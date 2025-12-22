--#region ALT NORMAL JOKERS --
SMODS.Joker{ --RescuePacket
    key = 'rescuePacket_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_rescuePacket',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 0, y = 7},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        odds = 1,
        chances = 4,
        shop_size = 1,
        switcher = false
    }},
    loc_vars = function(self,info_queue,center)
        local numerator, denominator = SMODS.get_probability_vars(center, center.ability.extra.odds, center.ability.extra.chances, 'prob')
        return{vars = {numerator, denominator, center.ability.extra.shop_size}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.main_eval and SMODS.pseudorandom_probability(card, pseudoseed('giga_rescuep'), card.ability.extra.odds, card.ability.extra.chances, 'rescuep_prob') then
            G.E_MANAGER:add_event(Event({
                func = function()
                    change_shop_size(1)
                    card.ability.extra.switcher = true
                    return true
                end
            }))
        end
        if card.ability.extra.switcher and context.ending_shop then
            G.E_MANAGER:add_event(Event({
                func = function()
                    change_shop_size(-1)
                    card.ability.extra.switcher = false
                    return true
                end
            }))
        end
    end
}
--#endregion
--#region ALT LEGENDARY JOKERS --
SMODS.Joker{ --MrYamiTsuAlt
    key = 'myt_own_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_myt_own',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 5, y = 6},
    soul_pos = {x = 6, y = 6},
    dependencies = 'foolsGambit',
    cost = 20,
    rarity = "fg_legendary_alt",
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        mult = 1,
        mult_add = 0.05
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.mult_add, center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if upgraded_enh_condition(context.other_card) or upgraded_seal_condition(context.other_card) then
                return {
                    func = function()
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_add
                        return true
                    end,
                    message_card = card,
                    message = 'X'..card.ability.extra.mult_add..' Mult',
                    color = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                x_mult = card.ability.extra.mult
            }
        end
    end
}
--#endregion
--#region ALT PREHISTORICS JOKERS --
SMODS.Joker{ --TRexALT
    key = 'tRex_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_tRex',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 6, y = 0},
    dependencies = 'foolsGambit',
    cost = 6,
    rarity = "fg_common_alt",
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 5,
        txt = {'Giga_Food', 'Food'},
        interac = {
            ptera = 9,
            velo = false
        }
    }},
    loc_vars = function(self, info_queue, center)
        local cash = next(SMODS.find_card("j_giga_pteranodon" or "j_giga_pteranodon_alt")) and center.ability.extra.interac.ptera or center.ability.extra.cash
        if next(SMODS.find_card("j_giga_velocyraptor" or "j_giga_velocyraptor_alt")) then
            center.ability.extra.txt = {'Tarot', 'Tarot'}
        else
            center.ability.extra.txt = {'Giga_Food', 'Food'}
        end
        return {vars = {colours={G.C.SECONDARY_SET[center.ability.extra.txt[1]]}, center.ability.extra.txt[2], cash}}
    end,
    calculate = function(self, card, context)
        if next(SMODS.find_card("j_giga_velocyraptor" or "j_giga_velocyraptor_alt")) then
            card.ability.extra.txt = {'Tarot', 'Tarot'}
        else
            card.ability.extra.txt = {'Giga_Food', 'Food'}
        end
        if context.scoring_name == 'High Card' then
            if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 then
                local to_destroy = context.full_hand[1]
                G.E_MANAGER:add_event(Event({
                    blocking = true,
                    func = function()
                        SMODS.destroy_cards(to_destroy)
                        return true
                    end
                }))
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    _create(card,card.ability.extra.txt[1],G.consumeables,false,false)
                    delay(0.4)
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
                return {
                    dollars = card.ability.extra.cash
                }
            end
        end
    end
}
SMODS.Joker{ --VelocyraptorALT
    key = 'velocyraptor_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_velocyraptor',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 7, y = 0},
    dependencies = 'foolsGambit',
    cost = 5,
    rarity = "fg_uncommon_alt",
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        odds = 1,
        chances = 9,
        interac = {
            ptera_chance = 7
        }
    }},
    loc_vars = function(self, info_queue, center)
        local chances = next(SMODS.find_card("j_giga_pteranodon" or "j_giga_pteranodon_alt")) and center.ability.extra.interac.ptera_chance or center.ability.extra.chances
        local numerator, denominator = SMODS.get_probability_vars(center, center.ability.extra.odds, chances, 'prob')
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local theChances = next(SMODS.find_card("j_giga_pteranodon" or "j_giga_pteranodon_alt")) and card.ability.extra.interac.ptera_chance or card.ability.extra.chances
            if SMODS.has_enhancement(context.other_card, 'm_mult') then
                if SMODS.pseudorandom_probability(card, pseudoseed('giga_triceratops'), card.ability.extra.odds, theChances, 'tcrtp_prob1') then
                    return {
                        level_up = true,
                        message = localize('k_level_up_ex')
                    }
                end
            end
        end
    end
}
SMODS.Joker{ --PteranodonALT
    key = 'pteranodon_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_pteranodon',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 2, y = 1},
    dependencies = 'foolsGambit',
    cost = 4,
    rarity = "fg_common_alt",
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 5,
        interac = {
            rex_mult = 8
        }
    }},
    loc_vars = function(self, info_queue, center)
        local _mult = next(SMODS.find_card("j_giga_tRex" or "j_giga_tRex_alt")) and center.ability.extra.interac.rex_mult or center.ability.extra.mult
        return {vars = {_mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local has_ace = false
            for i, c in ipairs(context.full_hand or {}) do
                if c:get_id() == 2 then
                    has_ace = true
                    break
                end
            end
            if not has_ace then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
SMODS.Joker{ --TriceratopsALT
    key = 'triceratops_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_triceratops',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 4, y = 5},
    dependencies = 'foolsGambit',
    cost = 8,
    rarity = "fg_rare_alt",
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 1,
        mult_add = 0.1,
        chips = 1,
        chips_add = 0.1,
        round = 1,
        interac = {
            trex_mult = 0.2,
            ptera_chips = 0.2
        }
    }},
    loc_vars = function(self, info_queue, center)
        local set = next(SMODS.find_card("j_giga_velocyraptor" or "j_giga_velocyraptor_alt")) and 'Spectral' or 'Tarot'
        local _mult = next(SMODS.find_card("j_giga_tRex" or "j_giga_tRex_alt")) and center.ability.extra.interac.trex_mult or center.ability.extra.mult_add
        local _chips = next(SMODS.find_card("j_giga_pteranodon" or "j_giga_pteranodon_alt")) and center.ability.extra.interac.ptera_chips or center.ability.extra.chips_add
        return {vars = {colours={G.C.SECONDARY_SET[set]}, localize(set:lower(), "labels"), _mult, _chips, center.ability.extra.mult, center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.round = (card.ability.extra.round) - 1
            if card.ability.extra.round <= -1 then
                card.ability.extra.round = 1
                if #G.consumeables.cards > 0 then
                    local to_destroy = pseudorandom_element(G.consumeables.cards, pseudoseed('tRex_destroy'))
                    G.E_MANAGER:add_event(Event({
                        blocking = true,
                        func = function()
                            SMODS.destroy_cards(to_destroy)
                            return true
                        end
                    }))
                    if not context.blueprint then
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_add
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_add
                    end
                end
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    _create(card,card.ability.extra.txt,G.consumeables,false,false)
                    delay(0.4)
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
            end
        end
        if context.joker_main then
            local effects = {}
            if card.ability.extra.mult > 1 then
                table.insert(effects, {
                    xmult = card.ability.extra.mult
                })
            end
            if card.ability.extra.chips > 1 then
                table.insert(effects, {
                    xchips = card.ability.extra.chips
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}
--#endregion
--#region ALT GEM JOKERS --
SMODS.Joker{ --MoonstoneALT
    key = 'moonstone_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_moonstone',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 6, y = 2},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 8
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        return {vars = {center.ability.extra.mult}}
    end,
    in_pool = function (self, args)
        for _, c in pairs(G.playing_cards or {}) do
            if c.edition and (c.edition.foil or c.edition.key == 'e_giga_shiny_foil') then
                return true
            end
        end
        return false
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.edition and (context.other_card.edition.foil or context.other_card.edition.key == 'e_giga_shiny_foil') then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
SMODS.Joker{ --PinkTourmalineALT
    key = 'pinkTourmaline_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_pinkTourmaline',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 7, y = 1},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        xmult = 1.4
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        return {vars = {center.ability.extra.xmult}}
    end,
    in_pool = function (self, args)
        for _, c in pairs(G.playing_cards or {}) do
            if c.edition and (c.edition.holo or c.edition.key == 'e_giga_shiny_holo') then
                return true
            end
        end
        return false
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.edition and (context.other_card.edition.holo or context.other_card.edition.key == 'e_giga_shiny_holo') then
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
    end
}
SMODS.Joker{ --RainbowQuartzALT
    key = 'rainbowQuartz_alt',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = true,
        alternate_key = 'j_giga_rainbowQuartz',
        crossover_label = 'Fools Gambit'
    },
    pos = {x = 7, y = 2},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 100
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_poly
        return {vars = {center.ability.extra.chips}}
    end,
    in_pool = function (self, args)
        for _, c in pairs(G.playing_cards or {}) do
            if c.edition and (c.edition.polychrome or c.edition.key == 'e_giga_shiny_poly') then
                return true
            end
        end
        return false
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.edition and (context.other_card.edition.polychrome or context.other_card.edition.key == 'e_giga_shiny_poly') then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
--#endregion