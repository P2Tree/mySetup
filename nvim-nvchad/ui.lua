local M = {}

--- Change the number display modes
function M.change_number()
  local number = vim.wo.number -- local to window
  local relativenumber = vim.wo.relativenumber -- local to window
  if not number and not relativenumber then
    vim.wo.number = true
  elseif number and not relativenumber then
    vim.wo.relativenumber = true
  elseif number and relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = false
  end
  vim.notify(string.format("number %s, relativenumber %s", bool2str(vim.wo.number), bool2str(vim.wo.relativenumber)), "info", {
    title = "UI Notice"
  })
end

return M
