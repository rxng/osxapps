#!/usr/bin/env bash

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# image libraries
brew install advancecomp gifsicle jhead jpegoptim jpeg optipng pngcrush pngquant jonof/kenutils/pngout

# nice packages
brew install tag autojump rbenv trash
#brew install libtiff libjpeg webp little-cms2

# python stuff
brew install pyenv pyenv-virtualenv pyenv-virtualenvwrapper

# quicklook stuff
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package quicklookase qlvideo Caskroom/cask/animated-gif-quicklook betterzipql

brew cleanup

# update bash_profile
echo "if which pyenv > /dev/null; then eval \"\$(pyenv init -)\"; fi" >> ~/.bash_profile
echo "if which pyenv-virtualenv-init > /dev/null; then eval \"\$(pyenv virtualenv-init -)\"; fi" >> ~/.bash_profile
echo "[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh" >> ~/.bash_profile
source ~/.bash_profile
