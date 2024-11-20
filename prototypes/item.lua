local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")

data:extend({
  {
    type = "item",
    name = "correga-power-core",
    icon = "__base__/graphics/icons/space-science-pack.png",
    subgroup = "correga-processes",
    order = "a-a",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    stack_size = 1,
    default_import_location = "correga",
    weight = 1*tons,
    spoil_ticks = 5 * minute,
    spoil_result = "correga-unstable-power-core"
  },
  {
    type = "item",
    name = "correga-unstable-power-core",
    icon = "__space-age__/graphics/icons/metallurgic-science-pack.png",
    subgroup = "correga-processes",
    order = "a-b",
    inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
    pick_sound = item_sounds.atomic_bomb_inventory_pickup,
    drop_sound = item_sounds.atomic_bomb_inventory_move,
    stack_size = 1,
    default_import_location = "correga",
    weight = 1*tons,
    spoil_ticks = 1 * minute,
    spoil_to_trigger_result = {
      items_per_trigger=1,
      trigger = table.deepcopy(data.raw["projectile"]["atomic-rocket"].action),
    }
  },
  {
    type = "item",
    name = "correga-result-power-core",
    icon = "__space-age__/graphics/icons/agricultural-science-pack.png",
    subgroup = "correga-processes",
    order = "a-c",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    stack_size = 1,
    default_import_location = "correga",
    weight = 1*tons,
    spoil_ticks = 60 * 8,
    spoil_to_trigger_result = {
      items_per_trigger=1,
      trigger = {
        type="direct",
        action_delivery=
        {
            {
                type="instant",
                source_effects={
                    type="script",
                    effect_id="correga-result-power-core"
                }
            }
        }
      },
    }
  },
  {
    type = "item",
    name = "correga-stablization-cage",
    icon = "__space-age__/graphics/icons/tungsten-plate.png",
    subgroup = "correga-processes",
    order = "b-a",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 20,
    default_import_location = "correga",
    weight = 50*kg,
  },
  {
    type = "item",
    name = "correga-stablized-core",
    icon = "__space-age__/graphics/icons/tungsten-plate.png",
    subgroup = "correga-processes",
    order = "b-b",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    stack_size = 1,
    default_import_location = "correga",
    fuel_value = "50GJ",
    fuel_category = "fusion",    
    burnt_result = "correga-depleted-stablized-core",
    weight = 10*tons,
  },
  {
    type = "item",
    name = "correga-depleted-stablized-core",
    icon = "__space-age__/graphics/icons/tungsten-plate.png",
    subgroup = "correga-processes",
    order = "b-c",
    inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
    pick_sound = item_sounds.atomic_bomb_inventory_pickup,
    drop_sound = item_sounds.atomic_bombr_inventory_move,
    stack_size = 1,
    default_import_location = "correga",
    weight = 10*tons,
    spoil_ticks = 5 * minute,
    spoil_to_trigger_result = {
      items_per_trigger=1,
      trigger = table.deepcopy(data.raw["projectile"]["atomic-rocket"].action),
    }
  },
})