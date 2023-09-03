local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

--- Delete trailing whitespace and tabs at the end of each line
--- exchanged by formatter.nvim plugin
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  group = myAutoGroup,
  command = [[%s/\s\+$//e]],
  desc = "Delete trailing whitespace and tabs",
})

--- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    vim.highlight.on_yank { timeout = 100 }
  end,
  desc = "Highlight on yank",
})

--- Don't insert comment sign automatically by o and O
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- but do continue when pressing enter.
  end,
  desc = "Do not insert comment sign when input o and O",
})

--- Display a message when the current file is not in utf-8 format.
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    if vim.bo.fileencoding ~= "utf-8" then
      vim.notify("File not in UTF-8 format!", vim.log.levels.WARN, { title = "nvim-config" })
    end
  end,
  desc = "Notice when the file is not UTF-8 encoding",
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
    vim.notify("File changed elsewhere, buffer reloaded", vim.log.levels.INFO, { title = "nvim-config" })
  end,
  desc = "Auto reload file if changed elsewhere",
})

--- If the line number where the cursor was last at exit is greater than 1 and
--- less than or equal to the number of lines in the current file, move the
--- cursor to where it was at exit.
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Recover cursor position with where last exit",
})

--- Open nvim-tree window when neovim open a directory
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = { "*" },
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- create a new empty buffer
    vim.cmd.enew()
    vim.cmd.bw(data.buf)
    -- change to the directory
    vim.cmd.cd(data.file)
    -- open the nvim-tree
    require("nvim-tree.api").tree.open()
  end,
  desc = "Open nvim-tree when open a directory",
})
