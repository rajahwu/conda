#!/bin/bash

# Base directory
BASE_DIR="/var/www/html/apps/Training/conda/perl/console/functions/services"

# Find all .sh files in the directory and subdirectories
find "$BASE_DIR" -name "*.sh" | while read -r script; do
  # Update the source line in each script
  sed -i 's|^source .*/vars/colors.sh|source "$(dirname "$0")/../../../../vars/colors.sh"|' "$script"
  echo "Updated $script"
done

echo "All scripts have been updated."

