#!/bin/bash
# This gist can be run with the following command. (May not always work)
# wget https://gist.github.com/azeey/936969/raw/dotfiles_setup.sh -O- | bash

DOTFILES_DIR="$HOME/dotfiles"
GIT_URL="git://github.com/azeey/dotfiles.git"

# Update repo
sudo su <<EOF
apt-get update

# Install Git
apt-get install -y git-core vim exuberant-ctags cscope vim-gnome tmux zsh ruby gems python-pip
EOF

echo "Setting up dev tools from $GIT_URL"
# Checkout from github
git clone $GIT_URL $DOTFILES_DIR

# Update submodules
cd $DOTFILES_DIR
git submodule update --init


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
sym $DOTFILES_DIR/vim $HOME/.vim
sym $DOTFILES_DIR/Xresources $HOME/.Xresources
sym $DOTFILES_DIR/xprofile $HOME/.xprofile
sym $HOME/.vim/vimrc $HOME/.vimrc

# Other packages
pip install --user git+git://github.com/Lokaltog/powerline
# gem install --user-install jump

git clone https://github.com/Lokaltog/powerline-fonts.git /tmp/powerline-fonts
bash /tmp/powerline-fonts/install.sh

# Install z.sh
mkdir -p $HOME/downloads/src/
git clone https://github.com/rupa/z.git $HOME/downloads/src/z

# Install Vundle bundles
vim +BundleInstall +qa!

# Change shell
chsh -s $(which zsh)

echo "Finished setting up dev tools.  Restart/reload shells and text editors"
