#!/bin/bash
#set -v

# This gist can be run with the following command. (May not always work)
# wget https://gist.github.com/azeey/936969/raw/dotfiles_setup.sh -O- | bash

DOTFILES_DIR="$HOME/dotfiles"
GIT_URL="git://github.com/azeey/dotfiles.git"

echo "Setting up dotfiles"

echo "Installing dependencies..."

LIST_OF_APPS="xsel silversearcher-ag neovim"

# Add neovim ppa
sudo apt-get update


# Install Git
sudo apt-get install -y $LIST_OF_APPS; true

# Use neovim as vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --config vim
sudo update-alternatives --config editor


function sym {
    src=$1
    dest=$2 

    echo "Symlinking $dest to $src"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        bkup="$dest.old"
        mv -v --backup=t $dest $bkup
    fi

    ln -s $src $dest
}

sym $DOTFILES_DIR/inputrc $HOME/.inputrc
sym $DOTFILES_DIR/zshrc $HOME/.zshrc
sym $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf
# sym $DOTFILES_DIR/vim $HOME/.vim
# sym $HOME/.vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.config
#sym $HOME/.vim $HOME/.config/nvim
sym $DOTFILES_DIR/lazyvim $HOME/.config/nvim

# Other packages
pip install --user neovim


# Install z.sh
mkdir -p $HOME/downloads/src/
git clone https://github.com/rupa/z.git $HOME/downloads/src/z


# Change shell
sudo chsh -s $(which zsh)

# Update alternatives for neovim

# Install Vundle bundles
vim +PlugInstall +qa!

echo "Finished setting up dev tools.  Restart/reload shells and text editors"
