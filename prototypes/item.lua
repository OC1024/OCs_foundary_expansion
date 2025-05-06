-- reuse code, graphics and sounds from the base game and space-age DLC
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({    
  { -- advanced foundry
  type = "item",
  name = "advanced-foundry",
  icon = "__OCs_foundary_expansion__/graphics/icons/advanced-foundry-icon.png", -- advanced foundry by Hurricane
  icon_size = 64, --icon_mipmaps = 4,
  group = "production",
  subgroup = "smelting-machine",
  order = "d[foundry]-a",
  stack_size = 5,
  weight = 400 * kg, -- twice the normal foundry
  place_result = "advanced-foundry",
},
})