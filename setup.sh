#!/bin/sh

#
# this script is able to run any number of times
#

# コメントアウトしているものは、既存ファイルがあるかもなので、それを確認のうえ、lnにするか、内容コピーにするかを判断する
ln -s ~/dotfiles/.tmux.conf ~
# tmux のプラグインディレクトリ
cp -p ~/dotfiles/.tmux ~
#ln -s ~/dotfiles/.gemrc ~
#ln -s ~/dotfiles/.gitconfig ~
#ln -s ~/dotfiles/.gitignore_global ~

# zsh
ln -s ~/dotfiles/.zshrc ~
cp -p ~/dotfiles/.zshrc.local.origin ~/.zshrc.local

# neovim(nvim)
mkdir -p ~/.config
ln -s ~/dotfiles/nvim ~/.config/

echo
echo "####################"
echo "you need setup for oh-my-zsh cf. https://github.com/robbyrussell/oh-my-zsh if you didn't it"
echo "####################"
