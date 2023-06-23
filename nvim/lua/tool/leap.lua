local leap = require_plugin("leap")
if not leap then
  return
end

leap.add_default_mappings()

-- Show labels and/or highlights matches right after the first input character
-- Default: nil (2 characters)
leap.opts.max_phase_one_targets = 0

-- Consider case in search patterns
-- Default: false
leap.opts.case_sensitive = true

