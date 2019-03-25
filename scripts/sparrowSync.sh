#!/bin/bash
for repo in devops-rail rail rail-stage2 rail-stage2-ext rail-uboot_2015 rail-uboot-env rail-ux; do
    cd /home/will/repos/$repo
    git pull
done
touch /tmp/lastUpdate
