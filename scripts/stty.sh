#!/bin/sh -xe
stty -F $1 115200
sx -vv -Y bin.boot1-bcm958303k_pos_sa > $1 < $1
sleep 2
sx -vv -Y u-boot-dtb.img > $1 < $1
sleep 2
sx -vv -Y M0.bin > $1 < $1
