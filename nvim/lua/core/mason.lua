local mason = require_plugin("mason")
if not mason then
  return
end

mason.setup {
  ui = {
    border = "rounded",
  },
  automatic_setup = true,
}
