local ok, sentiment = pcall(require, "sentiment")
if not ok then
  vim.notify "Could not load satellite"
  return
end

sentiment.setup {
  --- Dictionary to check whether a buftype should be included
  ---
  --- @type table<string, boolean>
  included_buftypes = {
    [""] = true,
  },

  --- Dictionary to check whether a filetype should be excluded
  ---
  --- @type table<string, boolean>
  excluded_filetypes = {},

  --- Dictionary to check whether a mode should be incluled
  ---
  --- @type table<string, boolean>
  included_modes = {
    n = true,
    i = true,
  },

  --- How much (in milliseconds) should the cursor stay still to calculate and
  --- render a pair
  ---
  --- NOTE: It's recommended to set this somewhere above and close to your key
  --- repeat speed in order to keep the calculations at minimum.
  ---
  --- @type integer
  delay = 50,


  --- How many lines to look backwards/forwards to find a pair
  ---
  --- @type integer
  limit = 100,

  --- List of `(left, right)` pairs
  ---
  --- NOTE: Both sides of a pair can't have the same character.
  ---
  --- @type tuple<string, string>[]
  pairs = {
    { "(", ")" },
    { "{", "}" },
    { "[", "]" },
  },
}

