---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  tabufline = {
    show_numbers = true,
  },

  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "ﴜ  Find Recent File", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "󰛳  Recover Workspace", "Spc p l", function() require("persistence").load() end },
      { "  Change Colorscheme", "Spc f c", "Telescope themes" },
      { "גּ  Check Mappings", "Spc t c", "NvCheatsheet" },
      { "󰿅  Quit", "q", ":q" },
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
