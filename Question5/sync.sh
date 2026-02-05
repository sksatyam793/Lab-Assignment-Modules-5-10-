#!/bin/bash

# Check for exactly two arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 dirA dirB"
    exit 1
fi

dirA="$1"
dirB="$2"

# Validate directories
if [ ! -d "$dirA" ] || [ ! -d "$dirB" ]; then
    echo "Error: Both arguments must be valid directories."
    exit 1
fi

echo "Files present only in $dirA:"
comm -23 <(ls "$dirA" | sort) <(ls "$dirB" | sort)

echo
echo "Files present only in $dirB:"
comm -13 <(ls "$dirA" | sort) <(ls "$dirB" | sort)

echo
echo "Common files comparison:"
for file in $(comm -12 <(ls "$dirA" | sort) <(ls "$dirB" | sort))
do
    if cmp -s "$dirA/$file" "$dirB/$file"; then
        echo "$file : Contents are SAME"
    else
        echo "$file : Contents are DIFFERENT"
    fi
done
