local blankline = require_plugin("indent_blankline")
if not blankline then
  return
end

blankline.setup {
  show_current_context = false,
  show_current_context_start = false,
  filetype_exclude = {
    "help",
    "alpha",
    "NvimTree",
    "lazy",
  }
}
