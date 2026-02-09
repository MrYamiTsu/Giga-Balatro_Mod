-- TYPE --
SMODS.ConsumableType{
    key = 'Giga_Artefact',
    primary_colour = HEX("F7070BFF"),
    secondary_colour = HEX('444444FF'),
    collection_rows = {5,6},
    shop_rate = 0
}

SMODS.Consumable{ --
    key = 'art1',
    set = 'Giga_Artefact',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 3,
    config = { extra = {
        mult = 1.2,
        cash = 3
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.cash, center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return true
    end,
    use = function (self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.cash, true)
                return true
            end
        }))
        delay(0.6)
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 then
            return {
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round then
            if math.random() == 0 then
                card.ability.extra.cash = card.ability.extra.cash + 2
            elseif card.ability.extra.cash > 0 then
                card.ability.extra.cash = card.ability.extra.cash - 1
            end
        end
    end
}