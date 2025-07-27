return {
  -- ───────────────────────────
  -- ① LSP 設定
  -- ───────────────────────────
  {
    "neovim/nvim-lspconfig",
    version = "0.1.6",              -- Neovim 0.9 対応安定版
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",       -- capabilities 連携に必要
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP がバッファにアタッチされたときに実行される共通設定
      local on_attach = function(client, bufnr)
        local tbuiltin = require("telescope.builtin")
        local map_opts = { noremap = true, silent = true, buffer = bufnr, desc = "LSP" }

        -- デバッグ: サーバーの機能を確認
        print("LSP Client:", client.name)
        print("Definition Provider:", client.server_capabilities.definitionProvider)
        print("References Provider:", client.server_capabilities.referencesProvider)

        -- Telescope を使った定義 / 参照ジャンプ
        -- 機能が利用可能な場合のみキーマップを設定
        if client.server_capabilities.definitionProvider then
          vim.keymap.set("n", "gd", tbuiltin.lsp_definitions, vim.tbl_extend("force", map_opts, { desc = "定義へジャンプ" }))
        end
        if client.server_capabilities.referencesProvider then
          vim.keymap.set("n", "gr", tbuiltin.lsp_references, vim.tbl_extend("force", map_opts, { desc = "参照を表示" }))
        end
        if client.server_capabilities.implementationProvider then
          vim.keymap.set("n", "gi", tbuiltin.lsp_implementations, vim.tbl_extend("force", map_opts, { desc = "実装を表示" }))
        end

        -- Hover など基本機能
        vim.keymap.set("n", "K",  vim.lsp.buf.hover,          vim.tbl_extend("force", map_opts, { desc = "ドキュメントを表示" }))
      end

      -- Ruby LSP (ruby-lsp)
      -- lspconfig.ruby_ls.setup({
      --   cmd = { "ruby-lsp" },       -- グローバル gem を使用
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "Rakefile"),
      -- })

      lspconfig.solargraph.setup({
        cmd = { "solargraph", "stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
        settings = {
          solargraph = {
            diagnostics = true,
          },
        },
      })

      -- YAML LSP
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
            validate   = true,
            hover      = true,
            completion = true,
          },
        },
      })

      -- 診断の表示方法
      vim.diagnostic.config({
        virtual_text  = true,
        signs         = true,
        underline     = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },

  -- ───────────────────────────
  -- ② nvim-cmp + LuaSnip
  -- ───────────────────────────
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"]     = cmp.mapping.select_next_item(),
          ["<C-p>"]     = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip"   },
          { name = "buffer"    },
          { name = "path"      },
        }),
      })
    end,
  },
}
