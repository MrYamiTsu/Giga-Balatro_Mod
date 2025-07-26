-- TAROTS --
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
            _create(card, 'Giga_Food', G.consumeables,true,true)
            delay(0.4)
		end
    end
}