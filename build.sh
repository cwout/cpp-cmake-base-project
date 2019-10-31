#!/bin/bash

cd "$(dirname "$0")" || exit

if [[ ! -d build/ ]]; then
    mkdir build/
fi
if [[ -d bin/ ]]; then
    rm -r bin/
fi
mkdir bin/

cd build/ || exit

#TODO: change release type
cmake -DCMAKE_BUILD_TYPE=Release ../
#TODO: change make thread count
make -j4

cd ../
#TODO: replace name of project
cp build/<binary_name> bin/
