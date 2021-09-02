#!/usr/bin/bash

if [ $# -ne 2 ]; then
    echo "USAGE: $0 binary size"
    exit
fi

HMACSHA256_KEY=0000000000000000000000000000000000000000000000000000000000000000
HASH_BIN=/tmp/hash
SIGN_ME=$1
SIGNED=$SIGN_ME.signed
UNSIGNED=$SIGN_ME.unsigned
SIGN_ME=$1
SIZE=$(($2))

rm -f $HASH_BIN
rm -f $UNSIGNED

dd status=none if=$SIGN_ME of=$UNSIGNED count=$SIZE iflag=count_bytes

SHA=$(openssl dgst -sha256 -mac hmac -macopt hexkey:$HMACSHA256_KEY $UNSIGNED | cut -d ' ' -f2)
echo $SHA
for i in $(seq 0 2 $(($(echo $SHA | wc -c) - 2))); do
    echo -n -e "\x${SHA:i:2}" >> $HASH_BIN
done

xxd -e $HASH_BIN

echo "Appending $UNSIGNED to $SIGN_ME:"
cat $UNSIGNED $HASH_BIN > $SIGNED
