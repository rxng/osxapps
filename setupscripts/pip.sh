#!/usr/bin/env bash

if test ! $(which pip); then
  echo "Installing pip..."
  easy_install pip
fi

pip install requests requests_cache bs4
