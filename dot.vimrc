" Loading of local settings {{{
set exrc
set secure
" }}}

" Directories and files {{{
set viminfo=!,'50,n~/.vim/viminfo
set dir=~/.vim/tmp//
set backupdir=~/.vim/tmp//
if version >= 703
  set undofile
  set undodir=~/.vim/undo//
endif
" }}}

" Encodings {{{
let &termencoding=&encoding
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,latin1
" }}}

" Leader key {{{
let mapleader = '\'
let maplocalleader = '\'
" }}}

" Numbering {{{
set number
if version >= 704
  set relativenumber
  nnoremap <Leader>n :set rnu!<CR>:set nu!<CR>
elseif version>=703
  set relativenumber
  nnoremap <Leader>n :set rnu!<CR>
else
  nnoremap <Leader>n :set nu!<CR>
endif
" }}}

" Indentation {{{
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }}}

" Searching/Replacing {{{
set smartcase
set ignorecase
set incsearch
set showmatch
set hlsearch
set gdefault
nnoremap <Leader><Space> :noh<CR>
" }}}

" Colors {{{
if !has("gui_running")
  set t_Co=256
endif
set background=dark
colorscheme solarized
" }}}

" Visual stuff {{{
" Enable syntax highlighting.
syntax on
" Hide uganda message
set shortmess+=I
" Always show statusline.
set laststatus=2
" Show at least 5 lines below and above cursor.
set scrolloff=5
" Show invisible chars.
set list
set listchars=tab:→\ ,eol:¬
" Show current position in status line.
set ruler
" Show current line.
set cursorline
" Show commands.
set showcmd
" Show modes.
set showmode
" Enable soft wrapping of text.
set wrap
" Toggle invisible symbols
nnoremap <Leader>i :set list!<CR>
" }}}

" Clipboard {{{
set clipboard=unnamed
" }}}

" Misc settings {{{
" Fast terminal connection.
set ttyfast
" Make buffer hidden when abandoned.
set hidden
" Improve command line completion.
set wildmenu
set wildmode=list:longest
" Specify what backspace can erase.
set backspace=indent,eol,start
" Enable reading man pages.
runtime ftplugin/man.vim
" Completion.
set completeopt-=preview
" }}}

" Functions {{{
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line('.')
  let c = col('.')
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position.
  let @/=_s
  call cursor(l, c)
endfunction
" }}}

" Misc mappings {{{
" Disable arrows in normal, visual and insert modes.
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" Exit from insert mode.
inoremap jj <Esc>
inoremap оо <Esc>
" Easy movement around windows.
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" Strip trailing whitespaces.
nnoremap <silent> <Leader>s :call Preserve("%s/\\s\\+$//e")<CR>
" Help.
nnoremap <Leader>h :vert help 
" Toggle fold.
nnoremap <Space> za
" Select last edited text.
nnoremap gV `[v`]
" }}}

" vimrc.local {{{
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" }}}
