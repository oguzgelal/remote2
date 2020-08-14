#!/bin/bash

echo "Setting up..."
apt-get update

# setup zsh & oh-my-zsh
apt-get install zsh -y && \
  chsh -s $(which zsh) && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"