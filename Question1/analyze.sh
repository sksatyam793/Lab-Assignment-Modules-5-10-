#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Exactly one argument is required."
    exit 1
fi

path="$1"

# Check if the path exists
if [ ! -e "$path" ]; then
    echo "Error: The given path does not exist."
    exit 1
fi

# If the argument is a file
if [ -f "$path" ]; then
    echo "File Analysis:"
    echo "Lines Words Characters"
    wc "$path"

# If the argument is a directory
elif [ -d "$path" ]; then
    echo "Directory Analysis:"
    total_files=$(find "$path" -type f | wc -l)
    txt_files=$(find "$path" -type f -name "*.txt" | wc -l)

    echo "Total files: $total_files"
    echo ".txt files: $txt_files"

else
    echo "Error: Invalid file type."
fi
