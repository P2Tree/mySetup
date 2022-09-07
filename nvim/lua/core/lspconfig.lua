local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify "Could not load lspconfig"
  return
end

local ok, mason = pcall(require, "mason-lspconfig")
if not ok then
  vim.notify "Could not load mason-lspconfig"
  return
end

-- local ok, color = pcall(require, "document-color")
-- if not ok then
--   vim.notify "Could not load document-color"
--   return
-- end

-- Set diagnostic options
vim.diagnostic.config {
  virtual_text = {
    spacing = 4,
    prefix = "●",
    severity = {
      vim.diagnostic.severity.ERROR,
      vim.diagnostic.severity.WARN,
      vim.diagnostic.severity.INFO,
      vim.diagnostic.severity.HINT,
    }
  },
  float = {
    severity_sort = true,
    -- source = "if_many",
  },
  severity_sort = true,
}

-- Set diagnostic icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- TODO: Use lsp_signature instead
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local default = require "language.default"

mason.setup()

mason.setup_handlers {
  function(server)
    lspconfig[server].setup(default)
  end,

  clangd = function(server) end,
  rust_analyzer = function(server) end,
  tsserver = function(server) end,
  jsonls = function(server) end,

  -- sumneko_lua = function(server) end,  -- we needs some config for lua lsp
  sumneko_lua = function()
    lspconfig.sumneko_lua.setup {
      capabilities = default.capabilities,
      on_attach = function(client, bufnr)
        default.on_attach(client, bufnr)
      end,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the 'vim' global
            globals = {
              'vim'
            },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          }
        }
      }
    }
  end,

  -- tailwindcss = function()
  --   local capabilities = default.capabilities
  --   capabilities.textDocument.colorProvider = {
  --     dynamicRegistration = false,
  --   }

  --   lspconfig.tailwindcss.setup {
  --     on_attach = function(client, bufnr)
  --       default.on_attach(client, bufnr)
  --       color.buf_attach(bufnr)
  --     end,
  --     capabilities = capabilities,
  --   }
  -- end,
}
