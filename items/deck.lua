-- DECKS --
SMODS.Back{ --Teal
    key = 'teal',
    atlas = "Decks",
    pos = {x = 0, y = 1},
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
            level_up_hand(nil, pseudorandom_element(hands, pseudoseed('Teal')), nil, 1)
        end
    end
}
SMODS.Back{ --Gladiolus
    key = 'gladiolus',
    atlas = "Decks",
    pos = {x = 1, y = 1},
    discovered = true,
	unlocked = true,
    config = { voucher = 'v_crystal_ball', joker_slot = -1 },
    loc_vars = function(self, back)
        return{vars = {self.config.joker_slot}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local _rank = pseudorandom_element(SMODS.Ranks, 'gladiolus_create').card_key
                    local enhancement = pseudorandom_element(G.P_CENTER_POOLS["Enhanced"], 'gogogo_gladiolus')
                    SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                    return true
                end
            }))
        end
    end
}
SMODS.Back{ --ReverseCheckered
    key = 'reverseCheckered',
    atlas = "Decks",
    pos = {x = 1, y = 0},
    discovered = true,
	unlocked = true,
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
    end,
    check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_black') > 1
    end
}
SMODS.Back{ --Foodie
    key = 'foodie',
    atlas = "Decks",
    pos = {x = 0, y = 0},
    discovered = true,
	unlocked = true,
    config = { voucher = 'v_giga_foodStand' },
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
SMODS.Back{ --Momentum
    key = 'momentum',
    atlas = "Decks",
    pos = {x = 2, y = 0},
    discovered = true,
	unlocked = true,
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
    discovered = true,
	unlocked = true,
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
    discovered = true,
	unlocked = true,
    config = { randomize_rank_suit = true, giga_value_min = 0.1, giga_value_max = 10 },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i, card in pairs(G.playing_cards) do
                    if pseudorandom("ok1", 1, 26) == 1 then
                        SMODS.destroy_cards(card)
                    end
                end
                return true
            end
        }))
        G.GAME.starting_params.hands = pseudorandom("ok1", 2, 6)
        G.GAME.starting_params.discards = pseudorandom("ok2", 1, 8)
        G.GAME.starting_params.dollars = pseudorandom("ok3", 0, 12)
        G.GAME.starting_params.joker_slots = pseudorandom("ok4", 2, 6)
        G.GAME.starting_params.consumable_slots = pseudorandom("ok5", 1, 4)
        G.GAME.starting_params.hand_size = pseudorandom("ok6", 6, 10)
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
                    G.jokers:shuffle(pseudoseed('ok7'))
                    delay(0.5)
                end
            end
        end
    end
}