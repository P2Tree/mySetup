local dap = require_plugin("dap")
local mason_dap  = require_plugin("mason-nvim-dap")
local mason_registry = require_plugin("mason-registry")
if not dap or not mason_dap or not mason_registry then
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

local cpptools = mason_registry.get_package("cpptools")
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = cpptools:get_install_path() .. '/extension/debugAdapters/bin/OpenDebugAD7',
  options = {
    detached = false,
  }
}

local last_input_program = ""
local last_input_args = ""
dap.configurations.cpp = {
  {
    name = "Debug code",
    type = "cppdbg",
    request = "launch",  -- either `launch` or `attach`
    program = function()
      last_input_program = vim.fn.input("Execute: ", vim.fn.getcwd() .. '/' .. last_input_program)
      return last_input_program
    end,
    args = function()
      last_input_args = vim.fn.input("Arguments: ", last_input_args)
      local arguments = vim.split(last_input_args, " ")
      return arguments
    end,
    cwd = '${workspaceFolder}',
    -- environment = {
    --   {
    --     PATH = os.getenv("PATH"),
    --   }
    -- },
    stopAtEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = true
      },
    },
  },
}
dap.configurations.c = dap.configurations.cpp

-- local codelldb = mason_registry.get_package("codelldb")
-- dap.adapters.codelldb = {
--   id = "codelldb",
--   type = "server",
--   host = "127.0.0.1",
--   port = 13000,
--
--   executable = {
--     command = codelldb:get_install_path() .. '/extension/adapter/codelldb',
--     args = { '--port', 13000 },
--   },
--   options = {
--     max_retries = 30,
--   }
-- }
--
-- local last_input_program = ""
-- local last_input_args = ""
--
-- dap.configurations.cpp = {
--   {
--     name = "Debug code",
--     type = "codelldb",
--     request = "launch",
--
--     -- other configurations from codelldb
--     initCommands = function()
--       last_input_program = vim.fn.input("Execute: ", last_input_program)
--       last_input_args = vim.fn.input("Arguments: ", last_input_args)
--     end,
--     relativePathBase = os.getenv("HOME"),
--     sourceLanguages = { "cpp", "c" },
--     program = function()
--       return last_input_program
--     end,
--     args = function()
--       local arguments = vim.split(last_input_args, " ")
--       return arguments
--     end,
--     cwd = "${workspaceFolder}",
--     env = {
--       PATH = os.getenv("PATH")
--     },
--   }
-- }
--
