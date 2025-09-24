
data.raw["recipe"]["kr-automation-core"].category = "metallurgy-or-assembling" -- making it castable and not craftable in the EM plant

-- 0. load API
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- 1. Preparations: Edit all Tables
-- Add/Change order of Alternative Receptes
local alt_recipes_table = {
    ["kr-iron-gear"] = {
        "casting-iron-gear",
        "kr-iron-gear",
        "kr-iron-gear-from-enriched-iron",
        "kr-iron-gear-from-iron-ore",
    },
    ["iron-stick"] = {
        "casting-iron-stick",
        "iron-stick",
        "kr-iron-stick-from-enriched-iron",
        "kr-iron-stick-from-iron-ore",
    },
    ["kr-iron-beam"] = {
        "kr-iron-beam",
        "kr-iron-beam-from-enriched-iron",
        "kr-iron-beam-from-iron-ore",
    },
    ["copper-cable"] = {
        "casting-copper-cable",
        "copper-cable",
        "kr-copper-cable-from-enriched-copper",
        "kr-copper-cable-from-copper-ore",
    },
    ["kr-steel-beam"] = {
        "kr-steel-beam",
        "kr-easy-steel-beam",
    },
    ["kr-steel-gear-wheel"] = {
        "kr-steel-gear-wheel",
        "kr-easy-steel-gear-wheel",
    },
    ["kr-rare-metals"] = {
        "kr-casting-rare-metals",
        "kr-rare-metals-from-enriched-rare-metals",
        "kr-rare-metals",
    },
    ["kr-molten-rare-metals"] = {
        "kr-molten-enriched-rare-metals",
        "kr-molten-rare-metals-from-lava",
        "kr-molten-rare-metals",
    }
}
generator_api.register_category_alt_recipes("metallurgy", alt_recipes_table)

-- 1.2 Block single Items, single category
local blacklist_items = {
    "kr-electronic-components",
    "kr-charged-antimatter-fuel-cell",
    "kr-imersite-crystal",
    "kr-imersite-powder",
    "kr-energy-control-unit",
    "kr-matter-stabilizer",
}
generator_api.register_item_blacklist("metallurgy", blacklist_items)

-- 1.3 Block complete Categories, single target category
local blacklist_categories = {
    "kr-advanced-chemistry",
    "kr-air-purification",
    "kr-atmosphere-condensation",
    "kr-bioprocessing",
    "kr-crushing",
    "kr-electrolysis",
    "kr-fluid-filtration",
    "kr-fuel-burning",
    "kr-fuel-refinery",
    "kr-growing",
    "kr-matter-conversion",
    "kr-matter-deconversion",
    "kr-nuclear-fusion",
--   ["kr-research-data"] = true,
    "kr-stabilizer-charging",
--   ["kr-tech-cards"] = true,
--   ["kr-tech-cards-cooling"] = true,
    "kr-void-crushing",
}
generator_api.register_category_blacklist("metallurgy", blacklist_categories)


-- 2. Execute the Generator.
local casting_dict = {
    -- ["kr-iron-gear"] = "metallurgy",
    ["kr-blank-tech-card"] = "metallurgy", -- category: electronics
    ["kr-automation-core"] = "metallurgy", -- category: electronics
    ["kr-empty-dt-fuel-cell"] = "metallurgy",
    -- imersium intermetiates
    ["kr-imersium-plate"] = "metallurgy",
    ["kr-imersium-beam"] = "metallurgy",
    ["kr-imersium-gear-wheel"] = "metallurgy",
    -- kr-logistic-5 (purple belts)
    ["kr-superior-transport-belt"] = "metallurgy",
    ["kr-superior-underground-belt"] = "metallurgy",
    ["kr-superior-splitter"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)


-- 3. Add Recipes to Techs
local recipe_tech_mapping = {
    ["casting-kr-blank-tech-card"] = {"foundry"}, -- or "automation-science-pack" or free
    ["casting-kr-automation-core"] = {"foundry"}, -- or "kr-automation-core" tech
    -- imersium intermediates
    ["casting-kr-imersium-beam"] = {"kr-imersium-processing"},
    ["casting-kr-imersium-gear-wheel"] = {"kr-imersium-processing"},
    -- kr-logistic-5 (purple belts)
    ["casting-kr-empty-dt-fuel-cell"] = {"kr-fusion-energy"}, -- ins't that to high-tech?
    ["casting-kr-superior-transport-belt"] = {"kr-logistic-5"},
    ["casting-kr-superior-underground-belt"] = {"kr-logistic-5"},
    ["casting-kr-superior-splitter"] = {"kr-logistic-5"},
}
add_recipe_unlocks(recipe_tech_mapping)

print("Changes due to Krastorio 2 being active.")