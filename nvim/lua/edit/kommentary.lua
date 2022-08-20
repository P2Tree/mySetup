local ok, kommentary = pcall(require, "kommentary.config")
if not ok then
  vim.notify "Could not load Kommentary"
  return
end

kommentary.configure_language("default", {
  prefer_single_line_comments = true,

})

kommentary.configure_language("html", {
  single_line_comment_string = "auto",
  multi_line_comment_strings = "auto",
  hook_function = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})

kommentary.configure_language("vue", {
  single_line_comment_string = "auto",
  multi_line_comment_strings = "auto",
  hook_function = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})

vim.keymap.set({"n"}, "<leader>ci", "<Plug>kommentary_line_increase", { desc = "add comment" })
vim.keymap.set({"v"}, "<leader>ci", "<Plug>kommentary_visual_increase<C-c>", { desc = "add comment" })
vim.keymap.set({"n"}, "<leader>cd", "<Plug>kommentary_line_decrease", { desc = "remove comment" })
vim.keymap.set({"v"}, "<leader>cd", "<Plug>kommentary_visual_decrease<C-c>", { desc = "remove comment" })

