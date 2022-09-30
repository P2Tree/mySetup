-- Neovim enable by default some options, which align to tpope/vim-sensible configuration

-- file encoding type for vim
vim.opt.encoding = "utf-8"
-- file-content encoding for the current buffer
vim.opt.fileencoding = "utf-8"
-- terminal encoding type
vim.opt.termencoding = "utf-8"
-- syntax highlight
vim.opt.syntax = "enable"
-- enable line number
vim.opt.number = true
-- enable relative number
vim.opt.relativenumber = true
-- hightlight current line
vim.opt.cursorline = true
-- highlight current line option
vim.opt.cursorlineopt = "both"
-- highlight current column line
vim.opt.cursorcolumn = true
-- auto change line when lines longer than the width
vim.opt.wrap = false
-- smart case search
vim.opt.smartcase = true
-- tab stops width
vim.opt.tabstop = 2  -- default:8
vim.opt.softtabstop = 2  -- default:0
-- space number when indent with << >> and change new line
vim.opt.shiftwidth = 2  -- default:8
-- tab key exchange to space key
vim.opt.expandtab = true
-- auto indent in new line
vim.opt.autoindent = true
-- smart indent in new line
vim.opt.smartindent = true
-- indent optinos 
vim.opt.cinoptions = ":0"
-- minimal number of screen lines to keep
vim.opt.scrolloff = 8  -- default:0
vim.opt.sidescrolloff = 8  -- default:0
-- max history saves
vim.opt.history = 1000  -- default:10000(vim)
-- show empty characters
vim.opt.list = true
-- colors
vim.opt.termguicolors = true
