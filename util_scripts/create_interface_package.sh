#!/bin/bash

# script to create a new interface package
# Usage:
#   # make sure current directory is util_scripts
#   bash create_interface_package.sh package_name

# check that exactly one argument was provided
if [ "$#" -ne 1 ]; then
    echo "Error: You must provide exactly 1 argument"
    echo "Usage: $0 package_name"
    exit 1
fi

# Create package in src directory of workspace
cd ../src
ros2 pkg create $1 --build-type ament_python --license Apache-2.0 --dependencies rclpy

# Adust directories within the package for interface, launch, and config files
cd $1
rm -r src include
mkdir msg
touch msg/.gitkeep
mkdir srv
touch srv/.gitkeep
mkdir action
touch action/.gitkeep
mkdir config
touch config/.gitkeep
mkdir launch
touch launch/.gitkeep

# build package in workspace directory
cd ../..
colcon build
echo "Interface package $1 created; you need to source workspace's install/bash.setup"