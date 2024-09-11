#!/bin/bash
grep -vE '^#|^$' /etc/ssh/sshd_config | diff -u /etc/ssh/sshd_config -