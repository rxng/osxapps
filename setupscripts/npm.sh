#!/usr/bin/env bash

if test ! $(which npm); then
   echo "Installing npm..."
   curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
   nvm install node
   npm -g install npm
fi

npm install -g imageoptim-cli node-readability requests

npm install svgo -g
