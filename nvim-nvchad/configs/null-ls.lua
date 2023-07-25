local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

-- code action sources
local code_actions = null_ls.builtins.code_actions
-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics
-- formatting sources
local formatting = null_ls.builtins.formatting
-- hover sources
local hover = null_ls.builtins.hover
-- completion sources
local completion = null_ls.builtins.completion

local sources = {
  formatting.stylua,
  formatting.clang_format,
  formatting.black,
  formatting.shfmt,
  formatting.prettier,
  code_actions.shellcheck,
  code_actions.refactoring,
  completion.spell,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
