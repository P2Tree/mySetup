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
      { "jay-babu/mason-null-ls.nvim" }
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

  {  "psliwka/vim-smoothie" },

  {  "editorconfig/editorconfig-vim" },

  {  "kevinhwang91/nvim-fundo",
    requires = "kevinhwang91/promise-async",
    run = function()
      require("fundo").install()
    end,
    config = function()
      require "tool.fundo"
    end,
    enabled = false,  -- WIP
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
      { "nvim-tree/nvim-web-devicons" },
    },
  },

  {  "akinsho/bufferline.nvim",
    config = function()
      require "interface.bufferline"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {  "utilyre/barbecue.nvim",
    config = function()
      require "interface.barbecue"
    end,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
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
    after = "catppuccin",  -- hlargs should be loaded after colorscheme
  },

  {  "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require "interface.lsp-inlayhints"
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
-- end of 3-Interface }}}

-- 4-Tool {{{
  {  "nvim-tree/nvim-tree.lua",
    config = function()
      require "tool.tree"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
    },
    event = "VeryLazy",
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
    event = "VeryLazy",
  },

  {  "simrat39/symbols-outline.nvim",
    config = function()
      require "tool.symbols-outline"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>s", "<Cmd>SymbolsOutline<CR>", desc = "Code Outline" },
    },
    event = "VeryLazy",
  },

  {  "lewis6991/gitsigns.nvim",
    config = function()
      require "tool.gitsigns"
    end,
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
    event = "VeryLazy",
  },

  {  "sindrets/diffview.nvim",
    config = function()
      require "tool.diffview"
    end,
  },

  {  "rbong/vim-flog" },

  {  "simnalamburt/vim-mundo",
    config = function()
      require "tool.mundo"
    end,
    keys = {
      { "<leader>u", "<Cmd>MundoToggle<CR>", desc = "Undo Tree" },
    },
    event = "VeryLazy",
  },

  {  "aserowy/tmux.nvim",
    config = function()
      require "tool.tmux"
    end,
  },

  {  "kevinhwang91/vim-ibus-sw" },

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

-- 5-Debug {{{
  {  "mfussenegger/nvim-dap",
    config = function()
      require "debug.dap"
    end,
    event = "VeryLazy",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
  },

  {  "Civitasv/cmake-tools.nvim",
    enabled = false,
  },

-- end of 5-Debug }}}

-- 6-Language {{{
  {  "plasticboy/vim-markdown",
    ft = { "markdown" },
  },

  {  "p00f/clangd_extensions.nvim",
    config = function()
      require "language.clangd_extensions"
    end,
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  },

  {  "b0o/SchemaStore.nvim",
    config = function()
      require "language.schema-store"
    end,
    ft = { "json", "jsonc" },
  },
-- end of 6-Language }}}

-- 7-Colorscheme {{{
  {  "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require "colorscheme.catppuccin"
    end,
    build = ":CatppuccinCompile",
  },

  {  "folke/tokyonight.nvim",
    config = function()
      require "colorscheme.tokyonight"
    end,
  },

  {  "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require "colorscheme.rose-pine"
    end,
  },

  {  "EdenEast/nightfox.nvim",
    config = function()
      require "colorscheme.nightfox"
    end,
  },

  {  "navarasu/onedark.nvim",
    config = function()
      require "colorscheme.onedark"
    end,
  },

  {  "ellisonleao/gruvbox.nvim",
    config = function()
      require "colorscheme.gruvbox"
    end,
  },
-- end of 7-Colorscheme }}}

}, {  -- lazy plugin configuration
  root = vim.fn.stdpath "data" .. "/lazy", -- directory where plugins will be installed
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = nil,
    -- version = "*", --enable this to try installing the latest stable versions of plugins
  },
  spec = nil, -- leave nil when passing the spec as the first argument to setup()
  lockfile = vim.fn.stdpath "config" .. "/lazy-lock.json", -- lockfile generated after running update.
  concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "--since=3 days ago" }, -- show commits from the last 3 dasy
    timeout = 120, -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    -- lazy.nvim requires git >= 2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This is should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
  dev = {
    -- directory where you store your local plugins projects
    path = "~/Documents/code/nvim",
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {}, -- For example {"folke"}
    fallback = true, -- Fallback to git when local plugin doesn't exist
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
    wrap = true, -- warp the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "鈴 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    -- leave nil, to automatically select a browser depending on your OS.
    -- If you want to use a specific browser, you can define it here
    browser = nil, --@type string?
    throttle = 20, -- how frequently should the ui process render events
    custom_keys = {
      -- you can define custom key maps here.
      -- To disable one of the defaults, set it to false

      -- open lazygit log
      ["<localleader>l"] = function(plugin)
        require("lazy.util").float_term({ "lazygit", "log" }, {
          cwd = plugin.dir,
        })
      end,
    },
  },
  diff = {
    -- diff command <d> can be one of:
    -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
    --   so you can have a different command for diff <d>
    -- * git: will run git diff and open a buffer with filetype git
    -- * terminal_git: will open a pseudo terminal with git diff
    -- * diffview.nvim: will open Diffview to show the diff
    cmd = "diffview.nvim",
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
      path = vim.fn.stdpath "cache" .. "/lazy/cache",
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      -- The default is to disable on:
      --  * VimEnter: not useful to cache anything else beyond startup
      --  * BufReadPre: this will be triggered early when opening a file from the command line directly
      disable_events = { "UIEnter", "BufReadPre" },
      ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
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
    files = { "README.md", "lua/**/README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath "state" .. "/lazy/state.json", -- state info for checker and other things
})

vim.keymap.set("n", "<leader>ol", "<Cmd>Lazy<CR>", { silent = true, desc = "Plugin manager" })
