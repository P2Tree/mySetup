return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "lua",
      "c",
      "cpp",
      "llvm",
      "tablegen",
      "python",
      "json",
      "yaml",
      "ini",
      "vim",
      "markdown",
    })
    opts.indent = { enable = true }
    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = "<TAB>",
      },
    }
    opts.endwise = { enable = true }
  end,
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
  },
}
