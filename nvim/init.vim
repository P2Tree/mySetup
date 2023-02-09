" NOTE: some of those settings set by default in neovim, so if I will transmit
" all of the configuration into init.lua, be careful to checkout the options
" which already set by default.
" Edit
set encoding=utf-8
set syntax=on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set backspace=indent,eol,start
set nobackup
set swapfile
set undofile
set ignorecase
set smartcase
set autoindent
set smartindent
set nocompatible
set completeopt=menu,menuone,noselect
" set list " show all white spaces as character
set hidden
set includeexpr=substitute(v:fname,'\\.','/','g')
set cinoptions=:0
set autowrite
set autoread
set nowrapscan
set autochdir

" Interface
set number
set relativenumber
set cursorline
set cursorlineopt=both
set cursorcolumn
set linebreak
set showbreak=>>
set showcmd
set hlsearch
set ruler
" set mouse=a
set laststatus=2
set belloff=all
set termguicolors
set wildmenu
set title
set nowrap
set signcolumn=yes
set conceallevel=1
set scrolloff=2
set sidescrolloff=5
set history=9999 " command history max save
set display+=lastline
set fillchars+=diff:╱
set synmaxcol=1000 " max syntax highlight in one line onely support 1000 characters
set foldmethod=manual  " more options takes over by plugin
" set splitkeep=screen " keeps the same screen screen lines in all split
" windows, avaliable for vim 9.0 and neovim nightly

set termguicolors " enable true color

" Keymapping
set pastetoggle=<F2>
let mapleader=" "

" cursor move
cmap <C-p> <Up>
cmap <C-n> <Down>
noremap T J                " joint two line together
noremap H ^
noremap L $
noremap J <C-e>
noremap K <C-y>

" window
noremap <C-left> <C-w>h
noremap <C-right> <C-w>l
noremap <C-up> <C-w>k
noremap <C-down> <C-w>j
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap sv <C-w>v          " split new window with vetical
noremap sh <C-w>s          " split new window with horizon
noremap sc <C-w>c          " close current window
noremap so <C-w>o          " open current window

" quit window or buffer
nnoremap <expr>q (len(getbufinfo({'buflisted': 1})) == 1) ? ":echo \"Last buffer!\"<cr>" : ": bd<cr>"
nnoremap <expr>Q ":wqa<cr>"

" delete it, not concat it
nnoremap <leader>x "_x
nnoremap <leader>X "_X
nnoremap <leader>d "_d
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
vnoremap <leader>d "_d
vnoremap <leader>dd "_dd

" indent map
vnoremap <tab> >gv
vnoremap <S-tab> <gv

" Open init.vim and source it
nnoremap <leader>re :e $MYVIMRC<CR>
nnoremap <leader>rs :source $MYVIMRC<CR>

autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Binary
" Enter binary mode when editing a file with postfix 'bin'
augroup Binary
  autocmd!
  autocmd BufReadPre  *.bin,*.dat let &bin=1
  autocmd BufReadPost *.bin,*.dat if &bin | %!xxd
  autocmd BufReadPost *.bin,*.dat set filetype=xxd | endif
  autocmd BufWritePre *.bin,*.dat if &bin | %!xxd -r
  autocmd BufWritePre *.bin,*.dat endif
  autocmd BufWritePost *.bin,*.dat if &bin | %!xxd
  autocmd BufWritePost *.bin,*.dat set nomod | endif
augroup END

colorscheme habamax

" Neovim
" NOTE: make a soft link file of this file to ~/.vimrc, which can auto load
" those configures when you use vim instead nvim
if has("nvim")
  if has("nvim-0.8")
    aunmenu PopUp.How-to\ disable\ mouse
    aunmenu PopUp.-1-
    lua require "init"
  else
    echo "This configuration needs NeoVim 0.7+ version"
  endif
endif

