local function make_synthesis_recipe(product, order, amount_min, amount_max, category, energy_required, probability, type)
  category = category or "metallurgy"
  energy_required = energy_required or 20
  type = type or "item"
  return {
    type = "recipe",
    name = "correga-synthesis-" .. product,
    category = category,
    enabled = false,
    allow_quality = false,
    energy_required = energy_required,
    ingredients =
    {
      {type = "item", name = "correga-power-core", amount = 1, ignored_by_stats=1},
      {type = "fluid", name = "fluoroketone-hot", amount = energy_required, ignored_by_stats=energy_required},
    },
    results={
        {type="item", name="correga-result-power-core", amount=1, ignored_by_stats=1, ignored_by_productivity=1},
        {type = "fluid", name = "fluoroketone-cold", amount = energy_required, ignored_by_stats=energy_required, ignored_by_productivity=energy_required},
        {type = type, name = product, amount_min=amount_min, amount_max=amount_max, probability=probability},
    },
    main_product = product,
    -- todo: build an icon set
    subgroup = "correga-synthesis",
    order = order .. "[" .. product .. "]"
  }
end

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
    subgroup = "correga-stablization",
    order = "a-a",
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
      {type = "item", name = "correga-result-power-core", amount = 1, percent_spoiled=0.5, ignored_by_productivity=1},
      {type = "item", name = "correga-power-core", amount = 1, ignored_by_productivity=1, probability=0},
      {type = "item", name = "correga-unstable-power-core", amount = 1, ignored_by_productivity=1, probability=0}
      
    },
    main_product="correga-power-core",
    allow_productivity = false,
    subgroup = "correga-stablization",
    order = "a-b",
  },
  {
    type = "recipe",
    name = "correga-stablization-cage",
    category = "electromagnetics",
    enabled = false,
    allow_quality = false,
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
    subgroup = "correga-intermediates",    
    order = "a-a",
  },
  {
    type = "recipe",
    name = "correga-stablized-core",
    category = "cryogenics",
    enabled = false,
    allow_decomposition = false,
    allow_quality = false,
    allow_as_intermediate = false,
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
    subgroup = "correga-stablization",
    order = "b-a"
  },
  {
    type = "recipe",
    name = "correga-core-extraction",
    category = "cryogenics",
    enabled = false,
    allow_decomposition = false,
    allow_quality = false,
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
    subgroup = "correga-stablization",
    order = "b-b"
  },
  {
    type = "recipe",
    name = "correga-depleted-core-extraction",
    category = "cryogenics",
    enabled = false,
    allow_decomposition = false,
    allow_quality = false,
    hide_from_stats = true,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "correga-depleted-stablized-core", amount = 1},
    },
    results={
        {type="item", name="correga-stablization-cage", amount=1, probability=0.99, ignored_by_productivity=1},
        {type = "fluid", name = "fluoroketone-hot", amount = 10, ignored_by_productivity=10},
        {type = "item", name = "correga-unstable-power-core", amount = 1, ignored_by_productivity=1},
    },
    allow_productivity = false,
    main_product = "correga-unstable-power-core",
    subgroup = "correga-stablization",
    order = "b-c"
  },
  {
    type = "recipe",
    name = "correga-science-pack",
    category = "cryogenics",
    enabled = false,
    allow_quality = false,
    energy_required = 20,
    ingredients =
    {
      {type = "item", name = "correga-power-core", amount = 1, ignored_by_stats=1},
      {type = "fluid", name = "fluoroketone-cold", amount = 10, ignored_by_productivity=10},
    },
    results={
        {type="item", name="correga-result-power-core", amount=1, ignored_by_stats=1, ignored_by_productivity=1},
        {type = "fluid", name = "fluoroketone-hot", amount = 10, ignored_by_productivity=10},
        {type = "item", name = "correga-science-pack", amount = 10},
    },
    main_product = "correga-science-pack",
    subgroup = "science-pack",
    order = "k-a[correga]",
  },
  {
    type = "recipe",
    name = "correga-inert-power-core",
    category = "electromagnetics",
    enabled = false,
    allow_quality = false,    
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "correga-stablization-cage", amount = 1},
      {type = "item", name = "quantum-processor", amount = 50},
      {type = "item", name = "low-density-structure", amount = 50},
      {type = "fluid", name = "fluoroketone-cold", amount = 500},

    },
    results={{type="item", name="correga-stablization-cage", amount=1}},
    subgroup = "correga-intermediates",    
    order = "a-a",
  },

  make_synthesis_recipe("scrap", "a", 50, 150),
  make_synthesis_recipe("stone", "a", 50, 100),
  make_synthesis_recipe("coal", "a", 10, 50),
  make_synthesis_recipe("calcite", "a", 10, 50),
  make_synthesis_recipe("iron-ore", "b", 20, 50),
  make_synthesis_recipe("copper-ore", "b", 20, 50),
  make_synthesis_recipe("uranium-ore", "c", 10, 30),
})