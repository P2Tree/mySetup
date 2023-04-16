local noice = require_plugin("noice")
if noice then
  noice.setup({
    --- Custom view configure will override default ones
    views = {
      popup = {  -- 'popup' view is powered by nui
        position = "50%",
        size = {
          width = "62",
          height = "auto",
        },
        border = {
          style = "rounded",
          text = {
            top = " Lua Output ",
            top_align = "center",
          },
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      }
    },
    routes = {
      {  -- lua print has this 'empty' type, routes it to popup window
        view = "popup",
        filter = {
          event = "msg_show",
          kind = "",
          ["not"] = {
            find = "written",
          }
        },
      },
      {  -- ignore 'written' messages, be sure 'W' is set to false in vim.opt.shortmess
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
    -- bottom_search = false, -- use a classic bottom cmdline for search
    -- command_palette = false, -- position the cmdline and popupmenu together
    -- long_message_to_split = false, -- long messages will be sent to a split
    -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = "rounded",
    }
  })
end
