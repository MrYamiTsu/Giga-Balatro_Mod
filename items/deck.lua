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
SMODS.Back{ --Foodie'sDeck
    key = 'foodie',
    atlas = "Decks",
    pos = {x = 0, y = 0},
    config = { voucher = 'v_giga_foodTruck' },
    loc_vars = function(self, deck)
        return {vars = {colours={HEX('F7070BFF')}}}
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            if #G.consumeables.cards < G.consumeables.config.card_limit then
                _create(card,'Giga_Food',G.consumeables,false,false)
            end
        end
    end,
}