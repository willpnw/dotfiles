#!/bin/bash

STONKS_FILE=stonks.json

items=$(jq . -c main.json)

for stonk in $(jq -c '.[]' $STONKS_FILE); do
    symbol=$(echo $stonk | jq -r .symbol)
    limit=$(echo $stonk | jq -r .limit)
    item=$(jq -c . ticker.json  | sed "s/ARGS/$symbol $limit/")
    items="$items,$item"
done

echo "[$items]" | jq > config
