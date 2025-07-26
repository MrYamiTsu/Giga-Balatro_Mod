-- FOODS CARDS --
SMODS.Consumable{ --HawaiianPizza
    key = 'hawaiianPizza',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 1},
    dependencies = 'Cryptid',
    rarity = 1,
    cost = 2,
    config = { extra = {
        round = 1,
        round_left = 1,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.round, center.ability.extra.txt}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        _create(card, 'Giga_Food', G.consumeables,true,true)
        delay(0.4)
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards then
            card.ability.extra.txt = 'Ready'
        end
    end
}