local catppuccin = require_plugin("catppuccin")
if not catppuccin then
  return
end

catppuccin.setup {
  flavour = "macchiato",  -- macchiato, latte, frappe, mocha
                          -- can use vim command: Catppuccin <flavour> to switch themes on the fly
  background = { -- :h background
    light = "latte",
    dark = "macchiato",
  },
  compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
  transparent_background = false,
  term_colors = false,
  dim_inactive = {
    enable = false,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = { "bold" },
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = { "bold" },
    operators = {},
  },
  color_overrides = {},
  highlight_overrides = {},
  integrations = {
    aerial = false,
    barbar = false,
    beacon = true,
    cmp = true,
    coc_nvim = false,
    dashboard = false,  -- dashboard-nvim, a fancy fastest async start screen
    fern = false,
    fidget = true,
    gitgutter = false,
    gitsigns = true,
    illuminate = true,
    hop = false,
    leap = true,
    lightspeed = false,
    lsp_saga = false,
    lsp_trouble = false,
    mason = true,
    markdown = true,
    mini = false,
    neogit = true,
    notify = true,
    nvimtree = true,
    overseer = true,
    pounce = false,
    symbols_outline = true,
    telekasten = false,
    telescope = true,
    treesitter = true,
    treesitter_context = false,
    ts_rainbow = true,
    vim_sneak = false,
    vimwiki = true,
    which_key = true,

    -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
    dap = {
      enabled = true,
      enable_ui = true, -- nvim-dap-ui
      -- also need to set highlight groups in dap setup file
    },
    barbecue = {
      dim_dirname = true,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    navic = {
      enable = true,  -- also need to set highlight = true in navic setup file
      custom_bg = "NONE",
    },
    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },
  },
}

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "catppuccin.lua",
  command = "source <afile> | CatppuccinCompile",
})

vim.cmd.colorscheme "catppuccin"
--
-- others plugins config:
-- in lualine setup, set options.theme = "catppuccin"

