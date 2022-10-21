-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Plugins Keymap
--- Set keymaps for plugins which setting to lazy loading
-- neogit
vim.keymap.set("n", "<leader>gg", "<Cmd>Neogit<CR>", { desc = "Open Neogit" })
-- diffview
vim.keymap.set("n", "<leader>gdo", "<Cmd>DiffviewOpen<CR>", { desc = "Open" })
vim.keymap.set("n", "<leader>gdc", "<Cmd>DiffviewClose<CR>", { desc = "Close" })
vim.keymap.set("n", "<leader>gdh", "<Cmd>DiffviewFileHistory<CR>", { desc = "Open History" })
-- symbolsOutline
vim.keymap.set("n", "<leader>s", "<Cmd>SymbolsOutline<CR>", { desc = "Open Outline" })

