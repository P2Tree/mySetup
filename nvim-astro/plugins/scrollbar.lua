return {
  { import = "astrocommunity.scrolling.nvim-scrollbar" },

  {
    "nvim-scrollbar",
    opts = {
      excluded_buftypes = {
        "terminal",
      },
      excluded_filetypes = {
        "lazy",
        "mason",
        "neo-tree",
        "aerial",
      },
    },
  },
}
