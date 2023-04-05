local mason = require_plugin("mason")
if not mason then
  return
end

mason.setup {
  ui = {
    border = "rounded",
  },
  automatic_setup = true,
}

vim.keymap.set("n", "<leader>om", "<Cmd>Mason<CR>", { silent = true, desc = "Package manager" })
