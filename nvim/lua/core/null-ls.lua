local null_ls = require_plugin "null-ls"
local mason_null_ls = require_plugin "mason-null-ls"
if not null_ls or not mason_null_ls then
  return
end

mason_null_ls.setup {
  -- A list of sources to install if they're not already installed.
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = {
    "gitlint",
    "shellcheck",
    "stylua",
    "black",
  },

  -- Run `require("null-ls").setup`.
  -- Will automatically install masons tools based on selected sources in `null-ls`.
  -- Can also be an exclusion list.
  automatic_installation = false,

  -- Automatic setup. Sources found installed in mason will automatically be setup
  -- for null-ls. Don't need to setup sources for null_ls manually.
  automatic_setup = true,
}

null_ls.setup {
  border = "rounded",
  fallback_severity = vim.diagnostic.severity.INFO,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.code_actions.shellcheck,
  }
}
