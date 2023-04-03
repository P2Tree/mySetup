local ok, neoscroll = pcall(require, "neoscroll")
if not ok then
  vim.notify "Could not load neoscroll"
end

neoscroll.setup({
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
              '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},

  -- Hide cursor while scrolling
  hide_cursor = true,

  -- Stop at <EOF> when scrolling downwards
  stop_eof = true,

  -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  respect_scrolloff = false,

  -- The cursor will keep on scrolling even if the window cannot scroll further
  cursor_scrolls_alone = true,

  -- Default easing function
  -- Options: quadratic, cubic, quartic, quintic, circular, sine
  easing_function = "quadratic",

  -- Function to run before the scrolling animation starts
  pre_hook = nil,

  -- Function to run after the scrolling animation ends
  post_hook = nil,

  -- Disable "Performance Mode" on all buffers
  performance_mode = false,
})

local keys = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
keys['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['sine']]}}
keys['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']]}}
-- Use the "circular" easing function
keys['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
keys['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
keys['<C-y>'] = {'scroll', {'-0.10', 'false', '100', [['sine']]}}
keys['<C-e>'] = {'scroll', { '0.10', 'false', '100', [['sine']]}}
-- When no easing function is provided the default easing function will be used
keys['zt']    = {'zt', {'300'}}
keys['zz']    = {'zz', {'300'}}
keys['zb']    = {'zb', {'300'}}

require('neoscroll.config').set_mappings(keys)
