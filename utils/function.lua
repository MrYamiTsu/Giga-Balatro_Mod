to_big = to_big or function(x) return x end

--- Upgrade the enhancement of a card
--- @param _card table the card with the enhancement to upgrade
function Giga.upgrade_enhancement(_card)
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
    _card:set_ability(G.P_CENTERS[_card.config.center_key].giga_data.enh_upgrade, nil , true)
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
            G.hand:unhighlight_all()
            return true
        end
    }))
    delay(0.5)
end

--- Upgrade the seal of a card
--- @param _card table the card with the seal to upgrade
function Giga.upgrade_seal(_card)
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
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            _card:set_seal(G.P_SEALS[_card:get_seal()].giga_data.seal_upgrade, true)
            return true
        end
    }))
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
            G.hand:unhighlight_all()
            return true
        end
    }))
    delay(0.5)
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
                local count_have = count_jokers_in_inventory(mat)
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

--- Little bit outdated, mustn't be used
--- @param selected_card table
--- @param base_enh string
function upgrade_enhencement_specific(selected_card, base_enh)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            selected_card:juice_up(0.3, 0.5)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            selected_card:flip()
            selected_card:juice_up(0.3, 0.3)
            return true
        end
    }))
    delay(0.2)
    if SMODS.has_enhancement(selected_card, base_enh) then
        selected_card:set_ability(G.P_CENTERS[selected_card.config.center_key].giga_data.enh_upgrade)
    else
        selected_card:set_ability(G.P_CENTERS[base_enh])
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            selected_card:flip()
            selected_card:juice_up(0.3, 0.3)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            G.hand:unhighlight_all()
            return true
        end
    }))
    delay(0.5)
end

--- Condition to check if a card's enhancement is upgraded
--- @param card table -- the card to check
--- @return boolean -- true if the card's enhancement is upgraded
function upgraded_enh_condition(card)
    if card.config.center_key and G.P_CENTERS[card.config.center_key].giga_data and
       G.P_CENTERS[card.config.center_key].giga_data.is_upgraded then
        return true
    end
    return false
end

--- Condition to check if a card's seal is upgraded
--- @param card table -- the card to check
--- @return boolean -- true if the card's seal is upgraded
function upgraded_seal_condition(card)
    if card:get_seal() and G.P_SEALS[card:get_seal()].giga_data and
       G.P_SEALS[card:get_seal()].giga_data.is_upgraded then
        return true
    end
    return false
end

--- Roll for a shiny edition
--- @return boolean
function Giga.shiny_roll()
    local chances, odds = Giga.config.shiny_chance[1], Giga.config.shiny_chance[2]
    if chances > 1 then
        return math.random(odds) <= chances
    end
    return math.random(odds) == chances
end

--- Roll for an astral planet
--- @return boolean
function Giga.astral_roll()
    local chances, odds = Giga.config.astral_chance[1], Giga.config.astral_chance[2]
    if chances > 1 then
        return math.random(odds) <= chances
    end
    return math.random(odds) == chances
end

--- Little bit outdated, use SMODS.add_card instead
---@param card table
---@param type string 
---@param place string
---@param negative boolean
---@param negative_condition boolean
function _create(card,type,place,negative,negative_condition)
    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local obj = create_card(type,place, nil, nil, nil, nil, nil, 'create'..type)
                if negative then
                    if negative_condition then
                        if card.edition and card.edition.type == 'negative' then
                            obj:set_edition('e_negative', true)
                        end
                    else
                        obj:set_edition('e_negative', true)
                    end 
                end
                obj:add_to_deck()
                G.consumeables:emplace(obj)
                obj:juice_up(0.3, 0.5)
                G.GAME.consumeable_buffer = 0
                return true
            end
        }))
    end
end

--- Shuffle a Table
---@param table table The table you want to shuffle
---@param seed string A seed name
---@return table
function ShuffleMyTable(table, seed)
	seed = seed or 'shuffley'
	local ret = {}
	for i = 1, #table do
		ret[#ret+1] = table[i]
	end
	pseudoshuffle(ret, pseudoseed(seed))
	return ret
end

--- Solve the factorial of a number
---@param n number The number
---@return number result The answer of the factorial
function Factorial(n)
    local result = 1
    for i = 1, n do
        result = result * i
    end
    return result
end

--- Count the number of jokers in inventory with a specific key
---@param key string The key of the joker to count
---@return integer count The number of jokers in inventory with the given key
function count_jokers_in_inventory(key)
    local count = 0
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == key then
            count = count + 1
        end
    end
    return count
end

--- Check if a key is an overcharge
---@param key string
---@return boolean
function Giga.is_overcharge(key)
    for _, i in ipairs(Giga.POOLS.Overcharges) do
        if i == key then
            return true
        end
    end
    return false
end

--- Check if a card has an overcharge.
---@param card table
---@return string | nil
function Giga.has_overcharge(card)
    for i, k in pairs(card and card.ability or {}) do
        if Giga.is_overcharge(i) then
            return i
        end
    end
    return nil
end

--- Delete overcherge on a card
---@param card table
function Giga.delete_overcharge(card)
  for i, _ in pairs(card and card.ability or {}) do
        if Giga.is_overcharge(i) then
            card.ability[i] = nil
        end
    end
end

--- Add an Overcharge to a card
---@param card table
---@param key string
function Giga.set_overcharge(card, key)
    if card and Giga.is_overcharge(key) then
        Giga.delete_overcharge(card)
        SMODS.Stickers[key]:apply(card, true)
    end
end