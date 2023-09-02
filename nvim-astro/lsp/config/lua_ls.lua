return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" }, -- recognize the `vim` global variable
      },
      workspace = {
        -- make the server aware of Neovim runtime files
        library = {
          vim.api.nvim_get_runtime_file("", true),
          ["${3rd}/luassert/library"] = true,
          ["${3rd/luv/library}"] = true,
        },
      },
      hint = {
        enable = true,
      },
      telemetry = {
        -- Do not send telemetry data containing a randomized but unique identifier
        enable = false,
      },
    },
  },
}
