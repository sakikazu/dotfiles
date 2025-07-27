return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require('Comment').setup({
      -- コメントアウト時にスペースを追加
      padding = true,
      
      -- コメントアウト後もカーソル位置を保持
      sticky = true,
      
      -- 空行を無視
      ignore = '^%s*$',
      
      -- キーマップ設定
      toggler = {
        line = 'gcc',  -- 行コメントトグル
        block = 'gbc', -- ブロックコメントトグル
      },
      
      -- オペレーターモード
      opleader = {
        line = 'gc',   -- 行コメント
        block = 'gb',  -- ブロックコメント
      },
      
      -- 追加のキーマップ
      extra = {
        above = 'gcO', -- 上の行にコメント追加
        below = 'gco', -- 下の行にコメント追加
        eol = 'gcA',   -- 行末にコメント追加
      },
      
      -- プリ・ポストフック（カスタム処理）
      pre_hook = nil,
      post_hook = nil,
    })

    -- カスタムキーマップ（より直感的）
    local api = require('Comment.api')
    local keymap = vim.keymap.set
    
    -- Ctrl+/ でコメントトグル（多くのエディタと同じ）
    keymap('n', '<C-/>', api.toggle.linewise.current, { desc = 'コメントトグル' })
    keymap('i', '<C-/>', api.toggle.linewise.current, { desc = 'コメントトグル' })
    keymap('v', '<C-/>', 
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = 'コメントトグル' }
    )
    
    -- Leader + c でもコメントトグル（既存の習慣に合わせて）
    keymap('n', '<leader>c', api.toggle.linewise.current, { desc = 'コメントトグル' })
    keymap('v', '<leader>c', 
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = 'コメントトグル' }
    )
    
    -- ブロックコメント用
    keymap('n', '<leader>bc', api.toggle.blockwise.current, { desc = 'ブロックコメントトグル' })
    keymap('v', '<leader>bc', 
      "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
      { desc = 'ブロックコメントトグル' }
    )
  end,
}
