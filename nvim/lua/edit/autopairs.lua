local autopairs = require_plugin("nvim-autopairs")
if not autopairs then
  return
end

autopairs.setup {
  fast_wrap = {}, -- press <alt-e> to use fast_wrap
  disable_filetype = { "TelescopePrompt", "vim" }
}

-- use treesitter to check autopairs
require("nvim-treesitter.configs").setup {
  autopairs = { enable = true },
}

-- local cmp_autopairs = autopairs.completion.cmp
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
