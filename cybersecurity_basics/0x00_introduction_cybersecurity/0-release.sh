#!/bin/bash
id=$(lsb_release -i | cut -f 2-)
echo "$id"