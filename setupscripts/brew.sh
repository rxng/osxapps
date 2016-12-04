#!/usr/bin/env bash

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor

brew install npm tag autojump

brew cask install qlcolorcode quicklook-csv qlstephen qlmarkdown quicklook-json betterzipql qlimagesize qlvideo
