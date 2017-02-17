#!/usr/bin/env bash

if test ! $(which pip); then
  echo "Installing pip..."
  easy_install pip
fi

pip install requests requests_cache bs4

pip install cheat


#newspaper

#curl https://raw.githubusercontent.com/codelucas/newspaper/master/download_corpora.py | python2.7
