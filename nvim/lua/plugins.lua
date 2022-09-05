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
        { "RRethy/nvim-treesitter-textsubjects", disable = true },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
      },
    }

    use {  "tpope/vim-unimpaired" }

    use {  "folke/which-key.nvim",
      config = function()
        require "core.which-key"
      end,
    }

    use {  "b0o/mapx.nvim",
      disable = true,
      -- Plugin organize keymaps
      -- Disable because lots of refactorings needs to be done
    }

    use {  "lewis6991/impatient.nvim" }

    use {  "nathom/filetype.nvim",
      config = function()
        require "core.filetype"
      end,
    }

    use {  "ii14/emmylua-nvim",
      opt = true,
      disable = true,
      -- used by sumneko_lua lsp, but i think it is optional
    }
    -- }}}

    -- Text Editing {{{
    use {  "github/copilot.vim",
      config = function()
        require "edit.copilot"
      end,
      disable = false,
      -- leave for later research
    }

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

    use {  "rafamadriz/friendly-snippets",
      disable = true,  -- not useful for me
    }

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
      disable = true,
      -- Spell check is less needed at this time
    }

    use {  "windwp/nvim-autopairs",
      config = function()
        require "edit.autopairs"
      end,
    }

    use {  "ThePrimeagen/refactoring.nvim",
      config = function()
        require "edit.refactoring"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
      },
      disable = true,
      -- Plugin surpporting refactorings
      -- Disable because it needs neovim nightly
    }
    -- }}}

    -- Interface Extension {{{
    use {  "nvim-lualine/lualine.nvim",
      config = function()
        require "interface.lualine"
      end,
      requires = {
        { "kyazdani42/nvim-web-devicons" },
        { "ofseed/lualine-copilot" },
      },
    }

    use {  "akinsho/bufferline.nvim",
      config = function()
        require "interface.bufferline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {  "stevearc/stickybuf.nvim",
      disable = true,
      -- Disable because it brings a more buggy behavior
      -- https://github.com/neovim/neovim/issues/12517
    }

    use {  "SmiteshP/nvim-navic",
      config = function()
        require "interface.navic"
      end,
    }

    use {  "RRethy/vim-illuminate",
      config = function()
        require "interface.illuminate"
      end,
      disable = false,
      -- substitute of cursorline
      -- more powerful but heavy
    }

    use {  "yamatsum/nvim-cursorline",
      config = function()
        require "interface.cursorline"
      end,
      disable = true,
      -- substitute of illuminate
    }

    use {  "kevinhwang91/nvim-ufo",
      config = function()
        require "interface.ufo"
      end,
      requires = "kevinhwang91/promise-async",
    }

    use {  "m-demare/hlargs.nvim",
      config = function()
        require "interface.hlargs"
      end,
      after = "catppuccin",
      -- hlargs should be loaded after colorscheme
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
      disable = true,
    }

    use {  "ray-x/lsp_signature.nvim",
      config = function()
        require "interface.lsp_signature"
      end,
      disable = true,  -- need to config
    }

    use {  "onsails/lspkind-nvim",
      config = function()
        require "interface.lspkind"
      end,
    }

    use {  "weilbith/nvim-code-action-menu",
      cmd = { "CodeActionMenu" },
      disable = true,
      -- Disable because it not stable
    }

    use {  "goolord/alpha-nvim",
      config = function()
        require "interface.alpha"
      end,
      disable = true,
    }

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

    use {  "norcalli/nvim-colorizer.lua",
      config = function()
        require "interface.colorizer"
      end,
      disable = true,
    }

    use {  "dstein64/nvim-scrollview" }

    use {  "lewis6991/satellite.nvim",
      config = function()
        require "interface.satellite"
      end,
      disable = true,
      -- A substitute for nvim-scrollview
      -- which support search results, lsp diagnostics and git hunks
      -- Disable because it's work in progress
    }

    use {  "kevinhwang91/nvim-bqf",
      config = function()
        require "interface.bqf"
      end,
      disable = false,
      -- A substitute for trouble
    }

    use {  "kevinhwang91/nvim-fFHighlight",
      config = function()
        require "interface.ffhighlight"
      end,
      disable = true,
      -- Plugin show inline search highlight
      -- Disable because it's not very useful
    }

    use {  "folke/todo-comments.nvim",
      config = function()
        require "interface.todo-comments"
      end,
    }

    use {  "folke/zen-mode.nvim",
      config = function()
        require "interface.zen-mode"
      end,
      cmd = { "ZenMode" },
    }

    use {  "psliwka/vim-smoothie" }

    use {  "edluffy/specs.nvim",
      config = function()
        require "interface.specs"
      end,
      disable = true,
      -- Disable because it's conflicting with the chinese text
    }

    use {  "chentoast/marks.nvim",
      config = function()
        require "interface.marks"
      end,
      disable = true,
      -- Disable causes the value of v:oldfiles to be messed up
    }

    use {  "tversteeg/registers.nvim",
      config = function()
        require "interface.registers"
      end,
      disable = true,
      -- Behaves strangely when used with text objects
    }

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
      disable = false,
      -- Disable it after the last neovim update, as this plugin is trying to merge into neovim
    }

    use {
      -- "EdenEast/nightfox.nvim",
      -- "navarasu/onedark.nvim",
      -- "tanvirtin/monokai.nvim",
      -- "shaunsingh/solarized.nvim",
      -- "shaunsingh/moonlight.nvim",
      -- "shaunsingh/nord.nvim",
      -- "Mofiqul/vscode.nvim",
      -- "ellisonleao/gruvbox.nvim",
      -- "folke/tokyonight.nvim",
      "catppuccin/nvim",
      -- "projekt0n/github-nvim-theme",
      config = function()
        require "interface.colorscheme"
      end,
      as = "catppuccin",  -- if use catppuccin/nvim
      run = ":CatppuccinCompile", -- if use catppuccin/nvim
      -- requires = { "rktjmp/lush.nvim" }, -- Required by gruvbox
    }
    -- }}}

    -- Tool Integration {{{
    use {  "sidebar-nvim/sidebar.nvim",
      config = function()
        require "config.interface.sidebar"
      end,
      requires = { "sidebar-nvim/sections-dap" },
      disable = true,
      -- work in progress with alpha version
    }

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

    use {  "kyazdani42/nvim-tree.lua",
      config = function()
        require "tool.tree"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
      disable = true,
      -- a substitue for neo-tree.nvim
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
        { "nvim-telescope/telescope-hop.nvim" },
        -- { "nvim-telescope/telescope-project.nvim" },
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

    use {  "stevearc/aerial.nvim",
      config = function()
        require "tool.aerial"
      end,
    }

    use {  "simrat39/symbols-outline.nvim",
      config = function()
        require "tool.symbols-outline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
      cmd = { "SymbolsOutline" },
      disable = true,
      -- Substitute for aerial.nvim
      -- Disable because better to use aerial.nvim
    }

    use {  "onsails/diaglist.nvim",
      disable = true,
    }

    use {  "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "tool.trouble"
      end,
      disable = true,
    }

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
      cmd = { "DiffviewOpen", "DiffviewFileHistory" },
      disable = false,
      -- have high requirement of git version
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

    use {  "ethanholz/nvim-lastplace",
      config = function()
        require "tool.lastplace"
      end,
    }

    use {  "Shatur/neovim-session-manager",
      config = function()
        require "tool.session-manager"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
      disable = true,
    }

    use {  "dstein64/vim-startuptime",
      cmd = { "StartupTime" },
    }

    use {  "sindrets/winshift.nvim",
      disable = true,
    }

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
    -- }}}

    -- Debug And Run {{{
    use {  "michaelb/sniprun",
      config = function()
        require "debug.sniprun"
      end,
      run = "bash install.sh",
    }

    use {  "rcarriga/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
      },
      disable = true,
    }

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
      disable = true,
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
