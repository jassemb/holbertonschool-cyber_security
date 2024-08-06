#!/bin/bash

# This script is a decoder
if [ $# -ne 1 ]; then
    echo "Usage: $0 <encoded_string>"
    exit 1
fi

# Extract the base64-encoded string from the input
password="${1#'{xor}'}"

# Decode the base64-encoded string
decoded_password=$(echo -n "$password" | base64 -d)

# Initialize the XOR-decoded password variable
decoded_password_xor=""

# XOR decode each character
for ((i = 0; i < ${#decoded_password}; i++)); do
    char="${decoded_password:$i:1}"
    ascii_value=$(printf "%d" "'$char")
    xor_result=$(( ascii_value ^ 95 ))
    decoded_password_xor+="$(printf "\\x$(printf '%x' $xor_result)")"
done

# Output the decoded password with newline handling
echo -e "$decoded_password_xor"
