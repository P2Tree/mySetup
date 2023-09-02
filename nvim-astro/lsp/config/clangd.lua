return {
  capabilities = {
    -- the offset_encoding of clangd will confilicts with null-ls, so add this
    offsetEncoding = "utf-8",
  },
}
