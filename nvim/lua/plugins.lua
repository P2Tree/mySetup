-- vim:foldmethod=marker
---@diagnostic disable: different-requires
-- Automatically download lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system { "git", "clone", "--filter=blob:none", "--single-branch", "https://github.com/folke/lazy.nvim.git", lazypath, }
end

vim.opt.runtimepath:prepend(lazypath)

local lazy = require "lazy"

lazy.setup({
-- 1-Core {{{
    {  "neovim/nvim-lspconfig",
      config = function()
        require "core.lspconfig"
      end,
      dependencies = { "williamboman/mason-lspconfig.nvim" },
      after = "mason.nvim",
    },

    {  "williamboman/mason.nvim",
      config = function()
        require "core.mason"
      end,
    },

    {  "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "core.null-ls"
      end,
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "neovim/nvim-lspconfig" },
      },
    },

    {  "ahmedkhalf/project.nvim",
      config = function()
        require "core.project"
      end,
    },

    {  "nvim-treesitter/nvim-treesitter",
      config = function()
        require "core.treesitter"
      end,
      dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "windwp/nvim-ts-autotag" },
        { "mrjones2014/nvim-ts-rainbow" },
        { "RRethy/nvim-treesitter-endwise" },
        { "RRethy/nvim-treesitter-textsubjects", disable = false },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
      },
      build = ":TSUpdate",
    },

    { "tpope/vim-sleuth" },

    {  "nathom/filetype.nvim",
      config = function()
        require "core.filetype"
      end,
    },

    {  "ii14/emmylua-nvim",
      lazy = true,
    },
-- end of 1-Core }}}

-- 2-Edit {{{
    {  "hrsh7th/nvim-cmp",
      config = function()
        require "edit.cmp"
      end,
      dependencies = {
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
      event = "VeryLazy",
    },

    {  "L3MON4D3/LuaSnip",
      config = function()
        require "edit.snip"
      end,
      event = "VeryLazy",
    },

    {  "b3nj5m1n/kommentary",
      config = function()
        require "edit.kommentary"
      end,
      event = "VeryLazy",
    },

    {  "kylechui/nvim-surround",
      config = function()
        require "edit.surround"
      end,
      event = "VeryLazy",
    },

    {  "RaafatTurki/hex.nvim",
      config = function()
        require "edit.hex"
      end,
    },

    {  "lewis6991/spellsitter.nvim",
      config = function()
        require "edit.spellsitter"
      end,
    },

    {  "windwp/nvim-autopairs",
      config = function()
        require "edit.autopairs"
      end,
      event = "VeryLazy",
    },
-- end of 2-Edit }}}

-- 3-Interface {{{
    {  "nvim-lualine/lualine.nvim",
      config = function()
        require "interface.lualine"
      end,
      dependencies = {
        { "kyazdani42/nvim-web-devicons" },
      },
    },

    {  "akinsho/bufferline.nvim",
      config = function()
        require "interface.bufferline"
      end,
      dependencies = { "kyazdani42/nvim-web-devicons" },
    },

    {  "utilyre/barbecue.nvim",
      config = function()
        require "interface.barbecue"
      end,
      dependencies = {
        "neovim/nvim-lspconfig",
        -- "SmiteshP/nvim-navic",
        "kyazdani42/nvim-web-devicons",
      },
    },

    {  "luukvbaal/statuscol.nvim",
      enabled = false, -- Requires neovim 0.9
    },

    {  "RRethy/vim-illuminate",
      config = function()
        require "interface.illuminate"
      end,
    },

    {  "kevinhwang91/nvim-ufo",
      config = function()
        require "interface.ufo"
      end,
      dependencies = "kevinhwang91/promise-async",
    },

    {  "m-demare/hlargs.nvim",
      config = function()
        require "interface.hlargs"
      end,
    },

    {  "zbirenbaum/neodim",
      config = function()
        require "interface.dim"
      end,
    },

    {  "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "interface.indent-blankline"
      end,
    },

    {  "stevearc/dressing.nvim",
      config = function()
        require "interface.dressing"
      end,
    },

    {  "onsails/lspkind-nvim",
      config = function()
        require "interface.lspkind"
      end,
    },

    {  "mhinz/vim-startify" },

    {  "j-hui/fidget.nvim",
      config = function()
        require "interface.fidget"
      end,
    },

    {  "rcarriga/nvim-notify",
      config = function()
        require "interface.notify"
      end,
    },

    {  "petertriho/nvim-scrollbar",
      config = function()
        require "interface.scrollbar"
      end,
    },

    {  "kevinhwang91/nvim-bqf",
      ft = 'qf',
      config = function()
        require "interface.bqf"
      end,
    },

    {  "folke/todo-comments.nvim",
      config = function()
        require "interface.todo-comments"
      end,
    },

    {  "psliwka/vim-smoothie" },

    {  "bennypowers/nvim-regexplainer",
      config = function()
        require "interface.regexplainer"
      end,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
    },
-- end of 3-Interface }}}

-- 4-Tool {{{
    {  "nvim-tree/nvim-tree.lua",
      config = function()
        require "tool.tree"
      end,
      dependencies = { "kyazdani42/nvim-web-devicons" },
      keys = {
        { "<leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
      },
    },

    {  "nvim-telescope/telescope.nvim",
      config = function()
        require "tool.telescope"
      end,
      dependencies = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "nvim-telescope/telescope-hop.nvim" },
        { "ahmedkhalf/project.nvim" },
        -- { "nvim-telescope/telescope-project.nvim" },
        -- { "nvim-telescope/telescope-symbols.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" },
        { "nvim-telescope/telescope-dap.nvim" },
        { "benfowler/telescope-luasnip.nvim" },
      },
      branch = "0.1.x",
      event = "VeryLazy",
    },

    {  "phaazon/hop.nvim",
      config = function()
        require "tool.hop"
      end,
      branch = "v2",
    },

    {  "mfussenegger/nvim-treehopper",
      config = function()
        require "tool.treehopper"
      end,
    },

    {  "simrat39/symbols-outline.nvim",
      config = function()
        require "tool.symbols-outline"
      end,
      dependencies = { "kyazdani42/nvim-web-devicons" },
      cmd = { "SymbolsOutline" },
    },

    {  "lewis6991/gitsigns.nvim",
      config = function()
        require "tool.gitsigns"
      end,
      dependencies = "nvim-lua/plenary.nvim",
    },

    {  "akinsho/git-conflict.nvim",
      config = function()
        require "tool.git-conflict"
      end,
    },

    {  "TimUntersberger/neogit",
      config = function()
        require "tool.neogit"
      end,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
      },
      keys = {
        { "<leader>gg", "<Cmd>Neogit<CR>", desc = "Open Neogit" },
      },
    },

    {  "sindrets/diffview.nvim",
      config = function()
        require "tool.diffview"
      end,
      keys = {
        { "<leader>gdo", "<Cmd>DiffviewOpen<CR>", desc = "Open DiffView" },
        { "<leader>gdc", "<Cmd>DiffviewClose<CR>", desc = "Close DiffView" },
        { "<leader>gdh", "<Cmd>DiffviewFileHistory<CR>", desc = "Open History" },
      },
    },

    {  "rbong/vim-flog" },

    {  "simnalamburt/vim-mundo",
      config = function()
        require "tool.mundo"
      end,
      keys = {
        { "<leader>u", "<Cmd>MundoToggle<CR>", desc = "Undo Tree" },
      },
    },

    {  "aserowy/tmux.nvim",
      config = function()
        require "tool.tmux"
      end,
    },

    {  "kevinhwang91/vim-ibus-sw" },

    { "Pocco81/auto-save.nvim",
      config = function()
        require "tool.auto-save"
      end,
    },

    {  "dstein64/vim-startuptime",
      cmd = { "StartupTime" },
    },

    {  "vuki656/package-info.nvim",
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

-- {{{ 5-Colorscheme
    {  "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require "colorscheme.catppuccin"
      end,
      build = ":CatppuccinCompile", -- if use catppuccin/nvim
    },

-- end of 5-Colorscheme }}}

-- 6- Debug {{{
    {  "mfussenegger/nvim-dap",
      config = function()
        require "debug.dap"
      end,
    },

    {  "theHamsta/nvim-dap-virtual-text",
      config = function()
        require "debug.dap-virtual-text"
      end,
    },

    {  "rcarriga/nvim-dap-ui",
      config = function()
        require "debug.dap-ui"
      end,
    },

    {  "mfussenegger/nvim-dap-python",
      config = function()
        require "debug.dap-python"
      end,
      ft = { "python" },
    },

    {  "rafcamlet/nvim-luapad",
      ft = { "lua" },
    },
-- end of 6-Debug }}}

-- 7-Language {{{
    {  "plasticboy/vim-markdown",
      ft = { "markdown" },
    },

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

    {  "b0o/SchemaStore.nvim",
      config = function()
        require "language.schema-store"
      end,
      ft = { "json", "jsonc" },
    },
-- }}}
}, {  -- lazy plugin configuration
  root = vim.fn.stdpath "data" .. "/lazy", -- directory where plugins will be installed
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = nil,
    -- version = "*", --enable this to try installing the latest stable versions of plugins
  },
  lockfile = vim.fn.stdpath "config" .. "/lazy-lock.json", -- lockfile generated after running update.
  concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "--since=3 days ago" }, -- show commits from the last 3 dasy
    timeout = 120, -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
  },
  dev = {
    -- directory where you store your local plugins projects
    path = "~/Documents/code/nvim",
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {}, -- For example {"folke"}
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "habamax" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      keys = " ",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
    },
    throttle = 20, -- how frequently should the ui process render events
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath "state" .. "/lazy/cache",
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      -- The default is to disable on:
      --  * VimEnter: not useful to cache anything else beyond startup
      --  * BufReadPre: this will be triggered early when opening a file from the command line directly
      disable_events = { "VimEnter", "BufReadPre" },
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to indluce in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    root = vim.fn.stdpath "state" .. "/lazy/readme",
    files = { "README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
})

vim.keymap.set("n", "<leader>ol", "<Cmd>Lazy<CR>", { silent = true, desc = "Plugin manager" })
