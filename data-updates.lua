-- small mods
if mods ["Advanced-Electric-Revamped-v16"] then
    require("prototypes.compatibility.Advanced-Electric-Revamped")
end

if mods["nixie-tubes"] then
    require("prototypes.compatibility.nixie-tubes")
end

if mods["long_stack_inserter"] then
    require("prototypes.compatibility.long-stack-inserter")
end

if mods["elevated-pipes"] then
    require("prototypes.compatibility.elevated-pipes")
end

if mods["lane-splitter"] then
    require("prototypes.compatibility.lane-splitter")
end

if mods["space-panels"] then
    require("prototypes.compatibility.space-panels")
end

if mods["aai-containers"] then
    require("prototypes.compatibility.aai-containers")
end

if mods["factorissimo-2-notnotmelon"] then
    require("prototypes.compatibility.factorissimo")
end

if mods["Various_Asteroid_Grabbers"] or mods["Various_Cargo_Bays"] or mods["space_platform_hub"] then
    require("prototypes.compatibility.various-grabber-and-cargo-bays")
end

-- planet mods
if mods["Metal-and-Stars"] then
    require("prototypes.compatibility.metal-and-stars")
end

if mods["planet-muluna"] then -- also counts as small overhaul
    require("prototypes.compatibility.planet-muluna")
end

-- overhaul mods
if mods["aai-industry"] then
    require("prototypes.compatibility.aai-industry")
end

if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
    require("prototypes.compatibility.Krastorio2")
end