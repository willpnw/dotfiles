#!/usr/bin/bash

translate() {
    if [ $# -ne 4 ]; then
        echo "Usage: dir app"
        echo "Example: translate Drone/DDClient ddclient uk platform"
        exit 1
    fi

    dir=$1
    app=$2
    language=$3
    platform=$4
    tsFile=${app}_${language}.ts
    qmFile=${app}_${language}.qm
    echo "dir: $dir"
    echo "app: $app"
    echo "tsFile: $tsFile"

    cd /mnt/d/Current/Guardian/Development/Source/$dir
    sourceFiles=`ag "(ClCompile|CustomBuild) Include" | sort -u | ag -v GeneratedFiles | cut -d '"' -f2 | ag -v ts$\|png$\|ico$\|lay$\|Shared`
    uiFiles=`ls GeneratedFiles/*.h`
    /mnt/c/Qt/Qt5.15.16/5.15.16/mingw81_64/bin/lupdate.exe $sourceFiles $uiFiles -ts $tsFile -no-obsolete
    translate.py $app $language
    /mnt/c/Qt/Qt5.15.16/5.15.16/mingw81_64/bin/lrelease.exe $tsFile
    cp $qmFile $platform/Debug
}

for language in es et uk ro; do
    translate Client/GClient    bbclient    $language Win32
    translate Server/GServer    bbserver    $language x64
    translate Drone/DDClient    ddclient    $language Win32
    translate Drone/TalonClient talonClient $language Win32
    translate Drone/DDServer    ddserver    $language x64
done

#cd /mnt/d/Current/Guardian/Development/Source/
#/mnt/c/Qt/Qt5.15.16/5.15.16/msvc2019_64/bin/linguist.exe `fd .ts$ | ag _es\|_et\|_uk`
