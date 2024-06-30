#!/bin/bash

# Check if URL is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <url> [output_file]"
  exit 1
fi

URL="$1"
OUTPUT_FILE="${2:-output.txt}"

# Fetch the HTML content and write to the output file
curl -s "$URL" -o "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
  echo "HTML content saved to $OUTPUT_FILE"
else
  echo "Failed to fetch the HTML content from $URL"
fi
