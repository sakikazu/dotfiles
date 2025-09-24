return {
  -- :G blame
  -- :G log を使う場合は、ファイルを指定すること。特に-pを使うときはファイル未指定だとOut of memoryになる
  {
    "tpope/vim-fugitive",
    cmd = { "G" }
  },
  -- :DiffviewOpen, :DiffviewFileHistory が使えるかお試し中
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
  -- <leader>hb でgit blame見るだけに使っているが、vim-fugitiveだけでいいかも
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
        signcolumn = true,
        numhl      = false,
        linehl     = false,
        word_diff  = false,
        current_line_blame = false, -- 常時表示はオフ
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          -- 操作系キーマッピング
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
        end,
      })
    end,
  }
}
