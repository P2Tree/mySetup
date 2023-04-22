-- Neovide configure
if vim.g.neovide then
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_hide_mouse_when_typing = true
end

require "options"
require "utils"
require "core.lazy"
require "autocmds"
require "keymaps"
require "llvm"

-- Load colorscheme
-- Options: tokyonight | nightfox | onedark | rose-pine | gruvbox
local CurrentTheme = "tokyonight"
vim.cmd("silent! colorscheme " .. CurrentTheme)
