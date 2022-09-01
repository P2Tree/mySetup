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
      treesitter = true,
      cmp = true,
      gitsigns = true,
      telescope = true,
      nvimtree = false,
      neotree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = true,
      neogit = true,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = {
        enable = true,
        italics = true,
        bolds = true,
      },
      markdown = true,
      lightspeed = false,
      ts_rainbow = true,
      hop = true,
      notify = true,
      telekasten = false,
      symbols_outline = false,
      aerial = true,
      mini = false,
      vimwiki = true,
      beacon = true,
      navic = true,  -- also need to set highlight = true in navic setup file
      overseer = false,
      dap = {
        enabled = false,
        enable_ui = false, -- nvim-dap-ui
        -- also need to set highlight groups in dap setup file
      }
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

vim.cmd("colorscheme "..theme)
