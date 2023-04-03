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

math.randomseed(os.time())

local function string_split(str, delimiter)
  local result = {}
  -- local regex = ("([^%s]+)"):format(delimiter, delimiter)
  -- for match in str:gmatch(regex) do
  for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

local function select_tips()
  local tips_path = vim.fn.stdpath('config') .. "/lua/tips"
  local tips_files = vim.fn.globpath(tips_path, '*', true, true)
  if next(tips_files) == nil then
    return nil
  end

  local tips_file = tips_files[math.random(#tips_files)]
  local tips = {}
  for tip in io.lines(tips_file) do
    table.insert(tips, tip)
  end

  local tip = tips[math.random(#tips)]
  local tip_parts = string_split(tip, ':')
  local tip_msg = ""
  if #tip_parts == 2 then
    tip_msg = "🎯 Tips: Use `" .. tip_parts[1] .. "` for " .. tip_parts[2]
  else
    tip_msg = "🎯 Tips: " .. tip_parts[1] .. " with no description"
  end
  return tip_msg
end

local function select_keymaps()
  local keymaps = vim.api.nvim_get_keymap('n')
  local selected_keymap = keymaps[math.random(#keymaps)]

  local key = selected_keymap.lhs
  if string.sub(key, 1, 1) == vim.api.nvim_get_var('mapleader') then
    key = "<leader>" .. string.sub(key, 2)
  end

  local key_msg = selected_keymap.desc
  if key_msg ~= nil then
    key_msg = "💡 Keys: Use `" .. key .. "` for " .. key_msg
  else
    key_msg = "💡 Keys: Use `" .. key .. "` with no description"
  end
  return key_msg
end

local selections = {select_tips, select_keymaps}
local footer = selections[math.random(#selections)]
dashboard.section.footer.val = footer

alpha.setup(dashboard.opts)
