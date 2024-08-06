#!/bin/bash
# XOR key
key=0x5A

# Input string to encode
input="dGVzdA=="

# Step 1: Decode the base64 string
decoded=$(echo "$input" | base64 -d)

# Step 2: XOR each byte with the key and convert it to hexadecimal
encoded_hex=""
for (( i=0; i<${#decoded}; i++ )); do
  byte=$(printf '%d' "'${decoded:$i:1}")
  xor_byte=$(($byte ^ $key))
  encoded_hex+=$(printf '%02x' $xor_byte)
done

# Step 3: Convert the hexadecimal string back to binary and then to base64
echo "$encoded_hex" | xxd -r -p | base64
