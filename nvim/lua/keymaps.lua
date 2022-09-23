-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Custom Keymap
-- cursor move
vim.keymap.set({"n", "v"}, "H", "^", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "L", "$", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "J", "<C-e>", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "K", "<C-y>", { noremap = true, silent = true })
-- window
vim.keymap.set("", "<C-left>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("", "<C-right>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("", "<C-up>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("", "<C-down>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("", "sv", "<C-w>v", { noremap = true, silent = true })
vim.keymap.set("", "sh", "<C-w>s", { noremap = true, silent = true })
vim.keymap.set("", "sc", "<C-w>c", { noremap = true, silent = true })
vim.keymap.set("", "so", "<C-w>o", { noremap = true, silent = true })

--- Plugins Keymap
--- Set keymaps for plugins which setting to lazy loading
-- neogit
vim.keymap.set("n", "<leader>gg", "<Cmd>Neogit<CR>", { desc = "Open Neogit" })
-- diffview
vim.keymap.set("n", "<leader>gdo", "<Cmd>DiffviewOpen<CR>", { desc = "Open" })
vim.keymap.set("n", "<leader>gdc", "<Cmd>DiffviewClose<CR>", { desc = "Close" })
vim.keymap.set("n", "<leader>gdh", "<Cmd>DiffviewFileHistory<CR>", { desc = "Open History" })


