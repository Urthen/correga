data.extend(
{
  {
    type="recipe-category",
    name="cryogenics-or-hand-crafting"
  },
  {
    type = "recipe",
    name = "correga-emergency-stablization",
    category = "cryogenics-or-hand-crafting",
    auto_recycle = false,
    allow_decomposition = false,
    allow_quality = false,
    allow_as_intermediate = false,
    allow_intermediates = false,
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "correga-unstable-power-core", amount = 1}
    },
    results =
    {
      {type = "item", name = "correga-power-core", amount = 1, percent_spoiled=0.5, ignored_by_productivity=1}
    },
    allow_productivity = false,
    icon = "__base__/graphics/icons/space-science-pack.png",
    subgroup = "correga-processes",
  },
  {
    type = "recipe",
    name = "correga-core-stablization",
    category = "cryogenics",
    auto_recycle = false,
    allow_decomposition = false,
    allow_quality = false,
    allow_as_intermediate = false,
    allow_intermediates = false,    
    result_is_always_fresh = true,
    hide_from_stats = true,
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "correga-power-core", amount = 1}
    },
    results =
    {
      {type = "item", name = "correga-result-power-core", amount = 1, ignored_by_productivity=1},
      {type = "item", name = "correga-power-core", amount = 1, ignored_by_productivity=1, probability=0},
      {type = "item", name = "correga-unstable-power-core", amount = 1, ignored_by_productivity=1, probability=0}
      
    },
    allow_productivity = false,
    icon = "__base__/graphics/icons/space-science-pack.png",
    subgroup = "correga-processes",
  },
  {
    type = "recipe",
    name = "correga-stablization-cage",
    category = "electromagnetics",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "tungsten-plate", amount = 5},
      {type = "item", name = "superconductor", amount = 2},
      {type = "item", name = "supercapacitor", amount = 2},
      {type = "item", name = "carbon-fiber", amount = 2},
      {type = "item", name = "quantum-processor", amount = 1},
    },
    results={{type="item", name="correga-stablization-cage", amount=1}},
    icon = "__base__/graphics/icons/space-science-pack.png",
    subgroup = "correga-processes",
  },
  {
    type = "recipe",
    name = "correga-stablized-core",
    category = "cryogenics",
    enabled = false,
    energy_required = 20,
    hide_from_stats = true,
    ingredients =
    {
      {type = "item", name = "correga-stablization-cage", amount = 1, ignored_by_stats=1},
      {type = "item", name = "correga-power-core", amount = 1, ignored_by_stats=1},
      {type = "fluid", name = "fluoroketone-cold", amount = 10, ignored_by_stats = 10},

    },
    results={{type="item", name="correga-stablized-core", amount=1, ignored_by_productivity=1}},
    allow_productivity = false,
    icon = "__base__/graphics/icons/space-science-pack.png",
    subgroup = "correga-processes",
  },
  {
    type = "recipe",
    name = "correga-core-extraction",
    category = "cryogenics",
    enabled = false,
    hide_from_stats = true,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "correga-stablized-core", amount = 1},
    },
    results={
        {type="item", name="correga-stablization-cage", amount=1, ignored_by_productivity=1},
        {type = "fluid", name = "fluoroketone-cold", amount = 10, ignored_by_productivity=10},
        {type = "item", name = "correga-power-core", amount = 1, ignored_by_productivity=1},
    },
    allow_productivity = false,
    main_product = "correga-power-core",
    icon = "__base__/graphics/icons/space-science-pack.png",
    subgroup = "correga-processes",
  },
  {
    type = "recipe",
    name = "correga-depleted-core-extraction",
    category = "cryogenics",
    enabled = false,
    hide_from_stats = true,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "correga-depleted-stablized-core", amount = 1},
    },
    results={
        {type="item", name="correga-stablization-cage", amount=1, ignored_by_productivity=1},
        {type = "fluid", name = "fluoroketone-hot", amount = 10, ignored_by_productivity=10},
        {type = "item", name = "correga-unstable-power-core", amount = 1, ignored_by_productivity=1},
    },
    allow_productivity = false,
    main_product = "correga-unstable-power-core",
    icon = "__base__/graphics/icons/space-science-pack.png",
    subgroup = "correga-processes",
  },
})