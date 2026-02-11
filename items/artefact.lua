-- TYPE --
SMODS.ConsumableType{
    key = 'Giga_Artefact',
    primary_colour = HEX("F7070BFF"),
    secondary_colour = HEX('444444FF'),
    collection_rows = {5,6},
    default = 'c_giga_art1',
    shop_rate = 0
}

SMODS.Consumable{ --FishingHook
    key = 'fishingHook',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
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
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if math.random(5) >= 2 then
                return{
                    func = function ()
                        card.ability.extra.cash = card.ability.extra.cash + 2
                        return true
                    end,
                    message = localize('k_giga_valueup'),
                    colour = G.C.GREEN
                }
            elseif card.ability.extra.cash > 0 then
                return{
                    func = function ()
                        card.ability.extra.cash = card.ability.extra.cash - 1
                        return true
                    end,
                    message = localize('k_giga_valuedown'),
                    colour = G.C.RED
                }
            end
        end
    end
}