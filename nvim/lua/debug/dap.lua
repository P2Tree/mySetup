local dap = require_plugin("dap")
local mason  = require_plugin("mason-nvim-dap")
if not dap or not mason then
  return
end

mason.setup {
  automatic_setup = {
    -- modifiers the default configurations table
    -- pass in a function or a list to override with
    -- the same can be done for adapters and filetypes
    configurations = function(default)
      default.python = nil
      return default
    end,
  },
}

mason.setup_handlers()

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Constant" })
vim.fn.sign_define("DapBreakpointRejected", { text = "" })

