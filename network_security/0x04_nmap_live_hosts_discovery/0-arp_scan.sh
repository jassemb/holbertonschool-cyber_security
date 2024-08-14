#!/bin/bash
[ $EUID -ne 0 ] && echo "Run as root" && exit 1 ||sudo nmap -sn -PR $1