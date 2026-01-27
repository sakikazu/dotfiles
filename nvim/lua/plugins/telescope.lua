-- telescopeの結果は、<C-q>でquickfixに送ると検索結果を残すことができる。<C-q>後は自動でquickfixが開く（copen）
-- fdやrg(ripgrep?)がインストールされていなければ、findコマンドが使われるため遅くなる。ffは最速のgit_filesにしたので、もうこれだけでいいかも
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    -- git grep と同等の検索でいいので、git_filesを使うのが最速そうだった
    {
      "<leader>ff",
      function()
        require("telescope.builtin").git_files({
          show_untracked = true, -- 必要なければ false でもOK
        })
      end,
      desc = "Find Files (git)"
    },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
    -- カーソル下ワードをgrep。結果ファイルリストからインクリメンタルサーチでファイルを絞り込める
    { "<leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Grep String" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    -- ファイル履歴数は vim.opt.shada にて設定
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
    -- LSP 関連
    { "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "定義へジャンプ" },
    { "gr", function() require("telescope.builtin").lsp_references() end, desc = "参照を表示" },
    { "gi", function() require("telescope.builtin").lsp_implementations() end, desc = "実装を表示" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        -- ripgrep を使用（サーバーにインストールが必要）
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",  -- Git ディレクトリは除外
        },
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { "core/dbdoc/", "node_modules/", "log/", "tmp/" }, -- プロジェクト向け
      },
    })
  end,
}

