#!/bin/bash
openssl rand -hex 8 | { read rand; echo -n "$1$rand" | openssl dgst -sha512 | awk '{print $2}' > 3_hash.txt; }