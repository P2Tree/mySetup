function _G.require_plugin(name)
  local status_ok, plugin = pcall(require, name)
  if not status_ok then
    local filename = vim.fn.fnamemodify(debug.getinfo(2).short_src, ":t")
    vim.notify("Could not find plugin " .. name .. " [" .. filename .. "]", vim.log.levels.WARN, {
      title = "Lazy Plugin Manager",
    })
    return nil
  end
  return plugin
end

function _G.has_plugin(name)
  return require("lazy.core.config").plugins[name] ~= nil
end
