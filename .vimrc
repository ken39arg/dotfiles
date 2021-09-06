set nocompatible
filetype off

if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
    Plug 'thinca/vim-ref'
    Plug 'thinca/vim-quickrun'
    " Plug 'Shougo/neocomplete.vim'
    " Plug 'basyura/jslint.vim'
    " Plug 'epmatsw/ag.vim'
    Plug 'h1mesuke/vim-alignta'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'kannokanno/previm'
    Plug 'tyru/open-browser.vim'
    Plug 'uarun/vim-protobuf'
    " Plug 'rdunklau/vim-perltidy'
    Plug 'w0rp/ale'
    Plug 'google/vim-jsonnet'
    Plug 'posva/vim-vue'
call plug#end()

" NeoBundleLazy 'nosami/Omnisharp', {
" \     'autoload': {'filetypes': ['cs']},
" \     'build': {
" \         'mac': 'xbuild server/OmniSharp.sln',
" \         'unix': 'xbuild server/OmniSharp.sln',
" \     }
" \ }


filetype plugin indent on

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
"set ai                 " always set autoindenting on
"set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set vb t_vb=
"set number
set autoindent
:set modeline

" タブ文字可視化
set list
set listchars=tab:>\ 
hi SpecialKey guibg=NONE guifg=Gray ctermfg=darkgray

" call pathogen#runtime_append_all_bundles()

set statusline=%F%m%r%h%w\ %{&fileencoding}\ %{&fileformat}\ [%l/%L,\ %v]
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set laststatus=2

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

  hi Pmenu ctermfg=Black ctermbg=Grey
  hi PmenuSel ctermbg=Blue
  hi PmenuSbar ctermbg=Cyan

endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

" from kittu
nmap j gj
nmap k gk
vmap j gj
vmap k gk

nmap n nzz
nmap N Nzz

noremap X ^x

nnoremap <Esc><Esc> :<C-u>nohlsearch<Return>

" enc
"id:parasporospa
command! Utf8 e ++enc=utf-8
command! Euc e ++enc=euc-jp
command! Sjis e ++enc=cp932
command! Jis e ++enc=iso-2022-jp
command! WUtf8 w ++enc=utf-8 | e
command! WEuc w ++enc=euc-jp | e
command! WSjis w ++enc=cp932 | e
command! WJis w ++enc=iso-2022-jp | e

" fuzzy finder plugin
" nnoremap <silent> <Space>ff :<C-u>FuzzyFinderFile<Cr>
" nnoremap <silent> <Space>fm :<C-u>FuzzyFinderMruFile<Cr>
" nnoremap <silent> <Space>fb :<C-u>FuzzyFinderBuffer<Cr>
" let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}
" nnoremap <unique> <silent> <space>fb :FufBuffer!<CR>
" nnoremap <unique> <silent> <space>ff :FufFile!<CR>
" nnoremap <unique> <silent> <space>fm :FufMruFile!<CR>
" nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>
" autocmd FileType fuf nmap <C-c> <ESC>
" let g:fuf_patternSeparator = ' '
" let g:fuf_modesDisable = ['mrucmd']
" let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
" let g:fuf_mrufile_maxItem = 100
" let g:fuf_enumeratingLimit = 20
" let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
" let g:acp_enableAtStartup = 0
" let g:fuf_keyOpen = '<CR>'
" let g:fuf_keyOpenSplit = '<C-s>'
" let g:fuf_keyOpenVsplit = '<C-v>'
" let g:fuf_keyOpenTabpage = '<C-t>'
" let g:fuf_keyNextMode = '<C-n>'

nnoremap <silent> <Space>ff :FZF<CR>
nnoremap <silent> <Space>ag :Ag<CR>

" yaml.vim
au FileType yaml setlocal expandtab ts=2 sw=2 enc=utf-8 fenc=utf-8

" {{{ 場所ごとの設定
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
" }}}

set wildmode=list:longest,full

set splitright
set splitbelow

" {{{ inflect_pluralize
if !exists('g:inflect_pluralize_cmd')
  let g:inflect_pluralize_cmd = "perl -MLingua::EN::Inflect=PL -E 'print PL(\"%s\")'"
endif

function! s:inflect_pluralize(word)
  return system(substitute(g:inflect_pluralize_cmd, "%s", a:word, "g"))
endfunction

function! s:insert_(v)
  execute "normal i" . a:v ."\<Esc>"
  echo a:v
endfunction

command! -nargs=1 PL  echo s:inflect_pluralize(<q-args>)
command! -nargs=1 PLI call s:insert_(s:inflect_pluralize(<q-args>))
" }}}

" {{{ jslint.vim
" augroup MyGroup
"   autocmd! MyGroup
"   autocmd FileType javascript call s:javascript_filetype_settings()
" augroup END
"
" function! s:javascript_filetype_settings()
"   autocmd BufLeave     <buffer> call jslint#clear()
"   autocmd BufWritePost <buffer> call jslint#check()
"   autocmd CursorMoved  <buffer> call jslint#message()
" endfunction
" }}}


" vim-go
"" mapping
"" highlight
let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_hightlight_structs = 1
let g:go_hightlight_interfaces = 1
let g:go_hightlight_operators = 1
let g:go_hightlight_build_constraints = 1
"" GoFmt時にインポートするパッケージを整理(GoFmtはファイル書き込み時に自動的に実行される)
" let g:go_fmt_command = "goimports"
let g:go_gopls_enabled = 1
" 調子が悪いときは gopls -listen=:37374 -logfile=auto -debug=:0
" でデーモン起動して下記を設定してそれを使うようにするとログが見れる
" let g:go_gopls_options = ['-remote=:37374', '-logfile=auto', '-debug=:0', '-rpc.trace']

autocmd BufRead,BufNewFile *.faced setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab fileformat=unix encoding=utf-8
let g:vim_markdown_folding_disabled = 1
