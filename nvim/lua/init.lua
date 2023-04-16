-- Neovide configure
if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_hide_mouse_when_typing = true
end

require "options"
require "utils"
require "plugins"
require "autocmds"
require "keymaps"
require "llvm"

-- Load colorscheme
vim.cmd "silent! colorscheme tokyonight"  -- score: 3
-- vim.cmd "silent! colorscheme nightfox"    -- score: 3
-- vim.cmd "silent! colorscheme catppuccin"  -- score: 2
-- vim.cmd "silent! colorscheme onedark"     -- scroe: 2
-- vim.cmd "silent! colorscheme rose-pine"   -- score: 1
-- vim.cmd "silent! colorscheme gruvbox"     -- score: 1
