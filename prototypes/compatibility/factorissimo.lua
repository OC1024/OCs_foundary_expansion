local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

if settings.startup["notnotmellons-factorissimo-evolution"].value then
  -- change the standard recipes to an evolution. the casting will be changed automatically
  -- if data.raw["recipe"]["factory-1"] then
  --   data.raw["recipe"]["factory-1"].ingredients = {
  --     {type = "item", name = "stone",        amount = 500},
  --     {type = "item", name = "iron-plate",   amount = 500},
  --     {type = "item", name = "copper-plate", amount = 200}
  --   }
  -- end
  if data.raw["recipe"]["factory-2"] then
    data.raw["recipe"]["factory-2"].ingredients = {
      { type = "item", name = "stone-brick",       amount = 500 }, -- 1000
      { type = "item", name = "steel-plate",       amount = 150 }, -- 250
      { type = "item", name = "big-electric-pole", amount = 50 },
      { type = "item", name = "factory-1",         amount = 1 }
    }
  end
  if data.raw["recipe"]["factory-3"] then
    data.raw["recipe"]["factory-3"].ingredients = {
      { type = "item", name = "concrete",       amount = 1000 }, -- 5000
      { type = "item", name = "tungsten-plate", amount = 1000 }, -- 2000
      { type = "item", name = "substation",     amount = 100 },
      { type = "item", name = "factory-2",      amount = 1 },
    }
  end
  log("Replaced notnotmelon's Factorissimo building recipes with an evolutionary ones.")
end

local new_recipes = {
  ["factory-1"] = "metallurgy",
  ["factory-2"] = "metallurgy",
  ["factory-3"] = "metallurgy",
}
generator_api.batch_generator(new_recipes)

data:extend({
  -- factorissimo-casting tech
  { -- casting factory 1
    type = "technology",
    name = "factory-casting-1",
    icons = {
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-lava-droplet.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__factorissimo-2-notnotmelon__/graphics/technology/factory-architecture-1.png",
        -- icon_size
      }
    },
    prerequisites = { "lava-to-stone-tech", "factory-architecture-t1" },
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
      },
      time = 30,
      count = 100,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-casting-factory-1" }
    },
  },
  { -- casting factory 2
    type = "technology",
    name = "factory-casting-2",
    icons = {
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-lava-droplet.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__factorissimo-2-notnotmelon__/graphics/technology/factory-architecture-2.png",
        -- icon_size
      }
    },
    prerequisites = { "casting-concrete-tech", "factory-architecture-t2", "factory-casting-1" },
    unit = {
      ingredients = {
        { "automation-science-pack",  1 },
        { "logistic-science-pack",    1 },
        { "chemical-science-pack",    1 },
        { "space-science-pack",       1 },
        { "metallurgic-science-pack", 2 },     -- duh-uh-hu!
      },
      time = 45,
      count = 250,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-casting-factory-2" }
    },
  },
  { -- casting factory 3
    type = "technology",
    name = "factory-casting-3",
    icons = {
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-lava-droplet.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__factorissimo-2-notnotmelon__/graphics/technology/factory-architecture-3.png",
        -- icon_size
      }
    },
    prerequisites = { "production-science-pack", "factory-architecture-t3", "factory-casting-2" },
    unit = {
      ingredients = {
        { "automation-science-pack",  1 },
        { "logistic-science-pack",    1 },
        { "chemical-science-pack",    1 },
        { "utility-science-pack",     1 },
        { "production-science-pack",  2 },     -- duh-hu!
        { "space-science-pack",       1 },
        { "metallurgic-science-pack", 2 },     -- duh-uh-hu!
      },
      time = 60,
      count = 1000,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-casting-factory-3" }
    },
  },
  { -- casting space factory
    type = "technology",
    name = "factorissimo-casting-space-factory",
    icons = {
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-lava-droplet.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__factorissimo-2-notnotmelon__/graphics/technology/factory-space-architecture.png",
        -- icon_size
      }
    },
    prerequisites = { "factory-casting-2", "factory-space-architecture" },
    unit = {
      count = 100,
      ingredients = {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "utility-science-pack",         1 },
        { "production-science-pack",      2 }, -- duh!
        { "space-science-pack",           2 }, -- duh-hu!
        { "metallurgic-science-pack",     2 }, -- duh-uh-hu!
        { "electromagnetic-science-pack", 1 },
        { "agricultural-science-pack",    1 },
        { "cryogenic-science-pack",       1 },
        { "promethium-science-pack",      1 },
      },
      time = 30
    },
    effects = {
      --  { type = "unlock-recipe", recipe = "oc-casting-space-factory"
    },
    hidden = true,
  },
})