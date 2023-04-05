local schemastore = require_plugin("schemastore")
local lspconfig = require_plugin("lspconfig")
if not schemastore or not lspconfig then
  return
end

local default = require "language.default"

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
  on_attach = function(client, bufnr)
    default.on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = default.capabilities,
}
