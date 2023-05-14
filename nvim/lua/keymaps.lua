local map = vim.keymap.set
local plugin_keymaps = {}

--- --------------------
---    Normal Keymaps
--- --------------------

--- better up down line with wrap line
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

--- Select up or down in insert mode
map("c", "<C-p>", "<Up>", { desc = "Select up in insert mode" })
map("c", "<C-n>", "<Down>", { desc = "Select down in insert mode" })

--- Joint two lines together
map("n", "T", "J", { desc = "Joint two lines together (same as origin `J`)" })

--- Jump to head or tail of the line
map({"n", "v"}, "H", "^", { desc = "Jump to the head of the line (same as `^`)" })
map({"n", "v"}, "L", "$", { desc = "Jump to the tail of the line (same as `$`)" })

--- Screen tiny step up or down scroll
map({"n", "v"}, "K", "<C-y>", { remap = true, desc = "Screen tiny step up scroll" })
map({"n", "v"}, "J", "<C-e>", { remap = true, desc = "Screen tiny step down scroll" })

--- Screen half step up and down scroll
map("n", "<PageUp>", "<C-u>", { remap = true, desc = "Screen half step up scroll" })
map("n", "<PageDown>", "<C-d>", { remap = true, desc = "Screen half step down scroll" })

--- Window move
map("n", "<C-left>", "<C-w>h", { desc = "Focus on the left window" })
map("n", "<C-right>", "<C-w>l", { desc = "Focus on the right window" })
map("n", "<C-up>", "<C-w>k", { desc = "Focus on the up window" })
map("n", "<C-down>", "<C-w>j", { desc = "Focus on the down window" })
map("n", "<C-h>", "<C-w>h", { desc = "Focus on the left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus on the right window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus on the up window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus on the down window" })

--- Window split
map("n", "<leader>-", "<C-w>s", { desc = "Split window horizontal" })
map("n", "<leader>\\", "<C-w>v", { desc = "Split window vertical" })

--- Quit window or buffer
map("n", "q", function()
  vim.cmd "redraw"
  local ft = vim.o.filetype
  if ft == "help" or ft == "qf" then
    vim.cmd "close"
  elseif #vim.fn.getbufinfo { buflisted = 1 } == 1 then
    vim.cmd "q"
  else
    vim.cmd "bp | bd #"
  end
end, { silent = true, desc = "Close buffer or exit neovim" })

vim.api.nvim_set_keymap("n", "gx",
  [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]],
  { desc = "Open URL under cursor with browser" }
  )

--- Record mode
map("n", "Q", "q", { desc = "Record mode (same as origin `q`)" })

--- Better indent
map("v", "<Tab>", ">gv")
map("v", ">>", ">gv")
map("v", "<S-Tab>", "<gv")
map("v", "<<", "<gv")

--- Search word under cursor
map({"n", "x"}, "*", "*N", { remap = true, desc = "Search word under cursor" })

--- switch previous buffer
map("n", "<Leader>bb", "<Cmd>e #<CR>", { desc = "Switch to other buffer" })

--- Disable search highlight
map("n", "<Esc>", "<Cmd>nohl<CR><Esc>", { silent = true, desc = "Disable search highlight" })

--- Copy to system clipboard
map({"n", "v"}, "Y", '"+y', { desc = "Copy to system clipboard" })

--- Refresh Neovim configure
map("n", "<Leader>r", ":source $MYVIMRC<CR>", { desc = "Refresh neovim configure" })

--- Add undo break-points
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", ";", ";<C-g>u")

--- save file
map({"i", "v", "n", "s"}, "<C-s>", "<Cmd>w<CR><Esc>", { desc = "Save file" })

--- open quickfix window
map("n", "<leader>oq", "<Cmd>copen<CR>", { silent = true, desc = "Open Quickfix List" })

--- --------------------
---    Plugin Keymaps
--- --------------------

--- Core: Lazy
map("n", "<leader>ol", "<Cmd>Lazy<CR>", { silent = true, desc = "Open plugin manager (Lazy)" })

--- Core: Mason
map("n", "<leader>om", "<Cmd>Mason<CR>", { silent = true, desc = "Open tool manager (Mason)" })

--- Edit: Hex
map("n", "<leader>hd", "<Cmd>HexDump<CR>", { desc = "Convert binary view to hex view" })
map("n", "<leader>ha", "<Cmd>HexAssemble<CR>", { desc = "Convert hex view to binary view" })
map("n", "<leader>hh", "<Cmd>HexToggle<CR>", { desc = "Convert between hex view and binary view" })

--- Interface: BufferLine
-- Default BufferLineGoToBuffer interface is relative buffer(visual buffer), but absolute buffer
-- The plugin support select buffer kind at go_to_buffer. So I use absolute buffer
map("n", "<M-1>", function() require('bufferline').go_to_buffer(1, true) end, { desc = "Go to buffer 1" })
map("n", "<M-2>", function() require('bufferline').go_to_buffer(2, true) end, { desc = "Go to buffer 2" })
map("n", "<M-3>", function() require('bufferline').go_to_buffer(3, true) end, { desc = "Go to buffer 3" })
map("n", "<M-4>", function() require('bufferline').go_to_buffer(4, true) end, { desc = "Go to buffer 4" })
map("n", "<M-5>", function() require('bufferline').go_to_buffer(5, true) end, { desc = "Go to buffer 5" })
map("n", "<M-6>", function() require('bufferline').go_to_buffer(6, true) end, { desc = "Go to buffer 6" })
map("n", "<M-7>", function() require('bufferline').go_to_buffer(7, true) end, { desc = "Go to buffer 7" })
map("n", "<M-8>", function() require('bufferline').go_to_buffer(8, true) end, { desc = "Go to buffer 8" })
map("n", "<M-9>", function() require('bufferline').go_to_buffer(9, true) end, { desc = "Go to buffer 9" })
map("n", "]b", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin Buffer" })
map("n", "<leader>bk", "<Cmd>BufferLinePick<CR>", { desc = "Pick Buffer" })
map("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { desc = "Close Buffer" })
map("n", "<leader>bs", "<Cmd>BufferLineSortByDirectory<CR>", { desc = "Sort Buffer by directory" })
-- map("n", "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", { desc = "Sort Buffer by extension" })
-- map("n", "<leader>bst", "<cmd>BufferLineSortByTabs<CR>", { desc = "Sort Buffer by tabs" })

--- Interface: Illuminate
map("n", "<M-n>", function() require('illuminate').goto_next_reference() end, { desc = "Next reference" })
map("n", "<M-p>", function() require('illuminate').goto_prev_reference() end, { desc = "Previous reference" })

--- Interface: Ufo
map('n', 'zR', function() require('ufo').openAllFolds() end, { desc = "Open all fold code" })
map('n', 'zM', function() require('ufo').closeAllFolds() end, { desc = "Close all fold code" })
map('n', 'zr', function() require('ufo').openFoldsExceptKinds() end, { desc = "Open fold except kinds" })
map('n', 'zm', function() require('ufo').closeFoldsWith() end, { desc = "Close specific number fold code" })  -- closeAllFolds == closeFoldsWith(0)
--- NOTE: 'za', 'zc', 'zo' is the native keymaps of Neovim

--- Interface: Nvim-tree
plugin_keymaps.nvimtree_toggle = {
  { "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "File Explorer" } }
}

--- Tool: Telescope builtin
plugin_keymaps.telescope_toggle = {
  { "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" } },
  { "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" } },
  { "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help tags" } },
  { "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Find recent files" } },
  { "<leader>fm", ":Telescope marks<CR>", { desc = "Find marks" } },
  { "<leader>fs", ":Telescope symbols<CR>", { desc = "Find symbols" } },
  { "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find Live grep" } },  -- exchanged by live_grep_args
  { "<leader>fk", ":Telescope keymaps<CR>", { desc = "Find keymaps" } },
  { "<leader>fc", ":Telescope colorscheme<CR>", { desc = "Find colorscheme" } },

  --- Tool: Telescope plugins
  --- telescope-project.nvim and project.nvim are the different plugins
  --- projects.nvim is a all in one plugins for projects managerment,
  --- but telescope-project.nvim is only a extension for telescope to manage projects.
  -- { "<leader>fp", function() require('telescope').extensions.project.project end, { desc = "Project" } },
  -- { "<leader>fp", function() require('telescope').extensions.projects.projects end, { desc = "Find project" } },
  --- Need telescope-live-grep-args
  -- { "<leader>fg", function() require('telescope').extensions.live_grep_args.live_grep_args() end, {  desc = "Find Live grep" } },
  --- Need notify
  { "<leader>fn", function() require('telescope').extensions.notify.notify() end, { desc = "Find notify" } },
  --- Need telescope-dap
  -- { "<leader>fde", function() require('telescope').extensions.dap.commands, { desc = "Commands" } },
  -- { "<leader>fdc", function() require('telescope').extensions.dap.configurations, { desc = "Configurations" } },
  -- { "<leader>fdb", function() require('telescope').extensions.dap.list_breakpoints, { desc = "Breakpoints" } },
  -- { "<leader>fdv", function() require('telescope').extensions.dap.variables, { desc = "Variables" } },
  -- { "<leader>fdf", function() require('telescope').extensions.dap.frames, { desc = "Frames" } },
  --- Need telescope-luasnip
  -- { "<leader>fsp", function() require('telescope').extensions.luasnip.luasnip() end, { desc = "Find snippets" } },
  --- Need telescope-undo.nvim
  -- { "<leader>fu", function() require('telescope').extensions.undo.undo() end, { desc = "Find undo history" } },
}

--- Tool: HOP
map({"n", "v"}, "f", "<Cmd>HopChar1CurrentLineAC<CR>", { desc = "Jump to char after in current line" })
map({"n", "v"}, "F", "<Cmd>HopChar1CurrentLineBC<CR>", { desc = "Jump to char after in current line" })
map({"n", "v", "o"}, "ss", "<Cmd>HopChar1<CR>", { desc = "Jump to char" })
map({"n", "v", "o"}, "sw", "<Cmd>HopWord<CR>", { desc = "Jump to word" })
map({"n", "v", "o"}, "sj", "<Cmd>HopLineStartAC<CR>", { desc = "Jump to line after" })
map({"n", "v", "o"}, "sk", "<Cmd>HopLineStartBC<CR>", { desc = "Jump to line before" })

--- Tool: Spider
map({"n", "o", "x"}, "w", function() require('spider').motion('w') end, { desc = "Spider 'w' move" })
map({"n", "o", "x"}, "e", function() require('spider').motion('e') end, { desc = "Spider 'e' move" })
map({"n", "o", "x"}, "b", function() require('spider').motion('b') end, { desc = "Spider 'b' move" })
map({"n", "o", "x"}, "ge", function() require('spider').motion('ge') end, { desc = "Spider 'ge' move" })

--- Tool: Symbols-Outline
plugin_keymaps.symbolsoutline_toggle = {
  { "<leader>s", "<Cmd>SymbolsOutline<CR>", { desc = "Code Outline" } }
}

--- Tool: Formatter
map("n", "=", function() vim.lsp.buf.format { async = true } end, { desc = "Format code" })
map("n", "=", function() vim.lsp.buf.format { async = true } end, { desc = "Format code" })

--- Tool: Git-Conflict
map('n', '<leader>gco', '<Plug>(git-conflict-ours)', { desc = "Git Conflict Choose Ours" })
map('n', '<leader>gct', '<Plug>(git-conflict-theirs)', { desc = "Git Conflict Choose Theirs" })
map('n', '<leader>gcb', '<Plug>(git-conflict-both)', { desc = "Git Conflict Choose Both" })
map('n', '<leader>gcn', '<Plug>(git-conflict-none)', { desc = "Git Conflict Choose None" })
map('n', '<leader>gcq', '<Cmd>GitConflictListQf<CR>', { desc = "Show Git Conflict Items in Quickfix" })
map('n', '[x', '<Plug>(git-conflict-prev-conflict)', { desc = "Git Conflict Choose Previous One" })
map('n', ']x', '<Plug>(git-conflict-next-conflict)', { desc = "Git Conflict Choose Next One" })

--- Tool: NeoGit
plugin_keymaps.neogit_toggle = {
  { "<leader>gg", "<Cmd>Neogit<CR>", { desc = "Open Neogit" } }
}

--- Tool: Diffview
map("n", "<leader>gdo", "<Cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
map("n", "<leader>gdc", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
map("n", "<leader>gdh", "<Cmd>DiffviewFileHistory<CR>", { desc = "Open History of Diffview" })

--- Tool: Session-Manager
-- map("n", "<leader>wl", "<cmd>SessionManager load_last_session<CR>", { desc = "Load last session" })
map("n", "<leader>wd", "<Cmd>SessionManager delete_session<CR>", { desc = "Delete session" })
map("n", "<leader>wl", "<Cmd>SessionManager load_session<CR>", { desc = "Load selected session" })
map("n", "<leader>ws", "<Cmd>SessionManager save_current_session<CR>", { desc = "Save current session" })
map("n", "<leader>ww", "<Cmd>SessionManager load_current_dir_session<CR>", { desc = "Load current session" })

--- Tool: Tmux
map({'n', 't'}, "<C-Left>", function() require('tmux').move_left() end, { desc = "Move to left panel" })
map({'n', 't'}, "<C-Right>", function() require('tmux').move_right() end, { desc = "Move to right panel" })
map({'n', 't'}, "<C-Up>", function() require('tmux').move_top() end, { desc = "Move to up panel" })
map({'n', 't'}, "<C-Down>", function() require('tmux').move_bottom() end, { desc = "Move to down panel" })

--- Tool: Package-Info
map("n", "<localleader>s", function() require('package_info').show() end, { desc = "Show package versions" })
map("n", "<localleader>c", function() require('package_info').hide() end, { desc = "Hide package versions" })
map("n", "<localleader>u", function() require('package_info').update() end, { desc = "Update package on line" })
map("n", "<localleader>d", function() require('package_info').delete() end, { desc = "Delete package on line" })
map("n", "<localleader>i", function() require('package_info').install() end, { desc = "Install a new package" })
map("n", "<localleader>p", function() require('package_info').change_version() end, { desc = "Install a different package version" })

--- Debug: DAP
map("n", "<leader>dc", function() require('dap').continue() end, { desc = "Debug: Continue" })
map("n", "<leader>dn", function() require('dap').step_over() end, { desc = "Debug: Step over" })
map("n", "<leader>ds", function() require('dap').step_into() end, { desc = "Debug: Step into" })
map("n", "<leader>df", function() require('dap').step_out() end, { desc = "Debug: Step out" })
map("n", "<leader>db", function() require('dap').toggle_breakpoint() end, { desc = "Debug: Toggle breakpoint" })
map("n", "<leader>dr", function() require('dap').repl.toggle() end, { desc = "Deubg: Toggle REPL" })
map("n", "<leader>dl", function() require('dap').run_last() end, { desc = "Deubg: Run last" })

map("n", "<leader>dp", function()
  require('dap').set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Deubg: Set breakpoint" })
map("n", "<leader>di", function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Deubg: Set log point" })

--- Debug DAP-UI
map("n", "<leader>du", function() require('dap-ui').toggle() end, { desc = "Toggle Deubg UI" })


--- ---------------------
---    Plugin handlers
--- ---------------------

--- Core: LSP Mappings
--- See `:help vim.lsp.*` for documentation on any of the below functions
plugin_keymaps.lsp = function(bufnr)
  map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto definition" })
  map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Goto declaration" })
  map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Goto implementation" })
  map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Goto references" })
  map("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Goto type definition" })

  map("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })

  map("n", "<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end, { buffer = bufnr, desc = "Format document" })

  map("n", "<leader>lk", function()
    local ufo = require_plugin("ufo")
    if ufo then
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    else
      vim.lsp.buf.hover()
    end
  end, { buffer = bufnr, desc = "Type hover" })

  map("n", "]l", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Diagnostic" })
  map("n", "[l", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Diagnostic" })

  map("n", "<leader>ln", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
  map("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
  map("n", "<leader>ll", vim.diagnostic.setloclist, { buffer = bufnr, desc = "Diagnostic list" })
  map("n", "<leader>ld", vim.diagnostic.open_float, { buffer = bufnr, desc = "Diagnostic float" })
  map("n", "<leader>lq", ":lclose<cr>", { silent = true, desc = "Close Diagnostic list" })

  map( "n", "<leader>lwa", vim.lsp.buf.add_workspace_folder,
    { buffer = bufnr, desc = "Add workspace folder" })
  map( "n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, desc = "Remove workspace folder" })
  map("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = "List workspace folders" })

  --- clangd special keymaps
  map( "n", "<leader>a", "<cmd>ClangdSwitchSourceHeader<CR>",
    { buffer = bufnr, desc = "Switch between source and header" })
end

--- Tool: GitSigns
plugin_keymaps.gitsigns = function(bufnr)
  local api = require("gitsigns")
  -- Navigation
  map("n", "[g", function() api.prev_hunk() end, { buffer = bufnr, desc = "Previous Git hunk" })
  map("n", "]g", function() api.next_hunk() end, { buffer = bufnr, desc = "Next Git hunk" })

  -- Actions
  map({"n", "v"}, "<leader>gs", function() api.stage_hunk() end, { buffer = bufnr, desc = "Stage hunk" })
  map({"n", "v"}, "<leader>gr", function() api.reset_hunk() end, { buffer = bufnr, desc = "Reset hunk" })
  map("n", "<leader>gu", function() api.undo_stage_hunk() end, { buffer = bufnr, desc = "Undo stage hunk" })
  map("n", "<leader>gS", function() api.stage_buffer() end, { buffer = bufnr, desc = "Stage buffer" })
  map("n", "<leader>gR", function() api.reset_buffer() end, { buffer = bufnr, desc = "Reset buffer" })

  -- Review
  map("n", "<leader>gk", function() api.preview_hunk() end, { buffer = bufnr, desc = "Preview hunk" })
  map("n", "<leader>gb", function() api.toggle_current_line_blame() end, { buffer = bufnr, desc = "Toggle blame line" })
  map("n", "<leader>gB", function()
    api.blame_line { full = true }
  end, { buffer = bufnr, desc = "Blame line" })
end

--- Tool: Nvim-tree
plugin_keymaps.nvimtree = function(bufnr)

  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  map('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  map('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  map('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  map('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  map('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  map('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  map('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  map('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  map('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  map('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  map('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  map('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  map('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  map('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  map('n', 'a',     api.fs.create,                         opts('Create'))
  map('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  map('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  map('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  map('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  map('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  map('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  map('n', 'd',     api.fs.remove,                         opts('Delete'))
  map('n', 'D',     api.fs.trash,                          opts('Trash'))
  map('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  map('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  map('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  map('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  map('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  map('n', 'f',     api.live_filter.start,                 opts('Filter'))
  map('n', '?',    api.tree.toggle_help,                  opts('Help'))
  map('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  map('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  map('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  map('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  map('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  map('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  map('n', 'o',     api.node.open.edit,                    opts('Open'))
  map('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  map('n', 'p',     api.fs.paste,                          opts('Paste'))
  map('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  map('n', 'q',     api.tree.close,                        opts('Close'))
  map('n', 'r',     api.fs.rename,                         opts('Rename'))
  map('n', 'R',     api.tree.reload,                       opts('Refresh'))
  map('n', 's',     api.node.run.system,                   opts('Run System'))
  map('n', 'S',     api.tree.search_node,                  opts('Search'))
  map('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  map('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  map('n', 'x',     api.fs.cut,                            opts('Cut'))
  map('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  map('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  map('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  map('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
end

--- Keymaps of those plugins are setting at the specific configure file
--- TODO: move those config at here
--- - lua/core/treesitter.lua
--- - lua/edit/cmp.lua
--- - lua/edit/comment.lua
--- - lua/interface/dressing.lua

return plugin_keymaps

--- -------------------
---    WhichKey view
--- -------------------

-- TODO: config in lua/interface/which-key.lua
