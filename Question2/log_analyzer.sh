#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one log file as argument."
    exit 1
fi

logfile="$1"

# Check if file exists and is readable
if [ ! -f "$logfile" ] || [ ! -r "$logfile" ]; then
    echo "Error: Log file does not exist or is not readable."
    exit 1
fi

# Count total log entries
total_entries=$(wc -l < "$logfile")

# Count log levels
info_count=$(grep -c " INFO " "$logfile")
warning_count=$(grep -c " WARNING " "$logfile")
error_count=$(grep -c " ERROR " "$logfile")

# Get most recent ERROR message
recent_error=$(grep " ERROR " "$logfile" | tail -1)

# Generate report file name with date
date=$(date +%Y-%m-%d)
report_file="logsummary_$date.txt"

# Write report
{
    echo "Log Summary Report - $date"
    echo "-------------------------"
    echo "Total log entries: $total_entries"
    echo "INFO messages: $info_count"
    echo "WARNING messages: $warning_count"
    echo "ERROR messages: $error_count"
    echo
    echo "Most recent ERROR message:"
    echo "$recent_error"
} > "$report_file"

# Display report
cat "$report_file"
