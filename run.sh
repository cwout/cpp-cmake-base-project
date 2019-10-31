#!/bin/bash

cd "$(dirname "$0")" || exit

cd run/ || exit
# if [[ -d out/ ]]; then
#     rm -r out/
# fi
# mkdir out/

#TODO: replace name of project
#TODO: add binary run arguments
../bin/<binary_name>
