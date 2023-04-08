local tree = require_plugin("nvim-tree")
if not tree then
  return
end

tree.setup {
  -- auto_reload_on_write = true,
  disable_netrw = true,
  -- hijack_cursor = false,
  -- hijack_netrw = true,
  -- hijack_unnamed_buffer_when_opening = false,
  -- sort_by = "name",
  -- root_dirs = {},
  -- prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  on_attach = "disable",
  -- remove_keymaps = false,
  -- select_prompts = false,
  view = {
    -- centralize_selection = false,
    width = function()
      local columns = vim.go.columns
      return math.floor(columns * 0.2) > 25 and math.floor(columns * 0.2) or 25
    end,
    -- hide_root_folder = false,
    -- side = "left",
    -- preserve_window_proportions = false,
    -- number = false,
    -- relativenumber = false,
    -- signcolumn = "yes",
    mappings = {
      -- custom_only = false,
      list = {
        -- user mappings go here
        { key = "?",     action = "toggle_help" },
      },
    },
    -- float = {
    --   enable = false,
    --   quit_on_focus_loss = true,
    --   open_win_config = {
    --     relative = "editor",
    --     border = "rounded",
    --     width = 30,
    --     height = 30,
    --     row = 1,
    --     col = 1,
    --   },
    -- },
  },
  renderer = {
    -- add_trailing = false,
    group_empty = true,
    -- highlight_git = false,
    -- full_name = false,
    highlight_opened_files = "icon",
    -- highlight_modified = "none",
    -- root_folder_modifier = ":~:s?$?/..?",
    -- indent_width = 2,
    indent_markers = {
      enable = true,
      -- inline_arrows = true,
      -- icons = {
      --   corner = "└",
      --   edge = "│",
      --   item = "│",
      --   bottom = "─",
      --   none = " ",
      -- },
    },
    icons = {
      -- webdev_colors = true,
      -- git_placement = "before",
      -- modified_placement = "after",
      -- padding = " ",
      -- symlink_arrow = " ➛ ",
      -- show = {
      --   file = true,
      --   folder = true,
      --   folder_arrow = true,
      --   git = true,
      --   modified = true,
      -- },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "⚐",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "✖",
          ignored = "◌",
        },
      },
    },
    -- special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    -- symlink_destination = true,
  },
  -- hijack_directories = {
  --   enable = true,
  --   auto_open = true,
  -- },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  -- system_open = {
  --   cmd = "",
  --   args = {},
  -- },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true,
    -- git_clean = false,
    -- no_buffer = false,
    -- custom = {},
    -- exclude = {},
  },
  -- filesystem_watchers = {
  --   enable = true,
  --   debounce_delay = 50,
  --   ignore_dirs = {},
  -- },
  -- git = {
  --   enable = true,
  --   ignore = true,
  --   show_on_dirs = true,
  --   show_on_open_dirs = true,
  --   timeout = 400,
  -- },
  -- modified = {
  --   enable = false,
  --   show_on_dirs = true,
  --   show_on_open_dirs = true,
  -- },
  actions = {
    -- use_system_clipboard = true,
    -- change_dir = {
    --   enable = true,
    --   global = false,
    --   restrict_above_cwd = false,
    -- },
    -- expand_all = {
    --   max_folder_discovery = 300,
    --   exclude = {},
    -- },
    -- file_popup = {
    --   open_win_config = {
    --     col = 1,
    --     row = 1,
    --     relative = "cursor",
    --     border = "shadow",
    --     style = "minimal",
    --   },
    -- },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      -- window_picker = {
      --   enable = true,
      --   picker = "default",
      --   chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      --   exclude = {
      --     filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
      --     buftype = { "nofile", "terminal", "help" },
      --   },
      -- },
    },
    -- remove_file = {
    --   close_window = true,
    -- },
  },
  -- trash = {
  --   cmd = "gio trash",
  -- },
  -- live_filter = {
  --   prefix = "[FILTER]: ",
  --   always_show_folders = true,
  -- },
  -- tab = {
  --   sync = {
  --     open = false,
  --     close = false,
  --     ignore = {},
  --   },
  -- },
  -- notify = {
  --   threshold = vim.log.levels.INFO,
  -- },
  -- ui = {
  --   confirm = {
  --     remove = true,
  --     trash = true,
  --   },
  -- },
  -- log = {
  --   enable = false,
  --   truncate = false,
  --   types = {
  --     all = false,
  --     config = false,
  --     copy_paste = false,
  --     dev = false,
  --     diagnostics = false,
  --     git = false,
  --     profile = false,
  --     watcher = false,
  --   },
  -- },
}

vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "File Explorer" })
