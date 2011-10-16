" --------------------------------------------------------------
" 参考）https://github.com/kenchan/dotfiles/blob/master/dot.vimrc
" --------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()

Bundle "git://github.com/tpope/vim-rails.git"
Bundle "git://github.com/vim-scripts/yanktmp.vim.git"
"Bundle "git://github.com/vim-scripts/The-NERD-Commenter.git"
Bundle "git://github.com/scrooloose/nerdcommenter.git"
Bundle "git://github.com/Shougo/unite.vim.git"
Bundle "git://github.com/vim-scripts/surround.vim.git"
Bundle "git://github.com/chrismetcalf/vim-yankring.git"
Bundle "git://github.com/Shougo/vimshell.git"
Bundle "git://github.com/vim-scripts/grep.vim.git"
Bundle "git://github.com/thinca/vim-quickrun.git"
Bundle "git://github.com/vim-scripts/matrix.vim--Yang.git"
"Bundle "git://github.com/hrp/EnhancedCommentify.git"


" まだ使いこなせないうちはコメントアウトにしとく
"Bundle 'haml.zip'
"Bundle 'git-commit'
"Bundle 'YankRing.vim'
"Bundle 'EasyMotion'
"Bundle 'vimwiki'
"Bundle 'Rename'
"Bundle 'wincent/Command-T'
"Bundle 'jade.vim'
"
"Bundle 'newspaper.vim'
Bundle 'git://github.com/vim-scripts/xoria256.vim.git'
"
"Bundle 'vim-ruby/vim-ruby'
"
"Bundle 'tsukkee/unite-help'
"
"Bundle 'kana/vim-textobj-user'
"Bundle 'kana/vim-textobj-fold'
"Bundle 'kana/vim-textobj-indent'
"Bundle 'kana/vim-textobj-lastpat'
"
Bundle 'git://github.com/Shougo/neocomplcache.git'
"Bundle 'Shougo/vimshell'
"Bundle 'Shougo/vimfiler'
"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/unite.vim'
"
"Bundle 'h1mesuke/vim-alignta'
"Bundle 'h1mesuke/unite-outline'
"
"Bundle 'thinca/vim-quickrun'
"
"Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-endwise'
"Bundle 'tpope/vim-surround'
"Bundle 'tpope/vim-fugitive'
"
"Bundle 'kenchan/vim-ruby-refactoring'
"Bundle 'nelstrom/vim-textobj-rubyblock'

filetype plugin indent on
syntax enable

set t_Co=256
set background=dark
colorscheme xoria256
hi Pmenu ctermbg=4

set ambiwidth=double
set autoread
set hidden  " バッファを切替えてもundoの効力を失わない
set number
set showmatch " 入力時の括弧で対応する括弧をハイライト
set ttymouse=xterm2
set wildmode=longest:list
set nocompatible

set directory-=.

"backup
set nobackup

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
set ignorecase
set smartcase
set incsearch

"statusline
set laststatus=2
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

  autocmd FileType ruby.rspec nnoremap <silent> <space>rc :QuickRun -cmdopt "-cfn -l %{line('.')}"<CR>
  autocmd FileType cucumber nnoremap <silent> <space>rc :QuickRun -cmdopt "-f pretty -l %{line('.')}"<CR>
  autocmd FileType ruby.rspec,cucumber nnoremap <silent> <space>rf :QuickRun<CR>

  autocmd BufWritePost $MYVIMRC source $MYVIMRC | if has('gui_running') | source $MYGVIMRC
  autocmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC

augroup END



" ---------------------------------------
" sakikazu setting
" ---------------------------------------
set paste

hi TabLine     term=reverse cterm=reverse ctermfg=white ctermbg=black
hi TabLineSel  term=bold cterm=bold,underline ctermfg=5
hi TabLineFill term=reverse cterm=reverse ctermfg=white ctermbg=black


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



