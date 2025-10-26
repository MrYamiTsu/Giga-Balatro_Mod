--#region ALT PREHISTORICS JOKERS --
SMODS.Joker{ --TRexALT
    key = 'tRex_alt',
    atlas = 'Jokers',
    pos = {x = 6, y = 0},
    dependencies = 'foolsGambit',
    cost = 6,
    rarity = "fg_rare_alt",
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 5,
        txt = {'Giga_Food', 'Food'},
        interac = {
            ptera = 9,
            velo = false
        }},
        fg_data = {
            is_alternate = true,
            alternate_card = 'j_giga_tRex',
            crossover_label = 'GIGA'
        }
    },
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
--[[SMODS.Joker{ --VelocyraptorALT
    key = 'velocyraptor_alt',
    atlas = 'Jokers',
    pos = {x = 7, y = 0},
    dependencies = 'foolsGambit',
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 6,
        interac = {
            rex_mult = 10
        }
    }},
    loc_vars = function(self, info_queue, center)
        local _mult = next(SMODS.find_card("j_giga_tRex")) and center.ability.extra.interac.rex_mult or center.ability.extra.mult
        return {vars = {_mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local has_ace = false
            for i, c in ipairs(context.full_hand or {}) do
                if c:get_id() == 14 then
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
}]]
--[[SMODS.Joker{ --PteranodonALT
    key = 'pteranodon_alt',
    atlas = 'Jokers',
    pos = {x = 2, y = 1},
    dependencies = 'foolsGambit',
    
}]]
SMODS.Joker{ --TriceratopsALT
    key = 'triceratops_alt',
    atlas = 'Jokers',
    pos = {x = 4, y = 5},
    dependencies = 'foolsGambit',
    cost = 8,
    rarity = "fg_uncommon_alt",
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
        }},
        fg_data = {
            is_alternate = true,
            alternate_card = 'j_giga_triceratops',
            crossover_label = 'GIGA',
        }
    },
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