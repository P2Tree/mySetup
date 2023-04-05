local dim = require_plugin("neodim")
if not dim then
  return
end

dim.setup {
  alpha = 0.75,
  blend_color = "#000000",
  update_in_insert = {
    enable = true,
    delay = 100,
  },
  hide = {
    virtual_text = true,
    signs = true,
    underline = true,
  },
}
