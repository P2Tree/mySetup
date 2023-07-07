-- Neovide configure
if vim.g.neovide then
  vim.o.guifont = "Mononoki Nerd Font:h14"
  -- floating blur amount
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  -- transparency
  vim.g.neovide_transparency = 0.8
  -- hiding mouse when typing
  vim.g.neovide_hide_mouse_when_typing = true
  -- refresh rate
  vim.g.neovide_refresh_rate = 60
  -- remember previous window size
  vim.g.neovide_remember_window_size = true
  -- cursor particles
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- animate switch to command line
  vim.g.neovide_cursor_animate_command_line = false
end

require "options"
require "utils"
require "core.lazy"
require "autocmds"
require "keymaps"
require "llvm"

-- Load colorscheme
-- Options: tokyonight | nightfox | nordfox | onedark | rose-pine | gruvbox
local CurrentTheme = "tokyonight"
vim.cmd("silent! colorscheme " .. CurrentTheme)
