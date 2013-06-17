set nocompatible						" Make Vim more useful
set clipboard=unnamed					" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu							" Enhance command-line completion
set esckeys 							" Allow cursor keys in insert mode
set backspace=indent,eol,start			" Allow backspace in insert mode
set ttyfast								" Optimize for fast terminal connections
set gdefault							" Add the g flag to search/replace by default
set encoding=utf-8 nobomb				" Use UTF-8 without BOM
let mapleader=","						" Change mapleader
set binary								
set noeol 								" Don't add empty newlines at the end of files

" Centralize backups, swapfiles and undo history
silent execute '!mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo'
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

set modeline							" Respect modeline in files
set modelines=4

"set exrc								" Enable per-directory .vimrc files and disable unsafe commands in them
set secure
set number								" Enable line numbers
syntax on								" Enable syntax highlighting
set cursorline							" Highlight current line

set tabstop=2							" Make tabs as wide as two spaces
set shiftwidth=4						" size of an indent
set expandtab							" use spaces
set autoindent							
set smartindent

"set lcs=trail:·						
"set list 								" Show invisible characters
set hlsearch 							" Highlight searches
set ignorecase							" Ignore case of searches

set incsearch							" Highlight dynamically as pattern is typed
set laststatus=2						" Always show status line

set mouse=a								" Enable mouse in all modes

set noerrorbells						" Disable error bells

set nostartofline						" Don’t reset cursor to start of line when moving around.

set ruler								" Show the cursor position
set shortmess=atI						" Don’t show the intro message when starting Vim
set showmode							" Show the current mode

set title								" Show the filename in the window titlebar
set showcmd								" Show the (partial) command as it’s being typed
set scrolloff=3							" Start scrolling three lines before the horizontal window border


function! StripWhitespace()				" Strip trailing whitespace (,ss)
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

noremap <leader>W :w !sudo tee % > /dev/null<CR>	" Save a file as root (,W)


if has("autocmd")						" Automatic commands
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif
