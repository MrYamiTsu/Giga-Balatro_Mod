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
CardSleeves.Sleeve{ --ReverseCheckered
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
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_black') > 1
    end
}
CardSleeves.Sleeve{ --Teal
    key = 'tealSleeve',
    atlas = "Sleeves",
    pos = {x = 2, y = 0},
    discovered = true,
	unlocked = true,
    apply = function(self, back)
        local hands = {}
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v] and G.GAME.hands[v].visible then
                hands[#hands+1] = v
            end
        end
        for _ = 1, 7, 1 do
            level_up_hand(nil, pseudorandom_element(hands, pseudoseed('TealSl')), nil, 1)
        end
    end
}
CardSleeves.Sleeve{ --Foodie
    key = 'foodieSleeve',
    atlas = "Sleeves",
    pos = {x = 1, y = 0},
    calculate = function(self, card, context)
        if context.setting_blind then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({set = 'Giga_Food'})
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
            end
        end
    end
}