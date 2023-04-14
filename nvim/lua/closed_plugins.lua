-- This file is a backup for plugins.lua which saves the closed plugins

-- BUG: have issues with functions
-- PERF: have issues with proformance
-- TODO: needs to config and enable
-- HACK: backup or substitute for other same kind of plugins
-- TEST: don't very useful and consider to drop

local lazy = require "lazy"

lazy.setup({
-- 1-Core {{{
  -- BUG: unstable, beta state, alternative to which-key.nvim
  {  "linty-org/key-menu.nvim" },

  -- TEST: Not very useful for me
  {  "stevearc/overseer.nvim",
    config = function ()
      require "core.overseer"
    end
  },

  -- TEST: don't have any spped improve for me
  -- {  "nathom/filetype.nvim" },

  -- TODO: Disable because lots of refactorings needs to be done
  {  "b0o/mapx.nvim" },

  -- HACK: plugins manager `lazy` has already done the same things
  {  "lewis6991/impatient.nvim" },
-- end of 1-Core }}}

-- 2-Edit {{{
  -- TEST: Don't needs it
  {  "github/copilot.vim",
    config = function()
      require "edit.copilot"
    end,
  },

  -- TEST: I rarely use snippets and Luasnip is enough
  {  "rafamadriz/friendly-snippets" },

  -- TEST: the plugin will format the whole file but only one line, so it only useful for new project
  {  "mhartington/formatter.nvim",
    config = function()
      require "edit.formatter"
    end,
  },

  -- BUG: Disable because it needs neovim nightly
  {  "ThePrimeagen/refactoring.nvim",
    config = function()
      require "edit.refactoring"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  -- HACK:
  {  "kevinhwang91/nvim-hlslens",
    config = function()
      require "interface.hlslens"
    end,
  },

  -- HACK: exchanged by numToStr/Comment.nvim
  {  "b3nj5m1n/kommentary",
    config = function()
      require "edit.kommentary"
    end,
    event = "VeryLazy",
  },

-- end of 2-Edit }}}

-- 3-Interface {{{
  -- BUG: Disable because it brings a more buggy behavior. See https://github.com/neovim/neovim/issues/12517
  {  "stevearc/stickybuf.nvim" },

  -- HACK: substitute of illuminate
  {  "yamatsum/nvim-cursorline",
    config = function()
      require "interface.cursorline"
    end,
  },

  -- HACK: substitute of barbecue.nvim
  {  "SmiteshP/nvim-navic",
    config = function()
      require "interface.navic"
    end,
  },
  -- TEST: UI update plugin, I tried and I don't like it, maybe notify is enough for me
  {  "folke/noice.nvim",
    config = function()
      require "interface.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  -- HACK
  {  "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require "interface.treesitter-context"
    end,
  },

  -- BUG: Disable because it not stable
  {  "weilbith/nvim-code-action-menu",
    cmd = { "CodeActionMenu" },
  },

  -- HACK: substitute of nvim-scrollbar
  {  "dstein64/nvim-scrollview" },

  -- HACK: substitute for nvim-scrollbar, which support search results, lsp diagnostics and git hunks. Disable because it's work in progress
  {  "lewis6991/satellite.nvim",
    config = function()
      -- require "interface.satellite"
      require('satellite').setup()
    end,
  },

  -- HACK: A substitute for nvim-scrollbar
  { "gorbit99/codewindow.nvim",
    config = function()
      require "interface.codewindow"
    end,
  },

  -- TEST: I don't like it
  {  "folke/zen-mode.nvim",
    config = function()
      require "interface.zen-mode"
    end,
    keys = {
      { "<leader>tz", "<Cmd>ZenMode<CR>", desc = "Zen Mode" },
    },
  },

  -- BUG: Disable because it's conflicting with the chinese text
  {  "edluffy/specs.nvim",
    config = function()
      require "interface.specs"
    end,
  },

  -- BUG: Behaves strangely when used with text objects
  {  "tversteeg/registers.nvim",
    config = function()
      require "interface.registers"
    end,
  },

  -- TEST: I don't use regex expression offen.
  {  "bennypowers/nvim-regexplainer",
    config = function()
      require "interface.regexplainer"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    -- Also need to install regex with nvim-treesitter: `:TSInstall regex`
  },

  -- PERF: have proformance issue and not very useful
  {  "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require "interface.lsp-inlayhints"
    end,
  },

-- end of 3-Interface }}}

-- 4-Tool {{{
  -- BUG: work in progress with alpha version
  {  "sidebar-nvim/sidebar.nvim",
    config = function()
      require "config.interface.sidebar"
    end,
    dependencies = { "sidebar-nvim/sections-dap" },
  },

  -- HACK: a substitute of nvim-tree
  {  "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require "tool.neo-tree"
    end,
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    },
  },

  -- BUG: some bug occured, which is replaced by symbol-outline
  {  "stevearc/aerial.nvim",
    config = function()
      require "tool.aerial"
    end,
    keys = {
      { "<leader>s", "<Cmd>AerialToggle<CR>", desc = "Code Outline" },
    },
  },

  -- TODO: waitting for test and enable
  {  "onsails/diaglist.nvim" },

  -- HACK: a substitute of some more plugins, such as native lsp and diaglist
  {  "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "tool.trouble"
    end,
  },

  -- TEST: don't very useful
  {  "mfussenegger/nvim-treehopper",
    config = function()
      require "tool.treehopper"
    end,
  },

  -- TODO: waitting for config
  {  "sindrets/winshift.nvim" },

  -- TEST: seems not very useful
  {  "simeji/winresizer" },

  -- TEST: used in HTTP filetype, don't use it for me
  {  "rest-nvim/rest.nvim",
    config = function()
      require "tool.rest"
    end,
    ft = { "http" },
  },

  -- TEST: I use tmux, so this plugin is not needed
  {  "akinsho/nvim-toggleterm.lua",
    config = function()
      require "tool.toggleterm"
    end,
  },

  -- TEST: lazy can do this and do more
  {  "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  },

  -- BUG: can't be use
  {  "rbong/vim-flog" },

  -- TEST: needs to install other tools to support (pynvim) and can't be use
  {  "simnalamburt/vim-mundo",
    config = function()
      require "tool.mundo"
    end,
    keys = {
      { "<leader>u", "<Cmd>MundoToggle<CR>", desc = "Undo Tree" },
    },
    event = "VeryLazy",
  },

-- end of 4-Tool }}}

-- 5- Debug {{{
  -- TODO: needs to test
  {  "Civitasv/cmake-tools.nvim",
    enabled = false,
  },

  -- TODO: needs to test
  {  "mfussenegger/nvim-dap-python",
    config = function()
      require "debug.dap-python"
    end,
    ft = { "python" },
  },

  -- TODO: needs to test
  {  "rafcamlet/nvim-luapad",
    ft = { "lua" },
  },

  -- TODO: needs to test
  {  "michaelb/sniprun",
    config = function()
      require "debug.sniprun"
    end,
    build = "bash install.sh",
  },

  -- TODO: needs to test
  {  "rcarriga/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  },

  -- HACK: manage dap, mason can do this
  {  "Pocco81/dap-buddy.nvim",
    build = "make",
  },
-- end of 5-Debug }}}

-- 6-Language {{{
  {  "p00f/clangd_extensions.nvim",
    config = function()
      require "language.clangd_extensions"
    end,
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  },

  {  "mfussenegger/nvim-jdtls",
    config = function()
      require "language.jdtls"
    end,
    ft = { "java" },
  },

  {  "jose-elias-alvarez/typescript.nvim",
    config = function()
      require "language.typescript"
    end,
    ft = { "typescript" },
  },
-- end of 6-Language }}}

-- 7-Colorscheme {{{
  -- HACK:
  {  "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require "colorscheme.catppuccin"
    end,
    build = ":CatppuccinCompile",
  },

  -- HACK:
  {
    "navarasu/onedark.nvim",
    config = function()
      require "colorscheme.onedark"
    end,
  },

  -- HACK:
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require "colorscheme.rose-pine"
    end,
  },

  -- HACK:
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require "colorscheme.gruvbox"
    end,
  },
-- end of 7-Colorscheme }}}
})
