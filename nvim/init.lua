-- 行番号を表示
vim.opt.number = true

-- 相対行番号を表示（30j といった相対指定のジャンプはしやすいが、絶対指定の方を多く使うので無効）
-- vim.opt.relativenumber = true

-- インデント設定（スペースを使う）
vim.opt.expandtab = true     -- タブ入力をスペースに変換
vim.opt.shiftwidth = 2       -- 自動インデントのスペース数
vim.opt.tabstop = 2          -- タブの見かけの幅
vim.opt.smartindent = true   -- スマートインデント有効化

-- 検索を賢くする
vim.opt.ignorecase = true    -- 小文字で検索すると大文字もヒット
vim.opt.smartcase = true     -- 大文字を含めると大文字だけにマッチ
vim.opt.incsearch = true     -- 入力中に検索結果をハイライト
vim.opt.hlsearch = true      -- 検索結果をハイライト

-- マウス操作を有効化（必要に応じて）
vim.opt.mouse = "a"          -- すべてのモードでマウス有効化

-- カーソル行のハイライト
vim.opt.cursorline = true

-- クリップボード連携（システムと共有）
vim.opt.clipboard = "unnamedplus"

-- ファイル保存時に自動で書式を整える（オプション）
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- 自動コメントインサート無効化

-- ファイルが変更されたら自動で再読み込み
vim.opt.autoread = true
vim.cmd("autocmd FocusGained,BufEnter * checktime")

-- カラースキームの設定（後から好みのものに変更可能）
vim.cmd("colorscheme default")

-- リーダーキーの設定（マッピングの前に設定する必要あり）
vim.g.mapleader = " "

-- コマンド入力中にも補完を表示（Neovimのデフォに近い動作）
vim.opt.wildmode = { "longest", "list", "full" }

-- モード表示を無効に（ステータスラインプラグインを使う場合）
vim.opt.showmode = false

-- .swpファイルを作成しないようにする
vim.opt.swapfile = false

-- Lazy.nvim セットアップを読み込む
-- TODO: neovimがv0.10以降にできたら、nvim-lspconfigを使ってLSPやってみる。ただ、他のを使えばできそうだが
require("config.lazy")


-- キーマッピングを簡単にするための関数
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- タブ操作
map('n', 'tn', ':tabnext<CR>', opts)
map('n', 'tp', ':tabprev<CR>', opts)

map('n', 'ts', ':tabs<CR>', opts)
map('n', 'tt', ':tabnew ', { noremap = true })  -- <Space>を入力待ちにするのでsilentは不要
map('n', 'tm', ':tabm', { noremap = true })     -- 最後に番号を続ける前提

-- タブ番号ジャンプ
map('n', 't1', ':tabn 1<CR>', opts)
map('n', 't2', ':tabn 2<CR>', opts)
map('n', 't3', ':tabn 3<CR>', opts)
map('n', 't4', ':tabn 4<CR>', opts)
map('n', 't5', ':tabn 5<CR>', opts)
map('n', 't6', ':tabn 6<CR>', opts)
map('n', 't7', ':tabn 7<CR>', opts)
map('n', 't8', ':tabn 8<CR>', opts)
map('n', 't9', ':tabn 9<CR>', opts)
map('n', 't0', ':tabn 10<CR>', opts)

-- 大幅横移動
vim.keymap.set('n', '<S-l>', '15<Right>', { silent = true, desc = '右に15文字移動' })
vim.keymap.set('v', '<S-l>', '<C-o>15<Right>', { silent = true, desc = '右に15文字移動' })
vim.keymap.set('n', '<S-h>', '15<Left>', { silent = true, desc = '左に15文字移動' })
vim.keymap.set('v', '<S-h>', '<C-o>15<Left>', { silent = true, desc = '左に15文字移動' })

-- ░░ ペイン移動（Ctrl + hjkl でウィンドウ移動）░░
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- ░░ 行を表示上の折り返し単位で移動
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)

-- ░░ バッファ操作関連 ░░
map('n', [[\b]], ':ls<CR>:buffer ', opts) -- バッファ一覧から選択
map('n', [[\v]], ':vsplit<CR><C-w><C-w>:ls<CR>:buffer ', opts) -- 垂直分割してバッファ一覧から選択
map('n', 'bp', ':bp<CR>', opts)          -- 前のバッファへ
map('n', 'bn', ':bn<CR>', opts)          -- 次のバッファへ

-- ░░ ビジュアルモードで行末まで選択 ░░
-- 通常の v はトグルだが、再度 v を押しても選択を継続するよう変更
map('v', 'v', '$h', opts)

-- ░░ 貼り付けモード切替（paste mode）░░
map('', 'setp', ':set paste<CR>', opts)
map('', 'setnp', ':set nopaste<CR>', opts)

-- ░░ ウィンドウサイズ変更（+/-/{}で拡大・縮小）░░
map('n', '+', '4<C-w>+', opts) -- 高さを増やす
map('n', '-', '4<C-w>-', opts) -- 高さを減らす
map('n', '{', '4<C-w><', opts) -- 幅を狭める
map('n', '}', '4<C-w>>', opts) -- 幅を広げる


-- TODO: option + 選択すれば、マウス有効でもコピーできるなら、下記は不要になる
-- マウス有効/無効のトグル切り替え関数
function ToggleMouse()
  if vim.o.mouse == "" then
    vim.o.mouse = "a"
    vim.notify("マウス有効")
  else
    vim.o.mouse = ""
    vim.notify("マウス無効（選択コピーが可能）")
  end
end

vim.api.nvim_set_keymap('n', '<Leader>m', ':lua ToggleMouse()<CR>', { noremap = true, silent = true })

