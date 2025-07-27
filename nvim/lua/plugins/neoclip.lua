-- YankRing（yank履歴を行ったり来たり）の代替
-- 使い方: telescopeで選択したあとは、ctrl + p でペースト可能
return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "kkharji/sqlite.lua", -- 永続化のため（オプション）
  },
  event = "VeryLazy",
  keys = {
    { "<leader>y", "<cmd>Telescope neoclip<cr>", desc = "Yank履歴" },
    { "<C-n>", "<Plug>(neoclip-next)", desc = "次のYank", mode = "n" },
    { "<C-p>", "<Plug>(neoclip-prev)", desc = "前のYank", mode = "n" },
  },
  config = function()
    require("neoclip").setup({
      history = 1000,
      enable_persistent_history = true, -- 永続化
      length_limit = 1048576,          -- 1MB制限
      continuous_sync = true,          -- リアルタイム同期
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      filter = nil,
      preview = true,
      prompt = nil,
      default_register = '"',
      default_register_macros = 'q',
      enable_macro_history = true,     -- マクロ履歴も保存
      content_spec_column = false,
      disable_keymaps = false,
      on_select = {
        move_to_front = false,         -- 選択時に先頭に移動しない
        close_telescope = true,
      },
      on_paste = {
        set_reg = false,              -- ペースト時にレジスタを設定しない
        move_to_front = false,
        close_telescope = true,
      },
    })

    -- Telescope統合
    require("telescope").load_extension("neoclip")
  end,
}
