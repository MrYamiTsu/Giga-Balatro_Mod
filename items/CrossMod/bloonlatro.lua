-- FOODS CARDS --
SMODS.Consumable{ --BananaSplit
    key = 'bananaSplit',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    dependencies = 'bloonlatro',
    rarity = 1,
    cost = 2,
    config = { extra = {
        round = 1,
        round_left = 1,
        txt = 'k_giga_notrd'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.round, localize(center.ability.extra.txt)}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        _create(card, 'Power', G.consumeables,true,true)
        delay(0.4)
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card)
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end
}