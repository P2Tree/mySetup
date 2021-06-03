" ====================================================================="
"
"   ----------------  Author: PWE
"   ----------------  Email: dicksonliuming@gmail.com
"
"   -- Brief --
"   这个配置文件包含了所有我使用的vim所应该有的配置，包括通用配置、插件、
"   快捷键映射、外部配置文件引用、自定义快捷键等。
"   如果你是第一次使用该vim配置文件，需要在shell中执行如下一行命令：
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs " https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   然后需要找到Plugins部分，注释掉不需要的插件，反注释需要用的插件，运行":PlugInstall"来安装插件。
"   如果VIM是用编译的方法安装，需要在安装后对VIM的环境变量做配置，常规的配置
"   应该是在/etc/profile中加入：
"       ```
"       export VIM=/etc/vim
"       export VIMRUNTIME=/usr/local/share/vim/vim80
"       ```
"       然后source /etc/profile
"   还需要在bashrc中配置$VIM, $VIMRUNTIME
"
"   -- Contents --
"   输入' + mark，跳转到对应位置，如输入's，会跳转到快捷键设置部分
"   0. mark: c contents              目录
"   1. mark: g general setting       通用设置
"   2. mark: s shortcut keys config  快捷键配置
"   3. mark: p plugins setting       插件管理与配置
"
"   使用 za 可以打开/关闭折叠内容，zf100G 可以创建新的从当前行到第100行的折叠

" ========= Description of shortcut keys 常用快捷键说明 ==================="{{{
" ---------- Ctrl系按键 ----------
"
" Ctrl + O                   --跳到上一个编辑位置     [Normal模式]
" Ctrl + I                   --跳回下一个编辑位置     [Normal模式]
"
" Ctrl + u                   --向上滚屏               [Normal模式]
" Ctrl + d                   --向下滚屏               [Normal模式]
"
" Ctrl + h                   --切换到左边的分屏窗口
" Ctrl + l                   --切换到右边的分屏窗口
" Ctrl + k                   --切换到上边的分屏窗口
" Ctrl + j                  --切换到下边的分屏窗口
"
" Ctrl + o                  --返回光标上次停留位置，另外''也可以实现返回，但只能返回一次
"
" Ctrl + e                  --向下翻滚页面一行，光标不移动
" Ctrl + y                  --向上翻滚页面一行，光标不移动
"
" ---------- Shift系按键 ----------
"
" Shift + >>                 --当前行缩进增加一个单位
" Shift + <<                 --当前行缩进减少一个单位
"
" ---------- Leader系按键 ----------
"  你可以输入 :map <Leader> 比如：:map ,
"  来打印出所有以<Leader>键开头的键盘映射
"
" <Leader>rm                 --一键去除^M字符
" <Leader>rt                 --一键替换全部Tab为空格
"
" <Leader>ev                 --编辑当前所使用的Vim配置文件
" <Leader>sv                 --使当前的Vim配置文件生效
"
" <Leader>/                  --取消搜索后的单词高亮
"
" <Tab>                      --切换到后一个buffer
" <Shift-Tab>               --切换到前一个buffer
"
" <Leader>vsp               --将当前所在标签文件复制并左右分割
" <Leader>sp                --将当前所在标签文件复制并上下分割
"
" ---------- 跳转命令 ----------
"
" 0 or ^ or $                --跳至 行首 or 第一个非空字符 or 行尾
" %                          --在匹配的括号间跳跃
" { or }                     --按段落上/下跳跃
" f字符                      --跳至从当前光标开始本行第一个指定字符出现的位置
" gd                         --跳至当前光标所在单词首次出现的位置
" gf                         --打开当前光标所在的文件名，如果确实存在该文件的话
"
" ]c                         --跳到下一个差异处
" [c                         --跳到上一个差异处
"
" [ Ctrl+D                   --跳至当前光标所在变量的首次定义位置 [从文件头部开始]
" [ Ctrl+I                   --跳至当前光标所在变量的首次出现位置 [从文件头部开始]
" [ D                        --列出当前光标所在变量的所有定义位置 [从文件头部开始]
" [ I                        --列出当前光标所在变量的所有出现位置 [从文件头部开始]
"
" ---------- 文本操作 ----------
"
" dw de d0 d^ d$ dd          --删除
" cw ce c0 c^ c$ cc          --删除并进入插入模式
" yw ye y0 y^ y$ yy          --复制
" vw ve v0 v^ v$ vv          --选中
"
" di分隔符                   --删除指定分隔符之间的内容 [不包括分隔符]
" ci分隔符                   --删除指定分隔符之间的内容并进入插入模式 [不包括分隔符]
" yi分隔符                   --复制指定分隔符之间的内容 [不包括分隔符]
" vi分隔符                   --选中指定分隔符之间的内容 [不包括分隔符]
"
" da分隔符                   --删除指定分隔符之间的内容 [包括分隔符]
" ca分隔符                   --删除指定分隔符之间的内容并进入插入模式 [包括分隔符]
" ya分隔符                   --复制指定分隔符之间的内容 [包括分隔符]
" va分隔符                   --选中指定分隔符之间的内容 [包括分隔符]
"
" Xi和Xa都可以在X后面加入一个数字，以指代所处理的括号层次
" 如 d2i( 执行的是删除当前光标外围第二层括号内的所有内容
"
" dt字符                     --删除本行内容，直到遇到第一个指定字符 [不包括该字符]
" ct字符                     --删除本行内容，直到遇到第一个指定字符并进入插入模式 [不包括该字符]
" yt字符                     --复制本行内容，直到遇到第一个指定字符 [不包括该字符]
" vt字符                     --选中本行内容，直到遇到第一个指定字符 [不包括该字符]
"
" df字符                     --删除本行内容，直到遇到第一个指定字符 [包括该字符]
" cf字符                     --删除本行内容，直到遇到第一个指定字符并进入插入模式 [包括该字符]
" yf字符                     --复制本行内容，直到遇到第一个指定字符 [包括该字符]
" vf字符                     --选中本行内容，直到遇到第一个指定字符 [包括该字符]
"
" <                           --可视化模式下整块代码左移一个tab位
" >                           --可视化模式下整块代码右移一个rab位
"
" ---------- 便捷操作 ----------
"
" Ctrl + A                   --将当前光标所在数字自增1        [仅普通模式可用]
" Ctrl + X                   --将当前光标所在数字自减1        [仅普通模式可用]
" m字符       and '字符      --标记位置 and 跳转到标记位置
" q字符 xxx q and @字符      --录制宏   and 执行宏
"}}}

" ========= General setup 通用配置 ========================================"{{{
"
:se ff=mac                " --更改文件格式，可选 unix、dos、mac

" ------------ 定义快捷键前缀，即<Leader>" --------------
let mapleader=","

" ---------- system -------------
" Set your system, default 0 and 0 is linux
let g:isWIN = 0
let g:isMAC = 0
" I think vim is better to work at a terminal,
" and there are so many good IDEs in GUI environment with vim plugin.
let g:isGUI = 0

" ---------- themes, font and color ----------
" Before use custom theme, make sure your shell have used 256 color.
" Try `echo $TERM` or use `export TERM=xterm-256color` to setting it.
set background=dark " light
colorscheme gruvbox " molokai
set guifont=Source\ Code\ Pro\ 11

" ------------- 基本配置 --------------
set autowrite                   " 自动保存"
set backspace=eol,start,indent  " 设置退格键可用
set whichwrap+=<,>,h,l          " 配合退格键使用
set autoindent!                 " 设置自动缩进
set smartindent                 " 智能自动缩进
set cindent                     " c/c++缩进模式
set relativenumber              " 开启相对行号
set number                      " 显示行号
set ruler                       " 右下角显示光标位置的状态行
set incsearch                   " 开启实时搜索功能，搜索时可以实时匹配
set hlsearch                    " 开启高亮显示结果
set ignorecase                  " 搜索时大小写不敏感"
set smartcase                   " 如果搜索内容中包含大写字母，则不使用ignorecase
set nowrapscan                  " 搜索到文件两端时不重新搜索
set nocompatible                " 关闭vi兼容模式，避免之前版本的一些bug
set hidden                      " allow change buffer when current buffer is unsave "允许在有未保存的修改时切换缓冲区
set autochdir                   " 设定文件浏览器目录为当前目录
set foldmethod=marker           " 选择代码折叠类型，can select: manual, indent, syntax, marker, diff, expr
" set foldlevel=100               " 禁止自动折叠
set foldenable                  " 启动vim时打开折叠代码
set laststatus=2                " 开启状态栏信息，2为总显示最后一个窗口的状态行，1则为窗口数多于一个的时候显示最后一个窗口的状态行，0为不显示最后一个窗口的状态行
set cmdheight=1                 " 命令行的高度，默认为1，这里设为2
set autoread                    " 当文件在外部被修改时自动更新该文件
set nobackup                    " 不生成备份文件
set noswapfile                  " 不生成交换文件
set wildmenu                    " vim 自身命令行模式智能补全"
set list                        " Show special characters " 显示特殊字符
set listchars=tab:\~\ ,trail:.  " Tab is indicated with '~', trail is indicated with '.' "Tab使用高亮~代替，尾部空白使用高亮点号代替
set showmatch                   " 显示括号配对情况
set nowrap                      " 禁止代码自动折行
set history=100                 " 设置vim历史记录最大条目数
"set magic
set mat=4                       " 光标闪烁以及闪烁频率

set lazyredraw                  " Don't update screen during macro and script execution "在宏和脚本运行时不要刷新屏幕（提高使用性能）

"set scroll=5                   " 指定翻页时的行数，默认不设置则为半页
set scrolloff=10                 " When moving the cursor scroll the screen, at least remain the 'scrolloff' lines above or below
                                "上下移动光标使正文滚页时，光标的上方或下方将至少始终保留的行数，默认给7行 set so=7

set cursorline                  " highlight current line "高亮光标当前行
set cursorcolumn                " highlight current column "高亮光标当前列
hi CursorLine   cterm=underline ctermbg=darkred ctermfg=none  " config current line color style "配置高亮当前行样式
hi CursorColumn cterm=NONE  ctermbg=lightmagenta ctermfg=none " config current column color style "配置高亮当前列样式

set showcmd                     " 命令行显示输入的命令
set noshowmode                    " 命令行显示vim当前模式中

set mouse=a                     " 启动鼠标操作

" 设置通用缩进策略
set expandtab                   " Automatically converts tabs to Spaces " 将Tab自动转化成空格
set tabstop=4                   " Spaces occupied by tab " 设置编辑时制表符占用空格数
set shiftwidth=2                " Spaces occupied by tab when formatting " 设置格式化时制表符占用空格数
set softtabstop=2               " Treat the number of spaces as tab " 把连续数量的空格视为一个制表符
set smarttab                    " delete a tab with one backspace button " 按一次backspace就删除整个tab

" 与系统共用剪切板，（将系统剪切板与匿名寄存器映射）
set clipboard=unnamed

" 文件类型检测与语法开关
if has("syntax")
    syntax enable               " 打开语法高亮
    syntax off                  " 允许用指定语法高亮配色方案替换默认方案
endif
filetype on                     " 开启文件类型侦测
filetype indent on              " 针对不同的文件类型采用不同的缩进格式
filetype plugin on              " 针对不同的文件类型加载对应的插件
filetype plugin indent on       " 针对不同的文件类型加载对应的插件缩进

let c_minlines=200  " This maybe slow down syntax highlight,
                    " 标记语法高亮的检查行数，对于比较大范围的 #if 0 可以有效判断，但会拖慢语法高亮

" 根据后缀名指定文件类型
autocmd BufRead,BufNewFile *.h            setlocal ft=c
autocmd BufRead,BufNewFile *.i            setlocal ft=c
autocmd BufRead,BufNewFile *.m            setlocal ft=objc
autocmd BufRead,BufNewFile *.ss           setlocal ft=scheme
autocmd BufRead,BufNewFile *.txt          setlocal ft=txt
autocmd BufRead,BufNewFile *.log          setlocal ft=conf
autocmd BufRead,BufNewFile hosts          setlocal ft=conf
autocmd BufRead,BufNewFile *.conf         setlocal ft=dosini
autocmd BufRead,BufNewFile *.ini          setlocal ft=dosini
autocmd BufRead,BufNewFile CMakeLists.txt setlocal ft=cmake
autocmd BufRead,BufNewFile *.cmake        setlocal ft=cmake
autocmd BufRead,BufNewFile *.launch       setlocal ft=xml

" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8                          " 设置内部编码"
set fileencodings=utf-8,gbk,cp936,latin-1   " 设置支持的文件编码"
set ambiwidth=double
set fileformat=unix                         " 设置新文件的EOL格式"
set fileformats=unix,mac,dos                " 给出文件的EOL格式类型"

autocmd FileType text,markdown,html,xml set wrap " 这些类型文件允许自动折行
augroup filetype
  au! BufRead,BUfNewFile .local.zshrc set filetype=zsh
augroup END

" 以下的内容是用于避免中文菜单的乱码问题，默认设置为在windows系统中启用
if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

" 打开vim，自动定位到上次最后变更的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

" initialize tags path
set tags=./tags;,tags

highlight ExtraWhitespace ctermbg=red guibg=red         " highlight trailing whitespace in red "高亮行末空格为红色
match ExtraWhitespace /\s\+$/                           " match trailing whitespace "匹配行末空格
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()               " for performance

" This function can delete trailing whitespace
" "这个函数通过替换命令删除行尾空格
func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc

au BufWrite * :call DeleteTrailingWS()    " Auto delete trailing whitespace when save file "保存时自动删除行尾空格

" change cursor shape and color with different mode
" if terminal is xterm
" if exists('$TMUX')
  " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  " let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" else
  " let &t_EI = "\eP\e\<Esc>]50;CursorShape=0\x7\e\\"
  " let &t_SI = "\eP\e\<Esc>]50;CursorShape=1\x7\e\\"
  " let &t_SR = "\eP\e\<Esc>]50;CursorShape=2\x7\e\\"
" endif

" if terminal is iterm2
if exists('&TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
endif

" ------------- Use for LLVM -------------------
" Set a few indentation parameters for LLVM source code style.
" set cinoptions=:0,g0,(0,Ws,l1
" au FileType tablegen set cinoptions+=<<>0
au FileType tablegen set cinkeys+=0<<>

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END
" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax
augroup filetype
    au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END
augroup filetype
    au! BufRead,BufNewFile *Makefile*       set filetype=make
augroup END

" change tab indent strategy for some c style files
au FileType c,cpp,html,htmldjango,lua,javascript,nsis
    \ set expandtab | set tabstop=2 | set shiftwidth=2

" set textwidth, auto return to next line when exceed the number
" 设置文本宽度，当输入大于该数值时，自动换行
au FileType c,cpp,tablegen,llvm set textwidth=80

" textwidth border highlight "文本宽度高亮提示线
au FileType c,cpp,tablegen,llvm set colorcolumn=81

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs, set tabs to 8 spaces
" 在makefile中，不将tabs扩展成空格，因为我们需要真的tab，并设定tab为8个空格
au FileType make set noexpandtab | set tabstop=8 | set shiftwidth=8

" ------------- END of Use for LLVM -------------------
"}}}

" ========= shortcut key config 快捷键配置 ================================"{{{

"关闭方向健"
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" Ctrl + hjkl 改为切换窗口键"
map <c-h> <esc><c-w>h
map <c-l> <esc><c-w>l
map <c-k> <esc><c-w>k
map <c-j> <esc><c-w>j

" Ctrl + vs 为将当前窗口左右复制分割
" Ctrl + hs 为将当前窗口上下复制分割
nnoremap <Leader>vs <esc><c-w>v
nnoremap <Leader>hs <esc><c-w>s
" 另外备注：
" 打开新文件并左右分割：:vsp filename
" 打开新文件并上下分割：:sp filename
nnoremap :vs :vsp
nnoremap :hs :sp
"
" 调整窗口大小
nnoremap <silent> + :exe "resize " . (winheight(0) * 4/3)<cr>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 3/4)<cr>
nnoremap <silent> = :exe "vertical resize " . (winwidth(0) * 4/3)<cr>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 3/4)<cr>
"
" 交换上下行切换的物理切换与逻辑切换"
" 即自动折行后，上下行可以移动光标到同一行的折行部分
" nnoremap k gk
" nnoremap gk k
" nnoremap j gj
" nnoremap gj j

" 增加一行但不进入插入模式"
nnoremap to o<Esc>
nnoremap tO O<Esc>

"关闭上次搜索的高亮"
noremap <silent><leader>/ :nohls<CR>

" 保证缩进调整后，还是选中状态"
vnoremap < <gv
vnoremap > >gv

" 自动跳转到粘贴文本的最后
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"没有权限时保存"
cmap w!! w !sudo tee >/dev/null %

"改变撤销后反撤销的键位"
nnoremap U <C-r>

" Ctrl + ]            多选择跳转
" 说明一下，因为有些时候会对应多个tags，而第一个tag不一定是我们想跳转的位置，
" 所以不如就每次跳转时，如果有多个tags，就输出列表让我自己选择
nnoremap <c-]> g<c-]>

" Scroll down for the specified lines "向下滚屏 8行
nnoremap J 8j
" Scroll up for the specified lines "向上滚屏 8行
nnoremap K 8k

" switch to line head "光标跳转到行首
nnoremap H ^
" switch to line tail "光标跳转到行尾
nnoremap L $

" quit buffer file " 关闭buffer
nnoremap <expr>q (len(getbufinfo({'buflisted':1})) == 1) ? ":q<cr>" : ":bd<cr>"

" \rm remove windows ^M "去除windows字符^M
nnoremap <leader>rm :%s/<c-v><c-m>//g<cr>

" \rt exchange tab with space "替换全部Tab为空格
nnoremap <leader>rt :retab<cr>

" \ev open and edit default vimrc "打开编辑默认vimrc
nnoremap <leader>ev <esc>:e $MYVIMRC<cr>
" \sv source default vimrc "生效默认vimrc
nnoremap <leader>sv <esc>:source $MYVIMRC<cr>

" 真正的删除，而不是剪切
nnoremap <leader>x "_x
nnoremap <leader>X "_X
nnoremap <leader>d "_d
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
vnoremap <leader>d "_d
vnoremap <leader>dd "_dd

" switch buffers with number
nnoremap <Leader>1 :1b<cr>
nnoremap <Leader>2 :2b<cr>
nnoremap <Leader>3 :3b<cr>
nnoremap <Leader>4 :4b<cr>
nnoremap <Leader>5 :5b<cr>
nnoremap <Leader>6 :6b<cr>
nnoremap <Leader>7 :7b<cr>
nnoremap <Leader>8 :8b<cr>
nnoremap <Leader>9 :9b<cr>

" Update cursor position free.
" 快捷更新光标位置，不再需要考虑当前光标位置
nnoremap <expr><leader>z Redraw()
fun! Redraw()
  let l = winline()
  let cmd = l * 2 <= winheight(0) + 1 ? l <= (&so + 1) ? 'zb' : 'zt' : 'zz'
  return cmd
endf
"}}}

" ========= Plugins Settings 插件管理与配置 ==============================="{{{
"
" 如果你是第一次使用该vim配置文件，需要在shell中执行如下一行命令：
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" 基本操作（在命令行模式下输入）：
" :PlugStatus        检查插件状态
" :PlugInstall       安装已声明但未安装的插件
" :PlugUpdate        更新已安装的插件
" :PlugDiff          检查插件安装前后差异
" :PlugClean         删除已安装但未声明的插件
" :PlugUpgrade       更新Vim-plug工具
"
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }  " coc-lists also use it
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                 " exchanged by coc-lists
" Plug 'airblade/vim-gitgutter'             " show git diff in the code, jump to changed code hunks
Plug 'mhinz/vim-signify'                  " show git diff in the code, exchange vim-gitgutter
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'       " check tag files and update autometically
Plug 'skywind3000/asyncrun.vim'           " async running tesk
Plug 'tpope/vim-fugitive'                 " package of git operation
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format', { 'for': ['cpp', 'llvm', 'tablegen'] }
Plug 'derekwyatt/vim-fswitch'             " switch between source file and corresponding header file
Plug 'luochen1990/rainbow'
Plug 'othree/xml.vim'                     " xml file helper
" Plug 'scrooloose/nerdtree'                " 工程目录管理，替代vim中固定的newtrw插件，功能一样
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ---------- 插件配置选项 ----------"
" 可以通过搜索：Plugin:[plugin name]来全文快速查找插件配置
"
" # 部分插件需要系统软件的支持，罗列在这里：

" Plugin:vim-airline (https://github.com/vim-airline/vim-airline)"
" 加入airline状态栏
let g:airline_powerline_fonts = 0 " 字体
let g:airline#extensions#tabline#enabled = 1  " 允许显示tabline
let g:airline#extensions#tabline#formatter = 'unique_tail'   " tabline上的标题只显示文件名
let g:airline#extensions#tabline#buffer_nr_show = 1    " tabline上显示buffer的标号
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>
let g:airline#extensions#whitespace#enabled=0   " 下边两行为关闭状态栏空白符号计数显示
let g:airline#extensions#whitespace#symbol='!'

" Plugin:indentLine (https://github.com/Yggdroot/indentLine)"
" 缩进指示插件
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_enabled = 1

" Plugin:nerdcommenter (https://github.com/scrooloose/nerdcommenter)"
" NERDcommenter      注释处理插件
" 以下为插件默认快捷键，其中的说明是以C/C++为例的
" \ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" \cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" \cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" \cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" \cca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" \cA 行尾注释
let g:NERDSpaceDelims = 1                        " 自动添加前置空格
let g:NERDCompactSexyComs = 1                    " 美化多行注释下的紧凑语法
let g:NERDefaultAlign = 1                        " 注释在评论行的最左边而不是跟随代码缩进
let g:NERDAltDelims_c = 1                        " 使用c的分隔符作为默认备用分隔符
let g:NERDCustomDelimiters =
      \ { 'c': { 'left': '/*', 'right': '*/'},
      \   'tablegen': { 'left': '//', 'right': '' } }
let g:NERDCommentEmptyLines = 1                  " 允许注释空行

" Plugin:tagbar
nmap <leader>tb :TagbarToggle<cr>
let g:tagbar_autofocus = 1
let g:tagbar_width = 40
let g:tagbar_compact = 1  " do not show Press F1 for help

" Plugin:fzf插件
" you need to install fzf tool in your system and add install path to PATH
" then you need to move fzf.vim (find in fzf source project) to your .vim/plugin folder.
" be noticed that fzf.vim is not fzf vim plugin, but a help configure that fzf vim plugin needed.
nmap <Leader>f :Files<cr>
nmap <Leader>b :Buffers<cr>
nmap <Leader>t :Tags<cr>
nmap <Leader>o :Rg <c-r><c-w><cr>    " must be supported by rg
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_history_dir = '~/.fzf-history'

command! -bang -nargs=+ -complete=dir Rg
      \ call fzf#vim#grep(
      \   "rg --column --line-number --no-heading --color=always --smart-case "
      \   .(len(<q-args>) > 0 ? <q-args>: '""'),
      \   1,
      \   {'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]},
      \   <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(
      \   <q-args>,
      \   <bang>0)

" Plugin:vim-gitgutter (https://github.com/airblade/vim-gitgutter.git)
" 可以在代码中显示当前的修改情况，自动标记增加、删除、修改行，以及跳转到下个修改段等功能
"
" current hunk is what your cursor pointed to.
" <Leader>ha : add current hunk into git stage, if you regret to do it, use git
"              to rollback -- git reset HEAD <file>
" <Leader>hr : reset current hunk to what it write before
" <Leader>hv : view current hunk with a small window
" <Leader>hn : jump to next hunk
" <Leader>hm : jump to previous hunk
"
" let g:gitgutter_terminal_reports_focus = 1
" set updatetime=200 " Pay attentain that this is a vim config option
" nmap <Leader>ha <Plug>(GitGutterStageHunk)
" nmap <Leader>hr <Plug>(GitGutterUndoHunk)
" nmap <Leader>hv <Plug>(GitGutterPreviewHunk)
" nmap <Leader>hn <Plug>(GitGutterNextHunk)
" nmap <Leader>hm <Plug>(GitGutterPrevHunk)

" Plugin: Signify (https://github.com/mhinz/vim-signify)
" 显示版本控制的修改信息，如git, svn
"
let g:signify_vcs_list = [ 'git' ]
noremap <silent><leader>sd :SignifyDiff!<cr> <c-w>h
noremap <silent><leader>su :SignifyHunkUndo<cr>
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
set updatetime=100
" let g:signify_realtime = 1    " if update not work until :w, try this setting
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Plugin:auto-pairs (https://github.com/jiangmiao/auto-pairs.git)
" 括号自动匹配与删除
"
au Filetype tablegen let g:AutoPairs["<"] = ">"

" Plugin:vim-gutentags (https://github.com/ludovicchabant/vim-gutentags.git)
" 管理tags文件并自动更新
"
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = 'tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Plugin: AsyncRun (https://github.com/skywind3000/asyncrun.vim.git)
" 异步运行插件，可以指定任何需要异步运行的任务
"
" auto open quickfix window with height fixed
let g:asyncrun_open = 15
" bell after tesk finished
let g:asyncrun_bell = 1
" open/close quickfix window
nnoremap <silent><leader>w :call asyncrun#quickfix_toggle(15)<cr>
" 以下配置用于构建相关任务
" make project (only used for LLVM, you can change it to your project)
nnoremap <silent><leader>m :AsyncRun -cwd=<root> cd build && ninja<cr>
" auto open quickfix when finish build
au User AsyncRunStop copen15 | clast | wincmd p
" next error item
nnoremap <silent><leader>cn :cn<cr>
" previous error item
nnoremap <silent><leader>cp :cp<cr>

" Plugin:fugitive (https://github.com/tpope/fugitive.git)
" git操作的包装，可以在vim中做复杂的git操作
"
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>ga :Gwrite<cr>
nmap <Leader>gr :Gread<cr>
nmap <Leader>ge :Gedit<cr>
nmap <Leader>gd :Gvdiff<cr>
nmap <Leader>gb :Gblame<cr>

" Plugin:vim-cpp-enhanced-highlight
"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Plugin:vim-clang-format
"
let g:clang_format#command = 'clang-format'
map <leader>cf :ClangFormat<cr>
let g:clang_format#detect_style_file = 0
let g:clang_format#auto_format = 0
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -2 }

" Plugin:vim-fswitch
"
nmap <silent> <Leader>sf :FSHere<cr>

" Plugin:nerdtree (https://github.com/scrooloose/nerdtree)"
" NERDTree            树形文件浏览器
" o 打开/关闭光标所在目录
" t 在新tab中打开文件或目录，并跳转
" T 在新tab中打开文件或目录，并不跳转
" p 跳转到父节点
" P 跳转到根节点
" q 关闭nerdtree窗口
" \nt 打开/关闭文件树窗口快捷键
" nmap <leader>nt :NERDTree<cr>
" let g:NERDTreeShowHidden = 1                   " 显示隐藏文件
" let NERDTreeWinSize=25                          " 设置子窗口宽度
" let NERDTreeWinPos="left"                      " 设置子窗口位置
" let NERDTreeMinimalUI=1                         " 子窗口不显示冗余帮助信息
" let NERDTreeAutoDeleteBuffer=1                  " 删除文件时自动删除对应buffer

" Plugin:coc.nvim (https://github.com/neoclide/coc.nvim)
" Conquer of completion
"
" You need to configure the coc-settings.json with your language server
" Type :CocConfig to open the coc-settings.json file.
" An example can find in https://github.com/neoclide/coc.nvim/wiki/Language-servers
" And you need to install the language server what you selected in to your
" system. Different language server have the different configuration.
" By the way, nodejs and npm are still needed to support this plugin, make
" sure they are installed in your system.
"
" coc.nvim also has many extensions, you can install extensions with command:
"   :CocInstall xxx
" For example: CocInstall coc-lists and CocInstall coc-explorer
if version >= 800
  set nowritebackup
  set updatetime=300
  set shortmess+=c
  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab to trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1] =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-q> coc#refresh()

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use [g and ]g to navigate diagnostics
  " Use :CocDiagnostics to get all diagnostics of current buffer in
  " location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " goto code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)

  function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Mappings for CocList (Need to use :CocInstall coc-lists to install it first)
  " Search files in workspace
  nnoremap <silent><nowait> <space>f :<C-u>CocList files<cr>
  " Search open buffers
  nnoremap <silent><nowait> <space>b :<C-u>CocList --normal buffers<cr>
  " Search keyword with rg or ag in workspace
  nnoremap <silent><nowait> <space>g :<C-u>CocList grep<cr>
  " Show changes
  nnoremap <silent><nowait> <space>c :<C-u>CocList --normal changes<cr>
  " Search symbols in workspace
  nnoremap <silent><nowait> <space>s :<C-u>CocList symbols<cr>
  " Show all diagnostics
  nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
  " Open file explorer
  nnoremap <silent><nowait> <space>e :<C-u>CocCommand explorer<cr>
  " Show installed extensions
  nnoremap <silent><nowait> <space>l :<C-u>CocList extensions<cr>
  " Find symbols
  nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
  " Resume latest coc list
  nnoremap <silent><nowait> <space>p :<C-u>CocListResume<cr>
endif
"}}}
