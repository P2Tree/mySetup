local snip = require_plugin("luasnip")
if not snip then
  return
end

local types = require "luasnip.util.types"

snip.config.setup {
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "DiagnosticWarn" } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { "●", "DiagnosticInfo" } },
      },
    },
  },
}
