Giga.optional_features = {
    retrigger_joker = true,
    cardareas = {
        unscored = true
    }
}

-- ATLAS --
SMODS.Atlas{
    key = "Sleeves",
    path = "Sleeve.png",
    px = 73,
    py = 95
}

-- SLEEVES --
CardSleeves.Sleeve{
    key = 'reverseCheckeredSleeve',
    atlas = "Sleeves",
    pos = {x = 0, y = 0},
    loc_vars = function(self)
		if self.get_current_deck_key() == "b_giga_reverseCheckered" then
			return { key = self.key .. "_alt", vars = {} }
		end
		return { vars = {} }
	end,
    apply = function(self)
        if self.get_current_deck_key() == 'b_giga_reverseCheckered' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i, card in pairs(G.playing_cards) do
                        if card.base.suit == 'Clubs' then
                            card:set_ability(G.P_CENTERS["m_bonus"], nil, true)
                        end
                        if card.base.suit == 'Diamonds' then
                            card:set_ability(G.P_CENTERS["m_mult"], nil, true)
                        end
                    end
                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i, card in pairs(G.playing_cards) do
                        if card.base.suit == 'Spades' then
                            card:change_suit('Clubs')
                        end
                        if card.base.suit == 'Hearts' then
                            card:change_suit('Diamonds')
                        end
                    end
                    return true
                end
            }))
        end
    end
}
CardSleeves.Sleeve{
    key = 'foodieSleeve',
    atlas = "Sleeves",
    pos = {x = 1, y = 0},
    loc_vars = function(self, deck)
        return {vars = {colours={HEX('F7070BFF')}}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if #G.consumeables.cards < G.consumeables.config.card_limit then
                _create(card,'Giga_Food',G.consumeables,false,false)
            end
        end
    end
}