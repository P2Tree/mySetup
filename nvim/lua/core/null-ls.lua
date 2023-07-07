local null_ls = require_plugin "null-ls"
local mason_null_ls = require_plugin "mason-null-ls"
if not null_ls or not mason_null_ls then
  return
end

mason_null_ls.setup {
  -- A list of sources to install if they're not already installed.
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = {
    -- git
    "gitlint",
    -- lua
    "stylua",
    -- python
    "black",
    -- shell
    "shfmt", "shellcheck",
  },

  -- Run `require("null-ls").setup`.
  -- Will automatically install masons tools based on selected sources in `null-ls`.
  -- Can also be an exclusion list.
  automatic_installation = false,

  -- Automatic setup. Sources found installed in mason will automatically be setup
  -- for null-ls. Don't need to setup sources for null_ls manually.
  automatic_setup = true,
}

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  border = "rounded",
  fallback_severity = vim.diagnostic.severity.INFO,
  sources = {
    -- git
    diagnostics.gitlint,
    -- lua
    formatting.stylua,
    -- python
    formatting.black,
    -- shell
    diagnostics.shellcheck,
    code_actions.shellcheck,
  }
}
