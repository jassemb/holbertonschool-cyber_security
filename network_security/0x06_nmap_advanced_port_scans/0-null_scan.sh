#!/bin/bash
[ -z "$1" ] && { echo "Usage: $0 <host>"; exit 1; } || sudo nmap -Pn -sN -p 20-25 "$1"