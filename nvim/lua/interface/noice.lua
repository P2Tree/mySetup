local noice = require_plugin("noice")
if noice then
  noice.setup({
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      -- view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      -- opts = {}, -- global options for the cmdline. See section on views
      format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        -- title: set to anything or empty string to hide
        cmdline = { pattern = "^:", icon = " :", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " /", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ?", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = {}, -- Used by input()
        -- lua = false, -- to disable a format, set to `false`
      },
    },
    presets = {
      lsp_doc_border = "rounded"
    }
  })
end
