local gitsigns = require_plugin("gitsigns")
if not gitsigns then
  return
end

gitsigns.setup {
  signs = {},
  -- signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
  -- linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  -- word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  -- watch_gitdir = {
  --   interval = 1000,
  --   follow_files = true,
  -- },
  -- attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  -- sign_priority = 6,
  -- update_debounce = 100,
  -- status_formatter = nil, -- Use default
  -- max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  -- yadm = {
  --   enable = false,
  -- },
  on_attach = function(bufnr)
    -- Navigation
    vim.keymap.set("n", "<leader>gj", gitsigns.next_hunk, { buffer = bufnr, desc = "Next Git hunk" })
    vim.keymap.set("n", "<leader>gk", gitsigns.prev_hunk, { buffer = bufnr, desc = "Previous Git hunk" })

    -- Actions
    vim.keymap.set({ "n", "v" }, "<leader>gs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
    vim.keymap.set({ "n", "v" }, "<leader>gr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
    vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
    vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
    vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
    vim.keymap.set("n", "<leader>gd", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
    vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame line" })
    vim.keymap.set("n", "<leader>gB", function()
      gitsigns.blame_line { full = true }
    end, { buffer = bufnr, desc = "Blame line" })
  end,
}

