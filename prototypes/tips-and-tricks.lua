local simulations = require("__space-age__/prototypes/tips-and-tricks-simulations")

data:extend({
    {
        type = "tips-and-tricks-item",
        name = "correga-briefing",
        tag = "[planet=correga]",
        category = "space-age",
        order = "d-k",
        trigger =
        {
            type = "research",
            technology = "planet-discovery-correga"
        },
        skip_trigger =
        {
            type = "or",
            triggers =
            {
                {
                    type = "change-surface",
                    surface = "correga"
                },
                {
                    type = "sequence",
                    triggers =
                    {
                        {
                            type = "research",
                            technology = "planet-discovery-correga"
                        },
                        {
                            type = "time-elapsed",
                            ticks = 15 * minute
                        },
                        {
                            type = "time-since-last-tip-activation",
                            ticks = 15 * minute
                        }
                    }
                }
            }
        },

        -- for now just show vulcanus
        simulation = simulations.vulcanus_briefing

    }
})