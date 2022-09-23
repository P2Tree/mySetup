" NOTE: some of those settings set by default in neovim, so if I will transmit
" all of the configuration into init.lua, be careful to checkout the options
" which already set by default.
" Edit
set backspace=indent,eol,start
set nobackup
set swapfile
set ignorecase
set nocompatible
set completeopt=menu,menuone,noselect
set hidden
set includeexpr=substitute(v:fname,'\\.','/','g')
set autowrite
set autoread
set nowrapscan
set autochdir

" Interface
set linebreak
set showbreak=>>
set mouse=a
set showcmd
set laststatus=2
set belloff=all
set wildmenu
set title
set signcolumn=yes
set cursorcolumn
" set cursorline
set cursorlineopt=both
set conceallevel=1
set display+=lastline,msgsep
set synmaxcol=1000 " max syntax highlight in one line onely support 1000 characters
set spell " enable spell check, more options taks over by plugin
set foldmethod=manual  " more options takes over by plugin

" Keymapping
set pastetoggle=<F2>
" di-highlight
nnoremap <esc> :nohl<cr>

" quit window or buffer
nnoremap <expr>q (len(getbufinfo({'buflisted': 1})) == 1) ? ":echo \"Last buffer!\"<cr>" : ":bd<cr>"
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

" Filetype
autocmd BufNewFile,BufRead .clang-tidy set filetype=yaml

" Fcitx5 auto switch
" Every time exit insert mode, automatically close fcitx5
autocmd InsertLeave * :silent !fcitx5-remote -c

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

" Neovim
if has("nvim")
  if has("nvim-0.7")
    lua require "init"
  else
    echo "This configuration needs NeoVim 0.7+ version"
  endif
else
  echo "This configuration needs NeoVim"
endif

