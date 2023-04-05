local bqf = require_plugin("bqf")
if not bqf then
  return
end

bqf.setup ({
  -- [[Enable nvim-bqf in quickfix window automatically]],
  -- default: true
  auto_enable = true,
  -- [[Give the window magic, when the window is splited horizontally, keep
  --   the distance between the current line and the top/bottom border of neovim unchanged.
  --   It's a bit like a floating window, but the window is indeed a normal window, without
  --   any floating attributes.]],
  -- default: true
  magic_window = true,
  -- [[Resize quickfix window height automatically.
  --   Shrink higher height to size of list in quickfix window, otherwise extend height
  --   to size of list or to default height (10)]],
  -- default: false
  auto_resize_height = true,

  preview = {
    -- [[Enable preview in quickfix window automatically]],
    -- default: true
    auto_preview = true,
    -- [[Border and scroll bar chars, they respectively represent:
    --   vline, vline, hline, hline, ulcorner, urcorner, blcorner, brcorner, sbar]],
    -- default = {'│', '│', '─', '─', '╭', '╮', '╰', '╯', '█'}
    border_chars = {'│', '│', '─', '─', '╭', '╮', '╰', '╯', '█'},

    -- [[Show the window title]],
    -- default = true
    show_title = true,

    --  [[Delay time, to do syntax for previewed buffer, unit is millisecond]],
    -- default: 50
    delay_syntax = 50,
    -- [[The height of preview window for horizontal layout,
    --   large value (like 999) perform preview window as a "full" mode]],
    -- default: 15
    win_height = 15,

    -- [[The height of preview window for vertical layout]],
    -- default: 15
    win_vheight = 15,

    -- [[Wrap the line, `:h wrap` for detail]],
    -- default: false
    wrap = false,

    -- [[Add label of current item buffer at the end of the item line]],
    -- default: true
    buf_label = true,

    -- [[A callback function to decide whether to preview while switching buffer,
    --  with (bufnr: number, qwinid: number) parameters]],
    -- default: nil
    should_preview_cb = nil,
  },

  func_map = {},

  filter = {
    fzf = {
      action_for = {
        -- [[Press ctrl-t to open up the item in a new tab]],
        -- default = 'tabedit'
        ['ctrl-t'] = 'tabedit',

        -- [[Press ctrl-v to open up the item in a new vertical split]],
        -- default = 'vsplit'
        ['ctrl-v'] = 'vsplit',
        -- [[Press ctrl-x to open up the item in a new horizontal split]],
        -- default = 'split'
        ['ctrl-x'] = 'split',

        -- [[Press ctrl-q to toggle sign for the selected items]],
        -- default = 'signtoggle'
        ['ctrl-q'] = 'signtoggle',

        -- [[Press ctrl-c to close quickfix window and abort fzf]],
        -- default = 'closeall'
        ['ctrl-c'] = 'closeall',
      },
      -- [[Extra options for fzf]],
      -- default = {'--bind', 'ctrl-o:toggle-all'}
      extra_opts = {'--bind', 'ctrl-o:toggle-all'},
    }
  }
})
