#!/bin/bash

cd "$(dirname "$0")" || exit
cd ..

# Run directory
if [[ ! -d run/ ]]; then
    mkdir run/
fi
cd run/ || exit

# Clean output directory
# if [[ -d out/ ]]; then
#     rm -r out/
# fi
# mkdir out/
