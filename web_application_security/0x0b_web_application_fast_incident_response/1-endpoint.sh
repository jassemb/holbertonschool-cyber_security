#!/bin/bash
awk '{print $7}' aa.txt | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'