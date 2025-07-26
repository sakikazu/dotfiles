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

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
  view = {
    width = 35,
    mappings = {
      list = {
        -- uniteと合わせる。vsplitは両者 <C-v>
        { key = "<C-s>", action = "split" },
      },
    },
  },
  remove_keymaps = {
    "<C-e>", -- tree表示のトグルをC-eにしているため、default mappingの方はremove
  },
})
