#!/bin/bash

set -e

# catch the error to print a message
trap 'catch' ERR
catch() {
    echo "ERROR"
}

# make sure the icon actually exists
test -f $icon
test $# -eq 1

iconName=$1
icon=$iconName.png

# move over the default icon and remove it from qrc
cp $icon icons/default
mv $icon icons/windows10
sed -i "/$icon/d" GClient.qrc

# copy over the themed icons
for dir in light dark; do
    cp ../GClientIcons/theme/$dir/$icon icons/$dir
done

# add all icons to qrc
for dir in default windows10 light dark; do
    sed -i "0,/prefix.*/s//&\n        <file>icons\/$dir\/$icon<\/file>/" GClient.qrc
done

# replace all instances with themed version
for f in `ag -sl $icon`; do
    sed -i "s/QIcon(\":\/GClient\/$icon/QIcon::fromTheme(\"$iconName/g" $f
done

echo "SUCCESS"
