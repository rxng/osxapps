#!/usr/bin/env bash

if test ! $(which npm); then
   if test ! $(which brew); then
     echo "Installing homebrew..."
     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   fi
   brew doctor

   echo "Installing npm..."
   brew install npm
fi

npm install -g imageoptim-cli node-readability requests

npm install svgo -g
