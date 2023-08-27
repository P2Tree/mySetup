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
    ["<PageUp>"] = { "<C-u>", desc = "Screen half step up scroll" },
    ["<PageDown>"] = { "<C-d>", desc = "Screen half step down scroll" },
    -- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
    -- search word under cursor
    ["*"] = { "*N" },
    -- open quickfix window
    ["<leader>uq"] = { "<Cmd> copen <CR>", desc = "Open Quickfix list" },
    -- open Lazy plugin manager
    -- exchange lines position
    ["<Alt-j>"] = { "<Cmd> m .+1<CR>==" },
    ["<Alt-k>"] = { "<Cmd> m .-2<CR>==" },
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
    ["K"] = false, -- This will not exactly close lsp hover, needs to delete in lsp.lua

    --- Buffer Line ---
    ["<tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>bx"] = {
      function() require("astronvim.utils.buffer").close() end,
      desc = "Close buffer",
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

    --- Terminal ---
    --

    --- LSP ---
    -- hover symbol details
    ["<leader>lk"] = {
      function() vim.lsp.buf.hover() end,
      desc = "Hover symbol details",
    },
    --- Telescope ---
    --

    --- Comment ---
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>c"] = { name = "Comment" },

    --- GitSigns ---
    --

    --- Flash ---
    --

    --- Aerial ---
    --
  },
  t = {
    ["<esc>"] = { "<Cmd> ToggleTerm <CR>", desc = "Toggle terminal" },
  },
}
