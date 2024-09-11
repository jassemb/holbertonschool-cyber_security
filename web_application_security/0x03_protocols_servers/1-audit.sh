#!/bin/bash
grep -vE '^#|^$' /etc/ssh/sshd_config | diff -u /usr/share/ssh/sshd_config.orig -