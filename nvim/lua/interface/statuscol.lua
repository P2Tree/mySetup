local statuscol = require_plugin("statuscol")
if not statuscol then
  return
end

local builtin = require "statuscol.builtin"

statuscol.setup {
  segments = {
    { text = { "%C" }, click = "v:lua.ScFa" },
    {
      sign = { name = { ".*" }, maxwidth = 1 },
      click = "v:lua.ScSa",
    },
    {
      text = { builtin.lnumfunc },
      condition = { true, builtin.not_empty },
      click = "v:lua.ScLa",
    },
    {
      sign = { name = { "GitSigns" }, maxwidth = 1, colwidth = 1 },
      click = "v:lua.ScSa",
    },
  },
}
