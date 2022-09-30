local theme = "catppuccin"

local ok, themeobj = pcall(require, theme)

-- local ok, nightfox = pcall(require, "nightfox")
-- if ok then
--   nightfox.setup {
--     options.styles = {
--       comments = "italic",
--     },
--   }
-- end

if ok and theme == "catppuccin" then
  themeobj.setup {
    compile = {
      enabled = true,
      path = vim.fn.stdpath "cache" .. "/catppuccin",
      suffix = "_compiled",
    },
    styles = {
      comments = { "italic" },
      conditionals = {},
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
    integrations = {
      aerial = true,
      barbar = false,
      beacon = true,
      cmp = true,
      coc_nvim = false,
      dashboard = false,  -- dashboard-nvim, a fancy fastest async start screen
      fern = false,
      fidget = true,
      gitgutter = false,
      gitsigns = true,
      hop = true,
      illuminate = true,
      leap = false,
      lightspeed = false,
      lsp_saga = false,
      lsp_trouble = false,
      markdown = true,
      mini = false,
      neogit = true,
      notify = true,
      nvimtree = true,
      overseer = false,
      pounce = false,
      symbols_outline = false,
      telekasten = false,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
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
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
    },
    color_overrides = {},
    highlight_overrides = {},
  }

  vim.api.nvim_create_autocmd("User", {
    pattern = "PackerCompileDone",
    callback = function()
      vim.cmd "CatppuccinCompile"
    end,
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "colorscheme.lua",
    command = "source <afile> | CatppuccinCompile",
  })

  vim.g.catppuccin_flavour = "macchiato"  -- macchiato, latte, frappe, mocha
  -- can use vim command: Catppuccin <flavour> to switch themes on the fly
  --
  -- others plugins config:
  -- in lualine setup, set options.theme = "catppuccin"

end

vim.cmd "colorscheme catppuccin"

vim.cmd [[
hi link GitSignsChangeLn DiffText
hi link GitSignsAddInLine GitSignsAddLn
hi link GitSignsDeleteInline GitSignsDeleteLn
hi link GitSignsChangeInline GitSignsChangeLn
hi link GitSignsDeleteLn DiffDelete
]]
