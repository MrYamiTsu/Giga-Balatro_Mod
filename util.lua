function upgrade_enhencement(selected_card)
    if SMODS.has_enhancement(selected_card, 'm_giga_soil') then
        selected_card:set_ability(G.P_CENTERS["m_giga_richSoil"])
    elseif SMODS.has_enhancement(selected_card, 'm_giga_richSoil') then
        selected_card:set_ability(G.P_CENTERS["m_giga_fossilSoil"])
    elseif SMODS.has_enhancement(selected_card, 'm_bonus') then
        selected_card:set_ability(G.P_CENTERS["m_giga_bigBonus"])
    elseif SMODS.has_enhancement(selected_card, 'm_stone') then
        selected_card:set_ability(G.P_CENTERS["m_giga_polishStone"])
    elseif SMODS.has_enhancement(selected_card, 'm_mult') then
        selected_card:set_ability(G.P_CENTERS["m_giga_multPlus"])
    elseif SMODS.has_enhancement(selected_card, 'm_lucky') then
        selected_card:set_ability(G.P_CENTERS["m_giga_luckiest"])
    elseif SMODS.has_enhancement(selected_card, 'm_gold') then
        selected_card:set_ability(G.P_CENTERS["m_giga_perfectGold"])
    --[[elseif SMODS.has_enhancement(selected_card, 'm_glass') then
        selected_card:set_ability(G.P_CENTERS["m_giga_reinforcedGlass"])
    elseif SMODS.has_enhancement(selected_card, 'm_steel') then
        selected_card:set_ability(G.P_CENTERS["m_giga_titanium"])]]
    end
    G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.2,
		func = function()
			G.hand:unhighlight_all()
			return true
		end,
	}))
	delay(0.5)
end

function _create(card,type,place,negative,negative_condition)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            if #G.consumeables.cards < G.consumeables.config.card_limit then
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
                card:juice_up(0.3, 0.5)
            end
            return true
        end
    }))
end