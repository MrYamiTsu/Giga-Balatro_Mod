-- DECKS --
SMODS.Back{ --ReverseCheckered
    key = 'reverseCheckered',
    atlas = "Decks",
    pos = {x = 1, y = 0},
    apply = function(self, back)
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
}
SMODS.Back{ --Foodie
    key = 'foodie',
    atlas = "Decks",
    pos = {x = 0, y = 0},
    config = { voucher = 'v_giga_foodStand' },
    calculate = function(self, card, context)
        if context.setting_blind then
            if #G.consumeables.cards < G.consumeables.config.card_limit then
                _create(card,'Giga_Food',G.consumeables,false,false)
            end
        end
    end
}
SMODS.Back{ --Momentum
    key = 'momentum',
    atlas = "Decks",
    pos = {x = 2, y = 0},
    config = { hand_size = 3 },
    loc_vars = function(self, info_queue, deck)
        return {vars = {self.config.hand_size}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            if G.GAME.blind.boss and G.GAME.round_resets.ante ~= 1 then
			    ease_ante(1)
            end
        end
    end
}
SMODS.Back{ --GamblingAddict
    key = 'gamblingAddict',
    atlas = "Decks",
    pos = {x = 4, y = 0},
    config = {},
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card{key = 'j_giga_stockMarket', stickers = {"eternal"}, force_stickers = true}
                return true
            end
        }))
	end
}
SMODS.Back{ --DrrunnkiDaecpk 
    key = 'drrunnkiDaecpk',
    atlas = "Decks",
    pos = {x = 3, y = 0},
    config = { randomize_rank_suit = true, giga_value_min = 0.1, giga_value_max = 10 },
    apply = function(self, back)
		G.GAME.modifiers.giga_randomscore = true
        if next(SMODS.find_mod("Cryptid")) then
	        G.GAME.modifiers.cry_misprint_min = (G.GAME.modifiers.cry_misprint_min or 1) * self.config.giga_value_min
		    G.GAME.modifiers.cry_misprint_max = (G.GAME.modifiers.cry_misprint_max or 1) * self.config.giga_value_max
        end
	end,
    calculate = function(self, card, context)
        if context.before and context.main_eval then
            if #G.jokers.cards > 0 then
                G.jokers:unhighlight_all()
                if #G.jokers.cards > 1 then
                    G.jokers:shuffle('ok1')
                    G.jokers:shuffle('ok2')
                    G.jokers:shuffle('ok3')
                    delay(0.5)
                end
            end
        end
    end
}