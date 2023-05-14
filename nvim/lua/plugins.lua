-- vim:foldmethod=marker

local Plugins

Plugins = {
  -- 1-Core {{{
  {
    "williamboman/mason.nvim",
    config = function()
      require "core.mason"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "core.lspconfig"
    end,
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "core.null-ls"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "williamboman/mason.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
    },
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require "core.project"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "core.treesitter"
    end,
    dependencies = {
      { "RRethy/nvim-treesitter-endwise" },
      -- { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    build = ":TSUpdate",
  },

  { "ii14/emmylua-nvim" },

  {
    "kevinhwang91/nvim-fundo",
    dependencies = "kevinhwang91/promise-async",
    run = function()
      require("fundo").install()
    end,
    config = function()
      require "core.fundo"
    end,
    enabled = false, -- WIP
  },

  -- end of 1-Core }}}

  -- 2-Edit {{{
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "edit.cmp"
    end,
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-calc" },
      { "saadparwaiz1/cmp_luasnip" },
      { "lukas-reineke/cmp-under-comparator" }, -- use for sort helper
    },
    event = "VeryLazy",
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require "edit.snip"
    end,
    -- dependencies = {
    --   "rafamadriz/friendly-snippets",
    -- },
    event = "VeryLazy",
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require "edit.comment"
    end,
    event = "VeryLazy",
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
    event = "VeryLazy",
  },

  {
    "RaafatTurki/hex.nvim",
    config = function()
      require "edit.hex"
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require "edit.autopairs"
    end,
    event = "VeryLazy",
  },

  {
    "echasnovski/mini.nvim",
    config = function()
      require "edit.mini"
    end,
    event = "VeryLazy",
  },
  -- end of 2-Edit }}}

  -- 3-Interface {{{
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "interface.lualine"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "akinsho/bufferline.nvim",
    config = function()
      require "interface.bufferline"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "utilyre/barbecue.nvim",
    config = function()
      require "interface.barbecue"
    end,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require "interface.statuscol"
    end,
    cond = function()
      if vim.fn.has "nvim-0.9.0" == 1 then
        return true
      end
    end,
    event = "VeryLazy",
  },

  {
    "folke/which-key.nvim",
    config = function()
      require "interface.which-key"
    end,
    event = "VeryLazy",
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require "interface.illuminate"
    end,
    event = "VeryLazy",
  },

  {
    "utilyre/sentiment.nvim",
    version = "*",
    config = function()
      require "interface.sentiment"
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    config = function()
      require "interface.ufo"
    end,
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "interface.indent-blankline"
    end,
    event = "VeryLazy",
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require "interface.dressing"
    end,
    event = "VeryLazy",
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "interface.lsp_signature"
    end,
    event = "VeryLazy",
  },

  {
    "onsails/lspkind-nvim",
    config = function()
      require "interface.lspkind"
    end,
    event = "VeryLazy",
  },

  {
    "goolord/alpha-nvim",
    config = function()
      require "interface.alpha"
    end,
  }, -- don't support lazy load

  {
    "j-hui/fidget.nvim",
    config = function()
      require "interface.fidget"
    end,
    event = "VeryLazy",
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require "interface.notify"
    end,
    event = "VeryLazy",
  },

  {
    "lewis6991/satellite.nvim",
    config = function()
      require "interface.satellite"
    end,
    event = "VeryLazy",
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require "interface.neoscroll"
    end,
    cond = function() -- Neovide has native scroll animation
      if not vim.g.neovide then
        return true
      end
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require "interface.bqf"
    end,
    event = "VeryLazy",
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require "interface.todo-comments"
    end,
    event = "VeryLazy",
  },

  {
    "chentoast/marks.nvim",
    config = function()
      require "interface.marks"
    end,
    event = "VeryLazy",
  },

  {
    "Bekaboo/deadcolumn.nvim",
    config = function()
      require "interface.deadcolumn"
    end,
    event = "VeryLazy",
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }, -- don't support lazy load
  -- end of 3-Interface }}}

  -- 4-Tool {{{
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "tool.tree"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = require("keymaps").nvimtree_toggle,
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "tool.telescope"
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-hop.nvim" },
      { "ahmedkhalf/project.nvim" },
      { "nvim-telescope/telescope-symbols.nvim" },
      -- { "nvim-telescope/telescope-media-files.nvim" },
      { "benfowler/telescope-luasnip.nvim" },
      -- { "nvim-telescope/telescope-live-grep-args.nvim" },  -- similar with native live grep
      -- { "nvim-telescope/telescope-ui-select.nvim" },  -- similar with dressing.nvim
      -- { "debugloop/telescope-undo.nvim" },
      -- { "nvim-telescope/telescope-project.nvim" },  -- similar with project.nvim
      -- { "nvim-telescope/telescope-dap.nvim" },
    },
    branch = "0.1.x",
    keys = require("keymaps").telescope_toggle,
  },

  -- origin hop.nvim repo is phaazon/hop.nvim, but it has bugs and not fix for a long time (since 2022.10), so I found a substitute one
  {
    "aznhe21/hop.nvim",
    config = function()
      require "tool.hop"
    end,
    branch = "fix-some-bugs",
    event = "VeryLazy",
  },

  {
    "chrisgrieser/nvim-spider",
    event = "VeryLazy",
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require "tool.symbols-outline"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = require("keymaps").symbolsoutline_toggle,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "tool.gitsigns"
    end,
    event = "VeryLazy",
  },

  {
    "akinsho/git-conflict.nvim",
    config = function()
      require "tool.git-conflict"
    end,
    event = "VeryLazy",
  },

  {
    "TimUntersberger/neogit",
    config = function()
      require "tool.neogit"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = require("keymaps").neogit_toggle,
  },

  {
    "sindrets/diffview.nvim",
    config = function()
      require "tool.diffview"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },

  {
    "Shatur/neovim-session-manager",
    config = function()
      require "tool.session-manager"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
  },

  {
    "aserowy/tmux.nvim",
    config = function()
      require "tool.tmux"
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/vim-ibus-sw",
    event = "VeryLazy",
  },

  {
    "vuki656/package-info.nvim",
    config = function()
      require "tool.package-info"
    end,
    dependencies = "MunifTanjim/nui.nvim",
    event = {
      "BufRead package.json",
      "BufRead package-lock.json",
    },
    ft = { "json" },
  },
  -- end of 4-Tool }}}

  -- 5-Debug {{{
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "debug.dap"
    end,
    event = "VeryLazy",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require "debug.dap-virtual-text"
    end,
    event = "VeryLazy",
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "debug.dap-ui"
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    event = "VeryLazy",
  },

  -- end of 5-Debug }}}

  -- 6-Language {{{
  { "plasticboy/vim-markdown", ft = { "markdown" } },

  { "b0o/SchemaStore.nvim", ft = { "json", "jsonc" } },
  -- end of 6-Language }}}

  -- 7-Colorscheme {{{
  -- Other color schemes can be found in closed_plugins.lua
  {
    "folke/tokyonight.nvim",
    config = function()
      require "colorscheme.tokyonight"
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    config = function()
      require "colorscheme.nightfox"
    end,
  },
  -- end of 7-Colorscheme }}}
}

return Plugins
