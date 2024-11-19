local meld = require("meld")
local correga_lab = meld(table.deepcopy(data.raw["simple-entity"]["fulgoran-ruin-vault"]), {
    name = "corregan-ruin-lab",
    autoplace = {
        order = "a[ruin]-a[vault]",
        probability_expression = "(min(fulgora_spots, (1 - fulgora_starting_vault_cone) / 2) < 0.015) * min(fulgora_vaults_and_starting_vault, 1 - fulgora_starting_mask)"
    },
    minable = {
        results = meld.append({
            {type="item", name="correga-power-core", amount_min=1, amount_max=1, percent_spoiled=0.9}
        })
    }
})

data:extend({
    correga_lab
})