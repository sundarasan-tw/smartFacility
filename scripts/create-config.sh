#!/usr/bin/env bash

############################################################
# Clones a .example config file into its actual version by
# removing the `.example` suffix (e.g., config.yaml.example → config.yaml).
#
# Usage:
#   ./create-config.sh
#
# Example:
#   ./create-config.sh
#
# Result:
#   - If the actual file does not exist, creates it from the .example file
#   - Skips cloning with a warning if the actual file already exists
############################################################

# Function to clone the .example file into the actual file
clone_example_file() {
  local example_file="$1"
  local actual_file="${example_file%.example}"  # Remove .example from the filename

  # Check if the actual file already exists
  if [ -f "$actual_file" ]; then
    echo "Warning: '$actual_file' already exists, skipping clone."
  else
    # Check if the .example file exists
    if [ -f "$example_file" ]; then
      cp "$example_file" "$actual_file"
      echo "Cloned '$example_file' to '$actual_file'."
    else
      echo "Error: '$example_file' does not exist."
    fi
  fi
}

clone_example_file "web-bff/sonar-scanner.properties.example"
