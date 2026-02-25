-- TYPE --
SMODS.ConsumableType{
    key = 'Giga_Artefact',
    primary_colour = HEX("F7070BFF"),
    secondary_colour = HEX('444444FF'),
    collection_rows = {5,6},
    default = 'c_giga_arrowTip',
    shop_rate = 0
}

SMODS.Consumable{ --FishingHook
    key = 'fishingHook',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'darling_credit'}
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_fishingHook'), 3, 5) then
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
SMODS.Consumable{ --Silex
    key = 'silex',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 3 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_fishingHook'), 3, 5) then
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
SMODS.Consumable{ --Totem ♣
    key = 'totem',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
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
SMODS.Consumable{ --ShellAmulet ♣
    key = 'shellAmulet',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 5 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_shellAmulet'), 3, 5) then
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
SMODS.Consumable{ --Plate
    key = 'plate',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 10 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_plate'), 3, 5) then
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
SMODS.Consumable{ --BoneDie
    key = 'boneDie',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 7 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_boneDie'), 3, 5) then
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
SMODS.Consumable{ --Helm ♣
    key = 'helm',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 4, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 8 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_helm'), 3, 5) then
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
SMODS.Consumable{ --Trident
    key = 'trident',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 9 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_trident'), 3, 5) then
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
SMODS.Consumable{ --Tablet
    key = 'tablet',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 10 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_tablet'), 3, 5) then
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
SMODS.Consumable{ --MayaMask
    key = 'mayaMask',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 11 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_mayaMask'), 3, 5) then
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
SMODS.Consumable{ --Diadem
    key = 'diadem',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_diadem'), 3, 5) then
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
SMODS.Consumable{ --Pillar ♣
    key = 'pillar',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    use = function (self, card, area, copier)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 13 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_pillar'), 3, 5) then
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
SMODS.Consumable{ --ArrowTip
    key = 'arrowTip',
    set = 'Giga_Artefact',
    atlas = 'Artefacts',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 8,
    config = { extra = {
        value = {
            incr = 2,
            decr = 1
        },
        mult = 1.2
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'darling_credit'}
        return{vars = {center.ability.extra.mult}}
    end,
    can_use = function (self, card)
        return false
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            return{
                x_mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_arrowTip'), 3, 5) then
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