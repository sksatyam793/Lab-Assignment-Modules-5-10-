#!/bin/bash

pass_all=0
fail_one=0

# Read data from marks.txt line by line
while IFS=',' read -r roll name m1 m2 m3
do
    fail_count=0

    # Check each subject against passing marks (33)
    if [ "$m1" -lt 33 ]; then
        ((fail_count++))
    fi

    if [ "$m2" -lt 33 ]; then
        ((fail_count++))
    fi

    if [ "$m3" -lt 33 ]; then
        ((fail_count++))
    fi

    # Passed all subjects
    if [ "$fail_count" -eq 0 ]; then
        echo "Passed all subjects: $roll, $name"
        ((pass_all++))

    # Failed in exactly one subject
    elif [ "$fail_count" -eq 1 ]; then
        echo "Failed in exactly one subject: $roll, $name"
        ((fail_one++))
    fi

done < marks.txt

# Display counts
echo "----------------------------"
echo "Total students passed all subjects: $pass_all"
echo "Total students failed in exactly one subject: $fail_one"
