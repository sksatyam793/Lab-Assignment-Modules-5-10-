#!/bin/bash

# Check if input.txt exists and is readable
if [ ! -f input.txt ] || [ ! -r input.txt ]; then
    echo "Error: input.txt does not exist or is not readable."
    exit 1
fi

# Extract words (case-insensitive, alphabetic only)
words=$(tr -cs '[:alpha:]' '\n' < input.txt | tr 'A-Z' 'a-z')

# Longest word
longest=$(echo "$words" | awk '{ if (length($0) > max) { max = length($0); word = $0 } } END { print word }')

# Shortest word
shortest=$(echo "$words" | awk 'NR==1 { min = length($0); word = $0 } { if (length($0) < min) { min = length($0); word = $0 } } END { print word }')

# Average word length
average=$(echo "$words" | awk '{ sum += length($0); count++ } END { if (count > 0) print sum / count }')

# Total number of unique words
unique=$(echo "$words" | sort | uniq | wc -l)

# Display results
echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $average"
echo "Total unique words: $unique"
