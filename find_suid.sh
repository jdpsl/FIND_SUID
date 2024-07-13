#!/bin/bash

# Check if the user is root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Find all files with SUID bit set and owned by root
find / -type f -perm -4000 -exec ls -l {} \; 2>/dev/null | awk '{print $9}'
