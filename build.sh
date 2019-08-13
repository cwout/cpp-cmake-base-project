#!/bin/bash

cd "$(dirname "$0")"

rm -r build/
rm -r bin/
mkdir build
mkdir bin

cd build/

cmake ../
make -j4

cd ../
#TODO: replace name of project
cp build/<binary_name> bin/

rm -r build/
