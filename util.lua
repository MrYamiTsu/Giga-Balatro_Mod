-- TALISMAN --
to_big = to_big or function(b) return b end

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
function init_pools()
    for _, pool in pairs(Giga.POOLS) do
        pool._calculate()
    end
end

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
function upgrade_enhancement(selected_card)
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
    selected_card:set_ability(G.P_CENTERS[selected_card.config.center_key].giga_data.enh_upgrade)
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
function upgrade_seal(selected_card)
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