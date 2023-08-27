return function()
  local llvmAutoGroup = vim.api.nvim_create_augroup("llvmAutoGroup", {
    clear = true,
  })

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.ll" },
    group = llvmAutoGroup,
    command = "set filetype=llvm",
  })
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.td" },
    group = llvmAutoGroup,
    command = "set filetype=tablegen",
  })
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.cu", "*.su" },
    group = llvmAutoGroup,
    command = "set filetype=cpp",
  })
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.Makefile" },
    group = llvmAutoGroup,
    command = "set filetype=make",
  })
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.rst" },
    group = llvmAutoGroup,
    command = "set filetype=rest",
  })

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "c,cpp,h,hpp,tablegen,llvm" },
    group = llvmAutoGroup,
    command = "set expandtab | set tabstop=2 | set softtabstop=2 | set shiftwidth=2 | set textwidth=80 | set colorcolumn=81",
  })
end
