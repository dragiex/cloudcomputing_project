#!/bin/bash

# Define the path to the 'archived_logs' directory
ARCHIVED_LOGS_DIR="/path/to/archived_logs"

# Check if the directory exists
if [ ! -d "$ARCHIVED_LOGS_DIR" ]; then
  echo "Directory '$ARCHIVED_LOGS_DIR' does not exist."
  exit 1
fi

# Find and remove all empty directories in the 'archived_logs' directory
find "$ARCHIVED_LOGS_DIR" -type d -empty -delete

echo "Empty subdirectories removed from '$ARCHIVED_LOGS_DIR'."
