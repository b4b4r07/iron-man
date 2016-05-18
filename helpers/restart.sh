#!/bin/bash

export PATH="$PATH:./node_modules/.bin"

npm install

./node_modules/.bin/forever \
    restart -c coffee node_modules/.bin/hubot \
    --adapter slack \
    --name zplug-man
