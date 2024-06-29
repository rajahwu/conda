#!/bin/bash

# Define paths and filenames
LOGS_DIR="scripts/logs"
OUTPUT_FILE="$LOGS_DIR/info_$(date +"%Y%m%d_%H%M%S").txt"

# Ensure logs directory exists
mkdir -p "$LOGS_DIR"

# Execute commands and write output to the output file
{
  echo "### Directory Listing ###"
  ls -l

  echo "### Project Tree ###"
  tree

  echo "### Conda Environments ###"
  conda info --envs
} > "$OUTPUT_FILE"

echo "Information logged to: $OUTPUT_FILE"

cat "$OUTPUT_FILE" | less
