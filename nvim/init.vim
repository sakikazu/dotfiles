" NeoVim: true color
set termguicolors
" 置換コマンド中にプレビューが表示される
set inccommand=split
" ハイフンも含めて同じ単語として選択できるようになる
set iskeyword+=-


"dein Scripts-----------------------------

" deinについて
" 手動でinstallなどを行うなら、:call dein#install()
"
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('tpope/vim-surround')
  " ctagsでrubyのパスサポートを改善させるため
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  " gfでgem内も飛べるようになる、 `:Bopen spree` でgemディレクトリに飛べる
  call dein#add('tpope/vim-bundler')
  call dein#add('scrooloose/nerdcommenter')
  " yank paste後に、ctrl+n/pで、yankの履歴を辿ることができる
  call dein#add('vim-scripts/YankRing.vim')
  " vim-endwise: if...endなど対応するキーワードの自動補完
  call dein#add('tpope/vim-endwise')

  " ### ruby-matchit　　 %を拡張して、def...end等のキーワードを移動出来るようにする。
  call dein#add("vimtaku/hl_matchit.vim")
  " このプラグインも必要
  call dein#add("vim-scripts/matchit.zip")

  " 外部grep（Rgrep、Regrep）
  call dein#add('vim-scripts/grep.vim')
  " GitGutterEnableでgitの変更がわかるがちゃんと使ってない
  call dein#add('airblade/vim-gitgutter')
  call dein#add('hoshinotsuyoshi/vim-to-github')
  " 統合Lintツール
  call dein#add('dense-analysis/ale')
  call dein#add('tpope/vim-markdown')

  " シンタックスハイライト
  call dein#add('tpope/vim-haml')
  call dein#add('slim-template/vim-slim')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('posva/vim-vue')
  call dein#add('hashivim/vim-terraform')
  " htmlのpug記法
  call dein#add('digitaltoad/vim-pug')

  " call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/ddc.vim')
  call dein#add('vim-denops/denops.vim')

  " Install your UIs
  call dein#add('Shougo/ddc-ui-native')

  " Install your sources
  call dein#add('Shougo/ddc-source-around')

  " Install your filters
  call dein#add('Shougo/ddc-matcher_head')
  call dein#add('Shougo/ddc-sorter_rank')

  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " call dein#add('github/copilot.vim')

  " Pythonのインデント整形
  call dein#add('Vimjas/vim-python-pep8-indent')

  " エクスプローラー
  call dein#add('nvim-tree/nvim-tree.lua')
  " TODO: Hack Nerd Font じゃないと表示されない
  " call dein#add('nvim-tree/nvim-web-devicons')

  " NOTE: 米印などの表示幅がおかしくなる問題を解消できるかと期待したがダメだった(NeoVim 9.0)
  " call dein#add('rbtnn/vim-ambiwidth')

  " LSP
  " vimを起動する度 `:CocInstall coc-solargraph` しないと、ruby のLSPが効かないので無効にする
  " call dein#add('neoclide/coc.nvim', {'branch': 'release'})

  " unite関連
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('Shougo/unite-outline')

  " for gitv
  call dein#add('gregsexton/gitv')
  call dein#add('tpope/vim-fugitive')

  " TODO: uniteの後継deniteは、コマンドを実行するとエラーになるので、neovimにした時にまたためす
  " call dein#add('Shougo/denite.nvim')
  " if !has('nvim')
    " call dein#add('roxma/nvim-yarp')
    " call dein#add('roxma/vim-hug-neovim-rpc')
  " endif

  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.8' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" lua ----------------------------
lua require('init')
" lua end ------------------------


" ドキュメント参照
" NeoBundle 'thinca/vim-ref'
" NeoBundle 'yuku-t/vim-ref-ri'

" NeoBundle "Shougo/vimshell.vim"
" NeoBundle "vim-scripts/DirDiff.vim"

" NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'fuenor/qfixgrep.git'

" NeoBundle 'groenewege/vim-less'

" TypeScript
" NeoBundle 'Quramy/tsuquyomi'
" NeoBundle 'leafgarland/typescript-vim'

" --------------------------------------------------------------
" 2013-10-07 add
" via: http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb
" --------------------------------------------------------------

" NeoBundleLazy 'tsukkee/unite-tag', {
      " \ 'depends' : ['Shougo/unite.vim'],
      " \ 'autoload' : {
      " \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
      " \ }}
" NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      " \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      " \ 'autoload' : {
      " \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      " \ }}

" ### unite-rails　　　　Railsプロジェクト用Unite-source
" NeoBundleLazy 'basyura/unite-rails', {
      " \ 'depends' : 'Shougo/unite.vim',
      " \ 'autoload' : {
      " \   'unite_sources' : [
      " \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      " \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      " \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      " \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      " \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      " \     'rails/stylesheet', 'rails/view'
      " \   ]
      " \ }}

" ### neosnippet　　　Rails/sinatra/rspec等の補完
" NeoBundleLazy 'Shougo/neosnippet', {
      " \ 'autoload' : {
      " \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
      " \   'filetypes' : 'snippet',
      " \   'insert' : 1,
      " \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      " \ }}

" ### swtich.vim　　　　.present?:.brank?など対応するキーワードを切り替える
" NeoBundle 'AndrewRadev/switch.vim'

" ### vim-ref　　　　　Ruby/Gemsのリファレンスを引く
" NeoBundle 'thinca/vim-ref'
" NeoBundle 'taka84u9/vim-ref-ri'

" NeoBundle 'tsukkee/unite-help'


" ### colorschemes
" memo とりあえずTeraTerm使ってるとこじゃ良い感じにならないので現在無効
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'baskerville/bubblegum'
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'vim-scripts/twilight'
" NeoBundle 'jonathanfilip/vim-lucius'
" NeoBundle 'jpo/vim-railscasts-theme'
" note: 俺の端末が変なせいか、変な色になる
" Markdown(.md/.mkd) Syntax
" NeoBundle 'joker1007/vim-markdown-quote-syntax'



" memo 履歴は見れるがC-rで補完とかできない。使えない(2013-10-23)
" NeoBundle 'mattn/vdbi-vim'
"" VDBI Usage
" :VDBI
" dbi:mysql:dbname=(db name)

syntax enable
filetype plugin indent on


" cf. Rubyプログラミングが快適になるVim環境を0から構築する - Qiita http://qiita.com/mogulla3/items/42a7f6c73fa4a90b1df3 - start

" --------------------------------
" deoplete -> ddc.vim
" NOTE: python3 ver11 のインストールが失敗するので、Deno依存のddcに移行した
"       deopleteでも満足していたので、dotfiles をgit push するかは特に必要性は感じていない
" --------------------------------
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_completion_start_length = 1

call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', #{
      \ _: #{
      \   matchers: ['matcher_head'],
      \   sorters: ['sorter_rank']},
      \ })
call ddc#custom#patch_global('sourceOptions', #{
      \   around: #{ mark: 'A' },
      \ })
call ddc#custom#patch_global('sourceParams', #{
      \   around: #{ maxSize: 500 },
      \ })
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources',
      \ ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', #{
      \   clangd: #{ mark: 'C' },
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', #{
      \   around: #{ maxSize: 100 },
      \ })
" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? '<C-n>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()

" --------------------------------
" dense-analysis/ale
" NOTE: rubocop自動解析
" --------------------------------
let g:ale_fixers = {
  \ 'ruby': ['rubocop'],
  \ 'rspec': ['rubocop'],
\ }

" --------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
" - end


" --------------------------------------------------------------
" 参考）https://github.com/kenchan/dotfiles/blob/master/dot.vimrc
" --------------------------------------------------------------

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

" Disable annoying beeping
set noerrorbells
set vb t_vb=

" NOTE: nvim-tree のデザインが崩れてしまうのでコメントアウト
" set ambiwidth=double " 米印みたいな文字が半角で表示されてしまうのを防ぐためらしいが効いてるか不明
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
set wildmode=longest:list
" statuslineの文字列などがマウス選択でコピーできなくなったため無効。エディタ内容は選択してyankすればできるが
"set mouse=a " 全モードでマウスを有効化
set mouse=

set wrap

set directory-=.

"backup
set nobackup
set noswapfile

"encoding
" memo
" これはファイル新規作成のときに有効になるんだな。既存ファイルのを変更するには、そのファイルを開いた状態で、このsetをやって保存しないといけない
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos,mac

"Tab
set expandtab " 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set smartindent
set ts=2 sw=2 sts=2

"search
set hlsearch
" 検索時に大文字・小文字を区別しない。ただし、検索語に大文字小文字が混在しているときは区別する
set ignorecase
set smartcase
" TODO: WSLの環境のせいかsmartcaseが効かないので、デフォルトで大文字小文字を区別する
" TODO:  この場合、uniteコマンドでも効いてしまって、ファイル検索がやりづらくなったので戻す
" set noignorecase
set incsearch

"statusline
set laststatus=2 " ステータスラインを常に表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%=%l,%c%v%8p

" keymap
nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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


" <Leader>
inoremap <Leader>date <C-R>=strftime('%Y/%m/%d(%a)')<CR>
inoremap <Leader>time <C-R>=strftime('%H:%M:%S')<CR>

" git-commit.vim
let git_diff_spawn_mode = 1


" memo 入力の邪魔になるだけだった・・
" Smartchr
" inoremap <expr> = smartchr#loop(' = ', ' == ', '=')
" inoremap <expr> , smartchr#one_of(', ', '->', ' => ')
" inoremap <expr> + smartchr#one_of(' + ', '++', '+')
" inoremap <expr> - smartchr#one_of(' - ', '--', '-')
" inoremap <expr> / smartchr#one_of(' / ', '// ', '/')
" inoremap <expr> ! smartchr#one_of('! ', ' != ', '!')


"------------------------------------
" unite.vim
" see: https://www.karakaram.com/unite/
"------------------------------------

" 候補を選択して <CR> すると新しいタブページでファイルを開く <- 元のタブに戻るとUniteは消えているので、使い心地は悪いな
"   :Unite file -default-action=tabopen <- Uniteのコマンドは設定ファイル内で設定できるのか？

" Unite上で `t` : 新しいタブでオープン
" Unite上で `p` : Preview

" インサートモードで開始
" let g:unite_enable_start_insert = 1
" 最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 300
" file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,uh :<C-u>Unite help<CR>
nnoremap <silent> ,ut :<C-u>Unite tab<CR>
nnoremap <silent> ,ug :<C-u>Unite tag<CR>
" これも使えるらしいので使っていきたい
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
" memo find file めっちゃ使う！required: vimproc
nnoremap <silent> ,us :<C-u>Unite file_rec/async:!<CR>

" vim-ref
nnoremap <Leader>a :Ref alc<space>

" uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " 使うものだけ有効にしている
	" ESCでuniteを終了
	" nmap <buffer> <ESC> <Plug>(unite_exit)
	" 入力モードのときjjでノーマルモードに移動
	" imap <buffer> jj <Plug>(unite_insert_leave)
	" 入力モードのときctrl+wでバックスラッシュも削除
	" imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	" ctrl+sで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
	" ctrl+vで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
	" ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

"------------------------------------
" vimproc
" NOTE: uniteでfile_rec/asyncを使ってファイルを一覧するときに、負荷軽減のため無視するディレクトリを指定
"------------------------------------
let s:unite_ignore_file_rec_patterns=
      \ ''
      \ .'vendor/bundle\|.bundle/\|\.sass-cache/\|'
      \ .'public/packs\|tmp/cache\|tmp/storage\|storage\|tmp\|log\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)"\?$'

call unite#custom#source(
      \ 'file_rec/async,file_rec/git',
      \ 'ignore_pattern',
      \ s:unite_ignore_file_rec_patterns)

"------------------------------------
" rails.vim configuration
"------------------------------------
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"
"let g:rails_default_database="sqlite3"

" rails.vim関係ないけどシンタックスハイライトの設定をここに置いといた
autocmd BufNewFile,BufRead *.mobile.erb set filetype=html
autocmd BufRead,BufNewFile *.slim set filetype=slim

" gfでジャンプできるようにpath設定。もっと良い方法があるかもだが
set path+=core/app/services/**

" Telescope設定（既存のdein設定の後に追加）
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep({default_text = vim.fn.expand('<cword>')})<CR>

nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


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


"#######################################
" 2020/06/20追加
"#######################################

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


" ### Grep Setting
" 引数-rnIHは再起、行数追加、バイナリファイルは除いてファイル名を表示
set grepprg=grep\ -rnIH\ --exclude=.svn\ --exclude=.git

" nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
" nnoremap <expr> <Space>G ':sil grep! --include="*.' . expand('%:e') . '" '

" ---------------------------------------
" grep.vim Setting
" ---------------------------------------

nnoremap <expr> <Space>g ':Regrep '
" TODO: Rails専用の設定になっているが、うまいこと汎用化できないかな
let Grep_Skip_Dirs = '.git tmp public vendor node_modules'
let Grep_Default_Options = '-I'   "バイナルファイルはgrepしない
let Grep_Skip_Files = '*.log *.map *.bak *~'  "ログ、バックアップファイルを無視する


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
" coc.nvim Setting
" https://rooter.jp/programming/vim-modern-ruby/
" ---------------------------------------
" タブで補完候補選択
" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap
      " \ pumvisible() ? "\" :
      " \ check_back_space() ? "\" :
      " \ coc#refresh()
" " gdで定義ジャンプ
" nmap gd (coc-definition)


" ---------------------------------------
" sakikazu setting
" ---------------------------------------
hi TabLine     term=reverse cterm=reverse ctermfg=white ctermbg=black
hi TabLineSel  term=bold cterm=bold,underline ctermfg=5
hi TabLineFill term=reverse cterm=reverse ctermfg=white ctermbg=black

" ペースト時に前行のコメントアウトが引き継がれてしまう件の対処
autocmd FileType * set formatoptions-=ro


"======= commands  =======
command! E Explore

" 現在ファイルの相対パスをクリップボードにコピー
command! FileNameRelative :call s:FileNameRelative()
function! s:FileNameRelative()
  let @* = expand('%:.')
  let @" = expand('%:.')
endfunction
"======= maps  =======

nnoremap <silent> <C-e> :NvimTreeFindFileToggle<CR>
" nnoremap <silent> <C-e> :Ex<CR>

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

map tc :tabnew<space>~/dotfiles/cheatsheet/


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

" paste関連（トグルできない？）
map setp :set paste<CR>
map setnp :set nopaste<CR>

" 大幅横移動
nmap <silent> <S-l> 15<right>
vmap <silent> <S-l> <C-o>15<right>
nmap <silent> <S-h> 15<left>
vmap <silent> <S-h> <C-o>15<left>

" S-Tabが効かないのでTabは却下
" nmap <silent> <S-Tab> 15<left>
" vmap <silent> <S-Tab> <C-o>15<left>
" nmap <silent> <tab> 15<right>
" vmap <silent> <tab> <C-o>15<right>


" ---------------------------------------
" 大仲さんのを一部
" ---------------------------------------
" window resize
nnoremap + 4<C-w>+
nnoremap - 4<C-w>-
nnoremap { 4<C-w><
nnoremap } 4<C-w>>


" --------------------------------------------------------------
" for PHP
" --------------------------------------------------------------
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags = 1

autocmd BufNewFile,BufRead *.ctp set filetype=php
autocmd BufNewFile,BufRead *.cls set filetype=php
autocmd BufNewFile,BufRead *.tpl set filetype=php

" expandtabはタブをスペースに変換するので、noexpandtabでその逆
" autocmd BufNewFile,BufRead *.php set nowrap ts=4 sw=4 sts=4 noexpandtab
autocmd BufNewFile,BufRead *.php set nowrap ts=4 sw=4 sts=4 expandtab

" --------------------------------------------------------------
" for JavaScript
" --------------------------------------------------------------
autocmd BufNewFile,BufRead *.js set nowrap ts=2 sw=2 sts=2 expandtab
" これでnerdcommenterがJS用のコメントアウトをしてくれるようになるが、vim-vueのシンタックスハイライトは効かなくなる
autocmd BufNewFile,BufRead *.vue set filetype=javascript


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
" for mac
" ※この行をコピペしたらうまくできないよ。ちゃんと↓のページにある通りやって
" http://d.hatena.ne.jp/esf/20100720/1279585601
"------------------------------------
noremap!  

"------------------------------------
" for MacVim
"------------------------------------
" Yankと選択時にクリップボードにコピー(Yankでもできるんかー！)
" set clipboard=unnamed,autoselect

" 上のをやると、文字削除したりとかでもクリップボードに入っちゃうのでめんどくさいので無効にした
" set clipboard=
" set clipboard+=unnamed


" Macでcrontabを編集するために（vimのバックアップの問題）
" http://weble.org/2011/06/06/mac-cron
set backupskip=/tmp/*,/private/tmp/*



"------------------------------------
" その他、vimの技メモ
"------------------------------------
" grepは、vimgrep（内部）ではなく、外部grepのRegrep（再帰的、メタキャラクタのエスケープ不要）を使う


"------------------------------------
" for WSL(windows)
"------------------------------------

" WSLでyankでクリップボードにコピー
if system('uname -a | grep microsoft') != ''
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif

"------------------------------------
" include external setting
"------------------------------------
if filereadable(expand('./.nvim_init.local.vim'))
  source ./.nvim_init.local.vim
endif
