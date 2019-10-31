#!/bin/bash

cd "$(dirname "$0")" || exit

if [[ -d build/ ]]; then
    rm -r build/
fi

bash build.sh
