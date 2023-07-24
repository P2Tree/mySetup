---@type NvPluginSpec[]
local plugins = {

  --- Install a plugin
  --- All NvChad plugins are lazy-loaded by default
  --- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  --- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example

  --- 1-Core {{{
  { "neovim/nvim-lspconfig",
    dependencies = {
      { "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      { "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            --- LSP
            "lua-language-server", -- lua
            "clangd", -- c/cpp
            "pyright", -- python
            "json-lsp", -- json
            --- Formatter
            "stylua", -- lua
            "clang-format", -- c/cpp
            "black", -- python
            "shfmt", -- shell
            "prettier", -- json
            --- Linter
            "gitlint", -- git
            "shellcheck", -- shell
          },
        },
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  { "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua",
        "cpp", "c", "llvm", "tablegen", "cuda",
        "json", "yaml", "ini", "markdown",
        "python",
        "ninja", "make", "cmake",
        "diff",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
      },
      indent = {
        enable = true,
        disable = {
          "python"
        }
      }
    },
  },
  --- 1-Core }}}

  --- 3-Interface {{{
  { "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        delete = { text = "_" },
      },
    },
  },
  { "utilyre/barbecue.nvim",
    lazy = false,
    opts = {
      exclude_filetypes = { "gitcommit", "toggleterm" },
      context_follow_icon_color = true,
    },
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
  },
  { "folke/noice.nvim",
    event = "VeryLazy",
    config = {
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        { -- show record message
          view = "notify",
          filter = { event = "msg_showmode" },
        },
        { -- disable "written" message
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "emsg",
            find = "search hit",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  { "luukvbaal/statuscol.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "utilyre/sentiment.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = true,
  },
  { "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "kevinhwang91/nvim-bqf",
    opts = {
      preview = {
        winblend = 5,  -- default is 12
      }
    },
    ft = "qf",
  },
  { "folke/todo-comments.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "chentoast/marks.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "rainbowhxch/beacon.nvim",
    event = "VeryLazy",
    config = true,
  },
  --- 3-Interface }}}

  --- 4-Tool {{{
  { "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        set_env = { ["COLORTERM"] = "truecolor" },
        mappings = {
          i = {
            ["<ESC>"] = require("telescope.actions").close,
          }
        }
      }
    },
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
    }
  },
  { "nvim-tree/nvim-tree.lua",
    opts = {
      sync_root_with_cwd = true,
      reload_on_bufenter = true,
      respect_buf_cwd = true,
      renderer = {
        highlight_opened_files = "icon",
        indent_markers = {
          enable = false,
        },
      },
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },
      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          resize_window = true,
        },
      },
    },
  },
  { "folke/flash.nvim",
    opts = {
      modes = {
        search = { enabled = false, },
        char = { enabled = false, },
      },
    },
  },
  { "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    init = function()
      require("core.utils").load_mappings "aerial"
    end,
    opts = {
      layout = {
        default_direction = "right",
      },
      close_on_select = true,
      autojump = true,
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  { "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    config = true,
    enabled = function()
      --- load only when a git file is opened
      vim.fn.system("git -C " ..'"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
      if vim.v.shell_error == 0 then
        return true
      end
    end,
  },
  { "aserowy/tmux.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "rainbowhxch/accelerated-jk.nvim",
    event = "VeryLazy",
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
    end,
  },
  -- session saving and restore
  { "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
  },
  -- light markdown preview tool
  { "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },
  -- show reference, defination number count
  { "VidocqH/lsp-lens.nvim",
    event = "VeryLazy",
    config = true,
  },
  --- 4-Tool }}}
}

require("which-key").register({
  ["<leader>"] = {
    ["b"] = "+buffer",
    ["f"] = "+find",
    ["g"] = "+git",
    ["l"] = "+lsp",
    ["o"] = "+open",
    ["t"] = "+terminal",
    ["i"] = "+interface",
    ["w"] = "+workspace",
  }
})

return plugins
