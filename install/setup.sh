#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
add-apt-repository ppa:jonathonf/vim
sudo apt-get update

# Setup Vim
apt-get -qq install vim # Install vim
cp ../.vimrc ~/ # Move vimrc to home
cp ../.tern.config ~/ # Move vimrc to home
apt-get -qq install silversearcher-ag # Install ag for better FZF usage
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
apt-get install build-essential cmake python-dev python3-dev # YouCompleteMeDependencies
echo "You must go to ~/.vim/bundle/YouCompleteMe/ and run ./install.py --js-completer --tern-completer"

# Setup Zsh
apt-get -qq install zsh # Install zsh
chsh -s $(which zsh) # Set zsh as default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Install oh-my-zsh on zsh
cp ../.zsh ~/ # Move zshrc to home

# Setup Tmux
apt-get -qq install tmux # Install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # Install Tmux Plugin Manager
cp ../.tmux.conf ~/ # Move tmux.conf to home
echo "You must set tmux source to ~/.tmux.conf running the following command: tmux source ~/.tmux.conf"
echo " Then you must go to ~/ and run: tmux, then press (Ctrl + b) + I to install the extensions"

# Setup Docker
apt-get install apt-transport-https ca-certificates curl software-properties-common
apt-get install docker-ce

curl -L https://github.com/docker/compose/releases/download/1.20.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

groupadd docker
usermod -aG docker $USER
chmod 777 /var/run/docker.sock

# Install Node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs

# Setup nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Setup npm
apt-get install npm
npm install -g eslint tern-node-express
