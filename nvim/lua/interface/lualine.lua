local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify "Could not load lualine"
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

local function lsp()
  local clients = vim.lsp.buf_get_clients()
  if #clients == 0 then
    return ""
  end
  local names = {}
  local ignored = { "null-ls", "copilot" }
  for _, client in ipairs(clients) do
    if not vim.tbl_contains(ignored, client.name) then
      table.insert(names, client.name)
    end
  end
  local msg = table.concat(names, ", ")
  if msg == "" then
    return ""
  else
    return " " .. msg
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
      { lsp, },
    },
    lualine_x = {
      -- "overseer",
      -- "copilot",
      "filetype",
      indent,
      "encoding",
      "fileformat",
    },
  },
  options = {
    icons_enabled = true,
    theme = "catppuccin",  -- if you use catppuccin as theme
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
    "quickfix",
    -- "nvim-tree",
    "neo-tree",
    "toggleterm",
    "symbols-outline",
    -- "aerial",
    "nvim-dap-ui",
  },
}
