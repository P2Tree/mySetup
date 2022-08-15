vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = { "*.ll" }, command = "set filetype=llvm",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = { "*.td" }, command = "set filetype=tablegen",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = { "*.cu" }, command = "set filetype=cpp",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = { "*.su" }, command = "set filetype=cpp",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = { "*.Makefile" }, command = "set filetype=make",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
  { pattern = { "*.rst" }, command = "set filetype=rest",
})

vim.api.nvim_create_autocmd({ "FileType" },
  { pattern = { "c,cpp,tablegen,llvm" }, command = "set expandtab | set tabstop=2 | set shiftwidth=2",
})
vim.api.nvim_create_autocmd({ "FileType" },
  { pattern = { "c,cpp,tablegen,llvm" }, command = "set textwidth=100 | set colorcolumn=101"
})
