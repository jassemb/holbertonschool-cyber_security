#!/bin/bash

# This script decodes an XOR encoded base64 string

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <encoded_string>"
    exit 1
fi

# Extract the base64-encoded string from the input
password="${1#'{xor}'}"

# Decode the base64-encoded string
decoded_password=$(echo -n "$password" | base64 -d 2>/dev/null | tr -d '\000')

# Check if base64 decoding was successful
if [ $? -ne 0 ]; then
    echo "Error: Invalid base64 encoding"
    exit 1
fi

# Initialize the XOR-decoded password variable
decoded_password_xor=""

# XOR decode each byte
for byte in $(echo -n "$decoded_password" | od -An -t x1); do
    # Convert byte from hex to decimal and apply XOR
    xor_result=$(( 16#$byte ^ 95 ))

    # Convert the result back to a character and append it
    decoded_password_xor+=$(printf "\\x$(printf '%x' $xor_result)")
done

# Output the decoded password, handling null bytes
echo -e "$decoded_password_xor"
