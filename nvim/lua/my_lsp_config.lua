-- ~/.config/nvim/lua/my_lsp_config.lua

local function setup_lsp()
  local mason = require('mason')
  local mason_lspconfig = require('mason-lspconfig')
  local lspconfig = require('lspconfig')

  mason.setup()
  mason_lspconfig.setup({
    ensure_installed = { 'solargraph' }
  })

  lspconfig.solargraph.setup({
    on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
    settings = {
      solargraph = {
        diagnostics = true,
        completion = true,
        useBundler = false,
      }
    }
  })
end

-- エラーハンドリング付きで実行
local ok, err = pcall(setup_lsp)
if not ok then
  vim.notify('LSP setup failed: ' .. toml.error(err), vim.log.levels.ERROR)
end
