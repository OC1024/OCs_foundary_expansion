-- reuse code, graphics and sounds from the base game and space-age DLC
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

-- data:extend({
--   {
--     type = "item",
--     name = "heavy-armor-plating",
--     icon = "__OCs_foundary_expansion__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
--     icon_size = 64, --icon_mipmaps = 4,
--     group = "intermediate-products",
--     subgroup = "military-equipment",
--     order = "z",
--     stack_size = 20,
--     weight = 100 * kg,
--   },
--   {
--     type = "item",
--     name = "ablative-armor-equipment",
--     icons =
--     {
--       {
--         icon = "__OCs_foundary_expansion__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
--         icon_size = 64,
--         -- icon_mipmaps = 4,
--       },
--       {
--         icon = "__base__/graphics/equipment/energy-shield-equipment.png",
--         icon_size = 128,
--         icon_scale = 0.125,
--         shift = {16, -16},
--         -- icon_mipmaps = 4,
--       }
--     },
--     group = "intermediate-products",
--     subgroup = "military-equipment",
--     order = "a[shield]-a[energy-shield-equipment]",
--     inventory_move_sound = item_sounds.energy_shield_inventory_move,
--     pick_sound = item_sounds.energy_shield_inventory_pickup,
--     drop_sound = item_sounds.energy_shield_inventory_move,
--     stack_size =10,
--     weight = 100 * kg,
--   },
-- })