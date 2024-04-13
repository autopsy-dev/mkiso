#!/bin/bash

# Function to display messages with formatting
message() {
  echo -e "\033[1m$1\033[0m"
}

# Function to display an error message and exit
error_exit() {
  echo -e "\033[1;31mError: $1\033[0m"
  exit 1
}

# Check if a path is provided as an argument
if [ $# -eq 1 ]; then
  source_path=$1
else
  # Get directory or file path from user
  read -p "Enter the directory or file path to convert to ISO: " source_path
fi

# Validate the directory or file path
if [ ! -d "$source_path" ] && [ ! -f "$source_path" ]; then
  error_exit "The specified path does not exist or is neither a directory nor a file."
fi

# Get ISO file name from user
read -p "Enter the desired ISO file name (without extension): " iso_name

# Validate the ISO file name
if [ -z "$iso_name" ]; then
  error_exit "ISO file name cannot be empty."
fi

# Set the ISO file path
iso_path="$iso_name.iso"

# Ask for confirmation before proceeding
read -p "The ISO file will be created as: $iso_path. Continue? (y/n): " confirm

if [ "$confirm" != "y" ]; then
  message "Conversion aborted."
  exit 0
fi

# Convert the directory or file to ISO
message "Creating ISO file..."
if [ -d "$source_path" ]; then
  mkisofs -o "$iso_path" -J -r "$source_path"
elif [ -f "$source_path" ]; then
  mkisofs -o "$iso_path" -J -r -graft-points /="$source_path"
fi

# Check if the ISO creation was successful
if [ $? -eq 0 ]; then
  message "ISO file created successfully: $iso_path"
else
  error_exit "Failed to create ISO file."
fi

exit 0
