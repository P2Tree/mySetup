local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

--- Delete trailing whitespace and tabs at the end of each line
--- exchanged by formatter.nvim plugin
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  group = myAutoGroup,
  command = [[%s/\s\+$//e]],
  desc = "Delete trailing whitespace and tabs"
})

--- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    vim.highlight.on_yank {  timeout = 100 }
  end,
  desc = "Highlight on yank"
})

--- Don't insert comment sign automatically by o and O
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
                            - "o"  -- O and o, don't continue comments
                            + "r"  -- but do continue when pressing enter.
  end,
  desc = "Do not insert comment sign when input o and O"
})

--- Display a message when the current file is not in utf-8 format.
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    if vim.bo.fileencoding ~= 'utf-8' then
      vim.notify("File not in UTF-8 format!", vim.log.levels.WARN, { title = "nvim-config" })
    end
  end,
  desc = "Notice when the file is not UTF-8 encoding"
})

--- Resize all windows when we resie the terminal
vim.api.nvim_create_autocmd({ "vimResized" }, {
  group = myAutoGroup,
  command = "wincmd =",
  desc = "Auto resize windows on resizing operation",
})

--- Automatically reload the file if it is changed outsize of Neovim
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    vim.notify("File changed elsewhere, buffer reloaded!", vim.log.levels.WARN, { title = "nvim-config" })
  end,
  desc = "Auto reload file if changed elsewhere"
})

--- If the line number where the cursor was last at exit is greater than 1 and
--- less than or equal to the number of lines in the current file, move the
--- cursor to where it was at exit.
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
  desc = "Recover cursor position with where last exit",
})
