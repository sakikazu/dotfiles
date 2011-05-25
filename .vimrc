"syntax on
"autocmd FileType *      set formatoptions=tcql nocindent comments&
"autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,ex:*/,://

" cakePHP setting
autocmd BufNewFile,BufRead *.ctp set filetype=php


set hidden  " バッファを切替えてもundoの効力を失わない
"set autoindent "これがあったからインデントされてたのか?
set paste
set autowrite
ab #d #define
ab #i #include
ab #b /********************************************************
ab #e ********************************************************/
ab #l /*------------------------------------------------------*/
set sw=2        "shiftwidth(インデントのスペース数)の略記
set tabstop=2   " ファイル内の <Tab> が対応する空白の数
set notextmode
set notextauto
set incsearch
set textwidth=70
"set guioptions+=a "これで”y”でコピった時にクリップボードに入ります。gvimのみ????
"set clipboard+=unnamed "これで”p”でペーストした時にクリップボードの中身が貼れます。 gvimのみ???
set visualbell

" オムニ補完
setlocal omnifunc=syntaxcomplete#Complete
" Ctrl-o でオムニ補完
imap <C-o> <C-x><C-o>
" sakikazu ↑効いてないぞ



"------------------------------------
" pathogen.vim
"------------------------------------
" pathogenでftdetectなどをloadさせるために一度ファイルタイプ判定をoff
filetype off
" pathogen.vimによってbundle配下のpluginをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
" ファイルタイプ判定をon
filetype plugin on


" エラーになる
" --------------------------------------------------------------
" rubycomplete.vim
" --------------------------------------------------------------
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" 不明 参照＞http://vim-users.jp/2010/01/hack119/
" inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()




"------------------------------------
" NERD_commenter.vim
"------------------------------------
" コメントの間にスペースを空ける
let NERDSpaceDelims = 1
"<Leader>xでコメントをトグル(NERD_commenter.vim)
map <Leader>x, c<space>
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1


"------------------------------------
" unite.vim
"------------------------------------
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>

" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  " Start insert.
  let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_source_file_mru_limit = 200


"------------------------------------
" surround.vim
"------------------------------------
" s, ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround


" ------------------------------------
" grep.vim
"------------------------------------
" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git .hg'
let Grep_Skip_Files = '*.bak *~'

" :Gb <args> でGrepBufferする
command! -nargs=1 Gb :GrepBuffer <args>
" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>



"------------------------------------
" vimshell
"------------------------------------
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."% "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."% "

  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
  call vimshell#set_execute_file('tgz,gz', 'gzcat')
  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
endif

function! g:my_chpwd(args, context)
  call vimshell#execute('echo "chpwd"')
endfunction
function! g:my_emptycmd(cmdline, context)
  call vimshell#execute('echo "emptycmd"')
  return a:cmdline
endfunction
function! g:my_preprompt(args, context)
  call vimshell#execute('echo "preprompt"')
endfunction
function! g:my_preexec(cmdline, context)
  call vimshell#execute('echo "preexec"')

  if a:cmdline =~# '^\s*diff\>'
    call vimshell#set_syntax('diff')
  endif
  return a:cmdline
endfunction

autocmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('i', 'iexe')
\| call vimshell#altercmd#define('l', 'll')
\| call vimshell#altercmd#define('ll', 'ls -l')
\| call vimshell#hook#set('chpwd', ['g:my_chpwd'])
\| call vimshell#hook#set('emptycmd', ['g:my_emptycmd'])
\| call vimshell#hook#set('preprompt', ['g:my_preprompt'])
\| call vimshell#hook#set('preexec', ['g:my_preexec'])

command! Vs :VimShell



" -------------------------------------------------------------
" neocomplcache
" -------------------------------------------------------------
  " Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'



" --------------------------------------------------------------
" rails.vim configuration
" --------------------------------------------------------------
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"
"let g:rails_default_database="sqlite3"



" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" こっから関口さんの設定と同じ

set nowrap      " ワードラップ
set number      " 行番号
set ruler       " ルーラー
set hlsearch    " サーチハイライト
set showmatch   " 入力時の括弧で対応する括弧をハイライト
set expandtab   " Insertモードで: <Tab> を挿入するのに、適切な数の空白を使う。（タブをスペースに展開する）

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


