local blankline = require_plugin("indent_blankline")
if not blankline then
  return
end

blankline.setup {
  show_current_context = true,
  show_current_context_start = true,
  -- use_treesitter = true,
  -- use_treesitter_scope = true,
  filetype_exclude = {
    "help",
    "OverseerForm",
  }
}
