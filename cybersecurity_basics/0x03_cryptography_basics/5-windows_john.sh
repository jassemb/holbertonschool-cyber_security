#!/bin/bash
john --format=NT "$1" && john --show "$1" | grep -oP ':\K.*' > 5-password.txt
