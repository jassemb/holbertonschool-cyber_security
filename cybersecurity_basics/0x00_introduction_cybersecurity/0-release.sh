#!/bin/bash
echo "$(lsb_release -i | awk -F: '{print $2}' | sed 's/^[ \t]*//')"