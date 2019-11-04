#!/bin/bash

cd "$(dirname "$0")" || exit

# Pre run
bash ./pre_run.sh

# Run program
cd run/ || exit
#TODO: replace name of project
#TODO: add binary run arguments
../bin/<binary_name>

# Post run
cd ../
bash ./post_run.sh
