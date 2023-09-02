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
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
      }
    end,
  },
}
