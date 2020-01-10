#!/usr/bin/env bash

set -ex

DOTFILE_PATH="~/developer/dotfiles"

# We might have already manually cloned dotfiles to get this script
if [ ! -f "$DOTFILE_PATH" ]; then
    git clone https://github.com/DarrienG/dotfiles "$DOTFILE_PATH"
fi

echo "Setting up links"
mkdir -p ~/.config/i3
# i3
ln -sfn ~/developer/dotfiles/i3 ~/.config/i3
ln -sfn ~/developer/dotfiles/i3status ~/.config/i3status
# Vim
ln -sfn ~/developer/dotfiles/.vim ~/.vim
ln -sfn ~/developer/dotfiles/.vimrc ~/.vimrc
## Note these are "standard locations" in the case I move my dotfiles later
ln -sfn ~/.vim ~/.config/nvim
ln -sfn ~/.vimrc ~/.config/nvim/init.vim
# Zsh
ln -sfn ~/developer/dotfiles/.zshrc ~/.zshrc
ln -sfn ~/developer/dotfiles/.myshrc ~/.myshrc
ln -sfn ~/developer/dotfiles/.osrc ~/.osrc
ln -sfn ~/developer/dotfiles/.macrc ~/.macrc
ln -sfn ~/developer/dotfiles/.linuxrc ~/.linuxrc

# Emacs
ln -sfn ~/developer/dotfiles/.emacs.d ~/.emacs.d
ln -sfn ~/developer/dotfiles/.emacs ~/.emacs
# Tmux
ln -sfn ~/developer/dotfiles/.tmux.conf ~/.tmux.conf
