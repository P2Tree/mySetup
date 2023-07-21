---@type NvPluginSpec[]
local plugins = {

  -- Install a plugin
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example

  -- 1-Core {{{
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
  -- 1-Core }}}

  -- 3-Interface {{{
  { "folke/noice.nvim",
    lazy = false,
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  -- 3-Interface }}}

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
