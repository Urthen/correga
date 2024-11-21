table.insert(data.raw["assembling-machine"]["cryogenic-plant"].crafting_categories, "cryogenics-or-hand-crafting")

-- future-proof against other mods modifying this higher for some reason
local fusion_reactor = data.raw["fusion-reactor"]["fusion-reactor"]
if 
  not fusion_reactor.burner.burnt_inventory_size or fusion_reactor.burner.burnt_inventory_size < 1 
then fusion_reactor.burner.burnt_inventory_size = 1 end