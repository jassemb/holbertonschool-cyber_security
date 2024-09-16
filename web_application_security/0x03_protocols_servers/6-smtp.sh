#!/bin/bash
postconf smtpd_tls_security_level | grep -qE "(may|none)" && echo "STARTTLS not configured" || postconf smtpd_tls_security_level