#!/bin/bash

SYMBOLS=(LMND  NIO   PLUG  ZOM)
LIMITS=( 155.8 58.47 68.45 1.96)

INDEX_FILE=/tmp/index
if [ ! -f $INDEX_FILE ]; then
    echo 0 > $INDEX_FILE
fi

INDEX=$(cat $INDEX_FILE)
echo $(((INDEX+1) % ${#SYMBOLS[@]})) > $INDEX_FILE

SYMBOL=${SYMBOLS[$INDEX]}
LIMIT=${LIMITS[$INDEX]}
FIELDS=regularMarketPrice,regularMarketChange,regularMarketChangePercent
API_ENDPOINT="https://query1.finance.yahoo.com/v7/finance/quote?lang=en-US&region=US&corsDomain=finance.yahoo.com"

results=$(curl --silent "$API_ENDPOINT&fields=$FIELDS&symbols=$SYMBOL" | jq '.quoteResponse .result')

getValue() {
    printf "%.2f" $(echo $results | jq .[0].$1)
}

price=$(getValue regularMarketPrice)
change=$(getValue regularMarketChange)
percent=$(getValue regularMarketChangePercent)

if echo $change | grep -q -; then
    class="stock-down"
else
    class="stock-up"
fi

text="$SYMBOL $LIMIT/$price $change ($percent %)"
echo -e "{\"text\": \"$text\", \"class\": \"$class\"}"
