#!/bin/zsh

#
# 各管理サーバーのファイルをバックアップする
#
# created at: 2012/11/12
#

localbackdir='/Users/sakikazu/bak/'


echo
echo '#############################################'
echo '# Sakura VPS(133.242.141.135)'
echo '#############################################'

echo
echo '# mysql dump'
# パス無しにしている理由は、gassuserなので、このMacのsakikazuにひもづいているキーチェーンが効かないためにsshエラーなると考えられるため
# それと、このsshのUserをgassuserにしていたら、このMacのsakikazuディレクトリに書き込みできなかったので、リモートサーバー側もsakikazuにして成功した
rsync -av --delete -e 'ssh -p 20022' sakura-without-passphrase:/home/sakikazu/db_backup $localbackdir/sakura


echo
echo '#############################################'
echo '# My Sakura(153.121.55.133)'
echo '#############################################'

echo
echo '# Gitリポジトリ(2014年、既にBitbucketに移行済みのため不要)'
# rsync -av --delete -e 'ssh -p 30022' sakikazu@"$mysakura":/home/sakikazu/bak_git_rep $localbackdir

echo
echo '# mysql dump'
rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/home/sakikazu/bak $localbackdir/_databases

echo
echo '# AdanHP (uploadディレクトリのみ)'
rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/usr/local/site/adan/public/upload "$localbackdir"adanhp/

echo
echo '# Koisos (uploadディレクトリのみ)'
target='koisos'
rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/usr/local/site/$target/public/upload "$localbackdir""$target"/

echo
echo '# HabitMachine (uploadディレクトリのみ)'
target='habit-machine'
rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/usr/local/site/$target/public/upload "$localbackdir""$target"/


# echo
# echo '# Nichiko (uploadsディレクトリのみ)'
# target='nichiko'
# rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/usr/local/site/$target/public/uploads "$localbackdir""$target"/

# echo
# echo '# Matabunkai (uploadsディレクトリのみ)'
# target='matabunkai'
# rsync -av --delete -e 'ssh -p 30022' sakikazu@mysakura:/usr/local/site/$target/public/uploads "$localbackdir""$target"/

