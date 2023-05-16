#!/bin/sh

# シンボリックリンク先にcdした時に、実際のパスで表示するためのもの
# 非シンボリックリンクのディレクトリの場合は、通常の cd を使うこと

# .zshrc に `alias cdl='source ~/dotfiles/tools/cdl.sh'` を設定する
# なぜ source をつけて実行するのかわかってない

cd $@
cd `readlink -f .`
