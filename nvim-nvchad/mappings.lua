---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    --- disable normal mappings
    ["<leader>b"] = "",   -- use `:e`
    ["<leader>n"] = "",   -- use `<leader>tn`
    ["<leader>rn"] = "",  -- use `<leader>tn`
    ["<leader>ch"] = "",  -- use `<leader>oc`
    ["<leader>fm"] = "",  -- use `=`

    --- disable lspconfig mappings
    ["K"] = "",           -- use `<leader>lk`
    ["<leader>D"] = "",   -- use `gt`
    ["<leader>ra"] = "",  -- use `<leader>ln`
    ["<leader>ca"] = "",  -- use `<leader>la`
    ["<leader>f"] = "",   -- use `<leader>ld`
    ["<leader>q"] = "",   -- use `<leader>lq`

    --- disable nvimtree mappings
    ["<C-n>"] = "",       -- use `<leader>e`
    ["<leader>e"] = "",   -- use `<leader>e`

    --- disable telescope mappings
    ["<leader>cm"] = "",  -- use `<leader>fgc`
    ["<leader>gt"] = "",  -- use `<leader>fgt`
    ["<leader>pt"] = "",  -- use `<leader>ft`
    ["<leader>th"] = "",  -- use `<leader>fc`
    ["<leader>ma"] = "",  -- use `<leader>fm`

    --- disable nvterm mappings
    ["<leader>h"] = "",   -- use `<leader>th`
    ["<leader>v"] = "",   -- use `<leader>tv`

    --- disable whichkey
    ["<leader>wK"] = "",  -- no key mapping
    ["<leader>wk"] = "",  -- no key mapping

    --- disable blankline
    ["<leader>cc"] = "",

    --- disable gitsigns
    ["<leader>rh"] = "",  -- use `<leader>gr`
    ["<leader>ph"] = "",  -- use `<leader>gk`
    ["<leader>td"] = "",  -- use `<leader>gx`
  }
}

M.general = {
  n = {
    --- joint two lines together
    ["T"] = { "J", "Joint two lines together" },
    --- jump to head or tail of the line
    ["H"] = { "^", "Jump to the head of the line"},
    ["L"] = { "$", "Jump to the tail of the line"},
    --- screen tiny step up or down scroll
    ["K"] = { "<C-y>", "Screen tiny step up scroll", opts = { remap = true }},
    ["J"] = { "<C-e>", "Screen tiny step down scroll", opts = { remap = true }},
    --- screen half step up and down scroll
    ["<PageUp>"] = { "<C-u>", "Screen half step up scroll", opts = { remap = true }},
    ["<PageDown>"] = { "<C-d>", "Screen half step down scroll", opts = { remap = true }},
    --- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
    --- search word under cursor
    ["*"] = { "*N", opts = { remap = true }},
    --- window split
    ["<leader>-"] = { "<C-w>s", "Split window horizontal" },
    ["<leader>\\"] = { "<C-w>v", "Split window vertical" },
    --- switch previous buffer
    ["<leader>bb"] = { "<Cmd> e # <CR>", "Switch to previous buffer", opts = { silent = true }},
    --- open quickfix window
    ["<leader>oq"] = { "<Cmd> copen <CR>", "Open Quickfix list", opts = { silent = true }},
    --- open cheat shell
    ["<leader>oc"] = { "<Cmd> NvCheatsheet <CR>", "Open CheatSheet", opts = { silent = true }},
    --- open Lazy plugin manager
    ["<leader>ol"] = { "<Cmd> Lazy <CR>", "Open plugin manager", opts = { silent = true }},
    --- open Mason tool manager
    ["<leader>om"] = { "<Cmd> Mason <CR>", "Open tool manager", opts = { silent = true }},
  },
  v = {
    --- jump to head or tail of the line
    ["H"] = { "^", "Jump to the head of the line"},
    ["L"] = { "$", "Jump to the tail of the line"},
    --- screen tiny step up or down scroll
    ["K"] = { "<C-y>", "Screen tiny step up scroll", opts = { remap = true }},
    ["J"] = { "<C-e>", "Screen tiny step down scroll", opts = { remap = true }},
    --- screen half step up and down scroll
    ["<PageUp>"] = { "<C-u>", "Screen half step up scroll", opts = { remap = true }},
    ["<PageDown>"] = { "<C-d>", "Screen half step down scroll", opts = { remap = true }},
    --- better indent
    [">"] = { ">gv", opts = { silent = true }},
    ["<"] = { "<gv", opts = { silent = true }},
    --- copy to system clipboard
    ["Y"] = { '"+y', "Copy to system clipboard" },
    --- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
  },
  i = {
    --- Add undo break-points
    [","] = { ",<C-g>u" },
    ["."] = { ".<C-g>u" },
    [";"] = { ";<C-g>u" },
    --- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
  }
}

M.lspconfig = {
  plugin = true,
  n = {
    ["gt"] = { function() vim.lsp.buf.type_definition() end,
                "LSP definition type", },
    ["<leader>lk"] = { function() vim.lsp.buf.hover() end,
                        "LSP hover", },
    ["<leader>ln"] = { function() require("nvchad_ui.renamer").open() end,
                        "LSP rename", },
    ["<leader>la"] = { function() vim.lsp.buf.code_action() end,
                        "LSP code action", },
    ["<leader>ld"] = { function() vim.diagnostic.open_float { border = "rounded" } end,
                        "LSP diagnostic floating", },
    ["<leader>lq"] = { function() vim.diagnostic.setloclist() end,
                        "LSP diagnostic loclist", },
    ["="] = { function() vim.lsp.buf.format { async = true } end,
                        "LSP formatting", },
  },
  v = {
    ["="] = { function() vim.lsp.buf.format { async = true } end,
                        "LSP formatting", },
  }
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<Cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  }
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>ft"] = { "<Cmd> Telescope terms <CR>", "Pick hidden termnial" },
    ["<leader>fc"] = { "<Cmd> Telescope themes <CR>", "Change themes" },
    ["<leader>fm"] = { "<Cmd> Telescope marks <CR>", "Find bookmarks" },
    ["<leader>fn"] = { function() require("telescope").extensions.notify.notify() end,
                       "List notify items" },
    ["<leader>fgc"] = { "<Cmd> Telescope git_commits <CR>", "Show git commits" },
    ["<leader>fgt"] = { "<Cmd> Telescope git_status <CR>", "Show git status" },
  }
}

M.nvterm = {
  plugin = true,
  n = {
    ["<leader>th"] = { function() require("nvterm.terminal").new "horizontal" end,
                       "New horizontal termianl" },
    ["<leader>tv"] = { function() require("nvterm.terminal").new "vertical" end,
                       "New vertical terminal" },
  }
}

M.gitsigns = {
  plugin = true,
  n = {
    ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end,
                       "Git reset hunk" },
    ["<leader>gk"] = { function() require("gitsigns").preview_hunk() end,
                       "Git preview hunk" },
    ["<leader>gx"] = { function() require("gitsigns").toggle_deleted() end,
                       "Git toggle deleted "},
  }
}

M.interface = {
  n = {
    --- toggle line number
    ["<leader>tn"] = { "<Cmd> lua require('ui').change_number() <CR>",
                       "Change the line number display modes" },
    ["<leader>tp"] = { function() require("base46").toggle_transparency() end,
                       "Toggle transparency" },
  }
}

-- tabbufline mappings
local tabbufline_n = {}
for i = 1, 9, 1 do
  tabbufline_n[string.format("<leader>b%s", i)] = {
    function() vim.api.nvim_set_current_buf(vim.t.bufs[i]) end,
    string.format("Switch to buffer %s", i) }
end
tabbufline_n["<leader>b>"] = {
  function() require("nvchad_ui.tabufline").move_buf(1) end,
  "Move buffer to right" }
tabbufline_n["<leader>b<"] = {
  function() require("nvchad_ui.tabufline").move_buf(-1) end,
  "Move buffer to left" }

M.tabbufline = { n = tabbufline_n }

return M
