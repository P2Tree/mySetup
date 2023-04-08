local comment = require_plugin("Comment")
if not comment then
  return
end

comment.setup({
  --- Add a space b/w comment and the line
  padding = true,
  --- Whether the cursor should stay at its position
  sticky = true,
  --- Lines to be ignored while (un)comment
  ignore = nil,
  --- LHS of toggle mappings in NORMAL mode
  toggler = {
    --- Line-comment toggle keymap
    line = '<leader>cc',
    --- Block-comment toggle keymap
    block = '<leader>cb',
  },
  --- LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    --- Line-comment keymap
    line = '<leader>cc',
    --- Block-comment keymap
    block = '<leader>cb',
  },
  --- LHS of extra mappings
  extra = {
    --- Add comment on the line above
    above = '<leader>cO',
    --- Add comment on the line below
    below = '<leader>co',
    --- Add comment at the end of line
    eol = '<leader>ca',
  },
})
