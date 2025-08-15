#!/bin/bash
#set -v

# This gist can be run with the following command. (May not always work)
# wget https://gist.github.com/azeey/936969/raw/dotfiles_setup.sh -O- | bash

DOTFILES_DIR="$HOME/dotfiles"
GIT_URL="git://github.com/azeey/dotfiles.git"

echo "Setting up dotfiles"

echo "Installing dependencies..."

LIST_OF_APPS="xsel ripgrep fd-find curl "

# TODO: Install fzf from source

# Add neovim ppa
sudo apt-get update

# Install Git
sudo apt-get install -y $LIST_OF_APPS; true

mkdir -p $HOME/downloads
(
  NVIM_DIR_NAME=nvim-linux64
  cd $HOME/downloads
  curl -o $NVIM_DIR_NAME.tar.gz -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
  rm -rf $NVIM_DIR_NAME && mkdir $NVIM_DIR_NAME && (cd $NVIM_DIR_NAME && tar xzvf ../$NVIM_DIR_NAME.tar.gz --strip-components=1)
  mkdir -p $HOME/.local/bin/
  ln -sf $PWD/$NVIM_DIR_NAME/bin/nvim $HOME/.local/bin/
  ln -sf $HOME/.local/bin/nvim $HOME/.local/bin/vim
  ln -sf $HOME/.local/bin/nvim $HOME/.local/bin/vi
)

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
sym $DOTFILES_DIR/tmux $HOME/.tmux
sym $DOTFILES_DIR/zshd $HOME/.zsh.d
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
# vim +PlugInstall +qa!

echo "Finished setting up dev tools.  Restart/reload shells and text editors"
