#!/bin/bash
iptables -F 
iptables -A INPUT -p tcp --dport ssh -j DROP