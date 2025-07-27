-- 行番号を表示
vim.opt.number = true

-- 相対行番号を表示（ジャンプがしやすくなる）
vim.opt.relativenumber = true

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

