data:extend(
{
      -- Basic terrain noise for mixing biomes
    {
        type = "noise-expression",
        name = "correga_biome_mix",
        expression = "clamp(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 'correga-biome-mix', octaves = 3, input_scale = 1/150}, 0, 1)"
    },

    {
        type = "noise-expression",
        name = "correga_devastated_elevation",
        expression = "vulcanus_basalt_lakes * 100"
    },

    {
        type = "noise-expression",
        name = "correga_plains_hills",
        expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 'correga-plains-hills', octaves = 3, input_scale = 1/50, output_scale = 0.1} + 0.2"
    },

    {
        type = "noise-expression",
        name = "correga_plains_river_channels",
        expression = "abs(basis_noise{x = x, y = y, seed0 = map_seed, seed1 = 'correga-plains-river-channels', input_scale = 1/150, output_scale = 4}) - 1"
    },

    {
        type = "noise-expression",
        name = "correga_plains_river_gaps",
        expression = "clamp(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 'correga-plains-river-gaps', octaves = 2, input_scale = 1/200} + 0.6, 0, 1)"
    },

    {
        type = "noise-expression",
        name = "correga_plains_rivers",
        expression = "clamp(correga_plains_river_channels + correga_plains_river_gaps, -1, 0)"
    },

    {
        type = "noise-expression",
        name = "correga_plains_elevation",
        expression = "(correga_plains_hills + correga_plains_rivers) * 100"        
    },

    -- Final planetary selections
    {
        type = "noise-expression",
        name = "correga_elevation",
        expression = "lerp(correga_plains_elevation, correga_devastated_elevation, correga_biome_mix) + 80" -- add 80 for fulgora oil "shoreline" fix
    },
    {
        type = "noise-expression",
        name = "correga_temperature",
        expression = "lerp(temperature_basic, vulcanus_temperature, correga_biome_mix)"
    },
    {
        type = "noise-expression",
        name = "correga_moisture",
        expression = "lerp(moisture_basic, vulcanus_moisture, correga_biome_mix)"
    },
    {
        type = "noise-expression",
        name = "correga_aux",
        expression = "lerp(aux_basic, vulcanus_aux, correga_biome_mix)"
    },

    -- Tiles    
    {
        type = "noise-expression",
        name = "correga_lava_probability",
        expression = "1100 * lerp(0, lava_basalts_range, correga_biome_mix * 2)"
    },    
    {
        type = "noise-expression",
        name = "correga_lava_hot_probability",
        expression = "2200 * lerp(0, lava_hot_basalts_range, correga_biome_mix * 2)"
    },
    {
        type = "noise-expression",
        name = "correga_oil_ocean_probability",
        expression = "500 * (elevation < fulgora_coastline)"
    }
})