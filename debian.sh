#!/bin/bash

# Debian supports many Emacs packages built in to the repository
# This has advantages, primarily related to security, as many Emacs
# repositories (eg. Melpa) have little to no security
# If this file is executed as root, it will update the package listings
# and then install the packages I use

if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be executed as root as it updates your apt package listings and installs packages"
    exit 1
    
fi


apt-get update

# What the packages are
# Magit - Nice git commands
# Company - Auto-completion for many things
# elpa-js2-mode - Javascript modes
# elpa-iedit - Allows you to edit multiple occurrences of the same string at the same time
# elpa-elfeed - An RSS reader
apt-get install -y elpa-magit elpa-company elpa-js2-mode elpa-iedit elpa-elfeed
