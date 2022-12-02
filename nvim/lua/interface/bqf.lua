local ok, nvim_bqf = pcall(require, "bqf")
if not ok then
  vim.notify "Could not load bqf"
  return
end

nvim_bqf.setup ({
  auto_enable = true,
  magic_window = true,
  auto_resize_height = true,  -- hightly recommended enable
  preview = {
    auto_preview = true,
    show_title = true,
    win_height = 15,
    win_vheight = 15,
    delay_syntax = 50,
  },
  func_map = {
    open = 'o', -- open under the cursor in quickfix
    drop = 'O',  -- open with drop and close quickfix
    openc = '<cr>',-- open and close quickfix
    split = 'x', -- open with vertical split
    vsplit = 'v', -- open with horizontal split

    -- has some issues to change kj keymap
    -- default is ctrl-n and ctrl-p
    -- prevfile = 'k', -- go to previous file
    -- nextfile = 'j', -- go to next file
    -- prevhist = 'h', -- go to previous quickfix list
    -- nexthist = 'l', -- go to next quickfix list
  }
})
