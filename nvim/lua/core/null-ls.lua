local null_ls = require_plugin("null-ls")
local mason_null_ls = require_plugin("mason-null-ls")
if not null_ls or not mason then
  return
end

mason_null_ls.setup({
  -- A list of sources to install if they're not already installed.
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = {},

  -- Run `require("null-ls").setup`.
  -- Will automatically install masons tools based on selected sources in `null-ls`.
  -- Can also be an exclusion list.
  automatic_installation = false,
})

null_ls.setup {
  border = "rounded",
  fallback_severity = vim.diagnostic.severity.INFO,
}

