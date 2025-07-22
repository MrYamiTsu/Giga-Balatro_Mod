SMODS.Back{ --Foodie'sDeck
    key = 'foodie',
    atlas = "Decks",
    pos = { x = 0, y = 0 },
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