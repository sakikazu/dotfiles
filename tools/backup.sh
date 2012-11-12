#!/bin/zsh

#
# 各管理サーバーのファイルをバックアップする
#
# created at: 2012/11/12
#

localbackdir='/home/sakikazu/backup/'

#
# Serversman(182.163.58.103)
#
serversman='182.163.58.103'

# Gitリポジトリ
rsync -av -e 'ssh -p 10022' sakikazu@"$serversman":/home/sakikazu/bak_git_rep $localbackdir

# mysql dump
rsync -av -e 'ssh -p 10022' sakikazu@"$serversman":/home/sakikazu/bak $localbackdir


# AdanHP
# uploadファイルのみ

