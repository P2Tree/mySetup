local bufferline = require_plugin("bufferline")
if not bufferline then
  return
end

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    -- style_preset = bufferline.presets.default, -- or bufferline.presets.minimal,
    themable = true, -- true | false, allows highlight groups to be overriden i.e. sets highlights as default
    numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function | false, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function | false, see "Mouse actions"
    indicator = {
      -- alternatives: right aligned =>▕ ▐  left aligned => ▎ ▌
      icon = "▌", -- this should be omitted if indicator style is not 'icon'
      style = "icon", -- "icon" | "underline" | "none",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = nil,
    -- name_formatter = function(buf)  -- buf contains:
    --       -- name                | str        | the basename of the active file
    --       -- path                | str        | the full path of the active file
    --       -- bufnr (buffer only) | int        | the number of the active buffer
    --       -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
    --       -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    -- end,
    max_name_length = 24,
    max_prefix_length = 20, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "false", -- false | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(bufnr)
      -- if the return is false, this buffer will be shown, otherwise, this buffer will be hidden
      local exclude_ft = { "qf", "fugitive", "git" }
      local cur_ft = vim.bo[bufnr].filetype
      local should_filter = vim.tbl_contains(exclude_ft, cur_ft)
      if should_filter then
        return false
      end
      return true
    end,
    offsets = {
      { filetype = "aerial", text = "Outline", text_align = "center", saperator = true },
      { filetype = "NvimTree", text = "File Explorer", text_align = "center", saperator = true },
      { filetype = "SidebarNvim", text = "Sidebar", text_align = "center", saperator = true },
    },
    color_icons = true, --- true | false, -- whether or not to add the filetype icon highlights
    get_element_icon = nil,
    -- get_element_icon = function(element)
    --   -- element consists of {filetype: string, path: string, extension: string, directory: string}
    --   -- This can be used to change how bufferline fetches the icon
    --   -- for an element e.g. a buffer or a tab.
    --   -- e.g.
    --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
    --   return icon, hl
    --   -- or
    --   local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
    --   return custom_map[element.filetype]
    -- end,
    show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
    show_buffer_close_icons = true, -- true | false,
    show_close_icon = false, -- true | false,
    show_tab_indicators = true, -- true | false,
    show_duplicate_prefix = true, -- true | false, whether to show duplicate buffer prefix
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = { '', '' }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false, -- false | true,
    always_show_bufferline = true, -- true | false,
    hover = {
      enable = true,
      delay = 200,
      reveal = {'close'}
    },
    sort_by = "id", -- 'insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
}
