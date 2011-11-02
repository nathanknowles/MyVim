"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" N8's Vim RC file
" -------------------------------------------------------------
"
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Parenthesis/bracket expanding
"    -> General Abbrevs
"    -> Editing mappings
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No vi-compatible
set nocompatible

set spelllang=en

syntax on
" Sets how many lines of history VIM has to remember
set history=1000
set undolevels=1000

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim_runtime/vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc
if has('gui_win32')
    set dir=$TEMP
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set visualbell
set number

set ffs=unix,dos,mac "Default file types

set smartindent

"Four spaces for tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Turn on Completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Who needs .gvimrc?
if has('gui_running')
  set encoding=utf-8
  "set guifont=Monospace\ Bold\ 9
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
  " Turn off toolbar and menu
  set guioptions-=T
  set guioptions-=m
  try
    lang en_US
  catch
  endtry
  
  colorscheme clouds
else
  colorscheme desert
endif

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => StatusLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" adds to statusline
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

" a little more informative version of the above
nmap <C-S-P> :call<SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets up Pathogen
runtime bundle\pathogen\autoload\pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect() 

" NERDTree
map <F8> :NERDTreeToggle<CR>



"Can be: linux, mac, windows
fun! MySys()
  return "unix"
endfun

