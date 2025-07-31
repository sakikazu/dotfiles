#!/bin/sh

#
# this script is able to run any number of times
#

#ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.tmux.conf ~
#ln -s ~/dotfiles/.gemrc ~
#ln -s ~/dotfiles/.gitconfig ~
#ln -s ~/dotfiles/.gitignore_global ~

# zsh
ln -s ~/dotfiles/.zshrc ~
cp ~/dotfiles/.zshrc.local.origin ~/.zshrc.local

# neovim(nvim)
mkdir -p ~/.config
ln -s ~/dotfiles/nvim ~/.config/nvim

echo
echo "####################"
echo "you need setup for oh-my-zsh cf. https://github.com/robbyrussell/oh-my-zsh if you didn't it"
echo "既にoh-my-zshをインストール済みなら、 `ln -s ~/dotfiles/zsh_tools/.p10k.zsh ~` と `ln -s ~/dotfiles/zsh_tools/.fzf.zsh ~` すること"
echo "####################"
