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

      -- Ruby LSP (ruby-lsp)
      lspconfig.ruby_ls.setup({
        cmd = { "ruby-lsp" },       -- グローバル gem を使用
        capabilities = capabilities,
        settings = {
          rubyLsp = {
            enabledFeatures = {
              documentHighlights = true,
              documentSymbols    = true,
              foldingRanges      = true,
              selectionRanges    = true,
              semanticHighlighting = true,
              hover              = true,
              inlayHints         = true,
              diagnostics        = true,
              codeActions        = true,
              completion         = true,
              definition         = true,
              formatting         = true,
              references         = true,
              rename             = true,
              signatureHelp      = true,
            },
          },
        },
      })

      -- YAML LSP
      lspconfig.yamlls.setup({
        capabilities = capabilities,
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
