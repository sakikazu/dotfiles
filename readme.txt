setup.sh

### others
* .rspec : 各railsプロジェクト配下に置く


---------------------------------
1．最初の一回のみ)remote追加して
git remote add origin git@github.com:sakikazu/dotfiles.git

2．push
git push -u origin master


## .vimperatorrc
注意：UbuntuのFirefoxの.vimperatorrcを、シンボリックリンクで置いていたら、
Firefox起動時に読み込んでくれなかった。明示的にsourceをする必要があったので、
dotfilesディレクトリからコピーしておくようにする。
修正は、dotfilesのものと両方にやる必要がある。

→いや、やっぱ修正がめんどくさいから毎回Firefox起動時に読み込むようにしようかな・・
