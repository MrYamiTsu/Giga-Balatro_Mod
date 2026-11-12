to_big = to_big or function(x) return x end

--- Generic helper to perform the flip & juice animation on card transformation
--- @param _card table the card to animate
--- @param transform_func function the mutation to apply while card is face-down
--- @param end_delay number|nil optional extra delay at the end
function Giga.flip_transform_card(_card, transform_func, end_delay)
    if not _card then return end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            _card:juice_up(0.3, 0.5)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            _card:flip()
            _card:juice_up(0.3, 0.3)
            _card:start_materialize(nil, false, 1)
            return true
        end
    }))
    delay(0.2)
    if transform_func then
        transform_func()
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            _card:flip()
            _card:juice_up(0.3, 0.3)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            if G.hand then
                G.hand:unhighlight_all()
            end
            return true
        end
    }))
    delay(end_delay or 0.5)
end

--- Upgrade the enhancement of a card
--- @param _card table the card with the enhancement to upgrade
function Giga.upgrade_enhancement(_card)
    local target_key = _card and _card.config and (_card.config.center_key or (_card.config.center and _card.config.center.key))
    if not target_key or not G.P_CENTERS[target_key] or not G.P_CENTERS[target_key].giga_data then
        return
    end
    local enh_target = G.P_CENTERS[target_key].giga_data.enh_upgrade
    if not enh_target or not G.P_CENTERS[enh_target] then
        return
    end
    Giga.flip_transform_card(_card, function()
        _card:set_ability(G.P_CENTERS[enh_target], nil, true)
    end)
end

--- Upgrade the seal of a card
--- @param _card table the card with the seal to upgrade
function Giga.upgrade_seal(_card)
    local seal_key = _card and _card:get_seal()
    if not seal_key or not G.P_SEALS[seal_key] or not G.P_SEALS[seal_key].giga_data then
        return
    end
    local target_seal = G.P_SEALS[seal_key].giga_data.seal_upgrade
    if not target_seal then
        return
    end
    Giga.flip_transform_card(_card, function()
        _card:set_seal(target_seal, true)
    end)
end

--- Checks if the player has the required fusion materials in their joker slots
function Giga.check_fusion()
    for _, fusion in pairs(Giga.POOLS.fusion_jokers) do
        if type(fusion) == "string" and G.P_CENTERS[fusion] then
            local mats = G.P_CENTERS[fusion].giga_data.merge_materials
            local required = {}
            for _, mat in ipairs(mats) do
                required[mat] = (required[mat] or 0) + 1
            end
            local has_all = true
            for mat, count_needed in pairs(required) do
                local count_have = Giga.count_jokers(mat)
                if count_have < count_needed then
                    has_all = false
                    break
                end
            end
            if has_all then
                G.E_MANAGER:add_event(Event({
                    blocking = true,
                    func = function()
                        for mat, need in pairs(required) do
                            local to_destroy = need
                            for _, c in ipairs(G.jokers.cards) do
                                if to_destroy <= 0 then
                                    break
                                end
                                if c.config.center_key == mat then
                                    G.E_MANAGER:add_event(Event({
                                        blocking = true,
                                        func = function()
                                            SMODS.destroy_cards(c)
                                            return true
                                        end
                                    }))
                                    to_destroy = to_destroy - 1
                                end
                            end
                        end
                        SMODS.add_card({ key = G.P_CENTERS[fusion].key, edition = 'e_negative' })
                        return true
                    end
                }))
            end
        end
    end
end

--- Check if a card enhancement is upgraded
--- @param card table -- the card to check
--- @return boolean -- true if the card's enhancement is upgraded
function Giga.upgraded_enh_condition(card)
    local key = card and card.config and (card.config.center_key or (card.config.center and card.config.center.key))
    if key and G.P_CENTERS[key] and G.P_CENTERS[key].giga_data and G.P_CENTERS[key].giga_data.is_upgraded then
        return true
    end
    return false
end
upgraded_enh_condition = Giga.upgraded_enh_condition

--- Check if a card seal is upgraded
--- @param card table -- the card to check
--- @return boolean -- true if the card's seal is upgraded
function Giga.upgraded_seal_condition(card)
    local seal = card and card:get_seal()
    if seal and G.P_SEALS[seal] and G.P_SEALS[seal].giga_data and G.P_SEALS[seal].giga_data.is_upgraded then
        return true
    end
    return false
end
upgraded_seal_condition = Giga.upgraded_seal_condition

--- Roll for a shiny edition (seeded)
--- @return boolean
function Giga.shiny_roll()
    local chances = (G.GAME.giga and G.GAME.giga.shiny_chance and G.GAME.giga.shiny_chance[1]) or 2
    local odds = (G.GAME.giga and G.GAME.giga.shiny_chance and G.GAME.giga.shiny_chance[2]) or 25
    return pseudorandom('giga_shiny') < (chances / odds)
end

--- Roll for an astral planet (seeded)
--- @return boolean
function Giga.astral_roll()
    local chances = (G.GAME.giga and G.GAME.giga.astral_chance and G.GAME.giga.astral_chance[1]) or 1
    local odds = (G.GAME.giga and G.GAME.giga.astral_chance and G.GAME.giga.astral_chance[2]) or 20
    return pseudorandom('giga_astral') < (chances / odds)
end

--- Shuffle a Table
--- @param table table The table you want to shuffle
--- @param seed string A seed name
--- @return table
function Giga.shuffle_table(table, seed)
    seed = seed or 'shuffley'
    local ret = {}
    for i = 1, #table do
        ret[#ret+1] = table[i]
    end
    pseudoshuffle(ret, pseudoseed(seed))
    return ret
end
ShuffleMyTable = Giga.shuffle_table

--- Solve the factorial of a number
--- @param n number The number
--- @return number result The answer of the factorial
function Giga.factorial(n)
    local result = 1
    for i = 1, n do
        result = result * i
    end
    return result
end
Factorial = Giga.factorial

--- Count the number of jokers in inventory with a specific key
--- @param key string The key of the joker to count
--- @return integer count The number of jokers in inventory with the given key
function Giga.count_jokers(key)
    local count = 0
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            if j.config and j.config.center and j.config.center.key == key then
                count = count + 1
            end
        end
    end
    return count
end
count_jokers_in_inventory = Giga.count_jokers

--- Check if a key is an overcharge
--- @param key string
--- @return boolean
function Giga.is_overcharge(key)
    if Giga.POOLS and Giga.POOLS.Overcharges then
        for _, i in ipairs(Giga.POOLS.Overcharges) do
            if i == key then
                return true
            end
        end
    end
    return false
end

--- Check if a card has an overcharge.
--- @param card table
--- @return string | nil
function Giga.has_overcharge(card)
    for i, _ in pairs(card and card.ability or {}) do
        if Giga.is_overcharge(i) then
            return i
        end
    end
    return nil
end

--- Delete overcharge on a card
--- @param card table
function Giga.delete_overcharge(card)
    for i, _ in pairs(card and card.ability or {}) do
        if Giga.is_overcharge(i) then
            card.ability[i] = nil
        end
    end
end

--- Add an Overcharge to a card
--- @param card table
--- @param key string
function Giga.set_overcharge(card, key)
    if card and Giga.is_overcharge(key) then
        Giga.delete_overcharge(card)
        card:juice_up(0.3, 0.5)
        if SMODS.Stickers and SMODS.Stickers[key] then
            SMODS.Stickers[key]:apply(card, true)
        end
    end
end

--- Get the number of overcharge discarded this round
--- @return integer
function Giga.discarded_overcharge()
    if G.GAME and G.GAME.giga and G.GAME.giga.discarded_overcharge then
        return G.GAME.giga.discarded_overcharge
    end
    return 0
end
