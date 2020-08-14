#!/bin/bash

echo "Setting up..."
apt-get update

# TODO: no front-end issue - debconf: unable to initialize frontend: Dialog
# TODO: -y flag for installation
# Default shell setting not working for code-server

# setup zsh & oh-my-zsh
apt-get install zsh -y && \
  chsh -s $(which zsh) && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"