
-- load the generator api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- [[
if settings["aai_storage_evolution"].value then
    -- change the standard recipes to an evolution. the casting will be changed automatically
    if data.raw["recipe"]["aai-strongbox"] then
      data.raw["recipe"]["aai-strongbox"].ingredients = {
        {type = "item", name = "steel-chest", amount = 2}, -- 2*8 + 8 = 24 steel-plate
        {type = "item", name = "steel-plate", amount = 8},
      }
    end
    if data.raw["recipe"]["aai-storehouse"] then
      data.raw["recipe"]["aai-storehouse"].ingredients = {
        {type = "item", name = "strongbox", amount = 2}, -- 24*2=48
        {type = "item", name = "steel-plate", amount = 52}, -- 48 + 52 = 100steel-plate as before
        {type = "item", name = "concrete", amount = 50}, -- as before
      }
    end
    if data.raw["recipe"]["aai-warehouse"] then
      data.raw["recipe"]["aai-warehouse"].ingredients = {
        {type = "item", name = "storehouse", amount = 1},
        {type = "item", name = "steel-plate", amount = 100}, -- =200steel-plate as before
        {type = "item", name = "concrete", amount = 50}, -- 50 + 50
      }
    end
    log("Replaced aai storage container base recipes with an evolutionary ones.")
end
-- ]]


local new_recipes = {
    ["aai-strongbox"] = "metallurgy",
    ["aai-storehouse"] = "metallurgy",
    ["aai-warehouse"] = "metallurgy",
}
generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
    ["casting-aai-strongbox"] = {"aai-strongbox-base"},
    ["casting-aai-storehouse"] = {"aai-storehouse-base"},
    ["casting-aai-warehouse"] = {"aai-warehouse-base"},
}
add_recipe_unlocks(recipe_unlock_mapping)