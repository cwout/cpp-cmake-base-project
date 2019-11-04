#!/bin/bash

cd "$(dirname "$0")" || exit

# Build directory
if [[ ! -d build/ ]]; then
    mkdir build/
fi

# Binary directory
if [[ -d bin/ ]]; then
    rm -r bin/
fi
mkdir bin/

# Build the project
cd build/ || exit
#TODO: change release type
cmake -DCMAKE_BUILD_TYPE=Release ../
#TODO: change make thread count
make -j4

# Copy the executable
cd ../
#TODO: replace name of project
cp build/<binary_name> bin/
