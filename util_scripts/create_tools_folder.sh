#!/bin/bash

# script to create a new tools folder
# Usage:
#   # make sure current directory is util_scripts
#   bash create_tools_folder.sh folder_name

# check that exactly one argument was provided
if [ "$#" -ne 1 ]; then
    echo "Error: You must provide exactly 1 argument"
    echo "Usage: $0 folder_name"
    exit 1
fi

# Create folder in src directory of workspace
cd ../src
mkdir $1
cp ../LICENSE $1/LICENSE
echo "Tools folder $1 created"