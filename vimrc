" ------------ 让配置变更立即生效，而不需要重启.vimrc" ------------
" ====================================================================="
"
"   -- Maintainer --
"   ----------------  Author: PWE
"   ----------------  Email: dicksonliuming@gmail.com
"
"   ----------------  Version: 1.0
"   ----------------  Date: 2016-07-14
"
"
"   -- Brief --
"   这个配置文件包含了所有我使用的vim所应该有的配置，包括通用配置、插件、
"   快捷键映射、外部配置文件引用、自定义快捷键等。
"   如果你是第一次使用该vim配置文件，需要在shell中执行如下一行命令：
"       `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
"   然后需要找到“Vundle”部分，注释掉不需要的插件，反注释需要
"   用的插件，然后运行"PluginInstall"来安装插件。
"
"   When you first use this .vimrc, you should enter this command in your
"   shell:
"       `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
"   and then, find the part named \"Vundle\" in it and comment plugins you don't needed and
"   uncomment the needed. Finally, run \"PluginInstall" to instll Plugins.
"
"   -- Contents --
"
"   1. mark: a 快捷键说明；   1. Total description of all custom shortcut keys.
"   2. mark: g 通用设置；               2. General setup.
"   3. mark: p 括号&&引号自动补全；     3. Auto pair.
"   4. mark: v Vundle环境配置与插件配置；   4. Environment deployment of Vundle and Plugins.
"   5. mark: k 自定义快捷键；           6. Custom shortcut keys.
"   6. mark: m 编译相关；               7. about make

" ========== Description of Custom shortcut keys 自定义快捷键说明 ==========="
" ---------- Ctrl系按键 ----------
"
" Ctrl + ]                   --转到函数定义           [ctags跳转]
" Ctrl + T                   --返回调用函数           [ctags跳转]

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
" Ctrl + n                  --多光标选中与当前光标字段相同的下一个字段 [vim-multiple-cursors]
" Ctrl + p                  --多光标选中与当前光标字段相同的上一个字段 [vim-multiple-cursors]
" Ctrl + x                  --取消当前多光标选中的字段 [vim-multiple-cursors]
"
" Ctrl + Tab                --切换到下一个buffer [airline]
" Ctrl + Shift + Tab        --切换到上一个buffer [airline]
" ---------- Shift系按键 ----------
"
" Shift + >>                 --当前行缩进增加一个单位  [Normal]
" Shift + <<                 --当前行缩进减少一个单位  [Normal]
" Shift + j                   --重映射 向下滚屏        [Normal模式]
" Shift + k                   --重映射 向上滚屏        [Normal模式]
"
" ---------- Leader系按键 ----------
"  你可以输入 :map <Leader> 比如：:map ,
"  来打印出所有以<Leader>键开头的键盘映射
"
" <Leader>c                  --复制至公共剪贴板       [仅选择模式]
" <Leader>a                  --复制所有至公共剪贴板   [Normal模式可用]
" <Leader>v                  --从公共剪贴板粘贴       [全模式可用]
"
" <Leader>rb                 --一键去除所有尾部空白   [全模式可用]
" <Leader>rm                 --一键去除^M字符         [全模式可用]
" <Leader>rt                 --一键替换全部Tab为空格  [全模式可用]
" <Leader>ra                 --一键清理当前代码文件   [Normal模式可用]
"
" <Leader>nt                 --打开/关闭文件树窗口    [nerdtree]
"
" <Leader>bb                 --按=号对齐代码          [Normal模式可用]
"
" <Leader>ev                 --编辑当前所使用的Vim配置文件
"
" <Leader>sw                 --自动切换对应的源文件和头文件  [VIM-FSWITCH]
"
" <Leader>/                  --取消搜索后的单词高亮
"
" <Leader>cc                 --给当前行或选定模块添加注释  [nerd commenter]
" <Leader>cu                 --给当前行或选定模块取消注释  [nerd commenter]
" <Leader>cm                 --使用一个复合行注释整个代码块 [nerd commenter]
" <Leader>ci                 --反转当前行的注释，若有注释则取消，若没有则注释
" <Leader>cy                 --使用C通用注释 [nerd commenter]
" <Leader>c$                 --注释当前光标处到行尾的内容  [nerd commenter]
" <Leader>cA                 --为当前行在行尾添加注释 [nerd commenter]
" <Leader>ca                 --切换注释标记风格 [nerd commenter]
"
" "<Leader>bl                 --开启或关闭多文件标签  [MiniBufExplorer]
" "<Leader>bn                 --切换到下一个文件标签  [MiniBufExplorer]
" "<Leader>bm                 --切换到上一个文件标签  [MiniBufExplorer]
" "<Leader>bd                 --关闭当前页文件标签    [MiniBufExplorer]
"
" <Leader>sf                 --查找光标所在单词在工程中其他出现位置 ·[CtrlSF]
"
" <Leader>tl                --打开或关闭taglist窗口  [taglist]
" <Leader>tg                --跳转到当前光标所在处tag对应的定义处   [taglist]
" <Leader>tr                --跳回到上一个tag列表所在位置           [taglist]
"
" <Leader>p                 --快速查找文件目录下的文件  [ctrlp.vim]
"
" <Leader><Tab>              --补全snips脚本   [ultisnips]
"
" ---------- 功能键位 ----------
"
" <F5>
" --刷新ctags缓存，在工程目录下使用tag类插件需要用到，如taglist
"
" ---------- 格式化命令 ----------
"
" ==                         --缩进当前行
" =G                         --缩进直到文件结尾
" gg=G                       --缩进整个文件
" 行号G=行号G                --缩进指定区间

" u [小写]                   --单步复原               [非插入模式]
" U [大写]                   --整行复原               [非插入模式]
" Ctrl + R                   --反撤消                 [非插入模式]
"
" ---------- 查看命令 ----------
"
" Ctrl+G                     --显示当前文件和光标的粗略信息
" g Ctrl+G                   --显示当前文件和光标的详细信息
"
" ---------- 搜索命令 ----------
"
" #                          --向前搜索当前光标所在字符
" *                          --向后搜索当前光标所在字符
" ?                          --向前搜索
" /                          --向后搜索
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
" :g/^/m0                    --将整个文件所有行排列顺序颠倒   [命令模式]
" m字符       and '字符      --标记位置 and 跳转到标记位置
" q字符 xxx q and @字符      --录制宏   and 执行宏
"
" ---------- 代码折叠 ----------
"
" zc                         --折叠
" zC                         --对所在范围内所有嵌套的折叠点进行折叠
" zo                         --展开折叠
" zO                         --对所在范围内所有嵌套的折叠点展开
" [z                         --到当前打开的折叠的开始处
" ]z                         --到当前打开的折叠的末尾处
" zj                         --向下移动到后一个折叠的开始处
" zk                         --向上移动到前一个折叠的结束处
"
"

" ======================= General setup 通用配置 =========================="
"
:se ff=unix                " --更改文件格式，可选 unix、dos、mac
:se filetype=c               "  --更改文件语法着色模式

" ------------ 定义快捷键前缀，即<Leader> = \" --------------
let mapleader=","

" ------------- 保存与恢复工作环境状态 ----------------
" set sessionoptions="blank,buffer,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
set sessionoptions-=curdir              " 去除绝对路径
set sessionoptions+=sesdir              " 增加相对路径
set undodir=~/.undo_history/
set undofile

" \ss 保存当前工作环境
map <Leader>ss :MBEClose<cr> :mksession! ~/session.vim<cr> :wviminfo! ~/vim.viminfo<cr>
" \rs 恢复工作环境
map <Leader>rs :source ~/session.vim<cr> :rviminfo ~/vim.viminfo<cr> :MBEOpen<cr>
" 由于minibufexpl与这里保存文档状态有bug冲突，导致文档状态也保存了minibufexpl的状态"

" 在当前程序工程根路径下添加新文件workspace.vim，并添加如下代码，工程路径替换为当前路径"
" set path+=.,,~/projcet/
if filereadable("workspace.vim")
    source workspace.vim
endif


autocmd! bufwritepost .vimrc source ~/.vimrc

" ------------ 判断操作系统类型 -------------
if(has('win32') || has('win64'))
    let g:isWIN = 1
    let g:isMAC = 0
else
    if system('uname') =~ 'Darwin'
        let g:isWIN = 0
        let g:isMAC = 1
    else
        let g:isWIN = 0
        let g:isMAC = 0
    endif
endif

" ------------ 判断是否处于GUI界面 -------------
if has('gui_running')
    let g:isGUI = 1
else
    let g:isGUI = 0
endif


" ------------ 设置着色模式和字体 -------------
set background=dark
if g:isWIN
    colorscheme molokai
    set guifont=Monaco:h11
elseif g:isMAC
    colorscheme molokai
    set guifont=Monaco:h14
else " 终端模式
    colorscheme molokai
    set guifont=Monaco\ 14
endif

" ------------- 基本配置 --------------
set autowrite               " 自动保存"
set backspace=2              " 设置退格键可用
set whichwrap+=<,>,h,l       " 配合退格键使用
set autoindent!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set cindent                 " c/c++缩进模式
set relativenumber           " 开启相对行号
set number!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能，搜索时可以实时匹配
set hlsearch                 " 开启高亮显示结果
set ignorecase               " 搜索时大小写不敏感"
set smartcase                " 如果搜索内容中包含大写字母，则不使用ignorecase
" set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭vi兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
" set foldmethod=indent        " 选择代码折叠类型，基于缩进进行代码折叠
set foldmethod=syntax        " 选择代码折叠类型，基于语法进行代码折叠
set foldlevel=100            " 禁止自动折叠
" set nofoldenable           " 启动vim时关闭折叠代码
set foldenable               " 启动vim时打开折叠代码
set laststatus=2             " 开启状态栏信息，2为总显示最后一个窗口的状态行，1则为窗口数多于一个的时候显示最后一个窗口的状态行，0为不显示最后一个窗口的状态行
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set wildmenu                 " vim 自身命令行模式智能补全"
set listchars=tab:\~\ ,trail:.
set showmatch               " 显示括号配对情况
set nowrap                  " 禁止代码自动折行
set history=700             " 设置vim历史记录最大条目数
"set magic
set mat=4                   " 光标闪烁以及闪烁频率

"set scroll=5                " 指定翻页时的行数，默认不设置则为半页
set scrolloff=7             " 上下移动光标使正文滚页时，光标的上方或下方将至少始终保留的行数，默认给7行 set so=7

set cursorline              " 高亮光标当前行
set cursorcolumn            " 高亮光标当前列
"配置高亮当前行样式
hi CursorLine   cterm=underline ctermbg=darkred ctermfg=white
"hi CursorColumn cterm=NONE  ctermbg=lightmagenta ctermfg=white " 配置高亮当前列样式
set showcmd                 " 命令行显示输入的命令
set showmode                " 命令行显示vim当前模式中

" ------------- 设置通用缩进策略 --------------
set expandtab                " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set tabstop=4                   " 设置编辑时制表符占用空格数"
set shiftwidth=4                " 设置格式化时制表符占用空格数"
set softtabstop=4               " 让vim把连续数量的空格视为一个制表符"
set smarttab                    " 按一次backspace就删除整个tab"

" ------------- 文件类型检测与语法开关"
if has("syntax")
    syntax enable            " 打开语法高亮
    syntax on                " 允许用指定语法高亮配色方案替换默认方案
endif
filetype on                  " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 针对不同的文件类型加载对应的插件缩进

" -------------- 根据后缀名指定文件类型 ---------------
au BufRead,BufNewFile *.h        setlocal ft=c
au BufRead,BufNewFile *.i        setlocal ft=c
au BufRead,BufNewFile *.m        setlocal ft=objc
au BufRead,BufNewFile *.ss       setlocal ft=scheme
au BufRead,BufNewFile *.txt      setlocal ft=txt
au BufRead,BufNewFile *.log      setlocal ft=conf
au BufRead,BufNewFile hosts      setlocal ft=conf
au BufRead,BufNewFile *.conf     setlocal ft=dosini
au BufRead,BufNewFile *.ini      setlocal ft=dosini

" -------------- 设置文件编码和文件格式 ---------------
set fenc=utf-8
set encoding=utf-8                          " 设置内部编码"
set fileencodings=utf-8,gbk,cp936,latin-1   " 设置支持的文件编码"
set fileformat=unix                         " 设置新文件的EOL格式"
set fileformats=unix,mac,dos                " 给出文件的EOL格式类型"

if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

" -------------- 打开vim，自动定位到上次最后变更的位置 ---------------
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

" -------------- 使用GUI界面时的设置 ---------------------------------
if g:isGUI
    " 启动时自动最大化窗口
    if g:isWIN
        au GUIEnter * simalt ~x
    endif
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    set guioptions+=c        " 使用字符提示框
    set guioptions-=m        " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
    set guioptions-=L        " 隐藏左侧滚动条
    set guioptions-=r        " 隐藏右侧滚动条
    set guioptions-=b        " 隐藏底部滚动条
    set showtabline=0        " 隐藏Tab栏
    set cursorline           " 高亮突出当前行
    " set cursorcolumn       " 高亮突出当前列
endif

" ==== Environment deployment of Vundle and Plugins Vundle ============= "
" [COMETOVUNDLE]
" ==== 环境配置以及插件 ===== "
" 如果你是第一次使用该vim配置文件，需要在shell中执行如下一行命令：
" `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
"
" 在命令行模式下输入：
" PluginInstall         " 安装下边罗列出的所有插件
" PluginClean           " 清除下边注释或未罗列但在系统中存在的插件
" PluginUpdate          " 更新下边罗列出的所有插件


filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle 管理的插件必须位于 vundle#begin() 和 vundle#end() 之间"
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'Lokaltog/vim-powerline'             " vim下美观智能的任务栏
Plugin 'vim-airline/vim-airline'            " vim下美观智能任务栏，取代vim-powerline，同时可取代minibufexpl
Plugin 'octol/vim-cpp-enhanced-highlight'   " c++ 增强高亮插件
" Plugin 'nathanaelkane/vim-indent-guides'    " 缩进配对指示
Plugin 'Yggdroot/indentLine'                " 缩进指示
Plugin 'derekwyatt/vim-fswitch'             " 源文件与头文件快速切换
Plugin 'lilydjwg/fcitx.vim'                 " 插入模式是中文输入后，返回命令模式自动切换回英文
Plugin 'scrooloose/nerdtree'                " 工程目录管理，替代vim中固定的newtrw插件，功能一样
Plugin 'scrooloose/nerdcommenter'           " 自动开关注释
Plugin 'SirVer/ultisnips'                   " 模板补全插件 替代snipmate
"Plugin 'fholgado/minibufexpl.vim'           " 多文件编辑buffer标签
"Plugin 'jlanzarotta/bufexplorer'            " 辅助实现文件buffer显示，和minibufexpl.vim一样的功能，为了省地方，选择minibufexpl.vim
Plugin 'dyng/ctrlsf.vim'                    " 工程目录下的内容查找，基于ack，替代grep.vim和ack.vim插件
"Plugin 'mileszs/ack.vim'                   " 文件内容查找，由ctrlsf替代，暂时屏蔽
Plugin 'kshenoy/vim-signature'              " 文件书签辅助，显示书签等功能
Plugin 'vim-scripts/taglist.vim'            " 辅助实现tag显示
Plugin 'jiangmiao/auto-pairs'               " 括号自动补全插件
Plugin 'tpope/vim-surround'                " 括号自动补全插件，由auto-pairs取代，但匹配修改括号等操作还是要surround来完成，暂用不到
"Plugin 'scrooloose/syntastic'              " 语法检查插件，由YCM代替，暂时屏蔽
Plugin 'ctrlpvim/ctrlp.vim'                 " 文件模糊搜索插件，可以用来替换command-Tnnk
Plugin 'terryma/vim-multiple-cursors'       " 多光标操作插件


call vundle#end()

filetype plugin indent on
filetype on

" ---------- 插件配置选项 ----------"
" 可以通过搜索：Plugin:[plugin name]来全文快速查找插件配置
"
" # 部分插件需要系统软件的支持，罗列在这里：
" ctrlsf 插件需要系统安装有 ack, sudo apt-get install ack-grep
" Ultisnips 插件需要系统.vim文件夹中设置好 snips脚本
" taglist 插件需要系统安装有 ctags，sudo apt-get install ctags，并且在使用前在工程中创建ctags标签文件
" YCM 插件需要系统的支持，TODO


" Plugin:vim-powerline (https://github.com/Lokaltog/vim-powerline)"
" 加入powerline状态栏"
"let g:Powerline_colorscheme='solarized256'
"
" Plugin:vim-airline (https://github.com/vim-airline/vim-airline)"
" 加入airline状态栏
"let g:airline_powerline_fonts=1 " 字体
let g:airline#extensions#tabline#enabled=1      " 下边两行为打开tagline功能，方便查看buffer和切换
let g:airline#extensions#tabline#buffer_nr_show=1
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>
let g:airline#extensions#whitespace#enabled=0   " 下边两行为关闭状态栏空白符号计数显示
let g:airline#extensions#whitespace#symbol='!'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" "
" Plugin:Indent Guides (https://github.com/nathanaelkane/vim-indent-guides)"
" 缩进配对指示插件
" let g:indent_guides_enable_on_vim_startup=1     " 随vim自启动
" let g:indent_guides_start_level=2               " 从第二层开始可视化显示缩进
" let g:indent_guides_guide_size=1               " 色块宽度
" 快捷键<Leader>i开关缩进可视化
" nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=darkgrey

" Plugin:indentLine (https://github.com/Yggdroot/indentLine)"
" 缩进指示插件
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_enabled = 1

" Plugin:vim-fswitch (https://github.com/derekwyatt/vim-fswitch)"
" 源文件与头文件快速切换插件
nmap <silent> <Leader>sw :FSHere<cr>
" 跳转到同一工程路径下的另一个目录下寻找对应项
autocmd! BufEnter *.c let b:fswitchdst = 'h' | let b:fswitchlocs = '../inc'
autocmd! BufEnter *.h let b:fswitchdst = 'c' | let b:fswitchlocs = '../src'

" Plugin:nerdtree (https://github.com/scrooloose/nerdtree)"
" NERDTree            树形文件浏览器
" o 打开/关闭光标所在目录
" t 在新tab中打开文件或目录，并跳转
" T 在新tab中打开文件或目录，并不跳转
" p 跳转到父节点
" P 跳转到根节点
" q 关闭nerdtree窗口
" \nt 打开/关闭文件树窗口快捷键
nmap <leader>nt :NERDTree<cr>
let g:NERDTreeShowHidden = 1                   " 显示隐藏文件
let NERDTreeWinSize=25                          " 设置子窗口宽度
let NERDTreeWinPos="right"                      " 设置子窗口位置
let NERDTreeMinimalUI=1                         " 子窗口不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1                  " 删除文件时自动删除对应buffer

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
let g:NERDCustomDelimiters = { 'c': { 'left': '/*', 'right': '*/'} }   " 用户定义
let g:NERDCommentEmptyLines = 1                  " 允许注释空行

" Plugin:Ultisnips (https://github.com/SirVer/ultisnips)
" 自动补全插件
" ~/.vim/bundle/ultisnips/mysnippets需要备份，或者：
" 在安装插件后，在目录`~/.vim/bundle/ultisnips/`下，新建目录`mysnippets`，在该目录下手动下载snippets
" 下载地址：https://github.com/honza/vim-snippets
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" UltiSnips模板补全快捷键与YCM快捷键有冲突，所以重新设定"
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" Plugin:MiniBufExplorer (https://github.com/fholgado/minibufexpl.vim)"
" 多文件编辑buffer标签
" 该插件现在仍不完善，会与常用功能发生冲突，会出现意外自动关闭等情况
" 除下边插件快捷键之外，使用系统快捷键也可以方便调用，如
" :b 1 或 :buffer 1      切换到对应数字的buffer页，1可以替换为其他数字
" :files                 列出所有当前打开的buffer
" :bn                    切换到上一个buffer
" :bp                    切换到下一个buffer
" :bd 1                  关闭对应数字的buffer页，1可以替换为其他数字，不加数字为关闭当前buffer
" let g:miniBufExplBuffersNeeded = 1      " 最少有一个buffer时自动开启标签页
" let g:miniBufExplCycleArround = 1           " 允许循环遍历所有标签页
" let g:miniBufExplShowBufNumber = 1      " 取消标签页名称上的数字编号
" let g:miniBufExplorerAutoStart = 1      " 自动打开，0为关闭，1为打开
" let g:miniBufExplorerMoreThanOne = 0    " 控制不允许打开多于一个的minibufexplorer窗口
" map <Leader>bl :MBEToggle<cr>           " 显示/隐藏minibufexplorer窗口
" map <Leader>bm :MBEbn<cr>               " 正向遍历buffer标签
" map <Leader>bn :MBEbp<cr>               " 反向遍历buffer标签
" map <Leader>bd :MBEbd<cr>               " 关闭当前标签页
" hi MBEVisibleActiveNormal   ctermfg=150 ctermbg=fg " 配置颜色,如果是在GUI下，需要将ctermfg ctermbg改为guifg guibg
"let g:did_minibufexplorer_syntax_inits = 1

" Plugin:ctrlsf (https://github.com/dyng/ctrlsf.vim)"
" 强大的工程目录名称搜索内容查找插件
" 需要系统安装ack, ubuntu下为sudo apt-get install ack-grep
" 进入ctrlsf后的基本操作：
" p 打开当前选中匹配项，但不关闭ctrlsf窗口"
" q 关闭ctrlsf窗口，不进行匹配"
" <enter> 打开当前选中匹配项，并关闭ctrlsf窗口"
" \sf 搜索快捷键, 速记 ctrl's''f'
nnoremap <Leader>sf :wa<cr> :CtrlSF<cr>
" 默认搜索路径为工程目录，工程目录的确认是寻找最近的.git .hg .svn .bzr _darcs"
let g:ctrlsf_default_root = 'project'

" Plugin:vim-signature (https://github.com/kshenoy/vim-signature)"
" 辅助标签使用的插件，如标签显示，添加标签等
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "m-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "mda",
            \ 'PurgeMarkers'       :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "']",
            \ 'GotoPrevLineAlpha'  :  "'[",
            \ 'GotoNextSpotAlpha'  :  "`]",
            \ 'GotoPrevSpotAlpha'  :  "`[",
            \ 'GotoNextLineByPos'  :  "]'",
            \ 'GotoPrevLineByPos'  :  "['",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "[+",
            \ 'GotoPrevMarker'     :  "[-",
            \ 'GotoNextMarkerAny'  :  "]=",
            \ 'GotoPrevMarkerAny'  :  "[=",
            \ 'ListLocalMarks'     :  "ms",
            \ 'ListLocalMarkers'   :  "m?"
            \ }

" Plugin:taglist.vim (https://github.com/vim-script/taglist.vim)"
" 用于显示tag的辅助插件
" 需要系统中有ctags支持，准确的说是exuberant ctags支持，现在的ctags默认即为exuberant ctags
" :TlistOpen 用于打开taglist窗口
" :TlistClose 用于关闭taglist窗口，直接输入q也可以关闭窗口
" :TlistToggle 若打开则关闭，若关闭则打开
" <space> 显示光标下的tag的原型定义
" o 在一个新打开的窗口中显示光标下的tag
" x taglist窗口放大或缩小
" + 打开一个折叠，用zo也可以
" - 关闭一个折叠，用zc也可以
" × 打开所有折叠，用zR也可以
" = 关闭所有折叠，用zM也可以
" [[ 跳到前一个文件
" ]] 跳到后一个文件
" q 关闭taglist窗口
" \tl                 打开/关闭Tags窗口，在右侧栏显示 [Tagbar插件]
nmap <leader>tl :TlistToggle<cr>
nmap <leader>tg <esc><c-]>
nmap <leader>tr <esc><c-t>
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr><cr> :TlistUpdate<cr>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr><cr> :TlistUpdate<cr>
set tags=tags
set tags+=tags;/
set tags+=./tags "添加当前路径下的tags文件

let Tlist_Ctags_Cmd = '/usr/bin/ctags'      " 如果ctags在PATH路径下，可以不设置该项
"let Tlist_Show_One_File = 1                 " 不允许同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1               " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1              " 在右侧窗口中显示taglist窗口
"let Tlist_Auto_Open = 1                    " 启动vim时，自动打开taglist窗口
let Tlist_GainFocus_On_ToggleOpen = 1       " 当使用:TlistToggle打开taglist窗口时，自动跳转到taglist窗口
let Tlist_Close_On_Select = 1              " 选择了tag后自动关闭taglist窗口
let Tlist_File_Fold_Auto_Close = 1          " 当同时显示多个文件中的tag时，可只显示当前文件tag，其他的tag都折叠起来
let Tlist_Process_File_Always = 1           " 始终解析文件中的tag，而不管taglist是否打开
"let Tlist_Use_Horiz_Window = 1             " 设置taglist横向显示

" Plugin:ctrlp插件"
" 文件模糊搜索，可以搜索文件、buffer、mru、tag等
" 原始为kien/ctrlp，使用改进版ctrlpvim/ctrlp.vim
" 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<cr>
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \}
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1

" Plugin:vim-multiple-cursors插件
" 多光标操作插件
" 选中多个相同字段后，需要按c进入替换状态
let g:multi_cursor_usr_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Plugin:newtrw插件"
" 已经成为vim中的固定插件，文件浏览器，与nerdtree作用一样
" :Explore 纵向打开文件浏览器"
" :Sexplore 横向打开文件浏览器"
" \fe 打开文件浏览器
"nmap <silent> <Leader>fe :Sexplore!<cr>
"let g:netrw_winsize = 30                    " 设置文件浏览器宽度

" Plugin:Syntastic插件"
" Syntastic           语法检查
" let g:syntastic_check_on_open = 1              " 默认开启

" ====未处理的部分===="

" GitGutter           Git辅助插件
let g:gitgutter_enabled               = 1      " 默认不开启
let g:gitgutter_signs                 = 1      " 默认不开启提示
let g:gitgutter_highlight_lines       = 1      " 默认不高亮行
let g:gitgutter_sign_added            = '+'    " 自定义新增指示符
let g:gitgutter_sign_modified         = '>'    " 自定义修改指示符
let g:gitgutter_sign_removed          = '-'    " 自定义删除指示符
let g:gitgutter_sign_modified_removed = '->'   " 自定义既修改又删除指示符


" ==================== Custom shortcut key 自定义快捷键 =================== "

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

"交换上下行切换的物理切换与逻辑切换"
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 增加一行但不进入插入模式"
nnoremap to o<Esc>
nnoremap tO O<Esc>

"关闭上次搜索的高亮"
noremap <silent><leader>/ :nohls<CR>

" 保证缩进调整后，还是选中状态"
vnoremap < <gv
vnoremap > >gv

"没有权限时保存"
cmap w!! w !sudo tee >/dev/null %

"改变撤销后反撤销的键位"
nnoremap U <C-r>

" Ctrl + ]            多选择跳转
nmap <c-]> g<c-]>
vmap <c-]> g<c-]>

" Shift + J            向下滚屏 8行
map <s-j> <esc>8j<cr>

" Shift + K            向上滚屏 8行
map <s-k> <esc>8k<cr>

" \c                  复制至公共剪贴板
vmap <leader>c "+y

" \a                  复制所有至公共剪贴板
nmap <leader>a <esc>ggVG"+y<esc>

" \v                  从公共剪贴板粘贴
imap <leader>v <esc>"+p
nmap <leader>v "+p
vmap <leader>v "+p

" \mp                 生成Promptline脚本文件，用于个性化终端操作 [Promptline插件 ]
nmap <leader>mp :!rm ~/backup/.promptline<cr><esc>:PromptlineSnapshot ~/backup/.promptline airline<cr>

" \gi                 开启或关闭GitGutter [GitGutter插件]
nmap <leader>gi :GitGutterToggle<cr>:GitGutterSignsToggle<cr>:GitGutterLineHighlightsToggle<cr>

" \gd                 打开Git文件对比模式 [竖直] [GitGutter插件]
nmap <leader>gd :Gdiff<cr>

" \gs                 打开Git文件对比模式 [水平] [GitGutter插件]
nmap <leader>gs :Gsdiff<cr>

" \gl                 查看Git提交日志 [gitv插件]
nmap <leader>gl :Gitv<cr>

" \rb                 一键去除所有尾部空白
imap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
nmap <leader>rb :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
vmap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>

" \rm                 一键去除windows字符^M
imap <leader>rm <esc>:%s/<c-v><c-m>//g<cr>
nmap <leader>rm :%s/<c-v><c-m>//g<cr>
vmap <leader>rm <esc>:%s/<c-v><c-m>//g<cr>

" \rt                 一键替换全部Tab为空格
imap <leader>rt <esc>:retab<cr>
nmap <leader>rt :retab<cr>
vmap <leader>rt <esc>:retab<cr>

" \ra                 一键清理当前代码文件
nmap <leader>ra <esc><Leader>rt<esc><Leader>rb<esc><Leader>rm<esc>gg=G<esc>

" \ev                 编辑当前所使用的Vim配置文件
nmap <silent> <Leader>ev <esc>:e $MYVIMRC<cr>

" ========================== about make 编译相关 ======================================= "
" 在程序工程目录下的workspace.vim中，需要编写如下命令，其中的路径要填写为当前程序路径"
" \mm 使用make编译当前工程
" \mc 使用make clean清空当前工程
" \mi 使用make install安装当前工程二进制文件
"nnoremap <silent> <Leader>mm :wa<cr> :make -C ~/project/<cr> :cw<cr>
"nnoremap <silent> <Leader>mc :make clean -C ~/project/<cr> :cw<cr>
"nnoremap <silent> <Leader>mi :make install -C ~/project/<cr> :cw<cr>
" 注意，若向使:cw正常跳转到出错文件，需要将make输出信息设置为英文，如在.bashrc中添加:
" export LANGUAGE=en_US.UTF-8
" \mp 上一项错误项
" \mn 下一项错误项
noremap <Leader>mp :cp<cr>
noremap <Leader>mn :cn<cr>
