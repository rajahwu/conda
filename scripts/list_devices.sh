#!/bin/bash

# Default values
ENV_NAME="default_env"
SCRIPT_DIR="scripts/python"
SCRIPT_NAME="list_devices.py"

# Function to display usage
usage() {
    echo "Usage: $0 -e <env_name> [-s <script_dir>] [-n <script_name>]"
    echo "  -e <env_name>: Specify the Conda environment name (required)"
    echo "  -s <script_dir>: Specify the script directory (default: scripts)"
    echo "  -n <script_name>: Specify the script name (default: list_devices.py)"
    exit 1
}

# Parse command-line options
while getopts ":e:s:n:" opt; do
  case $opt in
    e)
      ENV_NAME="$OPTARG"
      ;;
    s)
      SCRIPT_DIR="$OPTARG"
      ;;
    n)
      SCRIPT_NAME="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done

# Shift options to skip processed arguments
shift $((OPTIND - 1))

# Check if required argument -e <env_name> is provided
if [ "$ENV_NAME" == "default_env" ]; then
    echo "Error: Conda environment name (-e) is required."
    usage
fi

# Activate Conda environment
source activate "$ENV_NAME"

# Construct the full path to the script
FULL_SCRIPT_PATH="$SCRIPT_DIR/$SCRIPT_NAME"

# Check if the script file exists
if [ ! -f "$FULL_SCRIPT_PATH" ]; then
    echo "Error: Script file '$FULL_SCRIPT_PATH' not found."
    usage
fi

# Run the Python script
python "$FULL_SCRIPT_PATH"

# Deactivate Conda environment (optional)
conda deactivate
