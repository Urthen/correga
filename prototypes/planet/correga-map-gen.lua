fulgora = function()
    return
    {
      property_expression_names =
      {
        elevation = "correga_elevation",
        temperature = "correga_temperature",
        moisture = "correga_moisture",
        aux = "correga_aux",
        cliffiness = "fulgora_cliffiness",
        cliff_elevation = "cliff_elevation_from_elevation",
        ["tile:lava:probability"] = "correga_lava_probability",
        ["tile:lava-hot:probability"] = "correga_lava_hot_probability",
        ["tile:oil-ocean-shallow:probability"] = "correga_oil_ocean_probability"
      },
      cliff_settings =
      {
        name = "cliff-fulgora",
        cliff_elevation_0 = 80,
        cliff_elevation_interval = 40,
        cliff_smoothing = 0, -- This is critical for correct cliff placement on the coast.
        richness = 0.95
      },
      autoplace_controls =
      {
        ["scrap"] = {},
      },
      autoplace_settings =
      {
        ["tile"] =
        {
          settings =
          {
            ["oil-ocean-shallow"] = {},
            ["fulgoran-rock"] = {},
            ["fulgoran-dust"] = {},
            ["fulgoran-sand"] = {},
            ["fulgoran-dunes"] = {},
            ["fulgoran-walls"] = {},
            ["fulgoran-paving"] = {},
            ["fulgoran-conduit"] = {},
            ["fulgoran-machinery"] = {},  
            ["lava"] = {},
            ["lava-hot"] = {},
          }
        },
        ["decorative"] =
        {
          settings =
          {
            ["fulgoran-ruin-tiny"] = {},
            ["medium-fulgora-rock"] = {},
            ["small-fulgora-rock"] = {},
            ["tiny-fulgora-rock"] = {},
            ["crater-small"] = {},
            ["crater-large"] = {},            
            ["vulcanus-crack-decal-large"] = {},
            ["vulcanus-crack-decal-huge-warm"] = {},
          }
        },
        ["entity"] =
        {
          settings =
          {
            ["scrap"] = {},
            ["corregan-ruin-lab"] = {},
            ["fulgoran-ruin-colossal"] = {},
            ["fulgoran-ruin-huge"] = {},
            ["fulgoran-ruin-big"] = {},
            ["fulgoran-ruin-stonehenge"] = {},
            ["fulgoran-ruin-medium"] = {},
            ["fulgoran-ruin-small"] = {},
            ["big-fulgora-rock"] = {},            
            ["ashland-lichen-tree"] = {},
            ["ashland-lichen-tree-flaming"] = {},
          }
        }
      }
    }
  end

  return fulgora