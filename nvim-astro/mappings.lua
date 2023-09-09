-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  n = {
    --- Basic ---
    -- clear highlights
    ["<Esc>"] = { "<Cmd> noh <CR>", desc = "Clear highlights" },
    -- joint two lines together
    ["T"] = { "J", desc = "Joint two lines together" },
    -- jump to head or tail of the line
    ["H"] = { "^", desc = "Jump to the head of the line" },
    ["L"] = { "$", desc = "Jump to the tail of the line" },
    -- screen tiny step up or down scroll
    ["K"] = { "<C-y>", desc = "Screen tiny step up scroll" },
    ["J"] = { "<C-e>", desc = "Screen tiny step down scroll" },
    -- screen half step up and down scroll
    ["<PageUp>"] = { "<C-u>", desc = "Screen half step up scroll", remap = true },
    ["<PageDown>"] = { "<C-d>", desc = "Screen half step down scroll", remap = true },
    -- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
    -- search word under cursor without jump to next one
    ["*"] = { "<Cmd> keepjumps normal! mi*`i <CR>" },
    -- open quickfix window
    ["<leader>oq"] = { "<Cmd> copen <CR>", desc = "Open Quickfix list" },
    ["<leader>ol"] = { "<Cmd> Lazy <CR>", desc = "Open Lazy plugin manager" },
    ["<leader>om"] = { "<Cmd> Mason <CR>", desc = "Open Mason tool manager" },
    -- delete not cut
    ["<leader>x"] = { '"_x', desc = "Delete and not move to register" },
    ["<leader>X"] = { '"_X', desc = "Delete and not move to register" },
    ["<leader>d"] = { '"_d', desc = "Delete and not move to register" },
    ["<leader>D"] = { '"_D', desc = "Delete and not move to register" },
    -- vertical split window
    ["\\"] = { "<Cmd> vsplit <CR>", desc = "Vertical split window" },
    ["-"] = { "<Cmd> split <CR>", desc = "Horizontal split window" },

    ["<leader>w"] = false, -- Close: normal save
    ["|"] = false, -- Close: vertical split
    -- ["K"] = false, -- This will not exactly close lsp hover, delete in user/init.lua

    --- Buffer Line ---
    ["<tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>bn"] = { "<Cmd> tabnew <CR>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Close a selected buffer from tabline",
    },
    ["<leader>bd"] = {
      function() require("astronvim.utils.buffer").close() end,
      desc = "Close current buffer",
    },
    ["<leader>b\\"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(function(bufnr)
          vim.cmd.vsplit()
          vim.api.nvim_win_set_buf(0, bufnr)
        end)
      end,
      desc = "Vertical split buffer from tabline",
    },
    ["<leader>b-"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(function(bufnr)
          vim.cmd.split()
          vim.api.nvim_win_set_buf(0, bufnr)
        end)
      end,
      desc = "Horizontal split buffer from tabline",
    },

    ["<leader>c"] = false, -- Close: close buffer
    ["<leader>C"] = false, -- Close: force close buffer
    ["<leader>b|"] = false, -- Close: vertical split buffer from tabline

    --- Neo-Tree ---
    ["<leader>o"] = false, -- Close: toggle neo-tree

    --- Terminal ---
    --

    --- LSP ---
    ["<leader>lk"] = {
      function() vim.lsp.buf.hover() end,
      desc = "Hover symbol details",
    },
    ["<leader>lc"] = {
      "<Cmd> ClangdSwitchSourceHeader <CR>",
      desc = "Switch between source and header file",
    },
    ["="] = {
      function() vim.lsp.buf.format { async = true } end,
      desc = "LSP formatting buffer",
    },
    --- Telescope ---
    --

    --- Comment ---
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>c"] = { name = "Comment" },

    --- GitConflict ---
    ["<leader>gwo"] = { "<Plug>(git-conflict-ours)", desc = "Git conflict choose ours" },
    ["<leader>gwt"] = { "<Plug>(git-conflict-theirs)", desc = "Git conflict choose theirs" },
    ["<leader>gwb"] = { "<Plug>(git-conflict-both)", desc = "Git conflict choose both" },
    ["<leader>gwn"] = { "<Plug>(git-conflict-none)", desc = "Git conflict choose none" },
    ["<leader>gww"] = { "<Cmd> GitConflictListQf <CR>", desc = "List git conflict iterms" },
    ["[x"] = { "<Plug>(git-conflict-prev-conflict)", desc = "Jump to previous git conflict" },
    ["]x"] = { "<Plug>(git-conflict-next-conflict)", desc = "Jump to next git conflict" },

    --- Flash ---
    ["s"] = { function() require("flash").jump() end, desc = "Flash move" },
    ["S"] = { function() require("flash").treesitter() end, desc = "Flash treesitter move" },

    --- Notify ---
    ["<leader>ux"] = { function() require("notify").dismiss() end, desc = "Clean notify messages" },

    --- Note Page ---
    ["<leader>on"] = { function() require("user.tips").open_notes() end, desc = "Open my note page" },
    ["<leader>ot"] = { function() require("user.tips").toggle() end, desc = "Toggle a tip" },
  },
  v = {
    -- jump to head or tail of the line
    ["H"] = { "^", desc = "Jump to the head of the line" },
    ["L"] = { "$", desc = "Jump to the tail of the line" },
    -- screen tiny step up or down scroll
    ["K"] = { "<C-y>", desc = "Screen tiny step up scroll" },
    ["J"] = { "<C-e>", desc = "Screen tiny step down scroll" },
    -- screen half step up and down scroll
    ["<PageUp>"] = { "<C-u>", desc = "Screen half step up scroll", remap = true },
    ["<PageDown>"] = { "<C-d>", desc = "Screen half step down scroll", remap = true },
    -- still in visual mode after indent
    [">"] = { ">gv" },
    ["<"] = { "<gv" },
    -- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
    -- paste over currently selected text without yanking it
    ["p"] = { "_dP" },
    -- delete not cut
    ["<leader>x"] = { '"_x', desc = "Delete and not move to register" },
    ["<leader>X"] = { '"_X', desc = "Delete and not move to register" },
    ["<leader>d"] = { '"_d', desc = "Delete and not move to register" },
    ["<leader>D"] = { '"_D', desc = "Delete and not move to register" },

    --- LSP ---
    ["="] = {
      function() vim.lsp.buf.format { async = true } end,
      desc = "LSP formatting",
    },

    --- Flash ---
    ["s"] = { function() require("flash").jump() end, desc = "Flash move" },
    ["S"] = { function() require("flash").treesitter() end, desc = "Flash treesitter move" },
  },
  i = {
    -- add undo break-points
    [","] = { ",<C-g>u" },
    ["."] = { ".<C-g>u" },
    [";"] = { ";<C-g>u" },
    -- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
  },
  t = {
    ["<Esc>"] = { "<Cmd> ToggleTerm <CR>", desc = "Toggle terminal" },
  },
}
