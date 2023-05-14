local formatter = require_plugin("formatter")
if not formatter then
  return
end

formatter.setup({
  logging = true;
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      require("formatter.filetypes.lua").stylua
    },

    -- Formatter configuraations for filetype "cpp"
    cpp = {
      require("formatter.filetypes.cpp").clangformat
    },

    -- Use the special "*" filetype for defining formatter on
    -- any filetypes
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    },
  }
})
