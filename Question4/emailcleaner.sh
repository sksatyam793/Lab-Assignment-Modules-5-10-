#!/bin/bash

# Extract valid email addresses, remove duplicates, and store in valid.txt
grep -E "^[a-zA-Z0-9]+@[a-zA-Z]+\.com$" emails.txt | sort | uniq > valid.txt

# Extract invalid email addresses and store in invalid.txt
grep -Ev "^[a-zA-Z0-9]+@[a-zA-Z]+\.com$" emails.txt > invalid.txt

