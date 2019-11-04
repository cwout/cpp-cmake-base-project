#!/bin/bash

cd "$(dirname "$0")" || exit

# Clean the build directory
if [[ -d build/ ]]; then
    rm -r build/
fi

# Build the project
bash build.sh
