-- rails用プラグイン。ほぼ、gfとAによるファイル移動のために使っているようなもの
-- LSPが機能するようになれば、gfはLSPに任せられて、vim-railsは不要になるかも
-- TODO: gdでより多くでジャンプできるようになっていた。Aだけならtelescopeでもいいので、このプラグインはいらないかも。いややはりgdでジャンプできないケースは多かった・・謎
return {
  "tpope/vim-rails",
  event = { "BufReadPre", "BufNewFile" }, -- 起動を高速化（ファイル読み込み時に読み込む）
  init = function()
    -- Railsプラグインの動作レベル
    vim.g.rails_level = 4

    -- :A コマンドなどでジャンプするデフォルトファイル
    vim.g.rails_default_file = "app/controllers/application.rb"

    -- rake db:create などで使われるDB名
    vim.g.rails_default_database = "mysql"

    -- gf で app/services/ 以下も対象に
    vim.opt.path:append("core/app/services/**")
  end,
}

