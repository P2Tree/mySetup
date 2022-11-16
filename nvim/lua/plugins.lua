-- vim:foldmethod=marker
---@diagnostic disable: different-requires
-- Automatically download packer.nvim if it doesn't exist
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd "packadd packer.nvim"
end

-- Automatically run :PackerCompile after every time this file is changed
vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "packer_user_config",
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

local packer = require "packer"

-- Use packer.nvim to manage all of the plugins
return packer.startup {
  function(use)
    -- Core {{{
    use {  "wbthomason/packer.nvim" }

    use {  "neovim/nvim-lspconfig",
      config = function()
        require "core.lspconfig"
      end,
      requires = { "williamboman/mason-lspconfig.nvim" },
      after = "mason.nvim",
    }

    use {  "williamboman/mason.nvim",
      config = function()
        require "core.mason"
      end,
    }

    use {  "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "core.null-ls"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "neovim/nvim-lspconfig" },
      },
    }

    use {  "ahmedkhalf/project.nvim",
      config = function()
        require "core.project"
      end,
    }

    use { "tpope/vim-sleuth" }

    use {  "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "core.treesitter"
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "windwp/nvim-ts-autotag" },
        { "p00f/nvim-ts-rainbow" },
        { "RRethy/nvim-treesitter-endwise" },
        -- { "RRethy/nvim-treesitter-textsubjects", disable = true },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
      },
    }

    use {  "tpope/vim-unimpaired" }

    -- use {  "folke/which-key.nvim",
    --   config = function()
    --     require "core.which-key"
    --   end,
    --   disable = true,
    -- }

    -- use {  "b0o/mapx.nvim",
    --   disable = true, -- Disable because lots of refactorings needs to be done
    -- }

    use {  "lewis6991/impatient.nvim" }

    use {  "nathom/filetype.nvim",
      config = function()
        require "core.filetype"
      end,
    }

    -- use {  "ii14/emmylua-nvim",
    --   opt = true,
    --   disable = true, -- used by sumneko_lua lsp, but i think it is optional
    -- }
    -- }}}

    -- Text Editing {{{
    -- use {  "github/copilot.vim",
    --   config = function()
    --     require "edit.copilot"
    --   end,
    --   disable = true, -- leave for later research
    -- }

    use {  "hrsh7th/nvim-cmp",
      config = function()
        require "edit.cmp"
      end,
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-calc" },
        { "saadparwaiz1/cmp_luasnip" },
        { "kristijanhusak/vim-dadbod-completion" },
        { "lukas-reineke/cmp-under-comparator" },  -- use for sort helper
      },
    }

    use {  "L3MON4D3/LuaSnip",
      config = function()
        require "edit.luasnip"
      end,
    }

    -- use {  "rafamadriz/friendly-snippets",
    --   disable = true,  -- not useful for me
    -- }

    use {  "b3nj5m1n/kommentary",
      config = function()
        require "edit.kommentary"
      end,
    }

    use {  "tpope/vim-surround" }

    use {  "tpope/vim-repeat" }

    use {  "lewis6991/spellsitter.nvim",
      config = function()
        require "edit.spellsitter"
      end,
    }

    use {  "windwp/nvim-autopairs",
      config = function()
        require "edit.autopairs"
      end,
    }

    -- use {  "mhartington/formatter.nvim",
    --   config = function()
    --     require "edit.formatter"
    --   end,
    --   disable = true,  -- don't very useful
    -- }

    -- use {  "ThePrimeagen/refactoring.nvim",
    --   config = function()
    --     require "edit.refactoring"
    --   end,
    --   requires = {
    --     { "nvim-lua/plenary.nvim" },
    --     { "nvim-treesitter/nvim-treesitter" },
    --   },
    --   disable = true, -- Disable because it needs neovim nightly
    -- }
    -- }}}

    -- Interface Extension {{{
    use {  "nvim-lualine/lualine.nvim",
      config = function()
        require "interface.lualine"
      end,
      requires = {
        { "kyazdani42/nvim-web-devicons" },
        -- { "ofseed/lualine-copilot" },
      },
    }

    use {  "akinsho/bufferline.nvim",
      config = function()
        require "interface.bufferline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    -- use {  "stevearc/stickybuf.nvim",
    --   disable = true, -- Disable because it brings a more buggy behavior. See https://github.com/neovim/neovim/issues/12517
    -- }

    use {  "SmiteshP/nvim-navic",
      config = function()
        require "interface.navic"
      end,
    }

    use {  "RRethy/vim-illuminate",
      config = function()
        require "interface.illuminate"
      end,
    }

    -- use {  "yamatsum/nvim-cursorline",
    --   config = function()
    --     require "interface.cursorline"
    --   end,
    --   disable = true, -- substitute of illuminate
    -- }

    use {  "kevinhwang91/nvim-ufo",
      config = function()
        require "interface.ufo"
      end,
      requires = "kevinhwang91/promise-async",
    }

    use {
      "kevinhwang91/nvim-hlslens",
      config = function()
        require "interface.hlslens"
      end,
    }

    use {  "m-demare/hlargs.nvim",
      config = function()
        require "interface.hlargs"
      end,
    }

    use {  "zbirenbaum/neodim",
      config = function()
        require "interface.dim"
      end,
    }

    use {  "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "interface.indent-blankline"
      end,
    }

    use {  "stevearc/dressing.nvim",
      config = function()
        require "interface.dressing"
      end,
    }

    -- use {  "ray-x/lsp_signature.nvim",
    --   config = function()
    --     require "interface.lsp_signature"
    --   end,
    --   disable = true,  -- need to config
    -- }

    use {  "onsails/lspkind-nvim",
      config = function()
        require "interface.lspkind"
      end,
    }

    -- use {  "weilbith/nvim-code-action-menu",
    --   cmd = { "CodeActionMenu" },
    --   disable = true, -- Disable because it not stable
    -- }

    use {  "mhinz/vim-startify" }

    use {  "j-hui/fidget.nvim",
      config = function()
        require "interface.fidget"
      end,
    }

    use {  "rcarriga/nvim-notify",
      config = function()
        require "interface.notify"
      end,
    }

    use {  "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require "interface.treesitter-context"
      end,
    }

    -- use {  "dstein64/nvim-scrollview",
    --   disable = true,
    -- }

      use {  "petertriho/nvim-scrollbar",
        config = function()
          require "interface.scrollbar"
        end,
      }

    -- use {  "lewis6991/satellite.nvim",
    --   config = function()
    --     -- require "interface.satellite"
    --     require('satellite').setup()
    --   end,
    --   disable = true, -- A substitute for nvim-scrollview, which support search results, lsp diagnostics and git hunks. Disable because it's work in progress
    -- }

    -- use { "gorbit99/codewindow.nvim",
    --   config = function()
    --     require "interface.codewindow"
    --   end,
    --   disable = true, -- A substitute for nvim-scrollview
    -- }

    use {  "kevinhwang91/nvim-bqf",
      config = function()
        require "interface.bqf"
      end,
    }

    use {  "folke/todo-comments.nvim",
      config = function()
        require "interface.todo-comments"
      end,
      branch = "neovim-pre-0.8.0",  -- use this before 0.8.0 version
    }

    -- use {  "folke/zen-mode.nvim",
    --   config = function()
    --     require "interface.zen-mode"
    --   end,
    --   disable = true,
    -- }

    use {  "psliwka/vim-smoothie" }

    -- use {  "edluffy/specs.nvim",
    --   config = function()
    --     require "interface.specs"
    --   end,
    --   disable = true, -- Disable because it's conflicting with the chinese text
    -- }

    -- use {  "chentoast/marks.nvim",
    --   config = function()
    --     require "interface.marks"
    --   end,
    --   disable = true, -- Disable causes the value of v:oldfiles to be messed up
    -- }

    -- use {  "tversteeg/registers.nvim",
    --   config = function()
    --     require "interface.registers"
    --   end,
    --   disable = true, -- Behaves strangely when used with text objects
    -- }

    use {  "bennypowers/nvim-regexplainer",
      config = function()
        require "interface.regexplainer"
      end,
      requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
    }

    use {  "luukvbaal/stabilize.nvim",
      config = function()
        require "interface.stabilize"
      end,
      -- Delete this plugin after vim 0.8.0, which is merged into main stream with option 'splitkeep'
    }
    -- }}}

    -- {{{ Colorscheme
    use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require "colorscheme.catppuccin"
      end,
      run = ":CatppuccinCompile", -- if use catppuccin/nvim
      tag = "v0.2.4",  -- for nvim 0.7, if update to nvim 0.8, delete this limit
    }

    -- use {
    --   "folke/tokyonight.nvim",
    --   config = function()
    --     require "colorscheme.tokyonight"
    --   end,
    --   disable = true,
    -- }

    -- use {
    --   "ellisonleao/gruvbox.nvim",
    --   config = function()
    --     require "colorscheme.gruvbox"
    --   end,
    --   disable = true,
    -- }

    -- use {
    --   "navarasu/onedark.nvim",
    --   config = function()
    --     require "colorscheme.onedark"
    --   end,
    --   disable = true,
    -- }

    -- use {
    --   "rose-pine/neovim",
    --   as = "rose-pine",
    --   config = function()
    --     require "colorscheme.rose-pine"
    --   end,
    --   disable = true,
    -- }
    -- }}}

    -- Tool Integration {{{
    -- use {  "sidebar-nvim/sidebar.nvim",
    --   config = function()
    --     require "config.interface.sidebar"
    --   end,
    --   requires = { "sidebar-nvim/sections-dap" },
    --   disable = true, -- work in progress with alpha version
    -- }

    -- use {  "nvim-neo-tree/neo-tree.nvim",
    --   config = function()
    --     require "tool.neo-tree"
    --   end,
    --   branch = "v2.x",
    --   requires = {
    --     "nvim-lua/plenary.nvim",
    --     "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    --     "MunifTanjim/nui.nvim",
    --     "s1n7ax/nvim-window-picker",
    --   },
    --   disable = true, -- a substitute of nvim-tree
    -- }

    use {  "nvim-tree/nvim-tree.lua",
      config = function()
        require "tool.tree"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {  "nvim-telescope/telescope.nvim",
      config = function()
        require "tool.telescope"
      end,
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "ahmedkhalf/project.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "nvim-telescope/telescope-hop.nvim" },
        -- { "nvim-telescope/telescope-project.nvim" },
        { "nvim-telescope/telescope-symbols.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" },
        { "nvim-telescope/telescope-dap.nvim" },
        { "benfowler/telescope-luasnip.nvim" },
        { "kyzadani42/nvim-web-devicons" },
      },
      branch = "0.1.x",
    }

    use {  "phaazon/hop.nvim",
      config = function()
        require "tool.hop"
      end,
      branch = "v2",
    }

    use {  "mfussenegger/nvim-treehopper",
      config = function()
        require "tool.treehopper"
      end,
    }

    -- use {  "stevearc/aerial.nvim",
    --   config = function()
    --     require "tool.aerial"
    --   end,
    --   disable = true,
    -- }

    use {  "simrat39/symbols-outline.nvim",
      config = function()
        require "tool.symbols-outline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
      cmd = { "SymbolsOutline" },
    }

    -- use {  "onsails/diaglist.nvim",
    --   disable = true,
    -- }

    -- use {  "folke/trouble.nvim",
    --   requires = "kyazdani42/nvim-web-devicons",
    --   config = function()
    --     require "tool.trouble"
    --   end,
    --   disable = true,
    -- }

    use {  "akinsho/nvim-toggleterm.lua",
      config = function()
        require "tool.toggleterm"
      end,
      tag = "v2.*",
    }

    use {  "lewis6991/gitsigns.nvim",
      config = function()
        require "tool.gitsigns"
      end,
      requires = "nvim-lua/plenary.nvim",
    }

    use {  "TimUntersberger/neogit",
      config = function()
        require "tool.neogit"
      end,
      requires = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
      },
      cmd = { "Neogit" },
    }

    use {  "sindrets/diffview.nvim",
      config = function()
        require "tool.diffview"
      end,
    }

    use {  "akinsho/git-conflict.nvim",
      config = function()
        require "tool.git-conflict"
      end,
    }

    use {  "aserowy/tmux.nvim",
      config = function()
        require "tool.tmux"
      end,
    }

    use {  "kevinhwang91/vim-ibus-sw" }

    -- use {  "ethanholz/nvim-lastplace",
    --   config = function()
    --     require "tool.lastplace"
    --   end,
    --   disable = true,
    -- }

    -- use {  "Shatur/neovim-session-manager",
    --   config = function()
    --     require "tool.session-manager"
    --   end,
    --   requires = {
    --     { "nvim-lua/plenary.nvim" },
    --   },
    --   disable = true,
    -- }

    use {  "dstein64/vim-startuptime",
      cmd = { "StartupTime" },
    }

    -- use {  "sindrets/winshift.nvim",
    --   disable = true,
    -- }

    -- use {  "simeji/winresizer",
    --   disable = true,
    -- }

    use {  "vuki656/package-info.nvim",
      config = function()
        require "tool.package-info"
      end,
      requires = "MunifTanjim/nui.nvim",
      event = {
        "BufRead package.json",
        "BufRead package-lock.json",
      },
      ft = { "json" },
    }

    -- use {
    --   "rest-nvim/rest.nvim",
    --   config = function()
    --     require "tool.rest"
    --   end,
    --   ft = { "http" },
    --   disable = true,  -- don't need it
    -- }
    -- }}}

    -- Debug And Run {{{
    -- use {  "michaelb/sniprun",
    --   config = function()
    --     require "debug.sniprun"
    --   end,
    --   run = "bash install.sh",
    --   disable = true,
    -- }

    -- use {  "rcarriga/neotest",
    --   requires = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-treesitter/nvim-treesitter",
    --     "antoinemadec/FixCursorHold.nvim",
    --   },
    --   disable = true,
    -- }

    use {  "mfussenegger/nvim-dap",
      config = function()
        require "debug.dap"
      end,
    }

    use {  "theHamsta/nvim-dap-virtual-text",
      config = function()
        require "debug.dap-virtual-text"
      end,
    }

    use {  "rcarriga/nvim-dap-ui",
      config = function()
        require "debug.dap-ui"
      end,
    }

    use {  "Pocco81/dap-buddy.nvim",
      run = "make",
    }

    use {  "mfussenegger/nvim-dap-python",
      config = function()
        require "debug.dap-python"
      end,
      ft = { "python" },
    }

    use {  "rafcamlet/nvim-luapad",
      ft = { "lua" },
    }

    use {  "Shatur/neovim-cmake",
      config = function()
        require "debug.cmake"
      end,
      ft = { "c", "cpp", "cmake" },
    }
    -- }}}

    -- Language Specific {{{
    use {  "plasticboy/vim-markdown",
      ft = { "markdown" },
    }

    use {  "p00f/clangd_extensions.nvim",
      config = function()
        require "language.clangd_extensions"
      end,
      ft = { "c", "cpp" },
    }

    use {  "mfussenegger/nvim-jdtls",
      config = function()
        require "language.jdtls"
      end,
      ft = { "java" },
    }

    use {  "jose-elias-alvarez/typescript.nvim",
      config = function()
        require "language.typescript"
      end,
      ft = { "typescript" },
    }

    use {  "b0o/SchemaStore.nvim",
      config = function()
        require "language.schema-store"
      end,
      ft = { "json" },
    }
    -- }}}
  end,

  config = {
    display = {
      prompt_border = "rounded",
    },
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  },
}
