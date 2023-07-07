local ufo = require_plugin("ufo")
if not ufo then
  return
end

ufo.setup({
  open_fold_hl_timeout = 150,
  close_fold_kinds = {'imports', 'comment'},
})
