#!/usr/bin/env bash

############################################################
# Ensures vm.max_map_count is set at-least to 262144 (required by tools
# like SonarQube) by running commands in a privileged Docker
# container.
#
# Usage:
#   ./scripts/set-vm-memory.sh
#
# Arguments:
#   None
#
# Example:
#   ./scripts/set-vm-memory.sh
#
# Result:
#   Updates /etc/sysctl.conf and applies the new value if needed.
#   On successful completion you can expect the below log,
#   "Commands executed successfully inside container shell."
############################################################

# Step 1: Check if docker is available
if command -v docker &> /dev/null; then
  echo "Starting docker container shell and executing commands inside..."

  docker run -it --privileged --pid=host --net=host --ipc=host --rm alpine sh -c '
    echo "Checking current vm.max_map_count value..."
    current_value=$(sysctl -n vm.max_map_count)
    echo "Current vm.max_map_count: $current_value"

    if [ "$current_value" -lt 262145 ]; then
      echo "Updating vm.max_map_count to 262144..."

      if grep -q "vm.max_map_count" /etc/sysctl.conf; then
        sed -i.bak '\''/^vm\.max_map_count/ s/.*/vm.max_map_count = 262144/'\'' /etc/sysctl.conf
      else
        echo "vm.max_map_count = 262144" >> /etc/sysctl.conf
      fi

      sysctl -p
      echo "Virtual memory setting updated successfully."
    else
      echo "No update needed. Current vm.max_map_count is $current_value."
    fi
  '

  echo "Commands executed successfully inside container shell."
else
  echo "Docker not found. Skipping container-based memory update."
fi

# Step 6: Reminder to restart SonarQube
echo "Now, try running SonarQube again."
