"""""""""""""""""""""""""
"""BEGIN VUNDLE CONFIG"""
"""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let &rtp .= ',' . expand('<sfile>:p:h').'/_vim/bundle/Vundle.vim'
call vundle#begin()

"""PLUGINS"""
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'morhetz/gruvbox'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-repeat'
Plugin 'w0rp/ale'
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""
"""END VUNDLE CONFIG"""
"""""""""""""""""""""""

"""""""""""""""""""""""
"""ALE CONFIGURATION"""
"""""""""""""""""""""""
let ale_enabled=1
let ale_python_auto_pipenv=1
let ale_completion_enabled=1
let ale_cursor_detail=1
let ale_echo_cursor=1
let ale_lint_on_enter=1
let ale_lint_on_filetype_changed=1
let ale_lint_on_save=1
let ale_lint_on_text_changed='always'
let ale_lint_on_insert_leave=1
let ale_set_balloons=has('balloon_eval') && has('gui_running')
let ale_set_highlights=1                                     
let ale_sign_highlight_linenrs=1
let ale_update_tagstack=1
let ale_python_black_autopipenv=1

" Allow ALE to handle fixers
let g:ale_fixers = {
\	'python': [
\		'add_blank_lines_for_python_control_statements',
\		'black',
\		'reorder-python-imports',
\		'remove_trailing_lines',
\		'trim_whitespace',
\	]
\}

let ale_enabled=1
let ale_python_auto_pipenv=1

" stop autoinserting text
set completeopt=menu,menuone,preview,noselect,noinsert             

"""""""""""""""""""""""
""" END ALE CONFIG  """
"""""""""""""""""""""""

" add tags if there is one in this directory, or any of its ancestors
set tags=./tags;,tags;
autocmd DirChanged * :execute "set tags=./tags;,tags;"
	
" open NERDTree and Startify if no file was specified
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w 
								\ | else
                \ | endif

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
syntax on " Syntax highlighting
set bg=dark
set ruler
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set incsearch
set number
set wildmenu
set wildmode=longest:full,full

" Settings based on which vim is running
if has("gui_running")
	set guifont=Consolas:h10:cANSI:qDRAFT
	colorscheme gruvbox
else
	colorscheme desert
endif

" set python version
if has('python3')
	set pyx=3
elseif has('python')
	set pyx=2
endif
