#!/bin/bash

SYMBOL=$1
LIMIT=$2
FIELDS=regularMarketPrice,regularMarketChangePercent
API_ENDPOINT="https://query1.finance.yahoo.com/v7/finance/quote?lang=en-US&region=US&corsDomain=finance.yahoo.com"

results=$(curl --silent "$API_ENDPOINT&fields=$FIELDS&symbols=$SYMBOL" | jq '.quoteResponse .result')

getValue() {
    printf "%.2f" $(echo $results | jq .[0].$1)
}

price=$(getValue regularMarketPrice)
percent=$(getValue regularMarketChangePercent)

if echo $percent | grep -q -; then
    class="stock-down"
else
    class="stock-up"
fi

text="$SYMBOL $LIMIT/$price $change ($percent %)"
echo -e "{\"text\": \"$text\", \"class\": \"$class\"}"
