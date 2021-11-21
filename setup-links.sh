#!/usr/bin/env bash

set -ex

DOTFILE_PATH="$HOME/developer/dotfiles"

# We might have already manually cloned dotfiles to get this script
if [[ ! -d "$DOTFILE_PATH" ]]; then
    git clone https://github.com/DarrienG/dotfiles "$DOTFILE_PATH"
fi

echo "Setting up links"
mkdir -p ~/.config
mkdir -p ~/.config/alacritty

# i3
ln -sfn $DOTFILE_PATH/i3 ~/.config/i3
ln -sfn $DOTFILE_PATH/i3status ~/.config/i3status
# Vim
ln -sfn $DOTFILE_PATH/.vim ~/.vim
ln -sfn $DOTFILE_PATH/.vimrc ~/.vimrc
## Note these are "standard locations" in the case I move my dotfiles later
ln -sfn ~/.vim ~/.config/nvim
# Zsh
ln -sfn $DOTFILE_PATH/.zshrc ~/.zshrc
ln -sfn $DOTFILE_PATH/.myshrc ~/.myshrc
ln -sfn $DOTFILE_PATH/.osrc ~/.osrc
ln -sfn $DOTFILE_PATH/.macrc ~/.macrc
ln -sfn $DOTFILE_PATH/.linuxrc ~/.linuxrc
ln -sfn $DOTFILE_PATH/alacritty.yml ~/.config/alacritty/alacritty.yml

# Emacs
ln -sfn $DOTFILE_PATH/.emacs.d ~/.emacs.d
ln -sfn $DOTFILE_PATH/.emacs ~/.emacs
# Tmux
ln -sfn $DOTFILE_PATH/.tmux.conf ~/.tmux.conf

# Compton
ln -sfn $DOTFILE_PATH/compton ~/.config/compton

# Linux specific links
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo mkdir -p /etc/systemd/system/sleep.target.wants/
  sudo ln -sfn $DOTFILE_PATH/screenlock.service /etc/systemd/system/screenlock.service
  sudo ln -sfn $DOTFILE_PATH/start-lock.sh /usr/local/bin/start-lock.sh
  sudo systemctl enable screenlock.service
  sudo systemctl start screenlock.service
else
  ln -sfn ~/.vimrc ~/.config/nvim/init.vim
fi
