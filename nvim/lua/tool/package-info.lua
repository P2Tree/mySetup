local info = require_plugin("package-info")
if not info then
  return
end

info.setup {
  colors = {
    up_to_date = "#3C4048", -- Text color for up to date package virtual text
    outdated = "#d19a66", -- Text color for outdated package virtual text
  },
  icons = {
    enable = true, -- Whether to display icons
    style = {
      up_to_date = "|  ", -- Icon for up to date packages
      outdated = "|  ", -- Icon for outdated packages
    },
  },
  autostart = true, -- Whether to autostart when `package.json` is opened
  hide_up_to_date = true, -- It hides up to date versions when displaying virtual text
  hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
  -- Can be `npm` or `yarn`. Used for `delete`, `install` etc...
  -- The plugin will try to auto-detect the package manager based on
  -- `yarn.lock` or `package-lock.json`. If none are found it will use the
  -- provided one, if nothing is provided it will use `yarn`
  package_manager = "npm",
}
