local blankline = require_plugin("indent_blankline")
if not blankline then
  return
end

blankline.setup {
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = {
    "help",
    "alpha",
    "NvimTree",
    "lazy",
  }
}
