return {
  {
    "akinsho/git-conflict.nvim",
    event = "User AstroGitFile",
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "GitConflictDetected",
        callback = function() vim.notify("Conflict detected in " .. vim.fn.expand "<afile>") end,
      })
    end,
  },
}
