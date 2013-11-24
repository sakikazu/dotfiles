#!/bin/zsh

#
# 各管理サーバーのファイルをバックアップする
#
# created at: 2012/11/12
#

localbackdir='/home/sakikazu/backup/'

echo
echo '#############################################'
echo '# Serversman(182.163.58.103)'
echo '#############################################'
serversman='182.163.58.103'

echo
echo '# Gitリポジトリ'
rsync -av --delete -e 'ssh -p 10022' sakikazu@"$serversman":/home/sakikazu/bak_git_rep $localbackdir

echo
echo '# mysql dump'
rsync -av --delete -e 'ssh -p 10022' sakikazu@"$serversman":/home/sakikazu/bak $localbackdir

echo
echo '# AdanHP (uploadディレクトリのみ)'
rsync -av --delete -e 'ssh -p 10022' sakikazu@"$serversman":/usr/local/site/a-dan_v4/public/upload "$localbackdir"adanhp/

echo
echo '# Koisos (uploadディレクトリのみ)'
target='koisos'
rsync -av --delete -e 'ssh -p 10022' sakikazu@"$serversman":/usr/local/site/$target/public/upload "$localbackdir""$target"/

echo
echo '# HabitMachine (uploadディレクトリのみ)'
target='habit-machine'
rsync -av --delete -e 'ssh -p 10022' sakikazu@"$serversman":/usr/local/site/$target/public/upload "$localbackdir""$target"/


echo
echo '# Nichiko (uploadsディレクトリのみ)'
target='nichiko'
rsync -av --delete -e 'ssh -p 10022' sakikazu@"$serversman":/usr/local/site/$target/public/uploads "$localbackdir""$target"/

echo
echo '# Matabunkai (uploadsディレクトリのみ)'
target='matabunkai'
rsync -av --delete -e 'ssh -p 10022' sakikazu@"$serversman":/usr/local/site/$target/public/uploads "$localbackdir""$target"/

