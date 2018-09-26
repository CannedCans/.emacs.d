# Attribution
Initial work copied from https://www.emacswiki.org/emacs/GnusGmail

# Purpose
* Allows you to use Gnus with Gmail

# Use
* Replace email address and name in `.gnus`
* Replace email address and password in `.authinfo`
* `cp .gnus ~/.gnus; cp .authinfo ~/.authinfo`

Note: You can use .authinfo.gpg instead if you have Emacs set up properly to encrypt the file rather than leaving your passwords in plaintext

You must have IMAP enabled and have specific labels set to be sent over IMAP