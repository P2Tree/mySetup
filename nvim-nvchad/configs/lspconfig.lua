local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local noice = require "noice"
vim.notify = noice.notify
vim.lsp.handlers["textDocument/hover"] = noice.hover
vim.lsp.handlers["textDocument/signatureHelp"] = noice.signature

-- if you just want default config for the servers then put them in a table
local servers = { "clangd", "pyright", "jsonls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- or custom specific server
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          vim.api.nvim_get_runtime_file("", true),
          ["${3rd}/luassert/library"] = true,
          ["${3rd/luv/library}"] = true,
        },
      },
      telemetry = {
        -- Do not send telemetry data containing a randomized but unique identifier
        enable = false,
      },
    },
  },
}
