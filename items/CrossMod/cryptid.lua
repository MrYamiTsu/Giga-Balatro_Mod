SMODS.Consumable{ --HawaiianPizza
    key = 'hawaiianPizza',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 1},
    loc_txt = {
        name = 'Hawaiian Pizza',
        text = {
            'A delicious Hawaiian Pizza that',
            'will give a {C:cry_code}Code{} in {C:attention}#1#{} rounds',
            '{C:inactive}#2#{}'
        }
    },
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
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards < G.consumeables.config.card_limit then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        local code = create_card('Code',G.consumeables, nil, nil, nil, nil, nil, 'createCode')
        if card.edition and card.edition.type == 'negative' then
            code:set_edition('e_negative', true)
        end
        code:add_to_deck()
        G.consumeables:emplace(code)
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