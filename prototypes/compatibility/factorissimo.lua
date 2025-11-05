
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
-- [[
if settings.startup["notnotmellons_factorissimo_evolution"].value then
  -- change the standard recipes to an evolution. the casting will be changed automatically
  -- vanilla version is overwritten to medium artillery shell
  -- if data.raw["recipe"]["factory-1"] then
  --   data.raw["recipe"]["factory-1"].ingredients = {
  --     {type = "item", name = "stone",        amount = 500},
  --     {type = "item", name = "iron-plate",   amount = 500},
  --     {type = "item", name = "copper-plate", amount = 200}
  --   }
  -- end
  if data.raw["recipe"]["factory-2"] then
    data.raw["recipe"]["factory-2"].ingredients = {
      {type = "item", name = "stone-brick",       amount = 500}, -- 1000
      {type = "item", name = "steel-plate",       amount = 150}, -- 250
      {type = "item", name = "big-electric-pole", amount = 50},
      {type = "item", name = "factory-1",         amount = 1}
    }
  end
  if data.raw["recipe"]["factory-3"] then
    data.raw["recipe"]["factory-3"].ingredients = {
      {type = "item", name = "concrete",    amount = 1000}, -- 5000
      {type = "item", name = "tungsten-plate", amount = 1000}, -- 2000
      {type = "item", name = "substation",  amount = 100},
      {type = "item", name = "factory-2",   amount = 1},
    }
  end
  log("Replaced notnotmelon's Factorissimo building recipes with an evolutionary ones.")
end
-- ]]

local new_recipes = {
  ["factory-1"] = "metallurgy",
  ["factory-2"] = "metallurgy",
  ["factory-3"] = "metallurgy",
}
generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
  ["casting-factory-1"] = {"factory-architecture-t1"},
  ["casting-factory-2"] = {"factory-architecture-t2"},
  ["casting-factory-3"] = {"factory-architecture-t3"},
}
add_recipe_unlocks(recipe_unlock_mapping)

local adding_prereq_dict = {
  ["factory-architecture-t1"] = {"lava-to-stone-tech"},
  ["factory-architecture-t2"] = {"casting-concrete-tech"},
}
for index, prereq in ipairs(adding_prereq_dict) do
  add_prerequisite(index,prereq)
end