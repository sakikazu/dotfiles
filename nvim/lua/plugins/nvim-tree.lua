-- ### https://github.com/nvim-tree/nvim-tree.lua

-- DOCUMENT start

-- 備考
--   - 別ディレクトリのファイルを開いているときに NvimTreeFindFile しても、その場所のTreeは開かない。開くにはvimを閉じて cd が必要
--     - nvim-tree.update_focused_file.update_root のhelpを見て設定してみたが機能せず。でもglobal rootは変更しない方が良さそうなので、別Dirのものは、別セッションで開くでいいか

-- ヘルプ
--  `:help nvim-tree<Tab>` してみると色々ある
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt だと一覧性あり

-- ツリー内コマンド
--   g?: ヘルプ表示のトグル
--   C-t: 新しいタブでファイルを開く
--   E: カーソル配下を全部開く
--   W: 全部閉じる
--   f: 現在表示しているツリーの項目名で検索（expandしておく必要がある）
--     検索は、Eで開いた後に / の検索をした方が良さそう
--   F: 検索をクリア
--   .: 現在のファイルにvimコマンド実行
--     linuxコマンドを実行する場合は、 `!mv `とか `!bin/rspec ` とか
--     ちなみに `-bak` とか付加する場合は、 `ability{,-bak}` みたいな
--   <Tab>: ファイルプレビュー（開く時と違うのはカーソルはTreeのままということ）
-- DOCUMENT end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    -- netrwを無効化（nvim-tree公式の推奨設定）
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- カラースキーム用にtermguicolorsを有効に
    vim.opt.termguicolors = true

    -- NvimTree 起動キーを設定（例：<leader>e）
    vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })

    -- on_attachでキー設定をカスタマイズ
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- デフォルトマッピングを有効にする
      api.config.mappings.default_on_attach(bufnr)

      -- カスタムマッピング
      -- uniteと合わせる。vsplitは両者 <C-v>
      vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open Horizontal Split"))
      -- kakaku.com mac で、tmuxのC-tとかぶったからかnvim-treeでは効かなくなってたが、C-ttにすることで機能した
      vim.keymap.set("n", "<C-tt>", api.node.open.tab, opts("Open New Tab"))

      -- 不要なマッピングを解除（例: <C-e>）
      vim.keymap.del("n", "<C-e>", { buffer = bufnr })
    end

    require("nvim-tree").setup({
      view = {
        width = 35,
      },
      on_attach = my_on_attach,
    })
  end,
}

