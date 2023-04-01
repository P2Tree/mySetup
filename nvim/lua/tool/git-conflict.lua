local ok, conflict = pcall(require, "git-conflict")
if not ok then
  vim.notify "Could not load git-conflict"
end

conflict.setup {
  default_mappings = true, -- disable buffer local mapping created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = "DiffText",
    current = "DiffAdd",
  },
}

vim.keymap.set('n', '<leader>gco', '<Plug>(git-conflict-ours)', { desc = "git conflict choose ours" })
vim.keymap.set('n', '<leader>gct', '<Plug>(git-conflict-theirs)', { desc = "git conflict choose theirs" })
vim.keymap.set('n', '<leader>gcb', '<Plug>(git-conflict-both)', { desc = "git conflict choose both" })
vim.keymap.set('n', '<leader>gcn', '<Plug>(git-conflict-none)', { desc = "git conflict choose none" })
vim.keymap.set('n', '<leader>gcq', '<Cmd>GitConflictListQf<cr>', { desc = "show git conflict items in quickfix" })
vim.keymap.set('n', '[x', '<Plug>(git-conflict-prev-conflict)', { desc = "git conflict choose previous one" })
vim.keymap.set('n', ']x', '<Plug>(git-conflict-next-conflict)', { desc = "git conflict choose next one" })
