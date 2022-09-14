local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

-- Delete trailing whitespace and tabs at the end of each line
-- exchanged by formatter.nvim plugin
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   group = myAutoGroup,
--   command = [[%s/\s\+$//e]],
-- })

-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    vim.highlight.on_yank {  timeout = 300 }
  end,
})

-- Don't insert comment sign automatically by o and O
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
                            - "o"  -- O and o, don't continue comments
                            + "r"  -- but do continue when pressing enter.
  end,
})

-- Display a message when the current file is not in utf-8 format.
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    if vim.bo.fileencoding ~= 'utf-8' then
      vim.notify("File not in UTF-8 format!", vim.log.levels.WARN, { title = "nvim-config" })
    end
  end
})

-- Resize all windows when we resie the terminal
vim.api.nvim_create_autocmd({ "vimResized" }, {
  group = myAutoGroup,
  desc = "autoresize windows on resizing operation",
  command = "wincmd =",
})

-- Automatically reload the file if it is changed outsize of Neovim
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN, { tilte = "nvim-config" })
  end
})
vim.api.nvim_create_autocmd({ "FocusGained", "CursorHold" }, {
  pattern = { "*" },
  group = myAutoGroup,
  callback = function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd("checktime")  -- checktime can not work in commandline, so we need to check before execution
    end
  end
})

-- Remember folds status whether file close/open and restore it
-- vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
--   pattern = { "*" },
--   group = myAutoGroup,
--   command = "mkview"
-- })
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   pattern = { "*" },
--   group = myAutoGroup,
--   command = "silent! loadview"
-- })
