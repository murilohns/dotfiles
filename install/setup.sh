#!/bin/bash

sudo apt-get update

# Setup Vim
sudo apt-get -qq install vim # Install vim
cp ../.vimrc ~/ # Move vimrc to home
sudo apt-get -qq install silversearcher-ag # Install ag for better FZF usage
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Setup Zsh
sudo apt-get -qq install zsh # Install zsh
chsh -s $(which zsh) # Set zsh as default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Install oh-my-zsh on zsh

# Setup Tmux
sudo apt-get -qq install tmux # Install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # Install Tmux Plugin Manager
cp ../.tmux.conf ~/ # Move tmux.conf to home
# You must set tmux source to ~/.tmux.conf running the following command: tmux source ~/.tmux.conf
# Then you must go to ~/ and run: tmux, then press (Ctrl + b) + I

# Run script to install ubuntu packages
source ~/.dotfiles/install/ubuntu.sh

