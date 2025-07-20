SMODS.Consumable{ --Cook
    key = 'cook',
    set = 'Tarot',
    atlas = 'Consumeables',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 3
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card, colours={HEX('F7070BFF')}}}
    end,
    can_use = function (self,card)
		return true
    end,
    use = function (self,card,area,copier)
        for i = 1, card.ability.extra.card, 1 do
            if #G.consumeables.cards < G.consumeables.config.card_limit then
                local food = create_card('Giga_Food',G.consumeables, nil, nil, nil, nil, nil, 'createFood')
                food:add_to_deck()
                G.consumeables:emplace(food)
            else
                break
            end
		end
    end
}