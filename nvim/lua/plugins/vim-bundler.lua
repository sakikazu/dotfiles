-- gfでgem内も飛べるようになる、 `:Bopen spree` でgemディレクトリに飛べる
return {
  {
    "tpope/vim-bundler",
    ft = { "ruby" }, -- Rubyファイルを開いたときに読み込む（軽量化）
    cmd = { "Bopen", "Bedit", "Bsplit", "Btabedit", "Binstall", "Bupdate", "Bclean" }, -- bundler系コマンドを実行したときにも読み込む
  },
}

