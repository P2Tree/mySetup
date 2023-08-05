---@type MappingsTable
local M = {}

M.general = {
  n = {
    --- exit Neovim
    ["Q"] = { "<Cmd> qa <CR>", "Exit Neovim" },
    --- clear highlights
    ["<Esc>"] = { "<Cmd> noh <CR>", "Clear highlights" },
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
    ["<leader>bb"] = { "<Cmd> e # <CR>", "Switch to previous buffer" },
    --- open quickfix window
    ["<leader>oq"] = { "<Cmd> copen <CR>", "Open Quickfix list" },
    --- open cheat shell
    ["<leader>oc"] = { "<Cmd> NvCheatsheet <CR>", "Open CheatSheet" },
    --- open Lazy plugin manager
    ["<leader>ol"] = { "<Cmd> Lazy <CR>", "Open plugin manager" },
    --- open Mason tool manager
    ["<leader>om"] = { "<Cmd> Mason <CR>", "Open tool manager" },
    --- exchange lines position
    ["<M-j>"] = { "<Cmd> m .+1<CR>==" },
    ["<M-k>"] = { "<Cmd> m .-2<CR>==" },
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
    [">"] = { ">gv" },
    ["<"] = { "<gv" },
    --- copy to system clipboard
    ["Y"] = { '"+y', "Copy to system clipboard" },
    --- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
    --- paste over currently selected text without yanking it
    ["p"] = { "_dP" },
    --- exchange lines position
    ["<M-j>"] = { "<Cmd> m '>+1<CR>gv=gv" },
    ["<M-k>"] = { "<Cmd> m '<+2<CR>gv=gv" },
  },
  i = {
    --- Add undo break-points
    [","] = { ",<C-g>u" },
    ["."] = { ".<C-g>u" },
    [";"] = { ";<C-g>u" },
    --- mouse scroll with wheel
    ["<ScrollWheelUp>"] = { "<C-y>" },
    ["<ScrollWheelDown>"] = { "<C-e>" },
    --- exchange lines position
    ["<M-j>"] = { "<Cmd> m .+1<CR>==gi" },
    ["<M-k>"] = { "<Cmd> m .-2<CR>==gi" },
  }
}

M.interface = {
  n = {
    ["<leader>in"] = { "<Cmd> lua require('custom.ui').change_number() <CR>",
                       "Change the line number display modes" },
    ["<leader>it"] = { function() require("base46").toggle_transparency() end,
                       "Toggle transparency" },
    ["<leader>ic"] = { function() require("base46").toggle_theme() end,
                       "Switch colorschemes" },
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
                        "LSP diagnostic message", },
    ["<leader>ll"] = { function() vim.diagnostic.setloclist() end,
                        "LSP diagnostic loclist", },
    ["<leader>lc"] = { "<Cmd> ClangdSwitchSourceHeader <CR>",
                       "Switch between source and Header file", },
    ["<leader>lq"] = { "<Cmd> lclose <CR>", "Close diagnostic window", },
    ["="] = { function() vim.lsp.buf.format { async = true } end,
              "LSP formatting", },
    ["[d"] = { function() vim.diagnostic.goto_prev {} end,
               "Previous diagnostic location", },
    ["]d"] = { function() vim.diagnostic.goto_next {} end,
               "Next diagnostic location", },
  },
  v = {
    ["="] = { function() vim.lsp.buf.format { async = true } end,
                        "LSP formatting", },
  }
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<Cmd> NvimTreeToggle <CR>", "Toggle file manager" },
  }
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>ft"] = { "<Cmd> Telescope terms <CR>", "Pick hidden termnial" },
    ["<leader>fc"] = { "<Cmd> Telescope themes <CR>", "Change colorscheme" },
    ["<leader>fm"] = { "<Cmd> Telescope marks <CR>", "Search bookmarks" },
    ["<leader>fn"] = { function() require("telescope").extensions.notify.notify() end,
                       "List notify items" },
    ["<leader>fh"] = { "<Cmd> Telescope help_tags <CR>", "Search help tags" },
    ["<leader>fs"] = { "<Cmd> Telescope symbols <CR>", "Insert icon symbols" },
    ["<leader>fk"] = { "<Cmd> Telescope keymaps <CR>", "Search key mappings" },
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
    ["]g"] = {
      function()
        if vim.wo.diff then
          return "]g"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },
    ["[g"] = {
      function()
        if vim.wo.diff then
          return "[g"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to previous hunk",
      opts = { expr = true },
    },
  }
}

M.flash = {
  n = {
    ["s"] = { function() require("flash").jump() end,
              "Flash move" },
    ["S"] = { function() require("flash").treesitter() end,
              "Flash treesitter move" },
  },
  v = {
    ["s"] = { function() require("flash").jump() end,
              "Flash move" },
    ["S"] = { function() require("flash").treesitter() end,
              "Flash treesitter move" },
  },
}

M.aerial = {
  plugin = true,
  n = {
    ["<leader>s"] = { "<Cmd> AerialToggle <CR>", "Code Outline" },
  }
}

local tabufline_n = {}
for i = 1, 9, 1 do
  tabufline_n[string.format("<M-%s>", i)] = {
    function() vim.api.nvim_set_current_buf(vim.t.bufs[i]) end,
    string.format("Switch to buffer %s", i) }
end
tabufline_n["<leader>b>"] = {
  function() require("nvchad_ui.tabufline").move_buf(1) end,
  "Move buffer to right" }
tabufline_n["<leader>b<"] = {
  function() require("nvchad_ui.tabufline").move_buf(-1) end,
  "Move buffer to left" }
tabufline_n["<leader>bx"] = {
  function() require("nvchad_ui.tabufline").close_buffer() end,
  "Close buffer" }

M.tabufline = {
  plugin = true,
  n = tabufline_n
}

M.persistence = {
  -- plugin = true,  -- don't put this option to `true`, which will cause which-key don't recognise it
  n = {
    ["<leader>wr"] = { function() require("persistence").load() end,
                       "Restore workspace for the current directory" },
    ["<leader>wR"] = { function() require("persistence").load() end,
                       "Restore the last workspace" },
    ["<leader>wd"] = { function() require("persistence").stop() end,
                       "Stop save workspace on exit" },
  }
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>cc"] = {
      function()
        require("Comment.api").comment.linewise.current()
      end,
      "Comment linewise",
    },
    ["<leader>cb"] = {
      function()
        require("Comment.api").comment.blockwise.current()
      end,
      "Comment blockwise",
    },
    ["<leader>cd"] = {
      function()
        require("Comment.api").uncomment.linewise.current()
      end,
      "Uncomment linewise",
    },
  },

  v = {
    ["<leader>cc"] = {
      "<ESC><cmd>lua require('Comment.api').comment.linewise(vim.fn.visualmode())<CR>",
      "Comment linewise",
    },
    ["<leader>cb"] = {
      "<ESC><cmd>lua require('Comment.api').comment.blockwise(vim.fn.visualmode())<CR>",
      "Comment blockwise",
    },
    ["<leader>cd"] = {
      "<ESC><cmd>lua require('Comment.api').uncomment.linewise(vim.fn.visualmode())<CR>",
      "Uncomment linewise",
    },
  },
}

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

    --- disable tabufline
    ["<leader>x"] = "",   -- use `<leader>bx`
  }
}

return M
