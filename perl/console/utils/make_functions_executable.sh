#!/bin/bash

# Get the directory where the script is located
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Directory where the functions are located, relative to the script directory
functions_dir="$script_dir/../functions"
source "$script_dir/../vars/colors.sh"

# Check if the functions directory exists
if [ ! -d "$functions_dir" ]; then
  echo -e "${RED}Functions directory not found.${NC}"
  exit 1
fi

# Flag to check if any file was made executable
made_executable=false

# Loop through the files in the functions directory
for file in "$functions_dir"/*; do
  # Check if the file is a regular file and does not have execute permissions
  if [ -f "$file" ] && [ ! -x "$file" ]; then
    # Make the file executable
    chmod +x "$file"
    echo -e "${GREEN}Made $file executable.${NC}"
    made_executable=true
  fi
done

# Check if any file was made executable
if ! $made_executable; then
  echo -e "${CYAN}All functions are already executable.${NC}"
fi