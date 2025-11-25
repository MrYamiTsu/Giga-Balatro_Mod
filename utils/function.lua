-- TALISMAN --
to_big = to_big or function(b) return b end

-- UPGRADE FUNCTIONS --
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
function Giga.upgrade_seal(selected_card)
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
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            selected_card:set_seal(G.P_SEALS[selected_card:get_seal()].giga_data.seal_upgrade, true)
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
function upgraded_enh_condition(card)
    if card.config.center_key and G.P_CENTERS[card.config.center_key].giga_data and
       G.P_CENTERS[card.config.center_key].giga_data.is_upgraded then
        return true
    end
    return false
end
function upgraded_seal_condition(card)
    if card:get_seal() and G.P_SEALS[card:get_seal()].giga_data and
       G.P_SEALS[card:get_seal()].giga_data.is_upgraded then
        return true
    end
    return false
end

-- MERGE FUNCTION --
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
    return ret
end

-- CREATE FUNCTION --
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

-- SHUFFLE FUNCTION --
function ShuffleMyTable(t, seed)
	seed = seed or 'shuffley'
	local rt = {}
	for i = 1, #t do
		rt[#rt+1] = t[i]
	end
	pseudoshuffle(rt, pseudoseed(seed))
	return rt
end

-- MATH FUNCTION --
function Factorial(n)
  local result = 1
  for i = 1, n do
    result = result * i
  end
  return result
end

-- OTHER FUNCTION --
function count_jokers_in_inventory(key)
    local count = 0
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == key then
            count = count + 1
        end
    end
    return count
end