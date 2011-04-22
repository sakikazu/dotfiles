"syntax on
"autocmd FileType *      set formatoptions=tcql nocindent comments&
"autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://
autocmd BufNewFile,BufRead *.ctp set filetype=php


"set autoindent "これがあったからインデントされてたのか?
set paste
set autowrite
ab #d #define
ab #i #include
ab #b /********************************************************
ab #e ********************************************************/
ab #l /*------------------------------------------------------*/
set sw=4
set notextmode
set notextauto
set incsearch
set textwidth=70
"set guioptions+=a "これで”y”でコピった時にクリップボードに入ります。gvimのみ????
"set clipboard+=unnamed "これで”p”でペーストした時にクリップボードの中身が貼れます。 gvimのみ???
set visualbell


" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" こっから関口さんの設定と同じ

set nowrap      " ワードラップ
set number      " 行番号
set ruler       " ルーラー
set hlsearch    " サーチハイライト
set showmatch   " 入力時の括弧で対応する括弧をハイライト
set expandtab

" 文字コードをデフォルトUTF-8に
" --------------------------------------------------------------
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,ucs-2le,ucs-2,cp932,iso-2022-jp

" 改行コードの自動認識
" --------------------------------------------------------------
set fileformats=unix,dos,mac

" UTF-8の□や○でカーソル位置がずれないようにする
" --------------------------------------------------------------
if exists("&ambiwidth")
  set ambiwidth=double
endif

" coniguration for vim-ruby auto ditect .rb file syntax
" --------------------------------------------------------------
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

" rails.vim configuration
" --------------------------------------------------------------
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"
"let g:rails_default_database="sqlite3"


" rubycomplete.vim
" --------------------------------------------------------------
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1


" mru.vim
" --------------------------------------------------------------
:let MRU_Max_Entries=20 "MRUのファイルリストに記録しておく最大ファイル数です。
:let MRU_Exclude_Files="^/tmp/.*\|^/var/tmp/.*" 
"指定の正規表現にマッチするファイル名のファイルをMRUのファイルリストに記録しないようにします。デフォルトでは、全てのファイルを記録します。

:let MRU_Window_Height=15 "MRUのファイルリストのウィンドウの高さの設定です。
:let MRU_Use_Current_Windo=0
"MRUのファイルリストを開く時に、新規のウィンドウに表示するか、カレントのウィンドウに表示するかの設定です。デフォルトでは、新規のウィンドウに表示します。

:let MRU_Auto_Close=1
"MRUのファイルリストからファイルをEnterキーで選択した時に、ファイルリストのウィンドウを閉じるかどうかの設定です。デフォルトではファイル選択時にウィンドウを閉じます。


" configuration for lusty-explorer.vim
" -------------------------------------------------------------
nmap   we :BufferExplorer
nmap   wf :FilesystemExplorer

" NERDTree.vim configuration - http://vimwiki.net/?scripts%2F18 参照
" -------------------------------------------------------------
map nt :NERDTree
let g:NERDTreeShowHidden=1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
"" →動いてない？？


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
map tt :tabnew 
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

hi TabLine     term=reverse cterm=reverse ctermfg=white ctermbg=black
hi TabLineSel  term=bold cterm=bold,underline ctermfg=5
hi TabLineFill term=reverse cterm=reverse ctermfg=white ctermbg=black

" 下記の[tabline]の設定をすると、a/b/c/dd.htmlのような表記がされなくなってしまったので無効
"　→でもタブ番号が表示されるな。理想は、番号表示で↑の表記
"set showtabline=2
"set tabline=%!MyTabLine()
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
      let s .= '%' . (i+1) . 'T'
      let s .= ' ' . (i+1) . (1==getwinvar(i+1,'&modified')?'[+]':'') . ' %{MyTabLabelSel(' . (i+1) . ')} '
    else
      let s .= '%#TabLine#'
      let s .= '%' . (i+1) . 'T'
      let s .= ' ' . (i+1) . (1==getwinvar(i+1,'&modified')?'[+]':'') . ' %{MyTabLabel(' . (i+1) . ')} '
    endif
  endfor
  let s .= '%#TabLineFill#%T'
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif
  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let src_str = '/'. bufname(buflist[winnr - 1])
  let last_slash = strridx(src_str, '/')
  let len_str = strlen(src_str)
  let only_file_name = strpart(src_str, last_slash + 1, len_str - last_slash)
  return only_file_name
endfunction

function MyTabLabelSel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

" で表示されるステータスを置き換える
"---------------------------------------------------------------
silent! map  :call <SID>ShowStatus()
fun! s:ShowStatus()
  let file = expand("%")
  if file == ''
    let file = '[No Name]'
  endif
  let row  = line(".")
  let rows = line("$")
  let col  = col(".")
  let cols = col("$")
  let filesize   = getfsize(file)
  if filesize >= 0
    if filesize >= 10000
      let filesize = filesize / 1000 . 'KB '
    else
      let filesize = filesize . 'B '
    endif
  else
    let filesize = ''
  endif

  let tw = 'tw=' . &tw . ':'
  let ts = 'ts=' . &ts . ':'
  let sw = 'sw=' . &sw . ''

  let modified = &modified
  if modified
    let modified = '+ '
  else
    let modified = ''
  endif

  let modifiable = &modifiable
  if modifiable
    let modifiable = ''
  else
    let modifiable = '- '
  endif

  let readonly = &readonly
  if readonly
    let readonly = 'RO '
  else
    let readonly = ''
  endif

  let filetype = &filetype
  if filetype == ''
    let filetype = ''
  else
    let filetype = filetype . ','
  endif
  let fileformat = &fileformat . ','
  let encoding   = &enc

  let status = file . '  ' . row . '/' . rows . 'L(' . row * 100 / rows . '%) ' . col . '/' . cols . 'C ' . filesize
  let status = status . '[' . modified  . readonly . modifiable . filetype . fileformat . encoding . '] '
  let status = status . '[' . tw . ts . sw . ']'

  echo status
endfun



" --------------------------------------------------------------
" PHP
" --------------------------------------------------------------
" ★できてねええ。。
""
" PHP Lint
nmap ,l :call PHPLint()<CR>

""
" PHPLint
"
" @author halt feits <halt.feits at gmail.com>
"
function PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  echo result
endfunction

set tabstop=2
