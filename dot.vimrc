" Remap leader key.
let mapleader=","
let maplocalleader=","

" Load indentation rules an plugins according to the detected filetype.
filetype plugin indent on

" Enable syntax highlighting.
syntax on

" Hide uganda message.
set shortmess+=I

" Enable numbering relative to position.
set relativenumber
" Settings for viminfo.
set viminfo=!,'50,n~/.vim/viminfo

" Directory for swap files.
set dir=~/.vim/tmp//

" Directory for backup files.
set backupdir=~/.vim/tmp//

" Enable persistent undofiles.
set undofile

" Directory for undo files.
set undodir=~/.vim/undo//

" Smart search.
set smartcase
set ignorecase

" Highlight search results.
set incsearch
set showmatch
set hlsearch

" Replace all occurences in the string
set gdefault

" Show current line.
set cursorline

" Show current position in the status line
set ruler

" Set Solarized theme
set background=dark
colorscheme solarized
