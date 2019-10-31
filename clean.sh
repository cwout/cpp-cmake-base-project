#!/bin/bash

cd "$(dirname "$0")" || exit

if [[ -d build/ ]]; then
    rm -r build/
fi

if [[ -d bin/ ]]; then
    rm -r bin/
fi

if [[ -d run/out/ ]]; then
    rm -r run/out/
fi
