#!/bin/bash

#
# usage: railsプロジェクトに移動して、tmux起動してから実行
#

# TODO: これやるとnew-windowなどが実行されず。なのでshell実行前にtmuxしてからやるしかない
# tmux new-session

# 特定railsプロジェクトに固定しないようにしよう
# NOTE: カレントディレクトリは変更されない制限があるらしい。sourceで実行すればいいとあったが、できず
# このあとのtmuxのnew-windowからディレクトリ変更できている
# cd /home/sakikazu/dev/_biz/boot-home/

# tmux new-window -n rserver
tmux rename-window rserver
tmux new-window -n editor
tmux new-window -n shell
tmux new-window -n rconsole
tmux new-window -n rwebpack
tmux new-window -n tmp

tmux send-keys -t rserver 'bin/rails s' C-m
tmux send-keys -t rconsole 'bin/rails c' C-m
tmux send-keys -t rwebpack 'bin/webpack-dev-server' C-m

tmux select-window -t editor
