return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep({
          default_text = vim.fn.expand("<cword>"),
        })
      end,
      desc = "Live Grep with current word",
    },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        -- 必要に応じてカスタマイズ
      },
    })
  end,
}
