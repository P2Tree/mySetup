local ok, codewindow = pcall(require, "codewindow")
if not ok then
  vim.notify "Could not load codewindow"
  return
end

codewindow.setup {
  active_in_terminals = false, -- Should the minimap activate for terminal buffers
  auto_enable = true, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a tab)
  exclude_filetypes = { "log", "Outline", "NvimTree", "packer" }, -- Choose certain filetypes to not show minimap on
  max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
  max_lines = 10000, -- If auto_enable is true, don't open the minimap for buffers which have more than this max lines
  minimap_width = 15, -- The width of the text part of the minimap
  use_lsp = true, -- Use the builtin LSP to show errors and warnings
  use_treesitter = true, -- Use nvim-treesitter to highlight the code
  use_git = true, -- Show small dots to indicate git additions and deletions
  width_multiplier = 4, -- How many characters one dot represents
  z_index = 1, -- The z-index the floating window will be on
  show_cursor = true, -- Show the cursor position in the minimap
  window_border = 'single'  -- The border style of the floating window (accepts all usual options)
}

vim.api.nvim_set_hl(0, 'CodewindowBorder', {fg = '#000000'})
vim.api.nvim_set_hl(0, 'CodewindowBackground', {fg = 'Gray'})
vim.api.nvim_set_hl(0, 'CodewindowWarn', {fg = 'Yellow'})
vim.api.nvim_set_hl(0, 'CodewindowError', {fg = 'Red'})
vim.api.nvim_set_hl(0, 'CodeWindowAddition', {fg = 'Green'})
vim.api.nvim_set_hl(0, 'CodeWindowDeletion', {fg = 'Blue'})

-- Default keymap is :
-- <leader>mo - open the minimap
-- <leader>mc -- close the minimap
-- <leader>mf -- focus/unfocus the minimap
-- <leader>mm -- toggle the minimap
codewindow.apply_default_keybinds()
