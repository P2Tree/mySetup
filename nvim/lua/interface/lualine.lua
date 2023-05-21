local lualine = require_plugin("lualine")
if not lualine then
  return
end

local function lsp()
  local clients = vim.lsp.buf_get_clients()
  if #clients == 0 then
    return ""
  end
  local names = {}
  local ignored = { "null-ls" }
  for _, client in ipairs(clients) do
    if not vim.tbl_contains(ignored, client.name) then
      table.insert(names, client.name)
    end
  end
  local msg = table.concat(names, ", ")
  if msg == "" then
    return ""
  else
    return "  " .. msg
  end
end

local function is_buffer_empty()
  return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
end

lualine.setup {
  sections = {
    lualine_a = {
      { "mode", icon = "" },
    },
    lualine_b = {
      { "filename", cond = is_buffer_empty, color = { gui = 'bold' } },
      { "progress" },
    },
    lualine_c = {
      { "diagnostics",
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
      },
    },
    lualine_x = {
      { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } }
    },
    lualine_y = {
      { "branch", icon = "", color = { gui = 'bold' } },
      { lsp },
    },
    lualine_z = {
      { "encoding", fmt = string.upper } ,
    }
  },
  options = {
    component_separators = '',
    section_separators = { left = "", right = " " },
    theme = 'tokyonight',
    icons_enabled = true,
    disabled_filetypes = {
      "alpha",
    },
    always_divide_middle = true,
    globalstatus = false,
  },
  extensions = {
    "man",
    "quickfix",
    "nvim-tree",
    "toggleterm",
    "symbols-outline",
    "nvim-dap-ui",
    "lazy",
  },
}
