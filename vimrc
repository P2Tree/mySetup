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
"   在第一次使用时，需要找到“Vundle”部分，注释掉不需要的插件，反注释需要
"   用的插件，然后运行"PluginInstall"来安装插件。
"
"   When you first use this .vimrc, you should find the part named
"   \"Vundle\" in it. And then comment plugins you don't needed and
"   uncomment the needed. Finally, run \"PluginInstall" to instll Plugins.
"
"   -- Contents --
"
"   1. 全部自定义快捷键说明；   1. Total description of all custom shortcut keys.
"   2. 通用设置；               2. General setup.
"   3. 括号&&引号自动补全；     3. Auto pair.
"   4. Vundle环境配置与插件配置；   4. Environment deployment of Vundle and Plugins.
"   5. 部分语言添加补全字典；   5. Dictionary of some language.
"   6. 自定义快捷键；           6. Custom shortcut keys.

" ========== Description of Custom shortcut keys 自定义快捷键说明 ==========="
" ---------- Ctrl系按键 ----------
"
" Ctrl + H                   --光标移当前行行首       [插入模式]
" Ctrl + J                   --光标移下一行行首       [插入模式]
" Ctrl + K                   --光标移上一行行尾       [插入模式]
" Ctrl + L                   --光标移当前行行尾       [插入模式]

" Ctrl + ]                   --转到函数定义           [ctags跳转]
" Ctrl + T                   --返回调用函数           [ctags跳转]

" Ctrl + O                   --跳到上一个编辑位置     [Normal模式]
" Ctrl + I                   --跳回下一个编辑位置     [Normal模式]
"
" ---------- Shift系按键 ----------
"
" Shift + >>                 --当前行缩进增加一个单位  [Normal]
" Shift + <<                 --当前行缩进减少一个单位  [Normal]
"
" Shift + n                  --切换多文件标签         [ultisnips]
" Shift + m                  --切换多文件标签         [ultisnips]
" 
" ---------- Leader系按键 ----------
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
" <Leader>nt                 --打开/关闭文件树窗口    [nerd tree]
"
" <Leader>bb                 --按=号对齐代码          [Normal模式可用]
" <Leader>bn                 --自定义对齐             [Normal模式可用]
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
" <Leader>bl                 --开启多文件标签  [MiniBufExplorer]
"
" ---------- 补全命令 ----------
"
" <Leader><Tab>              --补全snips脚本   [ultisnips]
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
" XT 和 XF 是 Xt/Xf 的反方向操作
"
" cs'"                        --将外围的单引号变成双引号     [surround.vim插件]
" cs"<p>                      --将外围的双引号变成HTML标签对 [surround.vim插件]
" cst"                        --将外围的界定符变成双引号     [surround.vim插件]
" ds"                         --删除外围的双引号定界符       [surround.vim插件]
" <                           --可视化模式下整块代码左移一个tab位
" >                           --可视化模式下整块代码右移一个rab位
"
" ---------- 文本比较 ----------
"
" dp                         --将当前文件所在差异行替换到对比文件 [give]
" do                         --将对比文件所在差异行替换到当前文件 [get]
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
:se ft=c               "  --更改文件语法着色模式

" ------------ 定义快捷键前缀，即<Leader> = \" --------------
let mapleader="\\"

" ------------ 让配置变更立即生效，而不需要重启.vimrc" ------------
"autocmd BufWritePost .vimrc source .vimrc

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
set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set relativenumber           " 开启相对行号
set nu!                      " 显示行号
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
" set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
" set foldmethod=indent        " 选择代码折叠类型，基于缩进进行代码折叠
set foldmethod=syntax        " 选择代码折叠类型，基于语法进行代码折叠
set foldlevel=100            " 禁止自动折叠
" set nofoldenable           " 启动vim时关闭折叠代码
set laststatus=2             " 开启状态栏信息
set cmdheight=1              " 命令行的高度，默认为1，这里设为2
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set ignorecase               " 搜索时大小写不敏感"
set wildmenu                 " vim 自身命令行模式智能补全"
set listchars=tab:\~\ ,trail:.
set showmatch               " 显示括号配对情况
"set nowrap                  " 禁止代码自动折行

set scrolloff=7             " 上下移动光标使正文滚页时，光标的上方或下方将至少始终保留的行数，默认给7行"

set cursorline              " 高亮光标当前行
set cursorcolumn            " 高亮光标当前列
"配置高亮当前行样式
hi CursorLine   cterm=underline ctermbg=darkred ctermfg=white
"hi CursorColumn cterm=NONE  ctermbg=lightmagenta ctermfg=white " 配置高亮当前列样式

" ------------- 设置通用缩进策略 --------------
set expandtab                " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set tabstop=4                   " 设置编辑时制表符占用空格数"
set shiftwidth=4                " 设置格式化时制表符占用空格数"
set softtabstop=4               " 让vim把连续数量的空格视为一个制表符"

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
au BufRead,BufNewFile *.di       setlocal ft=d
au BufRead,BufNewFile *.ss       setlocal ft=scheme
au BufRead,BufNewFile *.lsp      setlocal ft=newlisp
au BufRead,BufNewFile *.cl       setlocal ft=lisp
au BufRead,BufNewFile *.phpt     setlocal ft=php
au BufRead,BufNewFile *.inc      setlocal ft=php
au BufRead,BufNewFile *.sql      setlocal ft=mysql
au BufRead,BufNewFile *.tpl      setlocal ft=smarty
au BufRead,BufNewFile *.txt      setlocal ft=txt
au BufRead,BufNewFile *.log      setlocal ft=conf
au BufRead,BufNewFile hosts      setlocal ft=conf
au BufRead,BufNewFile *.conf     setlocal ft=dosini
au BufRead,BufNewFile http*.conf setlocal ft=apache
au BufRead,BufNewFile nginx.conf setlocal ft=nginx
au BufRead,BufNewFile *.ini      setlocal ft=dosini

" -------------- 设置文件编码和文件格式 ---------------
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos

if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

" -------------- 打开vim，自动定位到上次最后变更的位置 ---------------
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif
endif

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

" =============== Auto Pair 引号 && 括号自动匹配 ===================== "

inoremap ( <c-r>=AutoPair('(', ')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=AutoPair('{', '}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=AutoPair('[', ']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=SamePair('"')<CR>
inoremap ' <c-r>=SamePair("'")<CR>
inoremap ` <c-r>=SamePair('`')<CR>

function! AutoPair(open, close)
    let line = getline('.')
    if col('.') > strlen(line) || line[col('.') - 1] == ' '
        return a:open.a:close."\<ESC>i"
    else
        return a:open
    endif
endf

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function! SamePair(char)
    let line = getline('.')
    if col('.') > strlen(line) || line[col('.') - 1] == ' '
        return a:char.a:char."\<ESC>i"
    elseif line[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf


" ==== Environment deployment of Vundle and Plugins Vundle ============= "
" ==== 环境配置以及插件 ===== "
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
Plugin 'Lokaltog/vim-powerline'             " vim下美观智能的任务栏
Plugin 'octol/vim-cpp-enhanced-highlight'   " c++ 增强高亮插件
" Plugin 'nathanaelkane/vim-indent-guides'    " 缩进配对指示
Plugin 'derekwyatt/vim-fswitch'             " 源文件与头文件快速切换
"Plugin 'kshenoy/vim-signature'              " vim书签所在行增加标志
Plugin 'lilydjwg/fcitx.vim'                 " 插入模式是中文输入后，返回命令模式自动切换回英文
Plugin 'scrooloose/nerdtree'                " 工程目录管理
Plugin 'scrooloose/nerdcommenter'           " 自动开关注释
Plugin 'SirVer/ultisnips'                   " 模板补全插件 替代snipmate
Plugin 'fholgado/minibufexpl.vim'           " 多文件编辑buffer标签
call vundle#end()

filetype plugin indent on
filetype on

" ---- 插件配置选项 ----"
" Plugin: vim-powerline (https://github.com/Lokaltog/vim-powerline)"
" 加入powerline状态栏"
let g:Powerline_colorscheme='solarized256'
"
" Plugin: Indent Guides (https://github.com/nathanaelkane/vim-indent-guides)"
" 缩进配对指示插件
let g:indent_guides_enable_on_vim_startup=1     " 随vim自启动
let g:indent_guides_start_level=2               " 从第二层开始可视化显示缩进
let g:indent_guides_guide_size=1               " 色块宽度
" 快捷键<Leader>i开关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Plugin: vim-fswitch (https://github.com/derekwyatt/vim-fswitch)"
" 源文件与头文件快速切换插件
nmap <silent> <Leader>sw :FSHere<cr>

" Plugin: nerdtree (https://github.com/scrooloose/nerdtree)"
" NERDTree            树形文件浏览器
let g:NERDTreeShowHidden = 1                   " 显示隐藏文件
let NERDTreeWinSize=32                          " 设置子窗口宽度
let NERDTreeWinPos="right"                      " 设置子窗口位置
let NERDTreeMinimalUI=1                         " 子窗口不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1                  " 删除文件时自动删除对应buffer
nmap <leader>nt :NERDTree<cr>               " \nt 打开/关闭文件树窗口快捷键

" Plugin: nerdcommenter (https://github.com/scrooloose/nerdcommenter)"
" NERDcommenter      注释处理插件
let g:NERDSpaceDelims = 1                        " 自动添加前置空格
let g:NERDCompactSexyComs = 1                    " 美化多行注释下的紧凑语法
let g:NERDefaultAlign = 1                        " 注释在评论行的最左边而不是跟随代码缩进
let g:NERDAltDelims_c = 1                        " 使用c的分隔符作为默认备用分隔符
let g:NERDCustomDelimiters = { 'c': { 'left': '/*', 'right': '*/'} }   " 用户定义
let g:NERDCommentEmptyLines = 1                  " 允许注释空行

" Plugin: Ultisnips (https://github.com/honza/vim-snipets)"
" 自动补全插件
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" UltiSnips模板补全快捷键与YCM快捷键有冲突，所以重新设定"
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" Plugin: MiniBufExplorer (https://github.com/fholgado/minibufexpl.vim)"
" 多文件编辑buffer标签
let g:miniBufExplBuffersNeeded = 1      " 最少有一个buffer时自动开启标签页
let g:miniBufExplCycleArround = 1           " 允许循环遍历所有标签页
let g:miniBufExplShowBufNumber = 1      " 取消标签页名称上的数字编号
map <Leader>bl :MBEToggle<cr>           " 显示/隐藏minibufexplorer窗口
map <Leader>bm :MBEbn<cr>               " 正向遍历buffer标签
map <Leader>bn :MBEbp<cr>               " 反向遍历buffer标签
map <Leader>bd :MBEbd<cr>               " 关闭当前标签页

hi MBEVisibleActiveNormal   ctermfg=150 ctermbg=fg " 配置颜色,如果是在GUI下，需要将ctermfg ctermbg改为guifg guibg
"let g:did_minibufexplorer_syntax_inits = 1


" ====未处理的部分===="

" GitGutter           Git辅助插件
let g:gitgutter_enabled               = 1      " 默认不开启
let g:gitgutter_signs                 = 1      " 默认不开启提示
let g:gitgutter_highlight_lines       = 1      " 默认不高亮行
let g:gitgutter_sign_added            = '+'    " 自定义新增指示符
let g:gitgutter_sign_modified         = '>'    " 自定义修改指示符
let g:gitgutter_sign_removed          = '-'    " 自定义删除指示符
let g:gitgutter_sign_modified_removed = '->'   " 自定义既修改又删除指示符

" Syntastic           语法检查
let g:syntastic_check_on_open = 1              " 默认开启
let g:syntastic_mode_map      = { 'mode': 'active', 'passive_filetypes': ['html', 'xhtml'] }

" ==================== Custom shortcut key 自定义快捷键 =================== "

"关闭方向健"
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

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

"没有权限时保存"
cmap w!! w !sudo tee >/dev/null %

"改变撤销后反撤销的键位"
nnoremap U <C-r>

" Ctrl + ]            多选择跳转
nmap <c-]> g<c-]>
vmap <c-]> g<c-]>

" Ctrl + U            简化全能补全按键
imap <c-u> <c-x><c-o>

" Ctrl + H            光标移当前行行首[插入模式]、切换左窗口[Normal模式]
imap <c-h> <esc>I
map <c-h> <c-w><c-h>
noremap <C-Left> <C-w>h

" Ctrl + J            光标移下一行行首[插入模式]、切换下窗口[Normal模式]
imap <c-j> <esc><down>I
map <c-j> <c-w><c-j>
noremap <C-Down> <C-w>j

" Ctrl + K            光标移上一行行尾[插入模式]、切换上窗口[Normal模式]
imap <c-k> <esc><up>A
map <c-k> <c-w><c-k>
noremap <C-Up> <C-w>k

" Ctrl + L            光标移当前行行尾[插入模式]、切换右窗口[Normal模式]
imap <c-l> <esc>A
map <c-l> <c-w><c-l>
noremap <C-Right> <C-w>l

" \c                  复制至公共剪贴板
vmap <leader>c "+y

" \a                  复制所有至公共剪贴板
nmap <leader>a <esc>ggVG"+y<esc>

" \v                  从公共剪贴板粘贴
imap <leader>v <esc>"+p
nmap <leader>v "+p
vmap <leader>v "+p

" \il                 显示/关闭对齐线 [indentLine插件]
nmap <leader>il :IndentLinesToggle<cr>

" \tl                 打开/关闭Tags窗口，在右侧栏显示 [Tagbar插件]
nmap <leader>tl :TagbarToggle<cr><c-w><c-l>

" \fe                 打开文件编码窗口，在右侧栏显示 [FencView插件]
nmap <leader>fe :FencView<cr>

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
nmap <leader>ra <esc>\rt<esc>\rb<esc>gg=G<esc>gg<esc>

" \ev                 编辑当前所使用的Vim配置文件
nmap <leader>ev <esc>:e $MYVIMRC<cr>

" \mm
nmap <leader>mm :!../make !../make install<cr>

" =========================== 加载自定义工程配置文件 ======================== "

if g:isWIN
    if filereadable($VIM.'/_self.vim')
        source $VIM/_self.vim
    end
else
    if filereadable($HOME.'/.self.vim')
        source /usr/share/vim/vimrc
        source $HOME/.self.vim
    end
end

