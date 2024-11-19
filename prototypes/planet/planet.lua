require("__correga__.prototypes.planet.planet-correga-map-gen")

local correga_map_gen = require("__correga__.prototypes.planet.correga-map-gen")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local meld = require("meld")

local correga = {
    type = "planet",
    name = "correga",
    icon = "__space-age__/graphics/icons/fulgora.png",
    starmap_icon = "__space-age__/graphics/icons/starmap-planet-fulgora.png",
    starmap_icon_size = 512,
    map_gen_settings = meld.overwrite(correga_map_gen()),
    gravity_pull = 10,
    distance = 40,
    orientation = 0.450,
    magnitude = 1.0,
    label_orientation = 0.15,
    order = "e[correga]",
    subgroup = "planets",
    pollutant_type = nil,
    solar_power_in_space = 15,
    surface_properties =
    {
        ["day-night-cycle"] = 20 * minute,
        ["magnetic-field"] = 99,
        pressure = 300,
        ["solar-power"] = 10,
        gravity = 6
    },
    ticks_between_player_effects = 2
}

correga = meld(table.deepcopy(data.raw["planet"]["fulgora"]), correga)

data:extend({
    correga,
    {
        type = "space-connection",
        name = "aquilo-correga",
        subgroup = "planet-connections",
        from = "aquilo",
        to = "correga",
        order = "b",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
    },
    {
        type = "space-connection",
        name = "aquilo-fulgora",
        subgroup = "planet-connections",
        from = "fulgora",
        to = "correga",
        order = "b",
        length = 30000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
    }
})
