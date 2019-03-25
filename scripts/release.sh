set -e
[ $# -eq 1 ] || {
echo "Usage: $(basename $0) version"
    exit
}

[ $(/usr/bin/id -u) -eq 0 ] || {
    echo "This script must be run as root"
    exit
}

RAIL=/opt/rail
RAIL_UX=/opt/rail/rail-ux
SIG_TOOLS=$RAIL"/EtsCustom/signature_tools"

update() {
    cd $1
    git clean -f
    git checkout .
    git fetch
    git checkout dev
    git pull
    git checkout qa
    git merge dev
    git push
    git tag $2
    git push --tags
}

update $RAIL $1
update $RAIL_UX $1
cd $RAIL
make clean all
VERSION=$(make install | grep -o uIm.*bin | grep -o [0-9]*)
make fs
mount -t nfs4 cdn-qa01.lab.tsafe.systems:/var/www/qa01/rail /mnt/cdn
FS=fs_$VERSION".ext2"
ROOTFS=rootfs_$VERSION".bin"
SIG=rootfs_$VERSION".sig"
cd $SIG_TOOLS
./gensig.sh $FS > $SIG

gzip -c /tftpboot/$FS > /mnt/cdn/rootfs/$ROOTFS".gz"

