#!/bin/bash
set -ex

# creating dirs
mkdir -p ~/.config

# adding extra apt repositories
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update


# installing all necessary packages listed in apt_packages.txt
if [ -f apt_packages.txt ]; then
    echo "Instalam sa moara franta"
    xargs sudo apt-get install -y < apt_packages.txt
fi

# Installing latest nvim release
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# installing ohmybash via curl
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# adding configurations
cp -r ~/dotfiles/.config/nvim ~/.config/
cp -r ~/dotfiles/.config/i3 ~/.config/
cp ~/dotfiles/.config/.tmux.conf ~/
cp ~/dotfiles/.config/.bashrc ~/
