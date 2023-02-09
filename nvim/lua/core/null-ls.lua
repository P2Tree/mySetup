local ok, null_ls = pcall(require, "null-ls")
if not ok then
  vim.notify "Could not load null-ls"
  return
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    -- ls.builtins.diagnostics.pylint,
    -- ls.builtins.diagnostics.codespell,
    null_ls.builtins.formatting.shfmt,
  },
}
