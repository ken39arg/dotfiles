set nocompatible
filetype off

if has('vim_starting')
   set runtimepath+=~/.vim/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" NeoBundleFetch 'Shougo/neobundle.vim'

" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
" Bundle 'php-doc'
NeoBundle 'AutoComplPop'
NeoBundle 'Gist.vim'
" Bundle 'actionscript.vim--Cuss'

" git hub
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
" Bundle 'soh335/vim-symfony'
NeoBundle 'basyura/jslint.vim'
NeoBundle 'epmatsw/ag.vim'
NeoBundle 'tpope/vim-dispatch'


NeoBundleLazy 'nosami/Omnisharp', {
\     'autoload': {'filetypes': ['cs']},
\     'build': {
\         'mac': 'xbuild server/OmniSharp.sln',
\         'unix': 'xbuild server/OmniSharp.sln',
\     }
\ }

" end bundle

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
  autocmd FileType php :set dictionary+=~/.vim/PHP.dict
  " autocmd filetype php :set tags+=~/.vim/tags/symfony.tags

  autocmd Filetype php set makeprg=php\ -l\ %
  autocmd Filetype php set errorformat=%m\ in\ %f\ on\ line\ %l
  
  hi Pmenu ctermfg=Black ctermbg=Grey
  hi PmenuSel ctermbg=Blue
  hi PmenuSbar ctermbg=Cyan

endif

if has("cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
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
nnoremap <unique> <silent> <space>fb :FufBuffer!<CR>
nnoremap <unique> <silent> <space>ff :FufFile!<CR>
nnoremap <unique> <silent> <space>fm :FufMruFile!<CR>
nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:acp_enableAtStartup = 0
let g:fuf_keyOpen = '<CR>'
let g:fuf_keyOpenSplit = '<C-s>'
let g:fuf_keyOpenVsplit = '<C-v>'
let g:fuf_keyOpenTabpage = '<C-t>'
let g:fuf_keyNextMode = '<C-n>'

"{{{ symfony.vim map
" nnoremap <silent><space>sv :<C-u>Sview<CR>
" nnoremap <silent><space>sa :<C-u>Saction<CR>
" nnoremap <silent><space>sm :<C-u>Smodel<CR>
" nnoremap <silent><space>sp :<C-u>Spartial<CR>
" nnoremap <silent><space>sc :<C-u>Scomponent<CR>
" noremap <buffer><space>cc :Symfony cc<CR>

" yaml.vim
" au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/script/yaml.vim
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

" php-doc.vim
" Default values
" let g:pdv_cfg_Package = ""
" let g:pdv_cfg_Version = "$Id$"
" let g:pdv_cfg_Author  = "Kensaku Araga <ken39arg@gmail.com>"
" let g:pdv_cfg_Copyright = ""
" inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
" nnoremap <C-D> :call PhpDocSingle()<CR>
" vnoremap <C-D> :call PhpDocRange()<CR>

let g:ref_phpmanual_path = $HOME .'/Documents/phpmanual'
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
augroup MyGroup
  autocmd! MyGroup
  autocmd FileType javascript call s:javascript_filetype_settings()
augroup END

function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction
" }}}

autocmd BufNewFile,BufRead *.as set filetype=actionscript

" let g:neocomplcache_enable_at_startup = 1
