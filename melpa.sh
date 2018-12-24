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
make recipes/magit
make recipes/multiple-cursors
make recipes/aggressive-indent
make recipes/ws-butler
make recipes/mediawiki

make json
