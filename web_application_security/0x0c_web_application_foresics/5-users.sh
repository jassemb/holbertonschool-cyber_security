#!/bin/bash
grep "useradd" auth.log | awk -F 'name=|,' '{print $2}' | sort | paste -sd","