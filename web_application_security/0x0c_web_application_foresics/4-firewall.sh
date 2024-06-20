#!/bin/bash
awk '/iptables -A INPUT/ && (/--dport/ || /-j ACCEPT/)' auth.log | wc -l