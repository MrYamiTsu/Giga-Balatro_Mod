SMODS.Atlas{
    key = "Partners",
    path = "Partner.png",
    px = 46,
    py = 58,
}

Partner_API.Partner{
    key = "pabloJr",
    name = "Pablo Jr. Partner",
    unlocked = true,
    discovered = true,
    individual_quips = true,
    pos = { x = 0, y = 0 },
    atlas = "Partners",
    config = { extra = {
        odds = 1,
        chances = 6
    }
    },
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances, 'prob')
        return {vars = {odds, chances}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(context.other_card, 'giga_pabloJr', card.ability.extra.odds, card.ability.extra.chances, 'pjr_prob') then
                if SMODS.has_enhancement(context.other_card, 'm_giga_soil') then                        
                    context.other_card:set_ability(G.P_CENTERS["m_giga_richSoil"])
                elseif SMODS.has_enhancement(context.other_card, 'm_giga_richSoil') then
                    context.other_card:set_ability(G.P_CENTERS["m_giga_fossilSoil"])
                elseif SMODS.has_enhancement(context.other_card, 'm_bonus') then
                    context.other_card:set_ability(G.P_CENTERS["m_giga_bigBonus"])
                elseif SMODS.has_enhancement(context.other_card, 'm_stone') then
                    context.other_card:set_ability(G.P_CENTERS["m_giga_polishStone"])
                elseif SMODS.has_enhancement(context.other_card, 'm_mult') then
                    context.other_card:set_ability(G.P_CENTERS["m_giga_multPlus"])
                elseif SMODS.has_enhancement(context.other_card, 'm_lucky') then
                    context.other_card:set_ability(G.P_CENTERS["m_giga_luckiest"])
                elseif SMODS.has_enhancement(context.other_card, 'm_gold') then
                    context.other_card:set_ability(G.P_CENTERS["m_giga_perfectGold"])
                --[[elseif SMODS.has_enhancement(context.other_card, 'm_glass') then
                    context.other_card:set_ability(G.P_CENTERS["m_giga_reinforcedGlass"])
                elseif SMODS.has_enhancement(context.other_card, 'm_steel') then
                    context.other_card:set_ability(G.P_CENTERS["m_giga_titanium"])]]
                end
                G.E_MANAGER:add_event(Event({
	    		    trigger = "after",
		    	    delay = 0.2,
			        func = function()
			            return true
		            end,
			    }))
            end
        end
    end,
}