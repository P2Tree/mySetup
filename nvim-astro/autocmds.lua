return function()
  local options = require "user.options"
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
  if options.g.auto_reload then
    vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
      pattern = { "*" },
      group = myAutoGroup,
      callback = function()
        vim.notify("File changed elsewhere, buffer reloaded", vim.log.levels.INFO, { title = "nvim-config" })
      end,
      desc = "Auto reload file if changed elsewhere",
    })
  end

  vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = { "*" },
    group = myAutoGroup,
    callback = function() require("user.tips").toggle() end,
    desc = "Show tips when neovim start",
  })
end
