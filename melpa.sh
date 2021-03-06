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

make recipes/helm-core; make recipes/popup
make recipes/f; make recipes/s; make recipes/helm;
make recipes/helm-org-rifle

make recipes/hydra
make recipes/ht; make recipes/pfuture; make recipes/ace-window
make recipes/treemacs

make recipes/math-symbol-lists; make recipes/company-math

# Packages from the Debian migration are after here
make recipes/company
make recipes/async; make recipes/dash; make recipes/git-commit; make recipes/magit-popup; make recipes/with-editor # The dependencies of magit
make recipes/lv; make recipes/transient; make recipes/magit

make recipes/js2-mode

# End debian migration

make recipes/epl; make recipes/pkg-info; make recipes/flycheck # Also needs dash, see above

make recipes/pos-tip; make recipes/flycheck-pos-tip # Also needs flycheck

make recipes/flycheck-haskell
make recipes/irony; make recipes/flycheck-irony

make recipes/rich-minority; make recipes/smart-mode-line

make recipes/org-journal; make recipes/org-brain

make recipes/solarized-theme

make recipes/avy

make recipes/intero # Also needs haskell-mode, flycheck, libtinfo-dev from debian apparently

make recipes/bbdb
make recipes/helm-bbdb

make recipes/markdown-mode

make recipes/emacsql; make recipes/emacsql-sqlite; make recipes/closql
make recipes/treepy; make recipes/ghub

make recipes/forge

make recipes/ivy; make recipes/key-chord; make recipes/biblio-core; make recipes/biblio; make recipes/parsebib; make recipes/helm-bibtex; make recipes/htmlize; make recipes/tablist; make recipes/pdf-tools; make recipes/org-ref

make recipes/gntp; make recipes/log4e; make recipes/alert; make recipes/org-alert

make recipes/org-drill

make recipes/typescript-mode

# Packages that aren't yet put into my config
# Just for testing


# End packages that aren't yet put into my config

make json
