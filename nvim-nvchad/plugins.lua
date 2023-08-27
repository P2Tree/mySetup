---@type NvPluginSpec[]
local plugins = {

	--- Install a plugin
	--- All NvChad plugins are lazy-loaded by default
	--- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	--- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example

	--- 1-Core {{{
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
			{
				"williamboman/mason.nvim",
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
						"shellcheck", -- shell
					},
				},
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"cpp",
				"c",
				"llvm",
				"tablegen",
				"cuda",
				"json",
				"yaml",
				"ini",
				"markdown",
				"python",
				"ninja",
				"make",
				"cmake",
				"diff",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
			},
			indent = { enable = false },  -- have bug in switch case indent
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					node_decremental = "<BS>",
					scope_incremental = "<TAB>",
				},
			},
			endwise = { enable = true },
		},
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
		},
	},
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		opts = {
			detection_methods = { "pattern", "lsp" },
			patterns = { "compile_commands.json", ".git", "package.json" },
			show_hidden = true,
			silent_chdir = false,
		},
		config = function(_, opts)
			require("project_nvim").setup(opts)
		end,
	},
	--- 1-Core }}}

	--- 2-Edit {{{
	--- 2-Edit }}}

	--- 3-Interface {{{
	{ "lewis6991/gitsigns.nvim", opts = {
		signs = {
			delete = { text = "_" },
		},
		current_line_blame = true,
	} },
	{
		"utilyre/barbecue.nvim",
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
	{
		"folke/noice.nvim",
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
	{ "luukvbaal/statuscol.nvim", event = "VeryLazy", config = true },
	{ "utilyre/sentiment.nvim", event = "VeryLazy", config = true },
	{ "petertriho/nvim-scrollbar", event = "VeryLazy", config = true },
	{ "karb94/neoscroll.nvim", event = "VeryLazy", config = true },
	{
		"kevinhwang91/nvim-bqf",
		opts = {
			preview = {
				winblend = 5, -- default is 12
			},
		},
		ft = "qf",
	},
	{ "folke/todo-comments.nvim", event = "VeryLazy", config = true },
	{ "chentoast/marks.nvim", event = "VeryLazy", config = true },
	{ "rainbowhxch/beacon.nvim", event = "VeryLazy", config = true },
	--- 3-Interface }}}

	--- 4-Tool {{{
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				set_env = { ["COLORTERM"] = "truecolor" },
				mappings = {
					i = {
						-- ["<ESC>"] = require("telescope.actions").close,

						-- These keymap is only used to fix the issue auto enter the
						-- insert mode when select item and open buffer from telescope
						-- prompt
						-- It may fixed in the new version of neovim.
						-- Try disable in 0.10
						["<CR>"] = function()
							vim.api.nvim_feedkeys(
								vim.api.nvim_replace_termcodes("<ESC><CR>", true, false, true),
								"i",
								false
							)
						end,
					},
				},
			},
			extensions_list = { "themes", "terms", "fzf", "ui-select" }, -- NvChad use it
			extensions = {
				["fzf"] = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
				},
				["ui-select"] = {
					require("telescope.themes").get_cursor(),
				},
			},
		},
		dependencies = {
			"nvim-telescope/telescope-symbols.nvim",
			{
				"nvim-telescope/telescope-ui-select.nvim",
				config = function()
					require("telescope").load_extension("ui-select")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			sync_root_with_cwd = true,
			reload_on_bufenter = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
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
	{
		"folke/flash.nvim",
		opts = {
			modes = {
				search = { enabled = false },
				char = { enabled = false },
			},
		},
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle" },
		init = function()
			require("core.utils").load_mappings("aerial")
		end,
		opts = {
			layout = {
				default_direction = "right",
			},
			close_on_select = true,
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"akinsho/git-conflict.nvim",
		event = "VeryLazy",
		config = true,
		enabled = function()
			--- load only when a git file is opened
			vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
			if vim.v.shell_error == 0 then
				return true
			end
		end,
	},
	{ "alexghergh/nvim-tmux-navigation",
	  event = "VeryLazy",
	  opts = {
		  disable_when_zoomed = true,  -- default to false
		},
	},
	{
		"rainbowhxch/accelerated-jk.nvim",
		event = "VeryLazy",
		config = function(_, opts)
			require("accelerated-jk").setup(opts)
			vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
			vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})
		end,
	},
	-- session saving and restore
	{ "folke/persistence.nvim", event = "BufReadPre", config = true },
	-- light markdown preview tool
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	-- show reference, defination number count
	{ "VidocqH/lsp-lens.nvim", event = "VeryLazy", config = true },
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = true,
					bo = {
						filetype = { "fidget" },
					},
				},
			})
		end,
		keys = {
			{
				"<C-w>p",
				function()
					local window_number = require("window-picker").pick_window()
					if window_number then
						vim.api.nvim_set_current_win(window_number)
					end
				end,
				"Pick windows",
			},
		},
	},
  { "stevearc/overseer.nvim",
    event = "VeryLazy",
    opts = {},
  }
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
	},
})

return plugins
