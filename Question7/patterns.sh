#!/bin/bash

# Check if exactly one argument (input file) is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 inputfile"
    exit 1
fi

input="$1"

# Validate input file
if [ ! -f "$input" ] || [ ! -r "$input" ]; then
    echo "Error: File does not exist or is not readable."
    exit 1
fi

# Clear output files
> vowels.txt
> consonants.txt
> mixed.txt

# Extract words, convert to lowercase, and process
tr -cs '[:alpha:]' '\n' < "$input" | tr 'A-Z' 'a-z' | while read word
do
    # Only vowels
    if [[ "$word" =~ ^[aeiou]+$ ]]; then
        echo "$word" >> vowels.txt

    # Only consonants
    elif [[ "$word" =~ ^[^aeiou]+$ ]]; then
        echo "$word" >> consonants.txt

    # Mixed (both vowels and consonants) and starting with a consonant
    elif [[ "$word" =~ ^[^aeiou].*[aeiou] ]]; then
        echo "$word" >> mixed.txt
    fi
done

