#!/bin/bash

# Define log file and number of lines to analyze
LOG_FILE="auth.log"
LINES=1000

# Extract the last 1000 lines from the log file
LOG_CONTENT=$(tail -n $LINES $LOG_FILE)

# Check for multiple unsuccessful login attempts followed by a success


# Pattern for unsuccessful login attempts (example: "Failed password")
UNSUCCESSFUL_PATTERN="Failed password for"
# Pattern for successful login attempts (example: "Accepted password")
SUCCESSFUL_PATTERN="Accepted password for"

# Initialize variables
declare -A login_attempts
current_user=""
unsuccessful_count=0

# Process each line of the log
while IFS= read -r line; do
    if [[ $line == *$UNSUCCESSFUL_PATTERN* ]]; then
        user=$(echo $line | awk '{for (i=1; i<=NF; i++) if ($i == "for") {print $(i+1); break}}')
        if [[ "$current_user" == "$user" ]]; then
            ((unsuccessful_count++))
        else
            current_user="$user"
            unsuccessful_count=1
        fi
    elif [[ $line == *$SUCCESSFUL_PATTERN* ]]; then
        user=$(echo $line | awk '{for (i=1; i<=NF; i++) if ($i == "for") {print $(i+1); break}}')
        if [[ "$current_user" == "$user" && $unsuccessful_count -gt 0 ]]; then
            echo "$user"
        fi
        current_user=""
        unsuccessful_count=0
    fi
done <<< "$LOG_CONTENT"
