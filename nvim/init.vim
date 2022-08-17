" Edit
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set backspace=indent,eol,start
set nobackup
set swapfile
set ignorecase
set smartcase
set autoindent
set nocompatible
set completeopt=menu,menuone,noselect
set list
set hidden
set includeexpr=substitute(v:fname,'\\.','/','g')
set autowrite
set autoread
set nowrapscan
set autochdir

" Interface
set number
set nowrap
set linebreak
set showbreak=>>
set hlsearch
set ruler
set mouse=a
set showcmd
set laststatus=2
set belloff=all
set termguicolors
set wildmenu
set title
set signcolumn=yes
set cursorcolumn
set cursorline
set cursorlineopt=both
set conceallevel=1
set scrolloff=1
set sidescrolloff=5
set display+=lastline,msgsep

" Encoding
set encoding=utf-8
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936

" Keymapping
set pastetoggle=<F2>
let mapleader=" "
" cursor move
cmap <C-p> <Up>
cmap <C-n> <Down>
noremap H ^
noremap L $
noremap J <C-e>
noremap K <C-y>
" window
noremap <C-left> <C-w>h
noremap <C-right> <C-w>l
noremap <C-up> <C-w>k
noremap <C-down> <C-w>j
noremap <C-s> <C-w>s
noremap <C-S> <C-w>v
" di-highlight
nnoremap <silent><leader>/ :nohls<CR>
" quit window or buffer
nnoremap <expr>q (len(getbufinfo({'buflisted': 1})) == 1) ? ":q<cr>" : ":bd<cr>"
" delete it, not concat it
nnoremap <leader>x "_x
nnoremap <leader>X "_X
nnoremap <leader>d "_d
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
vnoremap <leader>d "_d
vnoremap <leader>dd "_dd

" Filetype
autocmd BufNewFile,BufRead .clang-tidy set filetype=yaml

" Fcitx5 auto switch
" Every time exit insert mode, automatically close fcitx5
autocmd InsertLeave * :silent !fcitx5-remote -c

" Binary
" Enter binary mode when editing a file with postfix 'bin'
augroup Binary
  autocmd!
  autocmd BufReadPre  *.bin let &bin=1
  autocmd BufReadPost *.bin if &bin | %!xxd
  autocmd BufReadPost *.bin set filetype=xxd | endif
  autocmd BufWritePre *.bin if &bin | %!xxd -r
  autocmd BufWritePre *.bin endif
  autocmd BufWritePost *.bin if &bin | %!xxd
  autocmd BufWritePost *.bin set nomod | endif
augroup END

" Cursor
" Set cursor shape to beam instead of block,
" if exists('&TMUX')
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" else
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"   let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" endif
let &t_SI .= "\e[6 q"
let &t_SR .= "\e[3 q"
let &t_EI .= "\e[2 q"

" Neovim
if has("nvim")
  lua require "init"
else
  echo "This configuration needs NeoVim"
endif

