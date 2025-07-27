return {
  -- TODO: 従来のinit.vimのAleでできていた、rubocopの違反ルール名の表示ができなくなっている。要調査
  -- ───────────────────────────
  -- ① Linting (nvim-lint)
  -- ───────────────────────────
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      
      -- Linter設定
      lint.linters_by_ft = {
        ruby = { "rubocop" },
        yaml = { "yamllint" },
        javascript = { "eslint" },
        typescript = { "eslint" },
        json = { "jsonlint" },
      }
      
      -- 自動実行設定
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- ───────────────────────────
  -- ② Formatting (conform.nvim)
  -- ───────────────────────────
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "フォーマット",
      },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          ruby = { "rubocop" },
          yaml = { "prettier" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          lua = { "stylua" },
        },
        -- 保存時自動フォーマット
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
}
