#!/bin/sh

#
# this script is able to run any number of times
#

ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.tmux.conf ~
ln -s ~/dotfiles/.gemrc ~
ln -s ~/dotfiles/.gitconfig ~
ln -s ~/dotfiles/.gitignore_global ~

# zsh
ln -s ~/dotfiles/.zshrc ~
cp ~/dotfiles/.zshrc.local.origin ~/.zshrc.local

# neovim(nvim)
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/.nvim_init.vim ~/.config/nvim/init.vim

echo
echo "####################"
echo "you need setup for oh-my-zsh cf. https://github.com/robbyrussell/oh-my-zsh if you didn't it"
echo "####################"
