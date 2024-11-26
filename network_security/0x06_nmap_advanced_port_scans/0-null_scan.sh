#!/bin/bash
[ -z "$1" ] && exit 1 || sudo nmap -Pn -sN -p 20-25 "$1"
