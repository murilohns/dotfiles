#!/bin/bash

        # Run script to install ubuntu packages
        source ~/.dotfiles/install/ubuntu.sh

        # Download plug.vim and put it in the `autoload` directory
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        # Install CPython and anaconda
        source ~/.dotfiles/install/python.sh

        # Install Ruby lastest stable version with Rails using RVM
        source ~/.dotfiles/install/ruby.sh

        # Generate symlinks
        env RCRC=$HOME/.dotfiles/rcrc rcup
        rcup -v

        # Set zsh as default shell
        chsh -s $(which zsh)
