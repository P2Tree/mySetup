local map = vim.keymap.set

--- ------------
---   Outline
--- - `'n` to Normal Keymaps
--- - `'k` to Plugin Keymaps
--- - `'h` to Plugin Handler Keymaps
--- ------------

--- --------------------
---    Normal Keymaps
--- --------------------

--- Select up or down in insert mode
map("c", "<C-p>", "<Up>", { desc = "Select up in insert mode" })
map("c", "<C-n>", "<Down>", { desc = "Select down in insert mode" })

--- Joint two lines together
map("n", "T", "J", { desc = "Joint two lines together (same as origin `J`)" })

--- Jump to head or tail of the line
map("n", "H", "^", { desc = "Jump to the head of the line (same as `^`)" })
map("n", "L", "$", { desc = "Jump to the tail of the line (same as `$`)" })

--- Screen tiny step up or down scroll
map("n", "K", "<C-y>", { remap = true, desc = "Screen tiny step up scroll" })
map("n", "J", "<C-e>", { remap = true, desc = "Screen tiny step down scroll" })

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

--- Quit window or buffer
map("n", "q", function()
  vim.cmd "windo redraw!"
  if #vim.fn.getbufinfo { buflisted = 1 } == 1 then
    vim.cmd "q"
  elseif #vim.fn.getwininfo() ~= 1 then
    vim.cmd "close!"
  else
    vim.cmd "bp | bd #"
  end
end, { silent = true, desc = "Close buffer or exit neovim" })

--- Record mode
map("n", "Q", "q", { desc = "Record mode (same as origin `q`)" })

--- Tab indent
map("v", "<Tab>", ">gv", { desc = "Text increase indent" })
map("v", ">>", ">gv", { desc = "Text increase indent" })
map("v", "<S-Tab>", "<gv", { desc = "Text descrease indent" })
map("v", "<<", "<gv", { desc = "Text descrease indent" })

--- Disable search highlight
map("n", "<Leader><CR>", ":nohl<CR>", { desc = "Disable search highlight" })

--- Copy to system clipboard
map({ "n", "v" }, "Y", '"+y', { desc = "Copy to system clipboard" })

--- Refresh Neovim configure
map("n", "<Leader>r", ":source $MYVIMRC<CR>", { desc = "Refresh Neovim configure" })

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
map("n", "<M-1>", "<Cmd>lua require(\"bufferline\").go_to_buffer(1, true)<CR>", { desc = "Go to buffer 1" })
map("n", "<M-2>", "<Cmd>lua require(\"bufferline\").go_to_buffer(2, true)<CR>", { desc = "Go to buffer 2" })
map("n", "<M-3>", "<Cmd>lua require(\"bufferline\").go_to_buffer(3, true)<CR>", { desc = "Go to buffer 3" })
map("n", "<M-4>", "<Cmd>lua require(\"bufferline\").go_to_buffer(4, true)<CR>", { desc = "Go to buffer 4" })
map("n", "<M-5>", "<Cmd>lua require(\"bufferline\").go_to_buffer(5, true)<CR>", { desc = "Go to buffer 5" })
map("n", "<M-6>", "<Cmd>lua require(\"bufferline\").go_to_buffer(6, true)<CR>", { desc = "Go to buffer 6" })
map("n", "<M-7>", "<Cmd>lua require(\"bufferline\").go_to_buffer(7, true)<CR>", { desc = "Go to buffer 7" })
map("n", "<M-8>", "<Cmd>lua require(\"bufferline\").go_to_buffer(8, true)<CR>", { desc = "Go to buffer 8" })
map("n", "<M-9>", "<Cmd>lua require(\"bufferline\").go_to_buffer(9, true)<CR>", { desc = "Go to buffer 9" })
map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Pin Buffer" })
map("n", "<leader>bk", "<cmd>BufferLinePick<CR>", { desc = "Pick Buffer" })
map("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Close Buffer" })
map("n", "<leader>bs", "<cmd>BufferLineSortByDirectory<CR>", { desc = "Sort Buffer by directory" })
-- map("n", "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", { desc = "Sort Buffer by extension" })
-- map("n", "<leader>bst", "<cmd>BufferLineSortByTabs<CR>", { desc = "Sort Buffer by tabs" })

--- Interface: Illuminate
local illuminate = require_plugin("illuminate")
if illuminate then
  map("n", "<M-n>", illuminate.goto_next_reference, { desc = "Next reference" })
  map("n", "<M-p>", illuminate.goto_prev_reference, { desc = "Previous reference" })
end

--- Interface: Ufo
local ufo = require_plugin("ufo")
if ufo then
  map('n', 'zR', ufo.openAllFolds, { desc = "Open all fold code" })
  map('n', 'zM', ufo.closeAllFolds, { desc = "Close all fold code" })
  map('n', 'zr', ufo.openFoldsExceptKinds, { desc = "Open fold except kinds" })
  map('n', 'zm', ufo.closeFoldsWith, { desc = "Close specific number fold code" })  -- closeAllFolds == closeFoldsWith(0)
  --- NOTE: 'za', 'zc', 'zo' is the native keymaps of Neovim
end

--- Nvim-tree
map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "File Explorer" })

--- Tool: Telescope builtin
local telescope_builtin = require_plugin("telescope.builtin")
if telescope_builtin then
  map("n", "<leader>ff", telescope_builtin.find_files, { desc = "Find files" })
  map("n", "<leader>fb", telescope_builtin.buffers, { desc = "Find buffers" })
  map("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Find help tags" })
  map("n", "<leader>fo", telescope_builtin.oldfiles, { desc = "Find old files" })
  map("n", "<leader>fm", telescope_builtin.marks, { desc = "Find marks" })
  map("n", "<leader>fs", telescope_builtin.symbols, { desc = "Find symbols" })
  -- map("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Find Live grep" })  -- exchanged by live_grep_args
end

--- Tool: Telescope plugins
local telescope_plugins = require_plugin("telescope")
if telescope_plugins then
  --- telescope-project.nvim and project.nvim are the different plugins
  --- projects.nvim is a all in one plugins for projects managerment,
  --- but telescope-project.nvim is only a extension for telescope to manage projects.
  -- map("n", "<leader>fp", telescope.extensions.project.project, { desc = "Project" })
  -- map("n", "<leader>fp", telescope.extensions.projects.projects, { desc = "Find project" })

  --- Need telescope-live-grep-args
  map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {  desc = "Find Live grep" })

  --- Need notify
  map("n", "<leader>fn", telescope_plugins.extensions.notify.notify, { desc = "Find notify" })

  --- Need telescope-dap
  -- map("n", "<leader>fde", telescope_plugins.extensions.dap.commands, { desc = "Commands" })
  -- map("n", "<leader>fdc", telescope_plugins.extensions.dap.configurations, { desc = "Configurations" })
  -- map("n", "<leader>fdb", telescope_plugins.extensions.dap.list_breakpoints, { desc = "Breakpoints" })
  -- map("n", "<leader>fdv", telescope_plugins.extensions.dap.variables, { desc = "Variables" })
  -- map("n", "<leader>fdf", telescope_plugins.extensions.dap.frames, { desc = "Frames" })

  --- Need telescope-luasnip
  map("n", "<leader>fc", telescope_plugins.extensions.luasnip.luasnip, { desc = "Find snippets" })

  --- Need telescope-undo.nvim
  -- map("n", "<leader>fu", telescope_plugins.extensions.undo.undo, { desc = "Find undo history" })
end

--- Tool: HOP
map({ "n", "v" }, "f", "<Cmd>HopChar1CurrentLineAC<CR>", { desc = "Jump to char after in current line" })
map({ "n", "v" }, "F", "<Cmd>HopChar1CurrentLineBC<CR>", { desc = "Jump to char after in current line" })
map({ "n", "v", "o" }, "ss", "<Cmd>HopChar1<CR>", { desc = "Jump to char" })
map({ "n", "v", "o" }, "sw", "<Cmd>HopWord<CR>", { desc = "Jump to word" })
map({ "n", "v", "o" }, "sj", "<Cmd>HopLineStartAC<CR>", { desc = "Jump to line after" })
map({ "n", "v", "o" }, "sk", "<Cmd>HopLineStartBC<CR>", { desc = "Jump to line before" })

--- Tool: Symbols-Outline
map("n", "<leader>s", "<Cmd>SymbolsOutline<CR>", { desc = "Code Outline" })

--- Tool: Git-Conflict
map('n', '<leader>gco', '<Plug>(git-conflict-ours)', { desc = "Git Conflict Choose Ours" })
map('n', '<leader>gct', '<Plug>(git-conflict-theirs)', { desc = "Git Conflict Choose Theirs" })
map('n', '<leader>gcb', '<Plug>(git-conflict-both)', { desc = "Git Conflict Choose Both" })
map('n', '<leader>gcn', '<Plug>(git-conflict-none)', { desc = "Git Conflict Choose None" })
map('n', '<leader>gcq', '<Cmd>GitConflictListQf<CR>', { desc = "Show Git Conflict Items in Quickfix" })
map('n', '[x', '<Plug>(git-conflict-prev-conflict)', { desc = "Git Conflict Choose Previous One" })
map('n', ']x', '<Plug>(git-conflict-next-conflict)', { desc = "Git Conflict Choose Next One" })

--- Tool: NeoGit
map("n", "<leader>gg", "<Cmd>Neogit<CR>", { desc = "Open Neogit" })

--- Tool: Diffview
map("n", "<leader>gdo", "<Cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
map("n", "<leader>gdc", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
map("n", "<leader>gdh", "<Cmd>DiffviewFileHistory<CR>", { desc = "Open History of Diffview" })

--- Tool: Session-Manager
-- map("n", "<leader>wl", "<cmd>SessionManager load_last_session<CR>", { desc = "Load last session" })
map("n", "<leader>wd", "<cmd>SessionManager delete_session<CR>", { desc = "Delete session" })
map("n", "<leader>wl", "<cmd>SessionManager load_session<CR>", { desc = "Load selected session" })
map("n", "<leader>ws", "<cmd>SessionManager save_current_session<CR>", { desc = "Save current session" })
map("n", "<leader>ww", "<cmd>SessionManager load_current_dir_session<CR>", { desc = "Load current session" })

--- Tool: Tmux
local tmux = require_plugin("tmux")
if tmux then
  map({'n', 't'}, "<C-Left>", function() tmux.move_left() end, { desc = "Move to left panel" })
  map({'n', 't'}, "<C-Right>", function() tmux.move_right() end, { desc = "Move to right panel" })
  map({'n', 't'}, "<C-Up>", function() tmux.move_top() end, { desc = "Move to up panel" })
  map({'n', 't'}, "<C-Down>", function() tmux.move_bottom() end, { desc = "Move to down panel" })
end

--- Tool: Package-Info
local package_info = require_plugin("package-info")
if package_info then
  map("n", "<localleader>s", package_info.show, { desc = "Show package versions" })
  map("n", "<localleader>c", package_info.hide, { desc = "Hide package versions" })
  map("n", "<localleader>u", package_info.update, { desc = "Update package on line" })
  map("n", "<localleader>d", package_info.delete, { desc = "Delete package on line" })
  map("n", "<localleader>i", package_info.install, { desc = "Install a new package" })
  map("n", "<localleader>p", package_info.change_version, { desc = "Install a different package version" })
end

--- Debug: DAP
local dap = require_plugin("dap")
if dap then
  map("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
  map("n", "<leader>dn", dap.step_over, { desc = "Debug: Step over" })
  map("n", "<leader>ds", dap.step_into, { desc = "Debug: Step into" })
  map("n", "<leader>df", dap.step_out, { desc = "Debug: Step out" })
  map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
  map("n", "<leader>dr", dap.repl.toggle, { desc = "Deubg: Toggle REPL" })
  map("n", "<leader>dl", dap.run_last, { desc = "Deubg: Run last" })

  map("n", "<leader>dp", function()
    dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
  end, { desc = "Deubg: Set breakpoint" })
  map("n", "<leader>di", function()
    dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
  end, { desc = "Deubg: Set log point" })
end

--- Debug DAP-UI
local dapui = require_plugin("dapui")
if dapui then
  map("n", "<leader>du", dapui.toggle, { desc = "Toggle Deubg UI" })
end


--- ---------------------
---    Plugin handlers
--- ---------------------
local plugin_keymaps = {}

--- Core: LSP Mappings
--- See `:help vim.lsp.*` for documentation on any of the below functions
plugin_keymaps.lsp = function(bufnr)
  map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Definition" })
  map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaration" })
  map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
  map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })
  map("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type definition" })

  map("n", "gk", function()
   local ufo = require_plugin("ufo")
   if ufo then
     local winid = ufo.peekFoldedLinesUnderCursor()
     if not winid then
        vim.lsp.buf.hover()
     end
   else
     vim.lsp.buf.hover()
   end
  end, { buffer = bufnr, desc = "LSP: Hover" })
  map("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })

  map("n", "<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end, { buffer = bufnr, desc = "Format document" })

  map("n", "]g", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Diagnostic" })
  map("n", "[g", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Diagnostic" })

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
local gitsigns = require_plugin("gitsigns")
if gitsigns then
  plugin_keymaps.gitsigns = function(bufnr)
    -- Navigation
    map("n", "[g", gitsigns.prev_hunk, { buffer = bufnr, desc = "Previous Git hunk" })
    map("n", "]g", gitsigns.next_hunk, { buffer = bufnr, desc = "Next Git hunk" })

    -- Actions
    map({ "n", "v" }, "<leader>gs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
    map({ "n", "v" }, "<leader>gr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
    map("n", "<leader>gu", gitsigns.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
    map("n", "<leader>gS", gitsigns.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
    map("n", "<leader>gR", gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })

    -- Review
    map("n", "<leader>gk", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
    map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame line" })
    map("n", "<leader>gB", function()
      gitsigns.blame_line { full = true }
    end, { buffer = bufnr, desc = "Blame line" })
  end
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
