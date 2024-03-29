--- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "  "

--- Tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

--- Tab to space
vim.opt.expandtab = true
vim.opt.smartindent = true

--- Shift options
vim.opt.shiftround = true
vim.opt.shiftwidth = 2

--- Search cases sensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

--- Warp search
vim.opt.wrapscan = false

--- Auto read and write
vim.opt.autowrite = true

--- Undo backup
vim.opt.undofile = true
vim.opt.undolevels = 10000

--- Include file string exchange
vim.opt.includeexpr = "substitute(v:fname,'\\.','/','g')"

--- Remain lines when scroll screen
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8

--- options about fold
vim.o.foldcolumn = "1"
vim.o.foldenable = true
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99

--- Spilt window space
vim.o.fillchars = "foldopen:,foldclose:,foldsep: ,diff:╱"

--- Line number and relative number
vim.opt.number = true
-- vim.opt.relativenumber = true

--- Highlight current cursor column and row
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- vim.opt.cursorcolumn = true

--- Sign column
vim.opt.signcolumn = "yes"

--- Disable warp line
vim.opt.wrap = false

--- Enable mouse
vim.opt.mouse = "a"

--- Enable terminal true color
vim.opt.termguicolors = true

--- Line break within words instead internal
vim.opt.linebreak = true

--- complete options
vim.opt.completeopt = "menu,menuone,noselect"

--- Confirm to save changes before exiting modified buffer
vim.opt.confirm = true

--- Enable title of terminal
vim.opt.title = true

--- Hide some special characters
vim.opt.conceallevel = 2

--- Command mode auto complete
vim.opt.showcmd = true
vim.opt.wildmode = "longest:full,full"

--- Max syntax highlight in one line
vim.opt.synmaxcol = 200

--- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

--- grep format type
vim.opt.grepformat = "%f:%l:%c:%m"

--- use rg for grep
vim.opt.grepprg = "rg --vimgrep"

--- preview incremental substitute
vim.opt.inccommand = "nosplit"

--- popup menu
vim.opt.pumheight = 10

--- session options
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

--- don't show mode
vim.opt.showmode = false

--- spelling
vim.opt.spell = true
vim.opt.spelllang = { "en" }

--- window split
vim.opt.splitbelow = true
vim.opt.splitright = true

--- timeout of sequence
vim.opt.timeoutlen = 300

--- disable swap file
vim.opt.swapfile = false
vim.opt.updatetime = 200   -- swap file save time

--- Used for italic in tmux
vim.g.t_ZH = "\\e[3m"
vim.g.t_ZR = "\\e[23m"

--- Eagerly disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- avaliable for vim 9.0 and neovim nightly
if vim.fn.has("nvim-0.9.0") == 1 then
  --- Keeps the same screen screen lines in all split windows
  vim.opt.splitkeep = "screen"
end

