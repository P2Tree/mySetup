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
-- 1-Core {{{
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

    use {  "nvim-tree/nvim-web-devicons" }

    use {  "tpope/vim-unimpaired" }

    use { "tpope/vim-sleuth" }

    use {  "lewis6991/impatient.nvim" }

    use {  "nathom/filetype.nvim",
      config = function()
        require "core.filetype"
      end,
    }
-- end of 1-Core }}}

-- 2-Edit {{{
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

    use {  "b3nj5m1n/kommentary",
      config = function()
        require "edit.kommentary"
      end,
     }

    use {  "kylechui/nvim-surround",
      config = function()
        require "edit.surround"
      end,
    }

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
-- end of 2-Edit }}}

-- 3-Interface {{{
    use {  "nvim-lualine/lualine.nvim",
      config = function()
        require "interface.lualine"
      end,
      requires = {
        { "kyazdani42/nvim-web-devicons" },
      },
    }

    use {  "akinsho/bufferline.nvim",
      config = function()
        require "interface.bufferline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {  "utilyre/barbecue.nvim",
      config = function()
        require "interface.barbecue"
      end,
      requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "kyazdani42/nvim-web-devicons",
      },
    }

    use {  "RRethy/vim-illuminate",
      config = function()
        require "interface.illuminate"
      end,
    }

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
      disable = true,
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

    use {  "onsails/lspkind-nvim",
      config = function()
        require "interface.lspkind"
      end,
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

    use {  "petertriho/nvim-scrollbar",
      config = function()
        require "interface.scrollbar"
      end,
    }

    use {  "kevinhwang91/nvim-bqf",
      ft = 'qf',
      config = function()
        require "interface.bqf"
      end,
    }

    use {  "folke/todo-comments.nvim",
      config = function()
        require "interface.todo-comments"
      end,
    }

    use {  "psliwka/vim-smoothie" }

    use {  "bennypowers/nvim-regexplainer",
      config = function()
        require "interface.regexplainer"
      end,
      requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
    }
-- end of 3-Interface }}}

-- 4-Tool {{{
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

    use {  "simrat39/symbols-outline.nvim",
      config = function()
        require "tool.symbols-outline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
      cmd = { "SymbolsOutline" },
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
      tag = "*",  -- use stable branch. The default branch is develop one which is unstable to use
    }

    use {  "aserowy/tmux.nvim",
      config = function()
        require "tool.tmux"
      end,
    }

    use {  "kevinhwang91/vim-ibus-sw" }

    use {  "dstein64/vim-startuptime",
      cmd = { "StartupTime" },
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
-- end of 4-Tool }}}

-- {{{ 5-Colorscheme
    use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require "colorscheme.catppuccin"
      end,
      run = ":CatppuccinCompile", -- if use catppuccin/nvim
    }

-- end of 5-Colorscheme }}}

-- 6- Debug {{{
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
-- end of 6-Debug }}}

-- 7-Language {{{
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
    -- max_jobs = 10, -- use this when you hang in PackerSync
    display = {
      prompt_border = "rounded",
    },
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  },
}
