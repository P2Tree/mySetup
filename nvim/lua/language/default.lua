-- Default LSP server settigns
local M = {}

local ufo = require_plugin("ufo")
if not ufo then
  return
end

M.set_keymap = function(bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Diagnostic" })

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaration" })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })

  vim.keymap.set("n", "gk", function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
      -- choose one of coc.nvim and nvim LSP
      -- vim.fn.CocActionAsync "definitionHover" -- for coc.nvim
      vim.lsp.buf.hover() -- for nvim LSP
    end
   end, { buffer = bufnr, desc = "LSP: Hover" })
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })

  vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format { async = true }
  end, { buffer = bufnr, desc = "Format document" })

  vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
  vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { buffer = bufnr, desc = "Diagnostic list" })
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { buffer = bufnr, desc = "Diagnostic float" })
  vim.keymap.set("n", "<leader>lq", ":lclose<cr>", { silent = true, desc = "Close Diagnostic list" })

  vim.keymap.set(
    "n",
    "<leader>lwa",
    vim.lsp.buf.add_workspace_folder,
    { buffer = bufnr, desc = "Add workspace folder" }
  )
  vim.keymap.set(
    "n",
    "<leader>lwr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, desc = "Remove workspace folder" }
  )
  vim.keymap.set("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = "List workspace folders" })
end

M.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Disable semantic tokens
  client.server_capabilities.semanticTokensProvider = nil

  M.set_keymap(bufnr)
end

return M
