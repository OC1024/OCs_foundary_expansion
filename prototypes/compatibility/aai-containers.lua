local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")


if settings.startup["aai-storage-evolution"].value then
  -- change the standard recipes to an evolution. the casting will be changed automatically
  if data.raw["recipe"]["aai-strongbox"] then
    data.raw["recipe"]["aai-strongbox"].ingredients = {
      {type = "item", name = "steel-chest", amount = 2}, -- 2*8 + 8 = 24 steel-plate
      {type = "item", name = "steel-plate", amount = 8},
    }
  end
  if data.raw["recipe"]["aai-storehouse"] then
    data.raw["recipe"]["aai-storehouse"].ingredients = {
      {type = "item", name = "aai-strongbox", amount = 2}, -- 24*2=48
      {type = "item", name = "steel-plate", amount = 52}, -- 48 + 52 = 100steel-plate as before
      {type = "item", name = "concrete", amount = 50}, -- as before
    }
  end
  if data.raw["recipe"]["aai-warehouse"] then
    data.raw["recipe"]["aai-warehouse"].ingredients = {
      {type = "item", name = "aai-storehouse", amount = 1},
      {type = "item", name = "steel-plate", amount = 100}, -- =200steel-plate as before
      {type = "item", name = "concrete", amount = 50}, -- 50 + 50
    }
  end
  log("Replaced aai storage container base recipes with an evolutionary ones.")
end

-- adding aai boxes (normal) to
local aai_boxes = {
  "aai-strongbox",
  "aai-storehouse",
  "aai-warehouse",
}
local logistic_names = {
  "active-provider",
  "passive-provider",
  "storage",
  "buffer",
  "requester"
}
-- build mapping
local category_remapping = {}

for _, box in ipairs(aai_boxes) do
  for _, logi in ipairs(logistic_names) do
    category_remapping[box .. "-" .. logi] = "electronics"
  end
  category_remapping[box] = "pressing"
end
oc_recipe.change_multiple_crafting_category(category_remapping)


local new_recipes = {
    ["aai-strongbox"] = "metallurgy",
    ["aai-storehouse"] = "metallurgy",
    ["aai-warehouse"] = "metallurgy",
}
generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
    ["oc-casting-aai-strongbox"] = {"aai-strongbox-base"},
    ["oc-casting-aai-storehouse"] = {"aai-storehouse-base"},
    ["oc-casting-aai-warehouse"] = {"aai-warehouse-base"},
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)