local lspconfig = require_plugin("lspconfig")
local cmp_nvim_lsp = require_plugin("cmp_nvim_lsp")
local mason = require_plugin("mason-lspconfig")
if not lspconfig or not cmp_nvim_lsp or not mason then
  return
end

-- Set diagnostic options
vim.diagnostic.config {
  virtual_text = {
    spacing = 4,
    prefix = "", -- ●
    severity = vim.diagnostic.severity.ERROR,
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

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
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

  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()
-- Enable LSP foldingRange capability
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
  offsetEncoding = "utf-8",
}

local default_option = {}
default_option.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Custom keymaps of lsp
  require("keymaps").lsp(bufnr)
end

mason.setup()

mason.setup_handlers {
  --- Default handler and will be called for each installed server that
  --- doesn't have a dedicated handler
  function(server)
    lspconfig[server].setup(default_option)
  end,

  --- Provide dedicated handler for specific servers:

  -- Need to install json-lsp
  jsonls = function()
    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
      capabilities = default_option.capabilities,
      on_attach = function(client, bufnr)
        default_option.on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
    }
  end,

  -- Need to install clangd
  clangd = function()
    lspconfig.clangd.setup {
      capabilities = capabilities,
      on_attach = default_option.on_attach,
    }
  end,

  -- Need to install lua-language-server
  lua_ls = function()
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_attach = default_option.on_attach,
      settings = {
        Lua = {
          hint = {
            enable = true,
            setType = true,
            arrayIndex = "Disable",
          },
          completion = {
            callSnippet = "Replace",
            postfix = ".",
            showWord = "Disable",
            workspaceWord = false,
          },
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the 'vim' global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library =  {
              vim.api.nvim_get_runtime_file("", true),
              ["${3rd}/luassert/library"] = true,
              ["${3rd}/luv/library"] = true,
            }
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          }
        }
      }
    }
  end,

  -- Need to install pyright
  pyright = function()
    lspconfig.pyright.setup {
      capabilities = capabilities,
      on_attach = default_option.on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
          },
        },
      },
    }
  end,
}
