local ok, alpha = pcall(require, "alpha")
if not ok then
  vim.notify "Could not load alpha"
  return
end

-- local dashboard = require "alpha.themes.startify"
local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
  [[                                                                       ]],
  [[  ██████   █████                   █████   █████  ███                  ]],
  [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
  [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
  [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
  [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
  [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
  [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
  [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
  [[                                                                       ]],
  [[                                                                       ]],
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", "<cmd>ene <CR>"),
  dashboard.button("SPC f f", "  Find file"),
  dashboard.button("SPC f o", "  Find recently files"),
  dashboard.button("SPC f g", "  Find word"),
  dashboard.button("SPC f m", "  Jump to bookmarks"),
  dashboard.button("SPC w l", "  Load session"),
  dashboard.button("q", "  Exit NeoVim" , ":qa<CR>"),
}

-- dashboard.section.footer.val = hint

alpha.setup(dashboard.opts)
