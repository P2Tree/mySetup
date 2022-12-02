-- Impatient.nvim is a plugin which improves startuptime of neovim,
-- by creating cache. If it does not exist, it will not affect normal use
local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end


require "plugins"
require "autocmd"
require "keymaps"
require "llvm"

-- mouse enable
vim.opt.mouse = "a"

-- custom hightlight, after colorscheme is loaded
vim.api.nvim_set_hl(0, 'DiffText', { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = "#ffffff", bg = "#1d3450" })

vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "DiffText" })
vim.api.nvim_set_hl(0, "GitSignsAddInLine", { link = "GitSignsAddLn" })
vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { link = "GitSignsDeleteLn" })
vim.api.nvim_set_hl(0, "GitSignsChangeInline", { link = "GitSignsChangeLn" })
vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "DiffDelete" })

-- For the use of impatient.nvim, packer_compiled.lua needs to be
-- in the lua/ directory instead of the default.
-- If it doesn't exist, it will be created by :PackerSync
local ok, packer_compiled = pcall(require, "packer_compiled")
if not ok then
  vim.cmd "PackerSync"
end

