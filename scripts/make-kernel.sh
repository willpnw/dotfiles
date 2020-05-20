#!/bin/bash

set -e

export ARCH=arm
export CROSS_COMPILE=~/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabi/bin/arm-linux-gnueabi-
make tablesafe_defconfig
make menuconfig
#make -j12

#DTB=bcm958300k.dtb
DTB=tablesafe-rail_A10.dtb
#DTB=tablesafe-rail_A11.dtb

make ${DTB}
#mv arch/arm/boot/zImage /srv/tftp/zImage
#mv arch/arm/boot/dts/${DTB} /srv/tftp/zImage.dtb
