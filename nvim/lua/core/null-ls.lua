local null_ls = require_plugin("null-ls")
local mason = require_plugin("mason-null-ls")
if not null_ls or not mason then
  return
end

mason.setup_handlers {
  function(source_name, methods)
    -- all sources with no handler get passed here

    -- To keep the original functionality of `automatic_setup = true`,
    -- please add the below.
    require "mason-null-ls.automatic_setup"(source_name, methods)
  end,
}

null_ls.setup {
  border = "rounded",
  fallback_severity = vim.diagnostic.severity.INFO,
}
