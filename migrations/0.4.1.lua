for _, force in pairs(game.forces) do
    -- Tech migration
    if force.technologies["casting-science-packs-tech"] then
      force.technologies["foundry-science-packs-tech"].researched =
        force.technologies["casting-science-packs-tech"].researched
    end
    if force.technologies["casting-science-packs-productivity-tech"] then
      log("casting prod tech")
      force.technologies["foundry-science-packs-productivity-tech"].researched =
        force.technologies["casting-science-packs-productivity-tech"].researched
    end
    if force.technologies["em-science-packs-tech"] then
      force.technologies["emp-science-packs-tech"].researched =
        force.technologies["em-science-packs-tech"].researched
    end
    if force.technologies["em-science-packs-productivity-tech"] then
      log("em prod tech")
      force.technologies["emp-science-packs-productivity-tech"].researched =
        force.technologies["em-science-packs-productivity-tech"].researched
    end
    --  cryo stuff was moved to the biochamber tech
    if force.technologies["cryo-science-packs-tech"] then
      force.technologies["biochamber-science-packs-tech"].researched =
        force.technologies["cryo-science-packs-tech"].researched
    end
    if force.technologies["cryo-science-packs-productivity-tech"] then
      log("cryo prod tech")
      force.technologies["cryo-science-packs-productivity-tech"].researched =
        force.technologies["biochamber-science-packs-productivity-tech"].researched
    end

    -- Adjust unlocked recipes
    for _, recipe in pairs({
      {"casting-science-packs-tech", "foundry-science-packs-tech"},
      {"em-science-packs-tech", "emp-science-packs-tech"}
    }) do
      if force.recipes[recipe[1]] then
        force.recipes[recipe[2]].enabled = force.recipes[recipe[1]].enabled
      end
    end
    log("Renamed tech added.")
    -- force.technologies["casting-science-packs-productivity-tech"] = nil
    -- force.technologies["casting-science-packs-tech"] = nil
    -- force.technologies["em-science-packs-productivity-tech"] = nil
    -- force.technologies["em-science-packs-tech"] = nil
    -- log("Old tech removed.")

    -- Recipe migration
    local previous_mil_sci_recipe = "casting-military-science-pack"
    local renamed_mil_sci_recipe = "lava-to-military-science-pack"

    -- Check if the old recipe was unlocked and enable the renamed version
    if force.recipes[previous_mil_sci_recipe] and force.recipes[previous_mil_sci_recipe].enabled then
      force.recipes[renamed_mil_sci_recipe].enabled = true
    end

    -- Reset recipes to ensure new unlocks are applied
    force.reset_recipes()
    force.reset_technology_effects()

    -- Update assemblers using the old recipe
    for _, surface in pairs(game.surfaces) do
      for _, entity in pairs(surface.find_entities_filtered { type = "assembling-machine" }) do
        if entity.get_recipe() and entity.get_recipe().name == previous_mil_sci_recipe then
          entity.set_recipe(renamed_mil_sci_recipe) -- Replace with the renamed recipe
        end
      end
    end
    log("assemblers migration done.")
end
