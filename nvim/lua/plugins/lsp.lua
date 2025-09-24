-- ruby-lsp が良いとのことだが、NeoVim v0.10 以降からなので、バージョンアップが可能になったら
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP
      { 'neovim/nvim-lspconfig', version = "v0.1.7" },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- 補完
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
    },
    config = function()
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      -- ========================
      -- nvim-cmp 設定 (直接書く)
      -- ========================
      local cmp = require('cmp')
      cmp.setup({
        mapping = {
          ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-y>']     = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
          -- Tabで補完を確定（選択していれば）
          ["<Tab>"] = cmp.mapping.confirm({ select = false }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }
      })

      -- ========================
      -- ruby_lsp 定義 (0.1.7 に未収録なので手動追加)
      -- ========================
      local lspconfig = require('lspconfig')
      local configs = require('lspconfig.configs')

      if not configs.ruby_lsp then
        configs.ruby_lsp = {
          default_config = {
            cmd = { "bundle", "exec", "ruby-lsp" },
            filetypes = { "ruby" },
            root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
          }
        }
      end

      -- サーバー有効化
      lsp.setup_servers({ 'ruby_lsp', 'lua_ls' })

      -- Lua 設定 (Neovim用)
      lsp.configure('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } }
          }
        }
      })

      -- キーマッピング (便利系)
      lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        local keymap = vim.keymap.set
        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "gr", vim.lsp.buf.references, opts)
        keymap("n", "K",  vim.lsp.buf.hover, opts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap("n", "<leader>f", function() vim.lsp.buf.format({async = true}) end, opts)
      end)

      lsp.setup()
    end
  }
}

