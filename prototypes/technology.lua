-- alternative recipes for basic science packs in foundry, em-plant and biochamber
data:extend({
  { -- foundry sciences early-tech sciences
    type = "technology",
    name = "foundry-science-packs-tech",
    icon = "__OCs_foundary_expansion__/graphics/technology/casting-science-packs2.png",
    icon_size = 256, icon_mipmaps = 4,
    prerequisites = {"metallurgic-science-pack","space-science-pack","production-science-pack","military-science-pack"}, --some are indirect prereqs (red, green, blue))
    unit = {
      ingredients = { -- cast-able science packs are used twice as the rest
        {"automation-science-pack", 2},
        {"logistic-science-pack", 2},
        {"chemical-science-pack", 1},
        {"military-science-pack", 2},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 2},
      },
      time = 60,
      count = 500
      },
      effects = {
        {type = "unlock-recipe", recipe = "casting-automation-science-pack"},
        {type = "unlock-recipe", recipe = "casting-logistic-science-pack"},
        {type = "unlock-recipe", recipe = "casting-military-science-pack"},
        {type = "unlock-recipe", recipe = "lava-to-military-science-pack"}, -- Vulcanus/old version
        -- {type = "unlock-recipe", recipe = "casting-production-science-pack"},
        -- {type = "unlock-recipe", recipe = "casting-rail"}, -- needed to make some sense for the production science
      },
  },
  { -- em-plant sciences mid-tech sciences
  type = "technology",
  name = "emp-science-packs-tech",
  icon = "__OCs_foundary_expansion__/graphics/technology/em-science-packs3.png",
  icon_size = 256, icon_mipmaps = 4,
  prerequisites = {"electromagnetic-science-pack","space-science-pack","utility-science-pack","production-science-pack"}, --some are indirect prereqs (red, green, blue))
  unit = {
    ingredients = { -- em-able science packs are used twice as the rest
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 2},
      {"utility-science-pack", 2},
      {"space-science-pack", 1},
      {"electromagnetic-science-pack", 2},
    },
    time = 60,
    count = 500
    },
    effects = {
      {type = "unlock-recipe", recipe = "em-utility-science-pack"},
      {type = "unlock-recipe", recipe = "em-production-science-pack"},
      -- {type = "unlock-recipe", recipe = "em-electromagnetic-science-pack"}, -- already there
    },
  },
  { -- biochamber sciences early-midtech sciences
  type = "technology",
  name = "biochamber-science-packs-tech",
  icon = "__OCs_foundary_expansion__/graphics/technology/biochamber-science-packs.png",
  icon_size = 256, icon_mipmaps = 4,
  prerequisites = {"agricultural-science-pack","space-science-pack","chemical-science-pack",}, --some are indirect prereqs (biochamber, chemical-science-pack))
  unit = {
    ingredients = { -- biochamber-able science packs are used twice as the rest
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 2},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 2},
      {"agricultural-science-pack", 2},
    },
    time = 60,
    count = 500
    },
    effects = {
      {type = "unlock-recipe", recipe = "biochamber-chemical-science-pack"},
      {type = "unlock-recipe", recipe = "biochamber-space-science-pack"},
      -- {type = "unlock-recipe", recipe = "biochamber-agricultural-science-pack"}, -- already there
    },
  },
  { -- cryogenic-plant sciences late-game sciences
    type = "technology",
    name = "cryoplant-science-packs-tech",
    icon = "__OCs_foundary_expansion__/graphics/technology/cryo-science-packs2.png", -- not yet updated
    icon_size = 256, icon_mipmaps = 4,
    prerequisites = {"emp-science-packs-tech","foundry-science-packs-tech","biochamber-science-packs-tech","promethium-science-pack"}, --some are indirect prereqs (cryogenic)
    unit = {
      ingredients = { -- cryo-able science packs are used twice as the rest
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"cryogenic-science-pack", 2},
        {"promethium-science-pack", 2},
      },
      time = 90,
      count = 2000
    },
    effects = { -- non but key technology
        -- {type = "unlock-recipe", recipe = "cryo-cryogenic-science-pack"}, -- already there
        -- {type = "unlock-recipe", recipe = "cryo-promethium-science-pack"}, -- already there
    },
  },
})

-- -- quickly revive the old tech-names (migration from 0.4.0 to 0.4.1)
-- local old_to_new_techs = {
--   ["casting-science-packs-tech"] = "foundry-science-packs-tech",
--   ["em-science-packs-tech"] = "emp-science-packs-tech",
--   ["cryo-science-packs-tech"] = "biochamber-science-packs-tech",
--   ["casting-science-packs-productivity-tech"] = "foundry-science-packs-productivity-tech",
--   ["em-science-packs-productivity-tech"] = "emp-science-packs-productivity-tech",
--   ["cryo-science-packs-productivity-tech"] = "biochamber-science-packs-productivity-tech",
-- }
-- -- Specify which old techs were infinite
-- local infinite_techs = {
--   ["casting-science-packs-productivity-tech"] = true,
--   ["em-science-packs-productivity-tech"] = true,
--   ["cryo-science-packs-productivity-tech"] = true,
-- }
-- for old_name, new_name in pairs(old_to_new_techs) do
  -- local new_tech = data.raw.technology[new_name]
  -- if new_tech then
  --   local dummy = table.deepcopy(new_tech)
  --   dummy.name = old_name
  --   dummy.hidden = true
  --   dummy.enabled = false

  --   -- Fix for infinite techs
  --   if infinite_techs[old_name] then
  --     dummy.max_level = 255  -- Factorio treats 255 as "infinite" in data stage
  --     dummy.level = 1        -- Base level
  --     dummy.upgrade = true   -- Infinite techs usually are upgradeable
  --     dummy.next_upgrade = nil  -- Prevent linkage to new techs
  --   end
  --   if old_tech and new_tech and old_tech.researched then
  --     local level = old_tech.level
  --     for i = 1, level do
  --       new_tech.level = math.max(new_tech.level, i)
  --     end
  --   end
  --   data:extend({dummy})
  -- else
  --   log("Migration: Missing new tech '" .. new_name .. "' for dummy tech '" .. old_name .. "'")
  -- end
-- end

-- add casting rails to the stone-casting tech from my other mod
if mods["OCs_stone_casting"] and data.raw["technology"]["lava-to-stone-tech"] then
  table.insert(data.raw["technology"]["lava-to-stone-tech"].effects, {
    type = "unlock-recipe",
    recipe = "casting-rail"
  })
else -- should not be the case because of dependencies, vanilla fallback
  table.insert(data.raw["technology"]["railway"].effects, {
    type = "unlock-recipe",
    recipe = "casting-rail"
  })
end

-- add casting heat-pipe to the adjacent techs
local technology_names = {"heating-tower","nuclear-power"}
local recipe_name = "casting-heat-pipe"
for _, technology_name in pairs(technology_names) do
  local tech = data.raw["technology"][technology_name]
  if tech then
    tech.effects = tech.effects or {} -- Ensure the effects table exists
    table.insert(tech.effects, {type = "unlock-recipe", recipe = recipe_name})
    log("Added recipe '" .. recipe_name .. "' to technology '" .. technology_name .. "'.")
  else
    log("Technology '" .. technology_name .. "' does not exist.")
  end
end

-- -- Testweise included military technologies
-- if settings.startup["allow-heavy-military-tech"].value then
-- data:extend({
--   { -- heavy armor plating
--     type = "technology",
--     name = "heavy-armor-plating-tech",
--     -- order = "hka"
--     icons = {
--       {
--         icon = "__OCs_foundary_expansion__/graphics/technology/casting-heavy-armor-plating-tech.png",
--         icon_size = 64,
--         icon_mipmaps = 1,
--         scale = 4,
--       },
--       {
--         icon = "__OCs_foundary_expansion__/graphics/technology/overlayer-tech-molten-iron.png",
--         icon_size = 256,
--         icon_mipmaps = 4,
--       }
--     },
--     icon_size = 256, icon_mipmaps = 4,
--     prerequisites = {"tungsten-steel","military-4"},
--     unit = {
--       ingredients = {
--         {"automation-science-pack", 1},
--         {"logistic-science-pack", 1},
--         {"chemical-science-pack", 1},
--         {"millitary-science-pack", 2}, -- duh!
--         {"utility-science-pack", 1},
--         {"production-science-pack", 2}, -- duh-hu!
--         {"space-science-pack", 1},
--         {"metallurgic-science-pack", 2},
--       },
--       time = 30,
--       count = 100
--       },
--       effects = { -- not impemented yet
--         {type = "unlock-recipe", recipe = "casting-heavy-armor-plating"},
--         {type = "unlock-recipe", recipe = "heavy-armor-plating"},
--         {type = "unlock-recipe", recipe = "ablative-armor-equipment"},
--       },
--   },
-- })
-- end

-- Determine max level for productivity tech and creating the techs
local max_level_setting = settings.startup["science-productivity-max-level"].value
if max_level_setting == 0 then
  return -- Skip defining the prod-bonus-tech entirely
else
  local max_level
  if max_level_setting == -1 then
      max_level = "infinite"
  else
      max_level = max_level_setting
  end

  local function create_prod_bonus_tech(name, prereq, recipes)
    -- Get icon details from the prerequisite tech
    local base_icon = data.raw["technology"][prereq].icon

    -- Collect all recipes from the prerequisite tech and add additional recipes
    local productivity_effects = {}

    -- Function to add a productivity effect for a recipe
    local function add_productivity_effect(recipe)
      table.insert(productivity_effects, {
        type = "change-recipe-productivity",
        recipe = recipe,
        change = 0.05, -- +5% productivity per level
        effect_description = {"technology-description." .. name}
      })
    end

    -- Process all recipes unlocked by the prerequisite tech
    for _, effect in pairs(data.raw["technology"][prereq].effects) do
      if effect.type == "unlock-recipe" and effect.recipe then
        add_productivity_effect(effect.recipe)
      end
    end

    local allow_planetary_prod = settings.startup["allow-planetary-sci-productivity"].value
    if allow_planetary_prod then
      for _, recipe in pairs(recipes) do
        add_productivity_effect(recipe)
      end
    end

    return {
      type = "technology",
      name = name,
      icons = util.technology_icon_constant_recipe_productivity(base_icon), --reusing the vanilla prod icon as overlayer
      prerequisites = {prereq},
      effects = productivity_effects, 
      unit = {
        ingredients = data.raw["technology"][prereq].unit.ingredients,
        count_formula = "1000*2^(L/2)", -- Exponential scaling
        time = data.raw["technology"][prereq].unit.time
      },
      upgrade = true,
      max_level = max_level,
      -- order = "z-" .. name
    }
  end

  -- Create separate techs for the alternative recipes
  data:extend({
    create_prod_bonus_tech("foundry-science-packs-productivity-tech", "foundry-science-packs-tech", {"metallurgic-science-pack"}),
    create_prod_bonus_tech("emp-science-packs-productivity-tech", "emp-science-packs-tech", {"electromagnetic-science-pack"}),
    create_prod_bonus_tech("biochamber-science-packs-productivity-tech", "biochamber-science-packs-tech", {"agricultural-science-pack"}),
    create_prod_bonus_tech("cryoplant-science-packs-productivity-tech", "cryoplant-science-packs-tech", {"cryogenic-science-pack","promethium-science-pack"}),
  })

  -- Overwrite cryoplant tech cost with research trigger
  local cryo_tech = data.raw.technology["cryoplant-science-packs-tech"]
  if cryo_tech then
    cryo_tech.unit = nil -- Clear old unit definition
    cryo_tech.research_trigger = {
      type = "craft-item",
      item = "promethium-science-pack",
      count = 10,
    }
  end
end