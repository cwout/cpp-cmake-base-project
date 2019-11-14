#!/bin/bash

cd "$(dirname "$0")" || exit
cd ..

# Clean build directory
if [[ -d build/ ]]; then
    rm -r build/
fi

# Clean binary directory
if [[ -d bin/ ]]; then
    rm -r bin/
fi

# Clean program output directory
if [[ -d run/out/ ]]; then
    rm -r run/out/
fi
