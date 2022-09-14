local ok, formatter = pcall(require, "formatter")
if not ok then
  vim.notify "Could not load formatter"
  return
end

formatter.setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defiens default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      -- function()
      -- local util = require("formatter.util")
      -- Supports conditional formatting
      -- if util.get_current_buffer_file_name() == "special.lua" then
      --   return nil
      -- end
    },

    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },

    c = {
      require("formatter.filetypes.c").clangformat,
    },

    json = {
      require("formatter.filetypes.json").fixjson,
    },

    python = {
      require("formatter.filetypes.python").autopep8,
    },

    -- Use the special "*" filetype for defining formatter configurations on any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}

vim.keymap.set("n", "<leader>=", "<Cmd>FormatWrite<CR>", { desc = { "format code" } })
