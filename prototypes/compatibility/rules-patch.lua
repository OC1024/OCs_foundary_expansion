-- register new alt recipes
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

generator_api.register_single_alt_recipe("metallurgy", "space-platform-foundation",
  { "tungsten-space-platform-foundation", "space-platform-foundation" })
-- generator_api.register_single_alt_recipe("metallurgy","space-platform-foundation",{"space-platform-foundation","tungsten-space-platform-foundation"})

if not settings.startup["supress-extra-fluid-limit"].value then
  local machine_fluid_limits = {
    ["metallurgy"] = 3 -- advanced foundry
  }
  generator_api.register_machine_fluid_limits(machine_fluid_limits)
  log("late rules change for advanced foundry")
else
  log("supress-extra-fluid-limit is enabled, skipping late rules change for advanced foundry. Should now be 2.")
end
