local dapui = require_plugin("dapui")
local dap = require_plugin("dap")
if not dapui or not dap then
  return
end

dapui.setup {
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = "",
    },
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  force_buffers = true,
  icons = {
    collapsed = "▶",
    current_frame = "▶",
    expanded = "▼",
  },
  layouts = {
    {
      elements = {
        {
          id = "stacks",
          size = 0.3,
        },
        {
          id = "scopes",
          size = 0.5,
        },
        {
          id = "watches",
          size = 0.2,
        },
      },
      position = "left",
      size = 50,
    },
    {
      elements = {
        {
          id = "breakpoints",
          size = 0.3,
        },
        {
          id = "repl",
          size = 0.7,
        },
      },
      position = "right",
      size = 50,
    },
    {
      elements = {
        {
          id = "console",
          size = 1.0,
        }
      },
      position = "bottom",
      size = 10,
    },
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t",
  },
  render = {
    indent = 1,
    max_value_lines = 100,
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
