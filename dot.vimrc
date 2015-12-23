" vim:foldmethod=marker:foldlevel=0
" NeoBundle {{{
 if has('vim_starting')
   set nocompatible
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'vim-scripts/bufkill.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'lervag/vim-latex'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'fatih/vim-go'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'burnettk/vim-angular'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
"}}}
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
let mapleader = ','
let maplocalleader = ','
" }}}
" Numbering {{{
set number
if version >= 703
  set relativenumber
  nnoremap <Leader>n :set rnu!<CR>:set nu!<CR>
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
set listchars=tab:▸\ ,eol:¬
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
if v:version >= 703
  set colorcolumn=81
endif
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
" supertab {{{
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
let g:SuperTabClosePreviewOnPopupClose = 1
" }}}
" clang_complete {{{
let g:clang_complete_macros = 1
let g:clang_use_library = 1
if has('mac')
  let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/'
endif
" }}}
" airline {{{
" let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_exclude_preview = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
" }}}
" bufferline {{{
let g:bufferline_echo = 0
" }}}
" kls {{{
let g:kls_insertEnterRestoresLast = 1
" }}}
" ctrlp {{{
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
" }}}
" fugitive {{{
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
" }}}
" syntastic {{{
let g:syntastic_check_on_open=1
" }}}
" latex {{{
let g:tex_flavor = 'latex'
let g:tex_comment_nospell= 1
let g:latex_fold_enabled = 1
if has('mac')
  let g:latex_view_general_viewer = 'open'
  let g:latex_view_general_options = '-a Skim'
  nnoremap <Leader>ls :silent !~/Applications/Skim.app/Contents/SharedSupport/displayline -g <C-r>=line('.')<CR> <C-r>=g:latex#data[b:latex.id].out()<CR> "%:p"<CR><CR>
endif
" }}}
" {{{ gundo
nnoremap <Leader>u :GundoToggle<CR>
" }}}
" Autocommands {{{
" Hardwrapping for tex/latex.
au FileType tex setlocal textwidth=80 spell spelllang=en_us
" PEP8
au FileType python setlocal ts=4 sts=4 sw=4
" Set filetype for gnuplot scripts.
au BufNewFile,BufRead *.gnuplot setf gnuplot
" Restore cursor position.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Settings for quickfix.
au Filetype qf setlocal nonumber colorcolumn=
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
