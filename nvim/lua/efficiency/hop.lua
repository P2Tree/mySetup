local ok, hop = pcall(require, "hop")
if not ok then
  vim.notify "Could not load hop"
  return
end

hop.setup {
  keys = "etovxqpdygfblzhckisuran",
  jump_on_sole_occurrence = false,
}

vim.keymap.set({ "n", "v" }, "f", "<Cmd>HopChar1AC<CR>", { desc = "Char after" }) -- Case ignored
-- vim.keymap.set({ "n", "v", "o" }, "<Leader>hf", "<Cmd>HopChar1AC<CR>", { desc = "Char after" })
vim.keymap.set({ "n", "v" }, "F", "<Cmd>HopChar1BC<CR>", { desc = "Char after" }) -- Case ignored
-- vim.keymap.set({ "n", "v", "o" }, "<Leader>hF", "<Cmd>HopChar1BC<CR>", { desc = "Char after" })
vim.keymap.set({ "n", "v" }, "w", "<Cmd>HopWordAC<CR>", { desc = "Word" })
-- vim.keymap.set({ "n", "v", "o" }, "<Leader>hw", "<Cmd>HopWordAC<CR>", { desc = "Word" })
vim.keymap.set({ "n", "v" }, "b", "<Cmd>HopWordBC<CR>", { desc = "Word reverse" })
-- vim.keymap.set({ "n", "v", "o" }, "<Leader>hb", "<Cmd>HopWordBC<CR>", { desc = "Word reverse" })
vim.keymap.set({ "n", "v", "o" }, "<Leader>j", "<Cmd>HopLineStartAC<CR>", { desc = "Line after" })
vim.keymap.set({ "n", "v", "o" }, "<Leader>k", "<Cmd>HopLineStartBC<CR>", { desc = "Line before" })
