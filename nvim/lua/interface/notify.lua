local ok, notify = pcall(require, "notify")
if not ok then
  vim.notify "Could not load notify"
  return
end

notify.setup {
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    WARN = "",
    INFO = "",
    TRACE = "✎",
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "static",
  timeout = 2500,
  top_down = true,
}

vim.notify = notify
