-- This file is a backup for plugins.lua which saves the closed plugins

-- BUG: have issues with functions
-- PERF: have issues with proformance
-- TODO: needs to config and enable
-- HACK: backup or substitute for other same kind of plugins
-- TEST: don't very useful and consider to drop

  function(use)
-- 1-Core {{{
    -- BUG: Disable because plugin may lost proformance
    use {  "folke/which-key.nvim",
      config = function()
        require "core.which-key"
      end,
    }

    -- TODO: Disable because lots of refactorings needs to be done
    use {  "b0o/mapx.nvim" }

    -- HACK: Used by sumneko_lua lsp, but i think it is optional
    use {  "ii14/emmylua-nvim",
      opt = true,
    }
-- end of 1-Core }}}

-- 2-Edit {{{
    -- TEST: Don't needs it
    use {  "github/copilot.vim",
      config = function()
        require "edit.copilot"
      end,
    }

    -- TEST: I rarely use snippets and Luasnip is enough
    use {  "rafamadriz/friendly-snippets" }

    -- TEST: the plugin will format the whole file but only one line, so it only useful for new project
    use {  "mhartington/formatter.nvim",
      config = function()
        require "edit.formatter"
      end,
    }

    -- BUG: Disable because it needs neovim nightly
    use {  "ThePrimeagen/refactoring.nvim",
      config = function()
        require "edit.refactoring"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    }
-- end of 2-Edit }}}

-- 3-Interface {{{
    -- BUG: Disable because it brings a more buggy behavior. See https://github.com/neovim/neovim/issues/12517
    use {  "stevearc/stickybuf.nvim" }

    -- HACK: substitute of illuminate
    use {  "yamatsum/nvim-cursorline",
      config = function()
        require "interface.cursorline"
      end,
    }

    -- TODO: needs to config
    use {  "ray-x/lsp_signature.nvim",
      config = function()
        require "interface.lsp_signature"
      end,
    }

    -- BUG: Disable because it not stable
    use {  "weilbith/nvim-code-action-menu",
      cmd = { "CodeActionMenu" },
    }

    -- HACK: substitute of nvim-scrollbar
    use {  "dstein64/nvim-scrollview" }

    -- HACK: substitute for nvim-scrollbar, which support search results, lsp diagnostics and git hunks. Disable because it's work in progress
    use {  "lewis6991/satellite.nvim",
      config = function()
        -- require "interface.satellite"
        require('satellite').setup()
      end,
    }

    -- HACK: A substitute for nvim-scrollbar
    use { "gorbit99/codewindow.nvim",
      config = function()
        require "interface.codewindow"
      end,
    }

    -- TEST: I don't like it
    use {  "folke/zen-mode.nvim",
      config = function()
        require "interface.zen-mode"
      end,
    }

    -- BUG: Disable because it's conflicting with the chinese text
    use {  "edluffy/specs.nvim",
      config = function()
        require "interface.specs"
      end,
    }

    -- BUG: Disable causes the value of v:oldfiles to be messed up
    use {  "chentoast/marks.nvim",
      config = function()
        require "interface.marks"
      end,
    }

    -- BUG: Behaves strangely when used with text objects
    use {  "tversteeg/registers.nvim",
      config = function()
        require "interface.registers"
      end,
    }
-- end of 3-Interface }}}

-- 4-Tool {{{
    -- BUG: work in progress with alpha version
    use {  "sidebar-nvim/sidebar.nvim",
      config = function()
        require "config.interface.sidebar"
      end,
      requires = { "sidebar-nvim/sections-dap" },
    }

    -- HACK: a substitute of nvim-tree
    use {  "nvim-neo-tree/neo-tree.nvim",
      config = function()
        require "tool.neo-tree"
      end,
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
      },
    }

    -- BUG: some bug occured, which is replaced by symbol-outline
    use {  "stevearc/aerial.nvim",
      config = function()
        require "tool.aerial"
      end,
    }

    -- TODO: waitting for test and enable
    use {  "onsails/diaglist.nvim" }

    -- HACK: a substitute of some more plugins, such as native lsp and diaglist
    use {  "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "tool.trouble"
      end,
    }

    -- HACK: replaced by a auto command
    use {  "ethanholz/nvim-lastplace",
      config = function()
        require "tool.lastplace"
      end,
    }

    -- TEST: don't very useful
    use {  "Shatur/neovim-session-manager",
      config = function()
        require "tool.session-manager"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
    }

    -- TODO: waitting for config
    use {  "sindrets/winshift.nvim" }

    -- TEST: seems not very useful
    use {  "simeji/winresizer" }

    -- TEST: used in HTTP filetype, don't use it for me
    use {
      "rest-nvim/rest.nvim",
      config = function()
        require "tool.rest"
      end,
      ft = { "http" },
    }
-- end of 4-Tool }}}

-- {{{ 5-Colorscheme
    -- HACK:
    use {
      "folke/tokyonight.nvim",
      config = function()
        require "colorscheme.tokyonight"
      end,
    }

    -- HACK:
    use {
      "ellisonleao/gruvbox.nvim",
      config = function()
        require "colorscheme.gruvbox"
      end,
    }

    -- HACK:
    use {
      "navarasu/onedark.nvim",
      config = function()
        require "colorscheme.onedark"
      end,
    }

    -- HACK:
    use {
      "rose-pine/neovim",
      as = "rose-pine",
      config = function()
        require "colorscheme.rose-pine"
      end,
    }
-- end of 5-Colorscheme }}}

-- 6- Debug {{{
    -- TODO: needs to test
    use {  "michaelb/sniprun",
      config = function()
        require "debug.sniprun"
      end,
      run = "bash install.sh",
    }

    -- TODO: needs to test
    use {  "rcarriga/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
      },
    }
-- end of 6-Debug }}}
  end
