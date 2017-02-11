#!/usr/bin/env bash

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if test ! $(which rbenv); then
  echo "Installing rbenv..."
  brew install rbenv
  echo "eval "$(rbenv init -)" >> ~/.bash_profile
fi

rbenv install 2.4.0

gem install bundler
gem install image_optim image_optim_pack
