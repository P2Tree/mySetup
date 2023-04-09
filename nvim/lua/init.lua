require "basic"
require "util"
require "plugins"
require "autocmd"
require "keymaps"
require "llvm"

-- Load colorscheme after plugins are loaded
-- Only the configuration started the second time takes effect for the bufferline
-- vim.cmd "silent! colorscheme catppuccin"  -- score: 2
-- vim.cmd "silent! colorscheme nightfox"    -- score: 3
vim.cmd "silent! colorscheme tokyonight"  -- score: 3
-- vim.cmd "silent! colorscheme rose-pine"   -- score: 1
-- vim.cmd "silent! colorscheme onedark"     -- scroe: 2
-- vim.cmd "silent! colorscheme gruvbox"        -- score: 1
