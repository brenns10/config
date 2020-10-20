changequote(`<<<',`>>>')
<<<
# https://bloerg.net/2013/10/09/syncing-mails-with-mbsync-instead-of-offlineimap.html
IMAPAccount stephen
Host imappro.zoho.com
User stephen@brennan.io
PassCmd "~/bin/imap-pass -g stephen@brennan.io"
SSLType IMAPS
>>>CertificateFile ifelse(OS,mac,/usr/local/etc/openssl/cert.pem,/etc/ssl/certs/ca-certificates.crt)<<<

IMAPStore stephen-remote
Account stephen

MaildirStore stephen-local
Path ~/mail/stephen/
Inbox ~/mail/stephen/INBOX

Channel stephen
Master :stephen-remote:
Slave :stephen-local:
Patterns *
Create Both
Expunge Both
SyncState *

IMAPAccount yelp
Host imap.gmail.com
User sbrennan@yelp.com
PassCmd "~/bin/imap-pass -g sbrennan@yelp.com"
SSLType IMAPS
>>>CertificateFile ifelse(OS,mac,/usr/local/etc/openssl/cert.pem,/etc/ssl/certs/ca-certificates.crt)<<<
>>>ifelse(OS,mac,AuthMechs LOGIN,)<<<

IMAPStore yelp-remote
Account yelp

MaildirStore yelp-local
Path ~/mail/yelp/
Inbox ~/mail/yelp/INBOX
SubFolders Verbatim

Channel yelp
Master :yelp-remote:
Slave :yelp-local:
Patterns INBOX Finished ![Gmail]* "[Gmail]/Sent Mail" "[Gmail]/Drafts" "[Gmail]/Spam"
Create Both
Expunge Slave
SyncState *

>>>
