#!/bin/sh
###########################################################################
#
# ReleaseToDocControl
#
# Copy a new Blackbird release to TCI T-Number Doc Control Folder
# Will archive the previous release to Obsolete folder
#
# Usage: ReleaseToDocControl.sh
#
###########################################################################

set -e

########################################################################
# Function: showUsage
########################################################################
showUsage() {
    echo "usage: `basename $0` PATH_TO_RELEASE"
    echo "Example:"
    echo "`basename $0` /cygdrive/d/GARCHIVE/Temp/2022-06-10\ \[1.2.22.15\]\ RELEASE"
    exit 1
}

########################################################################
# Function: move function to support dry run
########################################################################
move() {
    if [ $dryRun -eq 1 ]; then
        echo "moving $1 -> $2"
    else
        if cp -r "$1" "$2" ; then
            rm -rf "$1" || :
        fi
    fi
}

makeDir() {
    if [ $dryRun -eq 1 ]; then
        echo "making dir $1"
    else
        mkdir "$1"
    fi
}

copy() {
    if [ $dryRun -eq 1 ]; then
        echo "copying $1 -> $2"
    else
        cp "$1" "$2"
    fi
}

########################################################################
# Function: doTNumber
########################################################################
doTNumber() {
    tnumber=$1
    prevRev="$tnumber-17-$2"
    newRev="$tnumber-17-$3"
    sourceFolder=$4
    sourceFilename=$5
    relNotesFilename=$6
    tnumDir="//tcifm/Files/Document Control/'T' Numbers Current Software/$tnumber"

    echo ""
    echo "**********************************************************************"
    echo "Copying $tnumber..."
    echo ""
    echo "prevRev          = $prevRev"
    echo "newRev           = $newRev"
    echo "sourceFolder     = $sourceFolder"
    echo "sourceFilename   = $sourceFilename"
    echo "relNotesFilename = $relNotesFilename"
    echo "tnumDir          = $tnumDir"
    echo "**********************************************************************"

    move "$tnumDir"/*.docx "$tnumDir"/Obsolete
    move "$tnumDir"/*.pdf "$tnumDir"/Obsolete
    move "$tnumDir/$prevRev" "$tnumDir"/Obsolete
    makeDir "$tnumDir/$newRev"
    copy "$sourceFolder/$sourceFilename" "$tnumDir/$newRev"
    copy "$sourceFolder/TCI INTERNAL ONLY"*.docx "$tnumDir"
    if [ "$relNotesFilename" != "" ]; then
        copy "$sourceFolder/$relNotesFilename" "$tnumDir"
    fi
}

release() {
    doTNumber T0654 "$PREVREV" "$NEWREV" "$SOURCEDIR" "SETUPS - UNRESTRICTED/BlackbirdClientSetup(T0654)_$FULL_VERSION.exe"
    doTNumber T0653 "$PREVREV" "$NEWREV" "$SOURCEDIR" "SETUPS - UNRESTRICTED/BlackbirdServerSetup(T0653)_x64_$FULL_VERSION.exe" "$RELNOTES_INT"
    doTNumber T0701 "$PREVREV" "$NEWREV" "$SOURCEDIR" "SETUPS - EXPORT LICENSE REQUIRED/BlackbirdServerSetup(T0701)_x64_$FULL_VERSION.exe" "$RELNOTES_XL"
    doTNumber T0702 "$PREVREV" "$NEWREV" "$SOURCEDIR" "SETUPS - EXPORT LICENSE REQUIRED/BlackbirdServerSetup(T0702)_x64_$FULL_VERSION.exe" "$RELNOTES_XL"
    doTNumber T0711 "$PREVREV" "$NEWREV" "$SOURCEDIR" "(DO NOT USE)/BlackbirdHVADSetup(T0711)_x64_$FULL_VERSION.exe"
    doTNumber T0712 "$PREVREV" "$NEWREV" "$SOURCEDIR" "SETUPS - EXPORT LICENSE REQUIRED/BlackbirdUVADSetup(T0712)_x64_$FULL_VERSION.exe"
    doTNumber T0713 "$PREVREV" "$NEWREV" "$SOURCEDIR" "SETUPS - EXPORT LICENSE REQUIRED/BlackbirdAL9Setup(T0713)_x64_$FULL_VERSION.exe"
    doTNumber T0732 "$PREVREV" "$NEWREV" "$SOURCEDIR" "SETUPS - UNRESTRICTED/BlackbirdFileTransferSetup(T0732)_$FULL_VERSION.exe"
    doTNumber T0801 "$PREVREV" "$NEWREV" "$SOURCEDIR" "DRONE/DroneServerSetup(T0801)_$FULL_VERSION.exe"
    doTNumber T0805 "$PREVREV" "$NEWREV" "$SOURCEDIR" "DRONE/DroneProcessorSetup(T0805)_$FULL_VERSION.exe"
    doTNumber T0810 "$PREVREV" "$NEWREV" "$SOURCEDIR" "DRONE/DroneClientSetup(T0810)_$FULL_VERSION.exe"
    doTNumber T0820 "$PREVREV" "$NEWREV" "$SOURCEDIR" "(DO NOT USE)/DroneApiSetup(T0820)_$FULL_VERSION.exe"
}

########################################################################
# MAIN
########################################################################

echo "**********************************************************************"
echo "** Blackbird ReleaseToDocControl Script                             **"
echo "**********************************************************************"

##########################################
# Setup parameters
##########################################
if [ $# -ne 1 ]; then
    showUsage
fi

SOURCEDIR=$1

tmp=T0712
DEFAULT_PREVREV=$(ls "//tcifm/Files/Document Control/'T' Numbers Current Software/$tmp" | grep $tmp | cut -d '-' -f3)
read -p "Enter previous revision [default=$DEFAULT_PREVREV]: " PREVREV
PREVREV=${PREVREV:-$DEFAULT_PREVREV}

DEFAULT_NEWREV=$(echo $PREVREV | tr A-Y B-Z)
read -p "Enter new revision [default=$DEFAULT_NEWREV]: " NEWREV
NEWREV=${NEWREV:-$DEFAULT_NEWREV}

FULL_VERSION=$(echo $(basename "$SOURCEDIR") | cut -d '[' -f2 | cut -d ']' -f1)
VERSION=$(echo $FULL_VERSION | cut -d '.' -f1-3)

DEFAULT_RELNOTES_INT=$(ls "$SOURCEDIR" | grep "Blackbird NextGen Release Notes")
read -p "Enter release notes internal[default=$DEFAULT_RELNOTES_INT]:" RELNOTES_INT
RELNOTES_INT=${RELNOTES_INT:-$DEFAULT_RELNOTES_INT}

DEFAULT_RELNOTES_XL=$(ls "$SOURCEDIR" | grep "Blackbird NextGen XL Release Notes")
read -p "Enter release notes xl[default=$DEFAULT_RELNOTES_XL]:" RELNOTES_XL
RELNOTES_XL=${RELNOTES_XL:-$DEFAULT_RELNOTES_XL}

echo ""
echo "************************************************************************************"
echo ""
echo SOURCEDIR    = "$SOURCEDIR"
echo PREVREV      = "$PREVREV"
echo NEWREV       = "$NEWREV"
echo RELNOTES_INT = "$RELNOTES_INT"
echo RELNOTES_XL  = "$RELNOTES_XL"
echo "Doing dry run..."
echo ""

echo "************************************************************************************"
echo "WARNING: Releasing Blackbird installers to TCI Document Control per above parameters"
echo "************************************************************************************"
read -p "Press [Enter] key to continue or ^C to bail out"

echo ""
echo -n "Blackbird ReleaseToDocControl Started - "
date

##########################################
# Copy the files
##########################################
dryRun=0
release

##########################################
# All done
##########################################
echo ""
echo "**********************************************************************"
echo -n "Blackbird ReleaseToDocControl Complete - "
date
echo "**********************************************************************"
