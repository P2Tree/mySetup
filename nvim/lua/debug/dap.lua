local ok, dap = pcall(require, "dap")
if not ok then
  vim.notify "Could not load dap"
  return
end

local ok, mason  = pcall(require, "mason-nvim-dap")
if not ok then
  vim.notify "Could not load mason-nvim-dap"
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

vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<leader>dn", require("dap").step_over, { desc = "Debug: Step over" })
vim.keymap.set("n", "<leader>ds", require("dap").step_into, { desc = "Debug: Step into" })
vim.keymap.set("n", "<leader>df", require("dap").step_out, { desc = "Debug: Step out" })
vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", require("dap").repl.toggle, { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>dl", require("dap").run_last, { desc = "Run last" })

vim.keymap.set("n", "<leader>dp", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Set breakpoint" })
vim.keymap.set("n", "<leader>di", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Set log point" })
