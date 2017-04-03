#!/bin/sh

#
# this script is able to run any number of times
#

ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.zshrc ~
ln -s ~/dotfiles/.tmux.conf ~
ln -s ~/dotfiles/.gemrc ~
ln -s ~/dotfiles/.gitconfig ~

echo
echo "####################"
echo "you need setup for oh-my-zsh cf. https://github.com/robbyrussell/oh-my-zsh if you didn't it"
echo "####################"
