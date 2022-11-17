local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify "Could not load treesitter"
  return
end

treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "gni",
      node_incremental = "gnn",
      scope_incrementnl = "gns",
      node_decremental = "gnd",
    },
  },
  indent = {
    enable = false,
  },
  refactor = {
    smart_rename = {
      enable = false,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = false,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  endwise = {
    enable = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
