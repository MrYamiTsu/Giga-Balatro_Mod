-- TALISMAN --
to_big = to_big or function(b) return b end

Giga.enhancement_upgrades = {
    m_giga_soil = "m_giga_richSoil",
    m_giga_richSoil = "m_giga_fossilSoil",
    m_bonus = "m_giga_bigBonus",
    m_steel = "m_giga_titanium",
    m_stone = "m_giga_polishStone",
    m_mult = "m_giga_multPlus",
    m_lucky = "m_giga_luckiest",
    m_gold = "m_giga_perfectGold",
    m_glass = "m_giga_reinforcedGlass",
    m_wild = "m_giga_evolvedWild"
}

Giga.seal_upgrades = {
    Red = "giga_redplus",
    Blue = "giga_blueplus",
    Gold = "giga_goldplus",
    Purple = "giga_purpleplus",
    giga_redplus = "giga_redplusplus",
    giga_blueplus = "giga_blueplusplus",
    giga_goldplus = "giga_goldplusplus",
    giga_purpleplus = "giga_purpleplusplus"
}

-- UPGRADE FUNCTIONS --
function check_upgrade(base_enh) --only keeping the function because i cba to replace it everywhere
    return Giga.enhancement_upgrades[base_enh]
end
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
        selected_card:set_ability(G.P_CENTERS[check_upgrade(base_enh)])
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
function upgrade_enhencement(selected_card)
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
    selected_card:set_ability(check_upgrade(selected_card.config.center.key))
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
    delay(0.2)
    selected_card:set_seal(Giga.seal_upgrades[selected_card:get_seal()])
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
    local is_upgraded = false
    for _, enh in pairs(Giga.enhancement_upgrades) do
        if enh == card.config.center.key then
            is_upgraded = true
        end
    end
    return is_upgraded
end
function upgraded_seal_condition(card)
    local is_upgraded = false
    for _, seal in pairs(Giga.seal_upgrades) do
        if card:get_seal() == seal then
            is_upgraded = true
        end
    end
    return is_upgraded
end

-- CREATE FUNCTIONS --
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