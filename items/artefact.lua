-- LOCAL FUNCTIONS --
local function calculate_artefact(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:get_id() == card.ability.extra.nbre then
        return{
            x_mult = card.ability.extra.mult
        }
    end
    if context.end_of_round and context.main_eval then
        if SMODS.pseudorandom_probability(card, pseudoseed('giga_'..card.config.center.key), 3, 5) then
            return{
                func = function ()
                    card.ability.extra_value = card.ability.extra_value + card.ability.extra.value.incr
                    card:set_cost()
                    return true
                end,
                message = localize('k_giga_valueup'),
                colour = G.C.GREEN
            }
        elseif card.sell_cost > 0 then
            return{
                func = function ()
                    card.ability.extra_value = card.ability.extra_value - card.ability.extra.value.decr
                    card:set_cost()
                    return true
                end,
                message = localize('k_giga_valuedown'),
                colour = G.C.RED
            }
        end
    end
end

-- TYPE --
SMODS.ConsumableType{
    key = 'Giga_Artefact',
    primary_colour = HEX("F7070BFF"),
    secondary_colour = HEX('444444FF'),
    collection_rows = {5,6},
    default = 'c_giga_arrowTip',
    shop_rate = 0
}

--#region ARTEFACTS --
SMODS.Consumable{ --FishingHook
    key = 'fishingHook',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    giga_data = {
        idea_credit = 'Darling'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 2},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Silex
    key = 'silex',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 2},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 3
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Totem
    key = 'totem',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 0},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 4
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 4 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_totem'), 3, 5) then
                return{
                    func = function ()
                        card.ability.extra_value = card.ability.extra_value + card.ability.extra.value.incr
                        card:set_cost()
                        return true
                    end,
                    message = localize('k_giga_valueup'),
                    colour = G.C.GREEN
                }
            elseif card.sell_cost > 0 then
                return{
                    func = function ()
                        card.ability.extra_value = card.ability.extra_value - card.ability.extra.value.decr
                        card:set_cost()
                        return true
                    end,
                    message = localize('k_giga_valuedown'),
                    colour = G.C.RED
                }
            end
        end
    end
}
SMODS.Consumable{ --ShellAmulet
    key = 'shellAmulet',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 0},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 5
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Plate
    key = 'plate',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 6
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --BoneDie
    key = 'boneDie',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 1},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 7
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Helm
    key = 'helm',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 0},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 8
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Trident
    key = 'trident',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 1},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 9
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Tablet
    key = 'tablet',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 2},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 10
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --MayaMask
    key = 'mayaMask',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 1},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 11
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Diadem
    key = 'diadem',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 2},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 12
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Pillar
    key = 'pillar',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 13
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
SMODS.Consumable{ --Arrow
    key = 'arrow',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    giga_data = {
        idea_credit = 'Darling'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 1},
    rarity = 1,
    cost = 6,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2,
        nbre = 14
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = calculate_artefact
}
--#endregion