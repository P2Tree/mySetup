local dap = require_plugin("dap")
local mason_dap  = require_plugin("mason-nvim-dap")
if not dap or not mason_dap then
  return
end

mason_dap.setup ({
  -- A list of adapters to install if they're not already installed.
  -- This setting has no relation with the `automatic_installatin` setting.
  ensure_installed = {
    "python"
  },

  -- Whether adapters that are set up (via dap) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  automatic_installatin = false,
})

-- If you want to use this for Rust and C, add something like this:
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Constant" })
vim.fn.sign_define("DapBreakpointRejected", { text = "" })

