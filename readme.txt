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


## TODO
- LSPで定義ジャンプできるようにしたい。nvim 0.10以降が必要なはず
  - そうすればrails.vimは卒業できるかも？Aによるファイル移動はtelescopeでもいいし
  - telescope.luaの方にもgdコマンド定義してるので、今ちょっとカオス

## 変更履歴
### 2025/07/30
- マウスを有効にした
  - tmuxとnvimの両方にて
  - これやると、マウスで選択したテキストの自動コピーができなくなるが、optionを押しながらやれば可能（WSLは未検証）
- [nvim] Lintプラグインのaleで、ALEFixコマンドで自動修正ができることがわかった
- [nvim] コメントアウトは、Comment.nvimで <leader>c に設定
- [nvim] git blame表示はgitsigns.nvim で <leader>hb に設定
- [nvim] nvim-neoclip.luaにて <leader>y でtelescopeで選択して、ctrl + p でペースト可能
- [nvim] nvim-treeは <leader>e 、詳細は plugins/nvim-tree.lua
- [iTerm2] nvimのプラグインで要求されるNerdフォントなどは、ダウンロードして、iTerm2で設定すれば使えることがわかった
- [zsh] ZSH_THEMEをpowerlevel10kにして、zshのステータスラインをgit branchなど含めてブラッシュアップ
- [zsh] oh-my-zshのプラグインにfzfを追加し、ctrl+rでコマンド履歴、ctrl+tでファイルをファジー検索

#### 開発時のウィンドウ構成
- tmuxでVSCode同様の画面分割
  - tmuxの<leader> " で下分割し、その下ペインを<leader> % で横分割する
  - 上ペインはnvim、下ペインはログやrspec実行など
