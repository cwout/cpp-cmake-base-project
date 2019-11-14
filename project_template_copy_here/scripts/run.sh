#!/bin/bash

cd "$(dirname "$0")" || exit
cd ..

# Pre run
bash ./scripts/pre_run.sh

# Run program
cd run/ || exit
#TODO: replace name of project
#TODO: add binary run arguments
../bin/<binary_name>

# Post run
cd ../
bash ./scripts/post_run.sh
