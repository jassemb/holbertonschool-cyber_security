#!/bin/bash
sudo [ $EUID -ne 0 ] && echo "Run as root" && exit 1 || nmap -sn -PR $1