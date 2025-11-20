-- POOLS --
Giga.POOLS = {
    r_food = {
        _calculate = function()
            Giga.POOLS.r_food = {_calculate = Giga.POOLS.r_food._calculate}
            for _, c in pairs(G.P_CENTERS) do
                if string.sub(c.key, 1, 2) == 'c_' and c.giga_data and c.giga_data.r_food then
                    table.insert(Giga.POOLS.r_food, c.key)
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