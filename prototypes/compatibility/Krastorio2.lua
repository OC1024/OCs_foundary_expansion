local mapping = {
    ["kr-automation-core"] = "pressing", -- making it castable and not craftable in the EM plant
    -- ["kr-lithium-plate"]  = "metallurgy-or-smelting"
}
change_multiple_crafting_category(mapping)

-- change my lithium recipe
replace_ingredient("forging-lithium-plate","item","lithium","item","kr-lithium",true)
if mods["metall-and-stars"] then
    -- hotfix metal and stars lithium output
    -- replace_result("mirandite-processing","item","lithium","item","kr-lithium",true)
    -- just in case this didn't work
    -- add_result("mirandite-processing","item","kr-lithium",1)
    -- or we create a recipe to switch one to the other
    data:extend({
        {
            type = "recipe",
            name =  "lithium-conversion",
            energy_required = 0.1,
            category = "pressing",
            icons = {
                {
                    icon = "__space-age__/graphics/icons/lithium.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                },
                {
                    icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-foundry.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                }
            },
            ingredients = {
                {type = "item", name = "lithium", amount=1},
            },
            results = {
                {type = "item", name = "kr-lithium", amount=1}
            },
            enabled = true, -- for dirty quick hack
            allow_decomposition = false,
            allow_productivity = false,
            auto_recycle = false,
        }
    })
end

-- 0. load API
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

local machine_fluid_limits = {
    ["metallurgy"] = 3 -- advanced foundry
}
generator_api.register_machine_fluid_limits(machine_fluid_limits)

-- 2. Execute the Generator.
local casting_dict = {
    -- intermetiates
    -- ["kr-iron-gear"] = "metallurgy",
    ["kr-blank-tech-card"] = "electromagnetics", -- category: electronics
    ["kr-automation-core"] = "metallurgy", -- category: electronics (switched by the line 2)
    ["kr-inserter-parts"] = "metallurgy",
    -- imersium intermetiates
    ["kr-imersium-plate"] = "metallurgy",
    ["kr-imersium-beam"] = "metallurgy",
    ["kr-imersium-gear-wheel"] = "metallurgy",
    -- kr-logistic-5 (purple belts)
    -- ["kr-superior-transport-belt"] = "metallurgy",
    -- ["kr-superior-underground-belt"] = "metallurgy",
    -- ["kr-superior-splitter"] = "metallurgy",
    --  high-tech
    ["kr-empty-dt-fuel-cell"] = "electromagnetics",
    ["kr-matter-stabilizer"] = "electromagnetics",
    ["kr-teleportation-gps-module"] = "electromagnetics",
}
generator_api.batch_generator(casting_dict)


-- 3. Add Recipes to Techs
local recipe_tech_mapping = {
    ["pulse-kr-blank-tech-card"] = {"electromagnetic-plant"}, -- or "automation-science-pack" or free
    ["casting-kr-automation-core"] = {"foundry"}, -- or "kr-automation-core" tech
    ["casting-kr-inserter-parts"] = "foundry",
    -- imersium intermediates
    ["casting-kr-imersium-beam"] = {"kr-imersium-processing"},
    ["casting-kr-imersium-gear-wheel"] = {"kr-imersium-processing"},
    -- kr-logistic-5 (purple belts)
    ["casting-kr-superior-transport-belt"] = {"kr-logistic-5"},
    ["casting-kr-superior-underground-belt"] = {"kr-logistic-5"},
    ["casting-kr-superior-splitter"] = {"kr-logistic-5"},
    -- high-tech
    ["pulse-kr-empty-dt-fuel-cell"] = {"kr-fusion-energy"},
    ["kr-matter-stabilizer"] = "kr-matter-processing",
    ["kr-teleportation-gps-module"] = "kr-planetary-teleporter",
}
add_recipe_unlocks(recipe_tech_mapping)

log("Changes due to Krastorio 2 being active.")