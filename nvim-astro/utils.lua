local M = {}

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
