local statuscol = require_plugin("statuscol")
if not statuscol then
  return
end

local builtin = require "statuscol.builtin"

statuscol.setup {
  segments = {
    {
      sign = { name = { ".*" } },
      click = "v:lua.ScSa",
    },
    {
      text = { builtin.lnumfunc },
      click = "v:lua.ScLa",
    },
    {
      sign = { name = { "GitSigns" }, colwidth = 1 },
      click = "v:lua.ScSa",
    },
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  },
}
