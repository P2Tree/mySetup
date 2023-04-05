local notify = require_plugin("notify")
if not notify then
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
  timeout = 5000,
  top_down = true,
}

vim.notify = notify
