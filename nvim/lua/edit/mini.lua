-- Library of 20+ independent Lua modules improving overall
-- Neovim (version 0.7 and higher) experience with minimal
-- effort. They all share same configuration approaches and
-- general design principles.

-- Extend and create a/i textobjects
local mini_ai = require_plugin('mini.ai')
if mini_ai then
  mini_ai.setup({
    -- Module mappings. Use `''` (empty string) to disable one
    mappings = {
      -- Main textobject prefixes
      around = 'a',
      inside = 'i',

      -- Next/last variants
      around_next = 'an',
      inside_next = 'in',
      around_last = 'al',
      inside_last = 'il',

      -- Move cursor to corresponding edge of `a` textobject
      goto_left = '',
      goto_right = '',
    },

    -- Number of lines within which textobject is searched
    n_lines = 50,

    -- How to search for object
    -- One of `cover`, `cover_or_next`, `cover_or_prev`,
    -- `cover_or_nearest`, `next`, `previous`, `nearest`.
    -- search_method = 'cover_or_next',

    -- Whether to disable showing non-error feedback
    -- silent = false,
  })
end

-- Visualize and work with indent scope
local mini_indentscope = require_plugin('mini.indentscope')
if mini_indentscope then
  mini_indentscope.setup({
    draw = {
      -- Delay (in ms) between event and start of drawing scope indicator
      delay = 100,
      -- Symbol priority. Increase to display on top of more symbols.
      priority = 2,
    },

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Textobjects
      object_scope = 'ii',
      object_scope_with_border = 'ai',
      -- Motions (jump to respective border line; if not present - body line)
      goto_top = 'tk',
      goto_bottom = 'tj',
    },

    -- Options which control scope computation
    options = {
      -- Type of scope's border: which line(s) with smaller indent to
      -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
      border = 'both',
      -- Whether to use cursor column when computing reference indent.
      -- Useful to see incremental scopes with horizontal cursor movements.
      indent_at_cursor = false,
      -- Whether to first check input line to be a border of adjacent scope.
      -- Use it if you want to place cursor on function header to get scope of
      -- its body.
      try_as_border = true,
    },

    -- Which character to use for drawing scope indicator
    symbol = '│',
  })
end

