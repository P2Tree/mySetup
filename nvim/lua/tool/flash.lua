local flash = require_plugin("flash")
if not flash then
  return
end

flash.setup({
  modes = {
    search = {
      enabled = true,  -- default: true
    },
    char = {
      enabled = true,  -- default: true
      jump_labels = true,  -- default: false
      keys = { "f", "F", ";", "," },
    }
  }
})
