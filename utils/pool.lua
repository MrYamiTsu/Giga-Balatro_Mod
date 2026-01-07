-- POOLS --
Giga.POOLS = {
    r_food = {
        _calculate = function()
            Giga.POOLS.r_food = {_calculate = Giga.POOLS.r_food._calculate}
            for _, c in pairs(G.P_CENTERS) do
                if c.set == 'Giga_Food' and c.giga_data and c.giga_data.r_food then
                    table.insert(Giga.POOLS.r_food, c.key)
                end
            end
        end
    },
    fusion_jokers = {
        _calculate = function()
            Giga.POOLS.fusion_jokers = {_calculate = Giga.POOLS.fusion_jokers._calculate}
            for _, c in pairs(G.P_CENTERS) do
                if c.set == 'Joker' and c.giga_data and c.giga_data.merge_materials and #c.giga_data.merge_materials >= 2 then
                    table.insert(Giga.POOLS.fusion_jokers, c.key)
                end
            end
        end
    },
    astrals = {
        _calculate = function()
            Giga.POOLS.astrals = {_calculate = Giga.POOLS.astrals._calculate}
            for _, c in pairs(G.P_CENTERS) do
                if (c.set == 'Planet' or c.set == 'Spectral') and c.giga_data and c.giga_data.astral_variant then
                    Giga.POOLS.astrals[c.key] = c.giga_data.astral_variant
                end
            end
        end
    }
}

-- INITIALISATION --
function init_pools()
    for _, pool in pairs(Giga.POOLS) do
        pool._calculate()
    end
end