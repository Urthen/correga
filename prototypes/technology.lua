data:extend({
    {
        type = "technology",
        name = "planet-discovery-correga",
        icons = util.technology_icon_constant_planet("__space-age__/graphics/technology/fulgora.png"),
        icon_size = 256,
        essential = true,
        effects =
        {
            {
                type = "unlock-space-location",
                space_location = "correga",
                use_icon_overlay_constant = true
            },
        },
        prerequisites = { "fusion-reactor" },
        unit =
        {
            count = 2000,
            ingredients =
            {
                { "automation-science-pack",      1 },
                { "logistic-science-pack",        1 },
                { "chemical-science-pack",        1 },
                { "production-science-pack",      1 },
                { "utility-science-pack",         1 },
                { "space-science-pack",           1 },
                { "metallurgic-science-pack",     1 },
                { "agricultural-science-pack",    1 },
                { "electromagnetic-science-pack", 1 },
                { "cryogenic-science-pack",       1 }
            },
            time = 60
        }
    },
    {
        type = "technology",
        name = "correga-emergency-stablization",
        icon = "__base__/graphics/technology/space-science-pack.png",
        icon_size = 256,     
        essential = true,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "correga-emergency-stablization",
          }
        },
        prerequisites = { "planet-discovery-correga"},
        research_trigger =
        {
          type = "mine-entity",
          entity = "corregan-ruin-lab"
        }
      },
      {
        type = "technology",
        name = "correga-core-stablization",
        icon = "__base__/graphics/technology/space-science-pack.png",
        icon_size = 256,            
        essential = true,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "correga-core-stablization",
          },
          {
            type = "unlock-recipe",
            recipe = "correga-stablization-cage",
          },
          {
            type = "unlock-recipe",
            recipe = "correga-stablized-core",
          },
          {
            type = "unlock-recipe",
            recipe = "correga-core-extraction",
          },          
          {
            type = "unlock-recipe",
            recipe = "correga-depleted-core-extraction",
          },
        },
        prerequisites = { "correga-emergency-stablization"},
        research_trigger =
        {
          type = "craft-item",
          item = "correga-power-core"
        }
      },
      {
        type = "technology",
        name = "correga-science-pack",
        icon = "__base__/graphics/technology/space-science-pack.png",
        icon_size = 256,             
        essential = true,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "correga-science-pack",
          },
        },
        prerequisites = { "correga-core-stablization"},
        research_trigger =
        {
          type = "craft-item",
          item = "correga-stablized-core"
        }
      },
      {
        type = "technology",
        name = "correga-experimental-matter-synthesis",
        icon = "__base__/graphics/technology/space-science-pack.png",
        icon_size = 256,                     
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "correga-synthesis-stone",
          },
          {
            type = "unlock-recipe",
            recipe = "correga-synthesis-coal",
          },
        },
        prerequisites = { "correga-science-pack"},
        unit =
        {
            count = 1000,
            ingredients =
            {
                { "automation-science-pack",      2 },
                { "logistic-science-pack",        2 },
                { "chemical-science-pack",        2 },
                { "production-science-pack",      2 },
                { "utility-science-pack",         2 },
                { "space-science-pack",           2 },
                { "metallurgic-science-pack",     2 },
                { "cryogenic-science-pack",       2 },
                { "correga-science-pack",         1 }
            },
            time = 120
        }
      },
      {
        type = "technology",
        name = "correga-power-core-duplication",
        icon = "__base__/graphics/technology/space-science-pack.png",
        icon_size = 256,             
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "correga-inert-power-core",
          },
          -- {
          --   type = "unlock-recipe",
          --   recipe = "correga-power-core-ignition",
          -- },
        },
        prerequisites = { "correga-science-pack"},
        unit =
        {
            count = 500,
            ingredients =
            {
                { "automation-science-pack",      2 },
                { "logistic-science-pack",        2 },
                { "chemical-science-pack",        2 },
                { "production-science-pack",      2 },
                { "utility-science-pack",         2 },
                { "space-science-pack",           2 },
                { "metallurgic-science-pack",     2 },
                { "cryogenic-science-pack",       2 },
                { "correga-science-pack",         1 }
            },
            time = 120
        }
      },
})