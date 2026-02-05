#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 directory_path"
    exit 1
fi

dir="$1"

# Validate directory
if [ ! -d "$dir" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Create backup directory if it does not exist
mkdir -p "$dir/backup"

echo "Parent script PID: $$"

# Move each file in background
for file in "$dir"/*
do
    # Skip directories
    [ -f "$file" ] || continue

    mv "$file" "$dir/backup/" &
    echo "Moving $(basename "$file") | Background PID: $!"
done

# Wait for all background jobs to complete
wait

echo "All background file moves completed."
