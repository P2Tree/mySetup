return {
  { -- override telescope plugin
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts)
      -- run the core AstroNvim configuration with the options table
      require "plugins.configs.telescope"(plugin, opts)

      -- require telescope and add custom configuration
      local telescope = require "telescope"
      telescope.setup {
        defaults = {
          mappings = {
            i = {
              -- ["<Esc>"] = require("telescope.actions").close,

              -- These keymap is only used to fix the issue auto enter the
              -- insert mode when select item and open buffer from telescope
              -- prompt.
              -- It may fixed in the new version of neovim.
              -- Try disable in neovim 0.10
              ["<CR>"] = function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC><CR>", true, false, true), "i", false)
              end,
            },
          },
        },
      }
    end,
  },
}
