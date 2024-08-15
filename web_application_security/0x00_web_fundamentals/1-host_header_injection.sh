#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 NEW_HOST TARGET_URL FORM_DATA"
  exit 1
fi

NEW_HOST="$1"
TARGET_URL="$2"
FORM_DATA="$3"

# Make the request with a custom Host header
curl -X POST "$TARGET_URL" \
  -H "Host: $NEW_HOST" \
  -d "$FORM_DATA"