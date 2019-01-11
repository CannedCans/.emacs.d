#!/bin/sh
# Pulls my private org mode directory

cd ~

if [ -d "org-directory" ]; then
  cd org-directory;
  git pull;
  cd ..
else
  git clone https://gitlab.com/CannedCans/org-directory.git
fi
