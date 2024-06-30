#!/bin/bash

# Get the directory where the script is located
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/../colors.sh"

# Define the directories
functions_dir="$script_dir/../functions"
tmp_dir="$script_dir/../tmp"
output_file="$tmp_dir/functions.txt"

# Ensure the tmp directory exists
mkdir -p "$tmp_dir"

# Create or clear the output file
: > "$output_file"

# Loop through each file in the functions directory
for function_file in "$functions_dir"/*.sh;
do
    # Add the filename as a header
    echo -e "${CYAN}#### $(basename "$function_file") ####${NC}" >> "$output_file"
    
    # Append the contents of the file
    cat "$function_file" >> "$output_file"
    
    # Add a newline for separation
    echo -e "\n" >> "$output_file"
done

echo -e "${GREEN}All function scripts have been written to $output_file${NC}"