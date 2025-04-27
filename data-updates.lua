data.raw["recipe"]["engine-unit"].category = "metallurgy-or-assembling"  -- use this as hotfix of the mod "foundry-expanded"


if alternative_recipes then
    -- Add/Change order of Alternative Receptes
    local alternatives = {
        ["space-platform-foundation"] = {"tungsten-space-platform-foundation", "space-platform-foundation"},
    }
    for name, alt_list in pairs(alternatives) do
        alternative_recipes[name] = alt_list
    end
end

-- require("prototypes/entity-updates")
-- require("prototypes/item-updates")
require("prototypes.recipe-updates")
require("prototypes.technology-updates")