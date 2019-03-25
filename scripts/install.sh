#!/bin/sh

USAGE="USAGE $0 [ -f s2bl|uboot|kernel-rootfs img [img2] ]"
start=$(date +%s)

if [ "$1" = "-f" ]; then
    if [ $# -ge 3 ]; then
        TYPE=$2
    else
        echo $USAGE
        exit 1
    fi
else
    clear
    ls /nvdata
    echo "What woud you like to install?"
    read TYPE
fi

case $TYPE in
    s2bl)
        if [ "$1" = "-f" ]; then
            if [ $# -ne 4 ]; then
                echo $USAGE
                exit 1
            else
                S2BL=$3
                S2BLEXT=$4
                REPLY=y
            fi
        else
            echo "Enter path to s2bl img"
            read S2BL
            echo "Enter path to s2bl-ext img"
            read S2BLEXT
            echo "Install $S2BL to /dev/mtd0 at 0x00000 and $S2BLEXT to /dev/mtd0 at 0x20000? [Y/n]"
            read -p "Continue [Y/n]? " -n 1 -r
        fi

        case $REPLY in
            [Yy])
                echo "Installing s2bl..."
                flash_erase /dev/mtd0 0x00000 2
                nandwrite -p /dev/mtd0 $S2BL
                nandwrite -p -s 0x20000 /dev/mtd0 $S2BLEXT
                ;;
            *)
                echo "Exiting"
                exit 1
                ;;
        esac
        ;;
    uboot)
        if [ "$1" = "-f" ]; then
            if [ $# -ne 3 ]; then
                echo $USAGE
                exit 1
            else
                UBOOT=$3
                REPLY=y
            fi
        else
            echo "Enter path to uboot img"
            read UBOOT
            echo "Install $UBOOT to /dev/mtd1? [Y/n]"
            read -p "Continue [Y/n]? " -n 1 -r
        fi

        case $REPLY in
            [Yy])
                echo "Installing uboot"
                flash_eraseall /dev/mtd1
                nandwrite -p /dev/mtd1 $UBOOT
                ;;
            *)
                echo "Exiting"
                exit 1
                ;;
        esac
        ;;
    kernel-rootfs)
        if [ "$1" = "-f" ]; then
            if [ $# -ne 4 ]; then
                echo $USAGE
                exit 1
            else
                KERNEL=$3
                ROOTFS=$4
                REPLY=y
            fi
        else
            echo "Enter path to kernel img"
            read KERNEL
            echo "Enter path to rootfs img"
            read ROOTFS
        fi

        echo "Printing bootargs"
        cat /proc/cmdline

        ROOT=$(cat /proc/cmdline | grep -o ubi.mtd=.)
        if [ $? -ne 0 ]; then
            ROOT=$(cat /proc/cmdline | grep -o root=/dev/mtdblock.)
        fi

        case $(echo $ROOT | grep -o [0-9]) in
            4)
                NEXT=-next
                ;;
            5)
                NEXT=""
                ;;
            *)
                echo "Could not determine current root partition"
                if [ "$1" = "-f" ]; then
                    exit 1
                else
                    echo "Enter current root partition to continue [4|5]"
                    read  ROOT
                    case $ROOT in
                        4)
                            NEXT=-next
                            ;;
                        5)
                            NEXT=""
                            ;;
                        *)
                            echo "Did not under stand $ROOT, exiting"
                            ;;
                    esac
                fi
                ;;
        esac

        if [ "$NEXT" = "-next" ]; then
            NEXT_KERNEL=3
            NEXT_ROOT=5
            NEXT=-next
        else
            NEXT_KERNEL=2
            NEXT_ROOT=4
        fi

        if [ "$1" = "-f" ]; then
            REPLY=y
        else
            echo "Writing $KERNEL to /dev/mtd${NEXT_KERNEL} and $ROOTFS to /dev/mtd${NEXT_ROOT}"
            read -p "Continue [Y/n]? " -n 1 -r
        fi

        case $REPLY in
            [Yy])
                echo "Installing"
                mkfs.ext2 /dev/mtdblock${NEXT_KERNEL}
                flash_eraseall /dev/mtd${NEXT_KERNEL}
                nandwrite -p /dev/mtd${NEXT_KERNEL} $KERNEL

                flash_eraseall /dev/mtd${NEXT_ROOT}
                dd if=$ROOTFS bs=1M | pv -fs $(ls -l $ROOTFS | awk '{print $5}') | nandwrite -p /dev/mtd${NEXT_ROOT}
                sleep 4
                echo "Updating bootargs"
                /nvdata/ota/ts_setUbootEnv.sh uboot-env${NEXT} /nvdata/uboot-env/uboot-env${NEXT}.bin /nvdata/uboot-env/uboot-env${NEXT}.sig
                echo "Printing bootargs"
                fw_printenv
                echo "Rootfs updated"
                ;;
            *)
                echo "Exiting"
                exit
                ;;
        esac

        ;;
    *)
        echo $USAGE
        exit 1
esac

end=$(date +%s)
delta=$(($end-$start))
echo "Took $(($delta/60)) minutes and $(($delta%60)) seconds"
echo "Reboot now to boot into new system"
