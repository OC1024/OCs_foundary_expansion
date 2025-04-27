
require("__OCs_base_assets__.prototypes.utils.casting-generator")
-- casting.generate_casting_from_recipe(casting.casting_materials)
-- generate_casting_from_recipe(data.raw.recipe["transport-belt"])
-- generate_casting_from_recipe(data.raw.recipe["fast-transport-belt"])


data:extend({ -- casting vanilla recipes
  { -- casting rails
    type = "recipe",
    name = "casting-rail",
    icons =
    {
      {
        icon = "__base__/graphics/icons/rail.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 35}, -- 30*1steel-plate + 5*1iron-stick
      {type = "fluid", name = "lava", amount = 10}, -- 10*1 stone
    },
    results = {
      {type = "item", name = "rail", amount = 2}
    }
  },
  -- { -- casting heat pipe
  --   type = "recipe",
  --   name = "casting-heat-pipe",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/heat-pipe.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "metallurgy",
  --   enabled = false, -- unlocked with the normal recipe
  --   energy_required = 1,
  --   ingredients = {
  --     {type = "fluid", name = "molten-iron", amount = 300}, -- 30*10steel-plate
  --     {type = "fluid", name = "molten-copper", amount = 200}, -- 10*20copper-plate
  --   },
  --   results = {
  --     {type = "item", name = "heat-pipe", amount = 1}
  --   }
  -- },
  -- { -- casting heat exchanger
  --   type = "recipe",
  --   name = "casting-heat-exchanger",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/heat-boiler.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-copper.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "metallurgy",
  --   enabled = false, -- unlocked with the normal recipe
  --   energy_required = 196, -- 202=100*1.6copper-plate + 3.2*10steel-plate + 1*10pipe
  --   ingredients = {
  --     {type = "fluid", name = "molten-iron", amount = 400}, -- 30*10steel-plate + 10*10pipe
  --     {type = "fluid", name = "molten-copper", amount = 1000}, -- 10*100copper-plate
  --   },
  --   results = {
  --     {type = "item", name = "heat-exchanger", amount = 1}
  --   }
  -- },
  -- { -- casting steam turbine
  --   type = "recipe",
  --   name = "casting-steam-turbine",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/steam-turbine.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "metallurgy",
  --   enabled = false, -- unlocked with the normal recipe
  --   energy_required = 256, -- 260=50*1.6copper-plate + 3.2*50steel-plate + 1*20pipe
  --   ingredients = {
  --     {type = "fluid", name = "molten-iron", amount = 1600}, -- 30*50steel-plate + 10*20pipe
  --     {type = "fluid", name = "molten-copper", amount = 500}, -- 10*50copper-plate
  --   },
  --   results = {
  --     {type = "item", name = "steam-turbine", amount = 1}
  --   }
  -- },
  -- { -- casting yellow belts
  --   type = "recipe",
  --   name = "casting-transport-belt",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/transport-belt.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "metallurgy",
  --   enabled = false, -- unlocked with the normal recipe
  --   energy_required = 2, --3.1=1.6ironplate + 1iron-gear-wheel + 0.5transport-belt
  --   ingredients = {
  --     {type = "fluid", name = "molten-iron", amount = 20}, -- 10*1iron-plate+10*1iron-gear-wheel
  --   },
  --   results = {
  --     {type = "item", name = "transport-belt", amount = 2}
  --   }
  -- },
  -- { -- casting yellow underground belts
  --   type = "recipe",
  --   name = "casting-underground-belt",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/underground-belt.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "metallurgy",
  --   enabled = false, -- unlocked with the normal recipe
  --   energy_required = 32, -- 32.5= 3.1*5transport-belt + 1.6*10iron-plate + 1undergound-belt
  --   ingredients = {
  --     {type = "fluid", name = "molten-iron", amount = 150}, -- (10*0.5iron-plate + 10*0.5iron-gear-wheel)*5transport-belt + 10*10iron-plate
  --   },
  --   results = {
  --     {type = "item", name = "underground-belt", amount = 2}
  --   }
  -- },
  -- { -- casting red belt
  --   type = "recipe",
  --   name = "casting-fast-transport-belt",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/fast-transport-belt.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "metallurgy",
  --   enabled = false, -- unlocked with the normal recipe
  --   energy_required = 2, --8.6= 3.1transport-belt+  5*1iron-gear-wheel + 0.5fast-transport-belt
  --   ingredients = {
  --     {type = "fluid", name = "molten-iron", amount = 20*0.5+5*10}, -- (10*1iron-plate+10*1iron-gear-wheel)*0.5 +10*5iron-gear-wheel
  --   },
  --   results = {
  --     {type = "item", name = "fast-transport-belt", amount = 1}
  --   }
  -- },
  -- { -- casting red underground belt
  --   type = "recipe",
  --   name = "casting-fast-underground-belt",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/fast-underground-belt.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "metallurgy",
  --   enabled = false, -- unlocked with the normal recipe
  --   energy_required = 64, -- 74.5 = 32.5*transport-belt  + 1*40iron-gear-wheel + 2*fast-undergound-belt
  --   ingredients = {
  --     {type = "fluid", name = "molten-iron", amount = 550}, -- 150undergound-belt + 40*10iron-gear-wheel
  --   },
  --   results = {
  --     {type = "item", name = "fast-underground-belt", amount = 2}
  --   }
  -- },
})

data:extend({
  -- { -- LDS space platform
  --   type = "recipe",
  --   name = "lds-space-platform-foundation",
  --   category = "crafting-with-fluid-or-metallurgy",
  --   subgroup = "space-related",
  --   order = "a[space-platform-foundation]-b[lds]",
  --   icons = {
  --     {
  --       icon = "__space-age__/graphics/icons/space-platform-foundation.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__base__/graphics/icons/light-density-structure.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --       icon_scale = 0.5,
  --       icon_shift = {8,8},
  --     }
  --   },
  --   enabled = false,
  --   energy_required = 20,
  --   ingredients = {
  --     {type = "item", name = "low-density-structure", amount = 1},
  --     {type = "item", name = "steel-plate", amount = 20},
  --   },
  --   results = {
  --     {type = "item", name = "space-platform-foundation", amount = 2}
  --   },
  -- },
  { -- LDS+tungsten space platform foundation
    type = "recipe",
    name = "tungsten-space-platform-foundation",
    category = "crafting-with-fluid-or-metallurgy",
    -- subgroup = "space-related",
    -- order = "a[space-platform-foundation]-c[tungsten]",
    icons = {
      {
        icon = "__space-age__/graphics/icons/space-platform-foundation.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-tungsten-plate-shifted.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    enabled = false,
    energy_required = 20,
    ingredients = {
      {type = "item", name = "low-density-structure", amount = 1},
      {type = "item", name = "tungsten-plate", amount = 10},
    },
    results = {
      {type = "item", name = "space-platform-foundation", amount = 2}
    },
  },
})

data:extend({ -- buildings
  { -- advanced-foundry"
  type = "recipe",
  name = "advanced-foundry",
  category = "metallurgy",
  group = "production",
  subgroup = "smelting-machine",
  order = "d[foundry]-a",
  -- order = "z-c",
  icon = "__OCs_core_extraction__/graphics/icons/advanced-foundry-icon.png",
  icon_size = 64, -- icon_mipmaps = 4
  enabled = false,
  energy_required = 30,
  surface_conditions = -- Vulcanus only
  {
    {
      property = "pressure",
      min = 4000,
      max = 4000
    }
  },
  ingredients = {
    {type = "fluid", name = "molten-iron", amount = 300},
    {type = "item", name = "refined-concrete", amount = 20},
    {type = "item", name = "advanced-circuit", amount = 40},
    {type = "item", name = "tungsten-plate", amount = 25},
    {type = "item", name = "foundry", amount = 1},
  },
  allow_productivity = false,
  allow_decomposition = true,
},
})
