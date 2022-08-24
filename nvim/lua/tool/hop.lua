local ok, hop = pcall(require, "hop")
if not ok then
  vim.notify "Could not load hop"
  return
end

hop.setup {
  keys = "etovxqpdygfblzhckisuran",
  jump_on_sole_occurrence = true,
}

vim.keymap.set({ "n", "v" }, "f", "<Cmd>HopChar1CurrentLineAC<CR>", { desc = "Jump to char after in current line" })
vim.keymap.set({ "n", "v" }, "F", "<Cmd>HopChar1CurrentLineBC<CR>", { desc = "Jump to char after in current line" })

vim.keymap.set({ "n", "v", "o" }, "<leader>hf", "<Cmd>HopChar1<CR>", { desc = "Jump to char" })
vim.keymap.set({ "n", "v", "o" }, "<leader>hw", "<Cmd>HopWord<CR>", { desc = "Jump to word" })
vim.keymap.set({ "n", "v", "o" }, "<leader>j", "<Cmd>HopLineStartAC<CR>", { desc = "Line after" })
vim.keymap.set({ "n", "v", "o" }, "<leader>k", "<Cmd>HopLineStartBC<CR>", { desc = "Line before" })
