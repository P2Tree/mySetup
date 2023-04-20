local deadcolumn = require_plugin("deadcolumn")
if not deadcolumn then
  return
end

deadcolumn.setup({
  -- The scope for showing the colored column
  -- 'line' | 'buffer' | 'visible' | 'cursor'
  -- scope = 'line',

  -- In which modes to show the colored column
  -- modes = { 'i', 'ic', 'ix', 'R', 'Rc', 'Rx', 'Rv', 'Rvc', 'Rvx' },

  -- Blending options
  blending = {
    -- The threshold for showing the colored column
    -- - between 0 and 1: for relative threshold, the colored column will be shown when the current line
    --   is longer than `threshold` times the `colorcolumn`
    -- greater than 1: for fixed threshold, the colored column will be shown when the current line
    --   is longer than `threshold` characters.
    threshold = 0.95,
    -- The color code to be used as the background color for blending
    colorcode = '#273644',
    -- The highlight group to be used as the background color for blending
    hlgroup = {
      'Normal',
      'background',
    },
  },

  -- Warning color options
  warning = {
    -- The alpha value for the warning color, blended with the background color
    alpha = 0.4,
    -- The color code for the warning color
    colorcode = '#4fd6be',
    -- The highlight group for the warning color
    hlgroup = {
      'Error',
      'background',
    },
  },

  -- Extra functionalities
  extra = {
    -- nil: disable
    -- string: `colorcolumn` will be set to this value when `textwidth` is set, and will be restored
    --   to the original value when `textwidth` is unset, suggested value is '+1'
    follow_tw = '+1',
  },
})

