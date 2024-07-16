#!/usr/bin/bash

APP=$(basename $(pwd))
VCXPROJ=$APP.vcxproj
APP_QRC=$APP.qrc
COMMON_QRC=/mnt/d/Current/Guardian/Development/Source/Common/theme/GTheme.qrc

findMissingIncludes() {
    QRC_FILES=$(cat $APP_QRC $COMMON_QRC | ag file | ag ">" | cut -d '>' -f2 | cut -d '<' -f1)
    for f in $QRC_FILES; do
        f=$(echo $f | sed 's?^icons?..\\..\\Common\\theme\\icons?')
        f=$(echo $f | sed 's?^qss?..\\..\\Common\\theme\\qss?')
        f=$(echo $f | sed 's?/?\\?g')
        ag -iQ "$f" $VCXPROJ > /dev/null || echo "$f"
    done
}

findExtraIncludes() {
    IMG_FILES=$(ag "Image Include" | cut -d '"' -f2 | sed 's?\\?/?g' | sed 's?../../Common/theme/??' | sort -u)
    for f in $IMG_FILES; do
        ag -Qi "$f" $APP_QRC $COMMON_QRC >/dev/null || echo "$f"
    done
}

echo "Checking for qrc files not in vcxproj..."
findMissingIncludes

echo ""
echo ""
echo ""
echo ""
echo "Checking for vcxproj files not in qrc..."
findExtraIncludes
