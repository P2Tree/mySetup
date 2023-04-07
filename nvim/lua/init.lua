require "basic"
require "util"
require "plugins"
require "autocmd"
require "keymaps"
require "llvm"

-- mouse enable
vim.opt.mouse = "a"

-- custom hightlight, after colorscheme is loaded
-- vim.api.nvim_set_hl(0, 'DiffText', { fg = "#ffffff", bg = "#1d3b40" })
-- vim.api.nvim_set_hl(0, 'DiffAdd', { fg = "#ffffff", bg = "#1d3450" })

-- Load colorscheme after plugins are loaded
-- Only the configuration started the second time takes effect for the bufferline
-- vim.cmd "silent! colorscheme catppuccin"  -- score: 2
-- vim.cmd "silent! colorscheme nightfox"    -- score: 3
vim.cmd "silent! colorscheme tokyonight"  -- score: 3
-- vim.cmd "silent! colorscheme rose-pine"   -- score: 1
-- vim.cmd "silent! colorscheme onedark"     -- scroe: 2
-- vim.cmd "silent! colorscheme gruvbox"        -- score: 1
