# Attribution
Initial work copied from https://www.emacswiki.org/emacs/GnusGmail, licensed under GPL 2

# Purpose
* Allows you to use Gnus with Gmail

# Use
* Replace email address and name in `.gnus`
* Replace email address and password in `.authinfo`
* `cp .gnus ~/.gnus; cp .authinfo ~/.authinfo`

Note: You can use .authinfo.gpg instead if you have Emacs set up properly to encrypt the file rather than leaving your passwords in plaintext

You must have IMAP enabled and have specific labels set to be sent over IMAP

# Using isync/mbsync
Move `.mbsyncrc` to ~
Add user information to the file
Replace the nnimap with '(nnmaildir "gmail" (directory "~/.mail/gmail"))

# Using mu4e
Move `secretemail.el` to ~/secret/secretemail.el
Replace user information (email address and name) with your own
Have .authinfo have your information
