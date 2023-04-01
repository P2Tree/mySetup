local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  vim.notify "Could not load toggleterm"
  return
end

toggleterm.setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  on_open = nil, -- function to run when the terminal opens
  on_close = nil, -- function to run when the terminal closes
  on_stdout = nil, -- callback for processing output on stdout
  on_stderr = nil, -- callback for processing output on stderr
  on_exit = nil, -- function to run when terminal process exits
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  highlights = {},
  shade_terminals = true,
  shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.fn.has "win32" == 1 and "pwsh" or vim.o.shell, -- change the default shell
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    -- like `size`, width and height can be a number or function which is passed the current terminal
    width = 100,
    height = 40,
    winblend = 8,
  },
  winbar = {
    enabled = true,
    name_formatter = function(term) -- term: Terminal
      return term.name
    end,
  },
}

vim.keymap.set("t", "<C-left>", "<Cmd>wincmd h<CR>")
vim.keymap.set("t", "<C-down>", "<Cmd>wincmd j<CR>")
vim.keymap.set("t", "<C-up>", "<Cmd>wincmd k<CR>")
vim.keymap.set("t", "<C-right>", "<Cmd>wincmd l<CR>")
vim.keymap.set("n", "<leader>tt", "<Cmd>ToggleTermToggleAll<CR>", { desc = "All Terminal" })
