data.raw["recipe"]["engine-unit"].category = "metallurgy-or-assembling"  -- use this as hotfix of the mod "foundry-expanded"

-- -- adding items to the base item list
-- if casting_materials then
--   local additions = {
--     ["stone-brick"] = { liquid = "lava", ratio = 20, energy_required = 1.2 },
--     ["glass"]       = { liquid = "lava", ratio = 25, energy_required = 1.5 },
--     ["sand"]        = { liquid = "lava", ratio = 10, energy_required = 0.8 },
--   }

--   for name, props in pairs(additions) do
--     casting_materials[name] = props
--   end
-- end

-- -- adding to the blacklist
-- if casting_blacklist then
--     casting_blacklist["special-gear"] = true
-- end
-- if category_blacklist then
--     category_blacklist["organic"] = true
-- end
-- -- removing from the whitelist
-- for i, name in ipairs(whitelist) do
--     if name == "stone-wall" then
--       table.remove(whitelist, i)
--       break -- nur einmal löschen
--     end
-- end

require("__OCs_base_assets__.prototypes.utils.casting-generator")
-- require("prototypes/entity-updates")
-- require("prototypes/item-updates")
require("prototypes.recipe-updates")
require("prototypes.technology-updates")