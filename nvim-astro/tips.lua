local M = {}

math.randomseed(os.time())

local function trim_string(str)
  local start_index = string.find(str, "%S", 2)
  if start_index == nil then
    return ""
  else
    return string.sub(str, start_index)
  end
end

local function string_split(str, delimiter)
  local result = {}
  for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
    local m = string.gsub(match, "^%s*(.-)%s*$", "%1")
    table.insert(result, m)
  end
  return result
end

function M.select_tips()
  local tips_path = vim.fn.stdpath "config" .. "/lua/user"
  local tips_files = vim.fn.globpath(tips_path, "notes.md", true, true)
  if tips_files == "" then return nil end
  local tips_file = tips_files[math.random(#tips_files)]

  local tips = {}
  for tip in io.lines(tips_file) do
    if string.sub(tip, 1, 1) == "-" then
      tip = trim_string(tip)
      table.insert(tips, tip)
    end
  end
  if #tips == 0 then return nil end

  local tip = tips[math.random(#tips)]
  local tip_parts = string_split(tip, ":")
  local tip_msg = ""
  if #tip_parts == 2 then
    tip_msg = "🎯 Tips: Use `" .. tip_parts[1] .. "` for " .. tip_parts[2]
  else
    tip_msg = "🎯 Tips: " .. tip_parts[1] .. " with no description"
  end
  return tip_msg
end

function M.select_keymaps()
  local keymaps = vim.api.nvim_get_keymap "n"
  local selected_keymap = keymaps[math.random(#keymaps)]

  local key = selected_keymap.lhs
  if string.sub(key, 1, 1) == vim.api.nvim_get_var "mapleader" then key = "<leader>" .. string.sub(key, 2) end

  local key_msg = selected_keymap.desc
  if key_msg ~= nil then
    key_msg = "💡 Keys: Use `" .. key .. "` for " .. key_msg
  else
    key_msg = "💡 Keys: Use `" .. key .. "` with no description"
  end
  return key_msg
end

function M.toggle()
  local tips = require "user.tips"
  local selections = { tips.select_tips(), tips.select_keymaps() }
  local selection = selections[math.random(#selections)]

  vim.notify(selection, vim.log.levels.INFO, { title = "nvim-tips" })
end

function M.open_notes()
  local current_file = vim.fn.expand "%:p"
  local init_lua = vim.fn.expand "$XDG_CONFIG_HOME" .. "/nvim/lua/user/notes.md"
  if current_file ~= init_lua then
    vim.cmd("e " .. init_lua)
  else
    vim.cmd "bd"
  end
end

return M
