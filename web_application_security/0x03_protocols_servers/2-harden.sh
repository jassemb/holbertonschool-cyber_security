#!/bin/bash
find / -xdev -type d -perm -0002 ! -path "/proc/*" ! -path "/sys/*" 2>/dev/null -exec chmod o-w {} +
