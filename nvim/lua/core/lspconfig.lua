local lspconfig = require_plugin("lspconfig")
local cmp_nvim_lsp = require_plugin("cmp_nvim_lsp")
local mason = require_plugin("mason-lspconfig")
if not lspconfig or not cmp_nvim_lsp or not mason then
  return
end

local default = require "language.default"

-- Set diagnostic options
vim.diagnostic.config {
  virtual_text = {
    spacing = 4,
    prefix = "●",
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

-- TODO: Use lsp_signature instead
-- vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
-- vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

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

mason.setup()

mason.setup_handlers {
  function(server)
    lspconfig[server].setup(default)
  end,

  jdtls = function(server) end,
  tsserver = function(server) end,
  jsonls = function(server) end,

  clangd = function()
    lspconfig.clangd.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        default.on_attach(client, bufnr)
        vim.keymap.set("n", "<localleader>t", "<cmd>ClangdAST<CR>", { buffer = bufnr, desc = "Show AST" })
        vim.keymap.set("n", "<localleader>s", "<cmd>ClangdSymbolInfo<cr>", { buffer = bufnr, desc = "Show type info" })
        vim.keymap.set(
          "n",
          "<leader>a",
          "<cmd>ClangdSwitchSourceHeader<CR>",
          { buffer = bufnr, desc = "Switch between source and header" }
        )
        vim.keymap.set(
          "n",
          "<localleader>h",
          "<cmd>ClangdTypeHierarchy<CR>",
          { buffer = bufnr, desc = "Show type hierarchy" }
        )
        vim.keymap.set(
          "n",
          "<localleader>m",
          "<cmd>ClangdMemoryUsage<CR>",
          { buffer = bufnr, desc = "Clangd memory usage" }
        )
      end,
    }
  end,

  lua_ls = function()
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        default.on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
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
            globals = {
              'vim'
            },
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

  pyright = function()
    lspconfig.pyright.setup {
      capabilities = capabilities,
      on_attach = default.on_attach,
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
