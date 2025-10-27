return {
  -- :G blame
  -- :Glog: `G log` だとファイル指定を忘れるとOut of memoryになるので、現在のファイル限定にするように再定義
  -- lewis6991/gitsigns.nvim は削除: 行ごとにblameを表示するのに使ってみたが、特に使わないので
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Glog" },
    config = function()
      -- :Glog コマンドを追加
      -- 常に --stat を付けて、現在のファイルのみのログを表示
      vim.api.nvim_create_user_command("Glog", function(opts)
        -- opts.args は :Glog に渡された引数（例: -p など）
        vim.cmd("G log --stat " .. opts.args .. " -- %")
      end, { nargs = "*" })
    end,
  },
  -- :DiffviewOpen, :DiffviewFileHistory が使えるかお試し中
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
}
