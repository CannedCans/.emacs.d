# .emacs.d
My Emacs configuration, incredibly basic with a few packages installed

Note: If you choose to use this config on your own computer, you may have to jump through slight hoops to get the packages installed unless you are using Debian (where many of the packages are available on stable).

If you are using Debian, run `debian.sh` as root and it will install the packages that I use.

eg. `cd ~/.emacs.d; sudo ./debian.sh` (you must have sudo access to do this)

# Package Installation From MELPA
This Emacs configuration uses a local MELPA, stored at ~/melpa

To add a package to be automatically installed, you need to add `make recipes/packagename` to melpa.sh and add packagename to the list in localmelpa/lmpackages.el

Then run `./melpa.sh` (no root) to build the local MELPA

When Emacs is next run, the package will be installed.
