" --------------------------------------------------------------
" 参考）https://github.com/kenchan/dotfiles/blob/master/dot.vimrc
" --------------------------------------------------------------

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle "Shougo/neobundle.vim"
NeoBundle 'Shougo/unite.vim'
NeoBundle "Shougo/vimshell.vim"
NeoBundle "Shougo/neocomplcache.vim"
" ### vimfiler: Explorer
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }


NeoBundle 'thinca/vim-quickrun'

NeoBundle "scrooloose/nerdcommenter"
NeoBundle "vim-scripts/surround.vim"
" NeoBundle "vim-scripts/yanktmp.vim"
NeoBundle "vim-scripts/grep.vim"
"NeoBundle "git://github.com/vim-scripts/The-NERD-Commenter.git"
" NeoBundle "git://github.com/tpope/vim-surround.git"
" NeoBundle "git://github.com/chrismetcalf/vim-yankring.git"
NeoBundle "git://github.com/vim-scripts/matrix.vim--Yang.git"
"NeoBundle "git://github.com/hrp/EnhancedCommentify.git"

NeoBundle "git://github.com/kchmck/vim-coffee-script.git"

" NeoBundle "git://github.com/violetyk/cake.vim.git"
" NeoBundle "git://github.com/jpo/vim-railscasts-theme.git"
NeoBundle "git://github.com/scrooloose/nerdtree.git"
NeoBundle 'YankRing.vim'


" --------------------------------------------------------------
" 2013-10-07 add
" via: http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb
" --------------------------------------------------------------

" ### alpaca_tags　　　ctagsの非同期生成
NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
      \ }}
NeoBundleLazy 'tsukkee/unite-tag', {
      \ 'depends' : ['Shougo/unite.vim'],
      \ 'autoload' : {
      \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
      \ }}
NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

" ### neosnippet　　　Rails/sinatra/rspec等の補完
NeoBundle 'Shougo/neosnippet'
" ### swtich.vim　　　　.present?:.brank?など対応するキーワードを切り替える
NeoBundle 'AndrewRadev/switch.vim'
" ### rubocop　　　　文法エラー、スタイルチェック
" ### vim-rails　　　　Railsプロジェクト用プラグイン
NeoBundle 'tpope/vim-rails'
" ### unite-rails　　　　Railsプロジェクト用Unite-source
NeoBundle 'basyura/unite-rails'
" ### vim-endwise　　　if...endなど対応するキーワードの自動補完
NeoBundle 'tpope/vim-endwise'
" ### ruby-matchit　　 %を拡張して、def...end等のキーワードを移動出来るようにする。
NeoBundle "vim-scripts/ruby-matchit"
" ### vim-ref　　　　　Ruby/Gemsのリファレンスを引く
NeoBundle 'thinca/vim-ref'
NeoBundle 'taka84u9/vim-ref-ri'

" ### unite-outline: いろんな言語のソースのアウトラインを表示
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-help'


" ### colorschemes
" memo とりあえずTeraTerm使ってるとこじゃ良い感じにならないので現在無効
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'baskerville/bubblegum'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'

" ### for gitv
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'



" まだ使いこなせないうちはコメントアウトにしとく
"Bundle 'haml.zip'
"Bundle 'git-commit'
"Bundle 'EasyMotion'
"Bundle 'vimwiki'
"Bundle 'Rename'
"Bundle 'wincent/Command-T'
"Bundle 'jade.vim'
"
"Bundle 'newspaper.vim'
"Bundle 'git://github.com/vim-scripts/xoria256.vim.git'
"
"Bundle 'vim-ruby/vim-ruby'
"
"
"Bundle 'kana/vim-textobj-user'
"Bundle 'kana/vim-textobj-fold'
"Bundle 'kana/vim-textobj-indent'
"Bundle 'kana/vim-textobj-lastpat'
"
"Bundle 'h1mesuke/vim-alignta'
"
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-surround'
"
"Bundle 'kenchan/vim-ruby-refactoring'
"Bundle 'nelstrom/vim-textobj-rubyblock'


filetype plugin indent on
syntax enable


" augroup init (from tyru's vimrc)
augroup vimrc
  autocmd!
augroup END

command!
  \ -bang -nargs=*
  \ MyAutocmd
  \ autocmd<bang> vimrc <args>

" 編集中の行に下線を引く
MyAutocmd InsertLeave * setlocal nocursorline
MyAutocmd InsertEnter * setlocal cursorline
MyAutocmd InsertLeave * highlight StatusLine ctermfg=145 guifg=#c2bfa5 guibg=#000000
MyAutocmd InsertEnter * highlight StatusLine ctermfg=12 guifg=#1E90FF


set ambiwidth=double
set autoread
set hidden  " バッファを切替えてもundoの効力を失わない

" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

set bs=indent,eol,start     " allow backspacing over everything in insert mode
set ai                      " always set autoindenting on
set history=100

set number
set ruler
set showmatch " 入力時の括弧で対応する括弧をハイライト
set ttymouse=xterm2
set wildmode=longest:list
set nocompatible
" 無効にする）マウス選択でコピーできていたのができなくなってしまったので
"set mouse=a " 全モードでマウスを有効化

set directory-=.

"backup
set nobackup
set noswapfile

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos

"Tab
set expandtab
set smartindent
set ts=2 sw=2 sts=2

"search
set hlsearch
" 検索時に大文字・小文字を区別しない。ただし、検索語に大文字小文字が混在しているときは区別する
set ignorecase
set smartcase
set incsearch

"statusline
set laststatus=2 " ステータスラインを常に表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p

" keymap
nnoremap j gj
nnoremap k gk

nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l

nnoremap Y y$

"sakikazu これが有効だとビジュアルモードでカーソル移動がおかしくなってしまった
"nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
"nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

cnoremap <C-a> <Home>
cnoremap <C-x> <C-r>=expand('%:p:h')<CR>/
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" 全角空白と行末の空白の色を変える
highlight WideSpace ctermbg=blue guibg=blue
highlight EOLSpace ctermbg=red guibg=red

function! s:HighlightSpaces()
  match WideSpace /　/
  match EOLSpace /\s\+$/
endf



" clipboard
set clipboard+=unnamed

" <Leader>
inoremap <Leader>date <C-R>=strftime('%Y/%m/%d(%a)')<CR>
inoremap <Leader>time <C-R>=strftime('%H:%M:%S')<CR>

" git-commit.vim
let git_diff_spawn_mode = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

" unite.vim
nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,uh :<C-u>Unite help<CR>
nnoremap <silent> ,ut :<C-u>Unite tag<CR>
" memo find file
nnoremap <silent> ,us :<C-u>Unite file_rec/async:!<CR>

" vim-ref
nnoremap <Leader>a :Ref alc<space>

" --------------------------------------------------------------
" rails.vim configuration
" --------------------------------------------------------------
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"
"let g:rails_default_database="sqlite3"

"------------------------------------
" surround.vim
"------------------------------------
" s, ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround

"------------------------------------
" NERD_commenter.vim
"------------------------------------
" コメントの間にスペースを空ける
let NERDSpaceDelims = 1
"<Leader>xでコメントをトグル(NERD_commenter.vim)
map <Leader>x, c<space>
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1

augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost Gemfile TagsBundle
    autocmd BufEnter * TagsSet
    " 毎回保存と同時更新する場合はコメントを外す
    " autocmd BufWritePost * TagsUpdate
  endif
augroup END

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

let g:EasyMotion_leader_key = '<Leader>m'

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" quickrun
let g:quickrun_config = {}
let g:quickrun_config = {
\  'ruby.rspec': {
\    'outputter/buffer/append' : 1,
\    'outputter/buffer/split' : 'below 10',
\    'runner' : 'remote',
\    'runner/remote/vimproc' : 1,
\    'command' : 'script/spec',
\    'cmdopt' : "-cfn"
\  },
\  'cucumber' : {
\    'outputter/buffer/append' : 1,
\    'outputter/buffer/split' : 'below 10',
\    'runner' : 'remote',
\    'runner/remote/vimproc' : 1,
\    'command' : 'cucumber',
\  }
\}

augroup MyAutoCmd
  autocmd!

  autocmd BufRead * call s:HighlightSpaces()
  autocmd WinEnter * call s:HighlightSpaces()

  autocmd InsertEnter * highlight StatusLine ctermfg=red guifg=red
  autocmd InsertLeave * highlight StatusLine ctermfg=white guifg=white

  "自動的に QuickFix リストを表示する
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
  autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin

  autocmd BufRead,BufNewFile *_spec.rb set filetype=ruby.rspec

" memo ここが有効だと、カッコにカーソルが乗ると勝手に移動してしまってた
" ★ これ、<space>をマッピングしてるからや！！右移動をスペースでなく、lにすれば解決する
  " autocmd FileType ruby.rspec nnoremap <silent> <space>rc :QuickRun -cmdopt "-cfn -l %{line('.')}"<CR>
  " autocmd FileType cucumber nnoremap <silent> <space>rc :QuickRun -cmdopt "-f pretty -l %{line('.')}"<CR>
  " autocmd FileType ruby.rspec,cucumber nnoremap <silent> <space>rf :QuickRun<CR>

  autocmd BufWritePost $MYVIMRC source $MYVIMRC | if has('gui_running') | source $MYGVIMRC
  autocmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC

augroup END



" ---------------------------------------
" Gitv Setting
" ---------------------------------------
" 勝手にFoldingされてしまう問題？を防ぐ
autocmd FileType git :setlocal foldlevel=99

" t で折りたたみか詳細表示かをトグル
autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction

autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
  nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction


" ---------------------------------------
" sakikazu setting
" ---------------------------------------
" memo set pasteがあると、NeoCompleteCacheが動作しなかった。しかも、これあると自動インデントされるようになるけど、逆にその方がいいことに気づいた…。
" set paste

hi TabLine     term=reverse cterm=reverse ctermfg=white ctermbg=black
hi TabLineSel  term=bold cterm=bold,underline ctermfg=5
hi TabLineFill term=reverse cterm=reverse ctermfg=white ctermbg=black

" ペースト時に前行のコメントアウトが引き継がれてしまう件の対処
autocmd FileType * set formatoptions-=ro



" coniguration for vim-ruby auto ditect .rb file syntax
" --------------------------------------------------------------
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1



" 論理移動と物理移動を交換
" --------------------------------------------------------------
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" タブ関係
" --------------------------------------------------------------
map tn :tabnext<cr>
map tp :tabprev<cr>

map ts :tabs<cr>
map tt :tabnew<space>
map tm :tabm

map t1 :tabn 1<cr>
map t2 :tabn 2<cr>
map t3 :tabn 3<cr>
map t4 :tabn 4<cr>
map t5 :tabn 5<cr>
map t6 :tabn 6<cr>
map t7 :tabn 7<cr>
map t8 :tabn 8<cr>
map t9 :tabn 9<cr>
map t0 :tabn 10<cr>


" バッファ関係
" --------------------------------------------------------------
nmap \b :ls<CR>:buffer
nmap \f :edit .<CR>
nmap \v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap \V :Vexplore!<CR><CR>
nmap bp :bp<CR>
nmap bn :bn<CR>

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" ---------------------------------------
" 大仲さんのを一部
" ---------------------------------------

" window resize
nnoremap + 4<C-w>+
nnoremap - 4<C-w>-
nnoremap { 4<C-w><
nnoremap } 4<C-w>>


" --------------------------------------------------------------
" PHP用オプション
" --------------------------------------------------------------
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags = 1

autocmd BufNewFile,BufRead *.ctp set filetype=php
autocmd BufNewFile,BufRead *.cls set filetype=php
autocmd BufNewFile,BufRead *.tpl set filetype=php


"----------------------------------------------------
"" バックアップ関係
"----------------------------------------------------
"" バックアップをとらない
" set nobackup
" ファイルの上書きの前にバックアップを作る
" " (ただし、backup
" がオンでない限り、バックアップは上書きに成功した後削除される)
" set writebackup
" " バックアップをとる場合
" "set backup
" " バックアップファイルを作るディレクトリ
" "set backupdir=~/backup
" " スワップファイルを作るディレクトリ
" "set directory=~/swap
"

"------------------------------------
" cake.vim
"------------------------------------
let g:cakephp_enable_auto_mode = 1

nnoremap <Space>cc :<C-u>Ccontrollertab<space>
nnoremap <Space>cm :<C-u>Cmodeltab<space>
nnoremap <Space>cv :<C-u>Cviewtab<space>
nnoremap <Space>cl :<C-u>Clog<space>
nnoremap <Space>ccv :<C-u>Ccontrollerviewtab<space>
nnoremap <Space>ccm :<C-u>Ccomponenttab<space>
nnoremap <Space>ccf :<C-u>Cconfigtab<space>
nnoremap <Space>cb :<C-u>Cbehaviortab<space>
nnoremap <Space>ch :<C-u>Chelpertab<space>
nnoremap <Space>ct :<C-u>Ctesttab<space>
nnoremap <Space>cf :<C-u>Cfixturetab<space>
nnoremap <Space>cs :<C-u>Cshelltab<space>


"------------------------------------
" for mac
" ※この行をコピペしたらうまくできないよ。ちゃんと↓のページにある通りやって
" http://d.hatena.ne.jp/esf/20100720/1279585601
"------------------------------------
noremap!  

