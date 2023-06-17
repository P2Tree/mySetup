local illuminate = require_plugin("illuminate")
if not illuminate then
  return
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
  -- filetype_overrides: filetype specific overrides.
  -- The keys are strings to represent the filetype while the values are tables that
  -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
  filetype_overrides = {},
  -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "NvimTree",
    "Outline",
    -- "Aerial",
    "lazy",
    "startify",
    "NeogitStatus",
    "NeogitPopup",
  },
  -- filetypes to illuminate, this is overriden by filetypes_denylist
  filetypes_allowlist = {},
  -- modes to not illuminate, this overrides modes_allowlist
  modes_denylist = {},
  -- modes to illuminate, this is overriden by modes_denylist
  -- See `:help mode()` for possible values
  modes_allowlist = {},
  -- syntax to not illuminate, this overrides providers_regex_syntax_allowlist
  -- Only applies to the 'regex' provider
  -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  providers_regex_syntax_denylist = {},
  -- syntax to illuminate, this is overriden by providers_regex_syntax_denylist
  providers_regex_syntax_allowlist = {},
  -- whether or not to illuminate under the cursor
  under_cursor = true,
  -- large_file_cutoff: number of lines at which to use large_file_config
  -- The `under_cursor` options is disabled when this cutoff is hit
  large_file_cutoff = 10000,
  -- large_file_config: config to use for large files (based on large_file_cutoff).
  -- Supports the same keys passed to .configure
  -- If nil, vim-illuminate will be disabled for large files.
  large_file_overrides = nil,
  -- min_count_to_highlight: minimum number of matches required to preform highlighting
  min_count_to_highlight = 2,
}
