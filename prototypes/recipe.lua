data:extend({
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
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-molten-iron.png",
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
  { -- casting heat pipe
    type = "recipe",
    name = "casting-heat-pipe",
    icons =
    {
      {
        icon = "__base__/graphics/icons/heat-pipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    enabled = false, -- unlocked with the normal recipe
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 300}, -- 30*10steel-plate
      {type = "fluid", name = "molten-copper", amount = 200}, -- 10*20copper-plate
    },
    results = {
      {type = "item", name = "heat-pipe", amount = 1}
    }
  },
})

-- data:extend({ -- military related
--   { -- heavy amor plating
--     type = "recipe",
--     name = "heavy-armor-plating",
--     icon = "__OCs_foundary_expansion__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
--     icon_size = 64, --icon_mipmaps = 4,
--     category = "crafting-with-fluid",
--     group = "intermediate-products",
--     -- subgroup = "",
--     enabled = false,
--     energy_required = 60,
--     ingredients = {
--       {type = "item", name = "tungsten-plate", amount = 4},
--       {type = "item", name = "steel-plate", amount = 10},
--     },
--     results = {
--       {type = "item", name = "heavy-armor-plating", amount = 1},
--     },
--     allow_productivity = true,
--     allow_decomposition = true,
--   },
--   { -- casting heavy amor plating
--     type = "recipe",
--     name = "casting-heavy-armor-plating",
--     icons =
--     {
--       {
--         icon = "__OCs_foundary_expansion__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
--         icon_size = 64,
--         -- icon_mipmaps = 4,
--       },
--       {
--         icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-molten-iron.png",
--         icon_size = 64,
--         -- icon_mipmaps = 4,
--       }
--     },
--     category = "metallurgy",
--     group = "intermediate-products",
--     -- subgroup = "",
--     enabled = false,
--     energy_required = 60,
--     ingredients = {
--       {type = "item", name = "tungsten-ore", amount = 16}, -- 4*4tungsten-ore
--       {type = "fluid", name = "molten-iron", amount = 340}, -- 30*10steel-plate + 10*4tungsten-plate
--     },
--     results = {
--       {type = "item", name = "heavy-armor-plating", amount = 1},
--     },
--     allow_productivity = true,
--   },
--   { -- ablative-armor-equipment
--     type = "recipe",
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
--     category = "crafting-with-fluid",
--     group = "military",
--     subgroup = "military-equipment",
--     enabled = false,
--     energy_required = 8,
--     ingredients = {
--       {type = "item", name = "heavy-armor-plating", amount = 1},
--       {type = "item", name = "electronic-circuit", amount = 10},
--     },
--     results = {
--       {type = "item", name = "ablative-armor-equipment", amount = 1},
--     },
--     allow_productivity = false,
--     allow_decomposition = true,
--   },
-- })

data:extend({ -- casting/em/cryo science
  { -- automation science
    type = "recipe",
    name = "casting-automation-science-pack",
    icons =
    {
      {
        icon = "__base__/graphics/icons/automation-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 10, fluidbox_multiplier = 4}, -- 1 iron-gear-wheel
      {type = "fluid", name = "molten-copper", amount = 10, fluidbox_multiplier = 4}, -- 1 copper-plate
    },
    results = {
      {type = "item", name = "automation-science-pack", amount = 1}
    },
    allow_productivity = true,
  },
  { -- logistic science
    type = "recipe",
    name = "casting-logistic-science-pack",
    icons =
    {
      {
        icon = "__base__/graphics/icons/logistic-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 6,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 40, fluidbox_multiplier = 4}, -- 2 iron-gear-wheel, 2 iron-plate
      {type = "item", name = "electronic-circuit", amount = 1},
    },
    results = {
      {type = "item", name = "logistic-science-pack", amount = 1}
    },
    allow_productivity = true,
  },
  { -- military science (molten metal version)
    type = "recipe",
    name = "casting-military-science-pack",
    icons =
    {
      {
        icon = "__base__/graphics/icons/military-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 120, fluidbox_multiplier = 4}, -- 30*1steel, 10*9iron-plate
      {type = "fluid", name = "molten-copper", amount = 100, fluidbox_multiplier = 4}, -- 10*1copper-plate
      -- {type = "fluid", name = "lava", amount = 660, fluidbox_multiplier = 2}, -- 30*1steel, 10*9iron-plate, 10*1copper-plate, 10*5*2stone = 330 lava. volume x2
      {type = "item", name = "coal", amount = 10}, -- 10coal
      -- {type = "item", name = "calcite", amount = 1}, -- make it so it resemble around 500 lava per calcite
      {type = "item", name = "stone-brick", amount = 10}, -- 20stone=10stone-brick=2wall
    },
    results = {
      {type = "item", name = "military-science-pack", amount = 2}
    },
    allow_productivity = true,
  },
  { -- military science (Vulcanus/old version)
    type = "recipe",
    name = "lava-to-military-science-pack",
    icons =
    {
      {
        icon = "__base__/graphics/icons/military-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-lava-droplet.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 20, -- volume x2
    ingredients = {
      {type = "fluid", name = "lava", amount = 660, fluidbox_multiplier = 2}, -- 30*1steel, 10*9iron-plate, 10*1copper-plate, 10*20*stone = 330 lava. volume x2
      {type = "item", name = "coal", amount = 20}, -- 10coal volume x2
      {type = "item", name = "calcite", amount = 1}, -- make it so it resemble around 500 lava per calcite
    },
    results = {
      {type = "item", name = "military-science-pack", amount = 4}
    },
    allow_productivity = true,
  },
  { -- chemical science (biochamber/new)
    type = "recipe",
    name = "biochamber-chemical-science-pack",
    icons =
    {
      {
        icon = "__base__/graphics/icons/chemical-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 24,
    ingredients = {
      {type = "item", name = "engine-unit", amount = 1},
      {type = "item", name = "advanced-circuit", amount = 3},
      {type = "item", name = "sulfur", amount = 1},
    },
    results = {
      {type = "item", name = "chemical-science-pack", amount = 2}
    },
    allow_productivity = true,
  },
  { -- space science (biochamber/new)
    type = "recipe",
    name = "biochamber-space-science-pack",
    icons =
    {
      {
        icon = "__base__/graphics/icons/space-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic", -- submod "OCs_ammo_casting" has optionally space-fish-breeding so there's a positive feedback loop if bioflux recipe is not enough
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 15,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 2},
      {type = "item", name = "ice", amount = 1},
      {type = "item", name = "carbon", amount = 1},
    },
    results = {
      {type = "item", name = "space-science-pack", amount = 5}
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    allow_productivity = true,
  },
  -- { -- production science foundry (old)
  --   type = "recipe",
  --   name = "casting-production-science-pack",
  --   icon = "__OCs_foundary_expansion__/graphics/technology/casting-production-science-pack.png",
  --   icon_size = 256, icon_mipmaps = 4,
  --   category = "metallurgy",
  --   enabled = false,
  --   energy_required = 21, -- vanilla
  --   ingredients = {
  --     {type = "fluid", name = "lava", amount = 5000, fluidbox_multiplier = 2},
  --     -- 10brick, 10steel, 15rails=(1iron-stick, 1steel-plate,1stone)/2
  --     -- 10*25 stone, 30*5 steel, 5*15iron-stick= 250lava+ 2250 molten-iron 
  --     {type = "item", name = "productivity-module", amount = 1},
  --     {type = "item", name = "advanced-circuit", amount = 5}, -- cannot be casted
  --     {type = "item", name = "calcite", amount = 10}, -- make it so it resemble around 500 lava per calcite
  --   },
  --   results = {
  --     {type = "item", name = "production-science-pack", amount = 3}
  --   },
  -- },
  { -- production science EM (new)
    type = "recipe",
    name = "em-production-science-pack",
    icons =
    {
      {
        icon = "__base__/graphics/icons/production-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-em-plant.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "electromagnetics",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 21, -- only last step 21
    ingredients = { -- doing the last two steps in the em plant (more would be to much throughput)
    -- 5 red circut +10stone-brick+10steel-plate+5s=electric-furnace
    -- 5 green circuit + 5advanced-circuit  +15s = productivity-module
    -- 1electric-furnanc + 1productivity-module +30rail +21s = 3production-science-pack
      {type = "item", name = "steel-plate", amount = 10}, -- for rails and electric furnance 10
      {type = "item", name = "advanced-circuit", amount = 10},
      {type = "item", name = "rail", amount = 30},
      {type = "item", name = "stone-brick", amount = 10},
      {type = "item", name = "electronic-circuit", amount = 5},
    },
    results = {
      {type = "item", name = "production-science-pack", amount = 3}
    },
    allow_productivity = true,
  },
  { -- utility science EM
    type = "recipe",
    name = "em-utility-science-pack",
    icons =
    {
      {
        icon = "__base__/graphics/icons/utility-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-em-plant.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "electromagnetics",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 21, -- only last step 21
    ingredients = { -- doing the last two steps in the em plant (more would be to much throughput)
    -- LDS just as it is
    -- 1flying robot frame = 1steel-plate+2battery +3electronic-circuit +1electric-engine-unit
    -- 2processing-unit = 2*2advanced-circuit + 2*20electric-ciruit + 2*5sulfuric-acid 2*10s
      {type = "item", name = "low-density-structure", amount = 3}, -- not carftable in em-plant
      {type = "item", name = "electronic-circuit", amount = 2*20},
      {type = "item", name = "advanced-circuit", amount = 2*2},
      {type = "item", name = "flying-robot-frame", amount = 1},
      -- {type = "item", name = "steel-plate", amount = 1},
      -- {type = "item", name = "electric-motor", amount = 1},
      -- {type = "item", name = "battery ", amount = 2},
      {type = "fluid", name = "sulfuric-acid", amount = 2*5}, --  2*10processing-unit
      -- {type = "fluid", name = "lubricant", amount = 15}, -- 15*1e-motor
    },
    results = {
      {type = "item", name = "utility-science-pack", amount = 3}
    },
    allow_productivity = true,
  },
  -- { -- chemical science (cryo/old)
  --   type = "recipe",
  --   name = "cryo-chemical-science-pack",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/chemical-science.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-cryo-plant.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "cryogenics",
  --   enabled = false,
  --   energy_required = 24,
  --   ingredients = {
  --     {type = "item", name = "engine-unit", amount = 1},
  --     {type = "item", name = "advanced-circuit", amount = 3},
  --     {type = "item", name = "sulfur", amount = 1},
  --   },
  --   results = {
  --     {type = "item", name = "chemical-science-pack", amount = 2}
  --   }
  -- },
  -- { -- space science (cryo/old)
  --   type = "recipe",
  --   name = "cryo-space-science-pack",
  --   icons =
  --   {
  --     {
  --       icon = "__base__/graphics/icons/chemical-science.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__OCs_foundary_expansion__/graphics/icons/overlayer-recipe-cryo-plant.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     }
  --   },
  --   category = "cryogenics",
  --   enabled = false,
  --   energy_required = 15,
  --   ingredients = {
  --     {type = "item", name = "iron-plate", amount = 2},
  --     {type = "item", name = "ice", amount = 1},
  --     {type = "item", name = "carbon", amount = 1},
  --   },
  --   results = {
  --     {type = "item", name = "space-science-pack", amount = 5}
  --   },
  --   surface_conditions =
  --   {
  --     {
  --       property = "gravity",
  --       min = 0,
  --       max = 0
  --     }
  --   },
  -- },
})