changequote(`<<<',`>>>')
<<<
defaults
auth on
tls on
>>>
tls_trust_file ifelse(OS,mac,/usr/local/etc/openssl/cert.pem,/etc/ssl/certs/ca-certificates.crt)
<<<
logfile ~/.msmtp.log

# Zoho
account zoho
host smtp.zoho.com
port 587
from stephen@brennan.io
user stephen@brennan.io
passwordeval "imap-pass -g stephen@brennan.io"

account default : zoho
>>>