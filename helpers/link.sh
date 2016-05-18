#!/bin/bash

key="$(
./helpers/json.sh \
    ./data/link.json \
    | grep "$@" \
    | cut -d' ' -f1 \
    | cut -d. -f2
)"

if [[ -n $key ]]; then
    printf "はいよ! "
    ./helpers/json.sh \
        ./data/link.json \
        | grep -F "${key}.link" \
        | sed -E 's/^(\$[^ ]+) (.*)$/\2/g'
else
    echo "ないよ?"
fi
