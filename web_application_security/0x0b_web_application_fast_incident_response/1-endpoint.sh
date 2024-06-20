#!/bin/bash
awk '{print $7}' logs.txt | sort | uniq -c | sort -nr | head -n 1 | ak '{print $2}'