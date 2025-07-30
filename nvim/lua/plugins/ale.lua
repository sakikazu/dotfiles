-- rubocop警告をコード上のechoラインに表示する
-- NOTE: ALEFixコマンドで、自動整形が可能
return {
  "dense-analysis/ale",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.g.ale_linters_explicit = 1
    vim.g.ale_linters = {
      ruby = { "rubocop" },
    }
    vim.g.ale_fixers = {
      ruby = { "rubocop" },
    }
    vim.g.ale_ruby_rubocop_auto_correct_all = 1
    vim.g.ale_fix_on_save = 0
    vim.g.ale_echo_cursor = 1 -- ← echo領域に表示
    vim.g.ale_virtualtext_cursor = 0 -- ← カーソル下に仮想テキストを出さない（任意）
  end,
}

