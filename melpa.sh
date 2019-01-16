#!/bin/sh
# Creates a local version of MELPA
# If it is not already downloaded from Github, it downloads it
# Otherwise, it pulls the most recent changes
# MELPA is then made (for the packages I use)

cd ~

if [ -d "melpa" ]; then
  cd melpa;
  git pull;
  cd ..
else
  git clone https://github.com/melpa/melpa
fi


cd melpa

# Add the packages to be provided by the local repo here
# Format is recipes/packagename
make recipes/multiple-cursors
make recipes/aggressive-indent
make recipes/ws-butler
make recipes/mediawiki
make recipes/haskell-mode

# Packages from the Debian migration are after here
make recipes/company
make recipes/async; make recipes/dash; make recipes/git-commit; make recipes/magit-popup; make recipes/with-editor # The dependencies of magit
make recipes/magit

make json
