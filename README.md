# .emacs.d
My Emacs configuration, incredibly basic with a few packages installed

Note: If you choose to use this config on your own computer, you may have to jump through slight hoops to get the packages installed unless you are using Debian (where many of the packages that aren't taken from the local MELPA are available on stable).

# Package Installation From MELPA
This Emacs configuration uses a local MELPA, stored at ~/melpa

To add a package to be automatically installed, you need to add `make recipes/packagename` to melpa.sh and add packagename to the list in localmelpa/lmpackages.el

Then run `./melpa.sh` (no root) to build the local MELPA

When Emacs is next run, the package will be installed.

If any errors appear where a package is not available when starting Emacs after just adding it to the list, first do `M-x list-packages` then press `g`, wait a few seconds, restart Emacs.

# Debian
If you are using Debian, run `debian.sh` as root and it will install some of the packages that I use that haven't been transitioned to the local MELPA (see the relevant section).

eg. `cd ~/.emacs.d; sudo ./debian.sh` (you must have sudo access to do this)
