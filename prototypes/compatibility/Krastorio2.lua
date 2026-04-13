local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

-- changing crafting category (making thins able in foundry and EM plant)
local mapping = {
    -- intermediates
    ["kr-automation-core"] = "pressing", -- instead of electronics
    -- ["kr-lithium-plate"]  = "metallurgy-or-smelting",
    ["kr-matter-stabilizer"] = "electronics",
    -- logistics

    ["kr-superior-inserter"] = "electronics",
    ["kr-superior-long-inserter"] = "electronics",
    -- equipment
    ["kr-energy-shield-mk3-equipment"] = "electronics",
    ["kr-energy-shield-mk4-equipment"] = "electronics",
    ["kr-advanced-exoskeleton-equipment"] = "electronics",
    ["kr-superior-exoskeleton-equipment"] = "electronics",
    ["kr-superior-nightvision-equipment"] = "electronics",
    ["kr-personal-laser-defence-mk2-equipment"] = "electronics",
    ["kr-personal-laser-defence-mk3-equipment"] = "electronics",
    ["kr-personal-laser-defence-mk4-equipment"] = "electronics",
    ["kr-fusion-reactor-equipment"] = "electronics",
    ["kr-antimatter-reactor-equipment"] = "electronics",
}
oc_helper.change_multiple_crafting_category(mapping)

-- change my lithium recipe
oc_helper.replace_ingredient("forging-lithium-plate", "item", "lithium", "item", "kr-lithium", true)
if mods["metall-and-stars"] then
    -- hotfix metal and stars lithium output
    -- replace_result("mirandite-processing","item","lithium","item","kr-lithium",true)
    -- just in case this didn't work
    -- add_result("mirandite-processing","item","kr-lithium",1)
    -- or we create a recipe to switch one to the other
    data:extend({
        {-- lithium conversion
            type = "recipe",
            name = "lithium-conversion",
            energy_required = 1,
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
                { type = "item", name = "lithium", amount = 10 },
            },
            results = {
                { type = "item", name = "kr-lithium", amount = 10 }
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

-- 2. Execute the Generator.
local casting_dict = {
    -- intermetiates
    -- ["kr-iron-gear"] = "metallurgy",
    ["kr-blank-tech-card"] = "electromagnetics", -- category: electronics
    ["kr-automation-core"] = "metallurgy",       -- category: electronics (switched by the line 2)
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
    ["pulse-kr-blank-tech-card"] = { "electromagnetic-plant" }, -- or "automation-science-pack" or free
    ["casting-kr-automation-core"] = { "foundry" },             -- or "kr-automation-core" tech
    ["casting-kr-inserter-parts"] = "foundry",
    -- imersium intermediates
    ["casting-kr-imersium-beam"] = { "kr-imersium-processing" },
    ["casting-kr-imersium-gear-wheel"] = { "kr-imersium-processing" },
    -- kr-logistic-5 (purple belts)
    ["casting-kr-superior-transport-belt"] = { "kr-logistic-5" },
    ["casting-kr-superior-underground-belt"] = { "kr-logistic-5" },
    ["casting-kr-superior-splitter"] = { "kr-logistic-5" },
    -- high-tech
    ["pulse-kr-empty-dt-fuel-cell"] = { "kr-fusion-energy" },
    ["kr-matter-stabilizer"] = "kr-matter-processing",
    ["kr-teleportation-gps-module"] = "kr-planetary-teleporter",
}
oc_helper.add_recipe_unlocks(recipe_tech_mapping)
