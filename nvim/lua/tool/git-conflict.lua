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

vim.keymap.set('n', '<leader>gco', '<Plug>(git-conflict-ours)', { desc = "Git Conflict Choose Ours" })
vim.keymap.set('n', '<leader>gct', '<Plug>(git-conflict-theirs)', { desc = "Git Conflict Choose Theirs" })
vim.keymap.set('n', '<leader>gcb', '<Plug>(git-conflict-both)', { desc = "Git Conflict Choose Both" })
vim.keymap.set('n', '<leader>gcn', '<Plug>(git-conflict-none)', { desc = "Git Conflict Choose None" })
vim.keymap.set('n', '<leader>gcq', '<Cmd>GitConflictListQf<cr>', { desc = "Show Git Conflict Items in Quickfix" })
vim.keymap.set('n', '[x', '<Plug>(git-conflict-prev-conflict)', { desc = "Git Conflict Choose Previous One" })
vim.keymap.set('n', ']x', '<Plug>(git-conflict-next-conflict)', { desc = "Git Conflict Choose Next One" })
