#!/bin/sh

set -e

start=$(date +%s)

test $# -eq 1 || { echo "Usage: $(basename $0) install.json" ; exit 1 ; }
test -f $1    || { echo "Usage: File not found $1" ; exit 1 ; }

downloadFile() {
    local endpoint=$1
    local username=$2
    local password=$3

    # derived variables
    local protocol=$(echo $endpoint | grep -o ".*//")
    local address=$(echo $endpoint | sed "s|$protocol||")
    local endpoint=${protocol}${username}:${password}@$address
    rm -f $(basename $endpoint)
    wget --ca-certificate=/etc/ssl/certs/tsafe-fullchain.crt $endpoint
}

USERNAME=$(           jq --raw-output ".username"           $1 )
PASSWORD=$(           jq --raw-output ".password"           $1 )
KERNEL=$(             jq --raw-output ".kernel"             $1 )
KERNEL_SIG=$(         jq --raw-output ".kernel_sig"         $1 )
ROOTFS=$(             jq --raw-output ".rootfs"             $1 )
ROOTFS_SIG=$(         jq --raw-output ".rootfs_sig"         $1 )

downloadFile $KERNEL_SIG $USERNAME $PASSWORD
downloadFile $ROOTFS_SIG $USERNAME $PASSWORD
/usr/sbin/ts_ota.sh uimage-rootfs `cat $(basename $KERNEL_SIG)` $KERNEL $USERNAME $PASSWORD `cat $(basename $ROOTFS_SIG)` $ROOTFS $USERNAME $PASSWORD

# Get the current partition we're booting off
echo "Checking bootargs..."
CURRENT=$(cat /proc/cmdline | grep -wo ubi.mtd=. | grep -o [0-9]) || CURRENT=$(cat /proc/cmdline | grep -wo mtdblock. | grep -o [0-9])

case $CURRENT in
    4)
        NEXT="-next"
        UBOOT_ENV=$(     jq --raw-output ".uboot_env_next"     $1 )
        UBOOT_ENV_SIG=$( jq --raw-output ".uboot_env_next_sig" $1 )
        ;;
    5)
        NEXT=""
        UBOOT_ENV=$(     jq --raw-output ".uboot_env"          $1 )
        UBOOT_ENV_SIG=$( jq --raw-output ".uboot_env_sig"      $1 )
        ;;
    *)
        echo "Unknwon bootargs, exiting"
        exit 1
        ;;
esac

downloadFile $UBOOT_ENV     $USERNAME $PASSWORD
downloadFile $UBOOT_ENV_SIG $USERNAME $PASSWORD

UBOOT_ENV=$(    basename $UBOOT_ENV)
UBOOT_ENV_SIG=$(basename $UBOOT_ENV_SIG)

flash_erase /dev/mtd0 0x60000
nandwrite -p -s 0x60000 /dev/mtd0 $UBOOT_ENV
writesig uboot-env${NEXT} 0x20000 `cat $UBOOT_ENV_SIG`

end=$(date +%s)
delta=$(($end-$start))
echo "Took $(($delta/60)) minutes and $(($delta%60)) seconds"
fw_printenv | grep bootargs
cat /proc/cmdline
echo "Verify filesystem type and partition is correct and then reboot"
