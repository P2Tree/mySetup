--- ----------
---    Edit
--- ----------

--- Encoding
vim.opt.encoding = "UTF-8"
vim.opt.fileencoding = "UTF-8"
--- Tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
--- Tab to space
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
--- Shift size
vim.opt.shiftwidth = 2
--- Search cases sensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true
--- Auto reload
vim.opt.autoread = true
--- Disable create backup file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
--- Undo backup
vim.opt.undofile = true
--- Show all white spaces as character
vim.opt.list = true
vim.opt.listchars = "trail:·"
--- Include file string exchange
vim.opt.includeexpr = "substitute(v:fname,'\\.','/','g')"

--- ---------------
---    Interface
--- ---------------

--- Remain lines when scroll screen
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5
--- Line number and relative number
vim.opt.number = true
-- vim.opt.relativenumber = true
--- Highlight current cursor column and row
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
--- Sign column
vim.opt.signcolumn = "yes"
--- Disable warp line
vim.opt.wrap = false
--- Enable mouse
vim.opt.mouse = "a"
--- Enable terminal true color
vim.opt.termguicolors = true
--- Keeps the same screen screen lines in all split
--- windows, avaliable for vim 9.0 and neovim nightly
-- vim.opt.splitkeep = "screen"
--- Line break within words instead internal
vim.opt.linebreak = true
vim.opt.showbreak = ">>"
--- Enable title of terminal
vim.opt.title = true
--- Hide some special characters
vim.opt.conceallevel = 1
--- Cmd mode auto complete
vim.opt.showcmd = true
--- Max syntax highlight in one line
vim.opt.synmaxcol = 200

--- Used for italic in tmux
vim.g.t_ZH = "\\e[3m"
vim.g.t_ZR = "\\e[23m"

--- -------------
---    Plugins
--- -------------

--- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- ----------------
---    Leader key
--- ----------------
vim.g.mapleader = " "
vim.g.maplocalleader = "  "

