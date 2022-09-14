local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify "Could not load lualine"
  return
end

local ok, navic = pcall(require, "nvim-navic")
if not ok then
  vim.notify "Could not load navic"
  return
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function indent()
  if vim.o.expandtab then
    return "SW:" .. vim.o.shiftwidth
  else
    return "TS:" .. vim.o.tabstop
  end
end

lualine.setup {
  sections = {
    lualine_b = {
      { "b:gitsigns_head", icon = "" },
      { "diff", source = diff_source },
      "diagnostics",
    },
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    },
    lualine_x = {
      -- "copilot",
      "filetype",
      'indent',
      "encoding",
      "fileformat",
    },
  },
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    disabled_filetypes = {
      "alpha",
    },
    always_divide_middle = true,
    globalstatus = false,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  extensions = {
    "man",
    -- "nvim-tree",
    "neo-tree",
    "toggleterm",
    -- "symbols-outline",
    "aerial",
    "nvim-dap-ui",
  },
}
-- lualine.setup {
--   sections = {
--     lualine_a = {
--       { 'mode', separator = { left = '' }, right_padding = 2 },
--     },
--     lualine_b = {
--       { "b:gitsigns_head", icon = "" },
--       { "diff", source = diff_source },
--       "diagnostics",
--     },
--     lualine_c = {
--       { navic.get_location, cond = navic.is_available },
--     },
--     lualine_x = {
--       -- "copilot",
--       "filetype",
--       'indent',
--       "encoding",
--       "fileformat",
--     },
--     lualine_y = { 'filetype', 'progress' },
--     lualine_z = {
--       { 'location', separator = { right = '' }, left_padding = 2 },
--     },
--   },
--   options = {
--     theme = "catppuccin",
--     component_separators = '|',
--     section_separators = { left = '', right = '' },
--   },
--   inactive_sections = {
--     lualine_a = { 'filename' },
--     lualine_b = {},
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = { 'location' },
--   },
--   tabline = {},
--   extensions = {
--     "man",
--     -- "nvim-tree",
--     "neo-tree",
--     "toggleterm",
--     -- "symbols-outline",
--     "aerial",
--     "nvim-dap-ui",
--   },
-- }
