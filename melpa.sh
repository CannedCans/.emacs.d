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
make recipes/magit
make recipes/multiple-cursors

make json
#make packages/archive-contents
