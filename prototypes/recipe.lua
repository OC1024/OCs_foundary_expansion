data:extend({ -- casting vanilla recipes
  { -- foundry lithium plate
    type = "recipe",
    name = "forging-lithium-plate",
    icons =
    {
      {
        icon = "__space-age__/graphics/icons/lithium-plate.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-foundry.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    enabled = false,
    energy_required = 6.4,
    ingredients = {
      {type = "item", name = "lithium", amount = 1},
    },
    results = {
      {type = "item", name = "lithium-plate", amount = 1}
    },
    allow_productivity = true,
  },
  { --  freezing water to ice
    type = "recipe",
    name = "freezing-water",
    icons = {
      {
        icon = "__space-age__/graphics/icons/ice.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-cryo-plant.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "cryogenics",
    -- subgroup = "fluid-recipes",
    enabled = false,
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = "water", amount = 20},
    },
    results = {
      {type = "item", name = "ice", amount = 1}
    },
    allow_productivity = false,
    allow_decomposition = false,
  }
})
allow_productivity("forging-lithium-plate")

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
    allow_decomposition = false,
    allow_productivity = false,
    auto_recycle = false,
  },
  { -- casting normal space platform foundation
    type = "recipe",
    name = "casting-space-platform-foundation",
    category = "metallurgy",
    -- subgroup = "space-related",
    -- order = "a[space-platform-foundation]-c[tungsten]",
    icons = {
      {
        icon = "__space-age__/graphics/icons/space-platform-foundation.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-copper-shifted.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    enabled = false,
    energy_required = 20,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 600},
      {type = "fluid", name = "molten-copper", amount = 100},
    },
    results = {
      {type = "item", name = "space-platform-foundation", amount = 1}
    },
    allow_decomposition = false,
    allow_productivity = false,
    auto_recycle = false,
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
  icon = "__OCs_foundary_expansion__/graphics/icons/advanced-foundry-icon.png",
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
  results = {
    {type = "item", name = "advanced-foundry", amount = 1}
  },
  allow_productivity = false,
  allow_decomposition = true,
},
})

-- pepare the generator
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- create new recipes
local new_recipes_dict = {
  -- basic transporotation 
  ["transport-belt"] = "metallurgy",
  ["underground-belt"] = "metallurgy",
  ["splitter"] = "metallurgy",
  ["fast-transport-belt"] = "metallurgy",
  ["fast-underground-belt"] = "metallurgy",
  ["fast-splitter"] = "metallurgy",
  ["express-transport-belt"] = "metallurgy",
  ["express-splitter"] = "metallurgy",
  ["express-underground-belt"] = "metallurgy",
  ["turbo-transport-belt"] = "metallurgy",
  ["turbo-splitter"] = "metallurgy",
  ["turbo-underground-belt"] = "metallurgy",
  -- fluid handling
  ["offshore-pump"] = "metallurgy",
  ["pump"] = "metallurgy",
  ["storage-tank"] = "metallurgy",
  ["barrel"] = "metallurgy",
  -- heating and power
  ["heating-tower"] = "metallurgy",
  ["steam-engine"] = "metallurgy",
  ["heat-exchanger"] = "metallurgy",
  ["heat-pipe"] = "metallurgy",
  ["steam-turbine"] = "metallurgy",
  ["boiler"] = "metallurgy",
  -- energy distribution
  ["small-electric-pole"] = "electromagnetics",
  ["medium-electric-pole"] = "electromagnetics",
  ["big-electric-pole"] = "electromagnetics",
  ["substation"] = "electromagnetics",
  ["solar-panel"] = "electromagnetics",
  -- ["accumulator"] = "electromagnetics", -- useless as the battery is chemistry
  -- other buildings
  -- ["steel-furnace"] = "metallurgy",
  -- item storage
  ["iron-chest"] = "metallurgy",
  ["steel-chest"] = "metallurgy",

  -- intermediates
  ["engine-unit"] = "metallurgy",
  ["electric-engine-unit"] = "electromagnetics",
  -- space related
  -- ["space-platform-foundation"] = "metallurgy", -- manually created because same item is casted differently
  ["tungsten-space-platform-foundation"] = "metallurgy",
  -- testing
  -- ["coal-liquefaction"] = "oil-refining", -- should be blacklisted by category
  -- ["plastic-bar"] = "chemistry", -- blacklisted by item and/or category
  -- ["solid-fuel-from-light-oil"] = "crafting-with-fluid", -- blacklisted by ingredients

  -- vehicles
  ["locomotive"] = "metallurgy",
  ["cargo-wagon"] = "metallurgy",
  ["fluid-wagon"] = "metallurgy",
  ["car"] = "metallurgy",
  ["tank"] = "metallurgy",
}
generator_api.batch_generator(new_recipes_dict)