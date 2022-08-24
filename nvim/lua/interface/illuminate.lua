local ok, illuminate = pcall(require, "illuminate")
if not ok then
  vim.notify "Could not load illuminate"
end

illuminate.configure {
  -- provider used to get references in the buffer, ordered by priority
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  -- delay in milliseconds
  delay = 100,
  -- filetypes to not illuminate, this overrides filetypes_allowlist
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "NvimTree",
    "Outline",
    "aerial",
    "packer",
    "alpha",
    "NeogitStatus",
    "NeogitPopup",
  },
  -- filetypes to illuminate, this is overriden by filetypes_denylist
  filetypes_allowlist = {},
  -- modes to not illuminate, this overrides modes_allowlist
  modes_denylist = {},
  -- modes to illuminate, this is overriden by modes_denylist
  modes_allowlist = {},
  -- syntax to not illuminate, this overrides providers_regex_syntax_allowlist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_denylist = {},
  -- syntax to illuminate, this is overriden by providers_regex_syntax_denylist
  providers_regex_syntax_allowlist = {},
  -- whether or not to illuminate under the cursor
  under_cursor = true,
}

vim.keymap.set("n", "<M-n>", illuminate.goto_next_reference, { desc = "Next reference" })
vim.keymap.set("n", "<M-p>", illuminate.goto_prev_reference, { desc = "Previous reference" })
