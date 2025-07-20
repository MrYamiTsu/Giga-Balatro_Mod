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