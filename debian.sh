#!/bin/bash

# Debian supports many Emacs packages built in to the repository
# This has advantages, primarily related to security, as many Emacs
# repositories (eg. Melpa) have little to no security
# If this file is executed as root, it will update the package listings,
# install Emacs 25/set to manually installed, then install the packages I use
# It will also ensure gnutls is installed

if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be executed as root as it updates your apt package listings and installs packages"
    exit 1
    
fi

# Update the package list
apt-get update

# Ensure that Emacs 25 is installed/set to manually installed
apt-get install -y emacs25

# Ensure that gnutls is installed/set to manually installed
# Used for things like email
apt-get install -y gnutls-bin

# What the packages are
# Magit - Nice git commands
# Company - Auto-completion for many things
# elpa-js2-mode - Javascript modes
# elpa-iedit - Allows you to edit multiple occurrences of the same string at the same time
# elpa-elfeed - A RSS reader
# slime - Common Lisp support
# elpa-git-timemachine - Easily go forward and backwards in a file in a git repo
# elpa-yasnippet - Templates (some come with this if you install via Debian)
# elpa-projectile - Easier project navigation
# elpa-anzu - Shows the amount of matches when searching with C-s
apt-get install -y elpa-magit elpa-company elpa-js2-mode elpa-iedit elpa-elfeed slime elpa-git-timemachine elpa-yasnippet elpa-projectile elpa-anzu

# Install the heavier packages that are somewhat optional
# Auctex - A somewhat nicer LaTeX mode, requires lots of LaTeX packages to install
apt-get install -y auctex
