local ok, scrollbar = pcall(require, "scrollbar")
if not ok then
  vim.notify "Could not load scrollbar"
  return
end

scrollbar.setup({
  show = true,
  show_in_active_only = false,
  set_highlights = true,
  folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
  max_lines = false, -- disables if no. of lines in buffer exceeds this
  handle = {
      text = " ",
      color = "Grey",
      cterm = nil,
      highlight = "CursorColumn",
      hide_if_all_visible = true, -- Hides handle if all lines are visible
  },
  marks = {
      Search = {
          text = { "-", "=" },
          priority = 0,
          color = nil,
          cterm = nil,
          highlight = "Search",
      },
      Error = {
          text = { "-", "=" },
          priority = 1,
          color = nil,
          cterm = nil,
          highlight = "DiagnosticVirtualTextError",
      },
      Warn = {
          text = { "-", "=" },
          priority = 2,
          color = nil,
          cterm = nil,
          highlight = "DiagnosticVirtualTextWarn",
      },
      Info = {
          text = { "-", "=" },
          priority = 3,
          color = nil,
          cterm = nil,
          highlight = "DiagnosticVirtualTextInfo",
      },
      Hint = {
          text = { "-", "=" },
          priority = 4,
          color = nil,
          cterm = nil,
          highlight = "DiagnosticVirtualTextHint",
      },
      Misc = {
          text = { "-", "=" },
          priority = 5,
          color = nil,
          cterm = nil,
          highlight = "Normal",
      },
  },
  excluded_buftypes = {
      "terminal",
  },
  excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "noice",
      "Outline",
      "NvimTree",
  },
  autocmd = {
      render = {
          "BufWinEnter",
          "TabEnter",
          "TermEnter",
          "WinEnter",
          "CmdwinLeave",
          "TextChanged",
          "VimResized",
          "WinScrolled",
      },
      clear = {
          "BufWinLeave",
          "TabLeave",
          "TermLeave",
          "WinLeave",
      },
  },
  handlers = {
      diagnostic = true,
      search = true, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
  },
})

-- Configure hlslens co-work for search highlight
require("scrollbar.handlers.search").setup()
