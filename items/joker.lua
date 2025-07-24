SMODS.Joker{ --CashPass
    key = 'cashPass',
    atlas = 'Jokers',
    pos = {x = 0, y = 0},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 12,
        mult = 0.75
    }
    },
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.cash, center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            return {
                dollars = card.ability.extra.cash,
            }
        end

        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.mult,
                message = 'X' .. card.ability.extra.mult,
                colour = G.C.MULT
            }
        end
    end
}

SMODS.Joker{ --BlueChicken
    key = 'blueChicken',
    atlas = 'Jokers',
    pos = {x = 1, y = 0},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        round = 0,
        config_round = 3,
        chips = 12
    }
    },
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.chips, center.ability.extra.round}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            if card.ability.extra.round > -1 then
                card.ability.extra.round = card.ability.extra.round - 1
            end
            if card.ability.extra.round == -1 then
                if #G.jokers.cards < G.jokers.config.card_limit then
                    SMODS.add_card{key = "j_giga_blueEgg"}
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
                card.ability.extra.round = card.ability.extra.config_round or 1
            end
        end

        if context.cardarea == G.jokers and context.joker_main and card.ability.extra.chips > 0 then
            return{
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                chip_mod = card.ability.extra.chips
            }
        end
    end
}

SMODS.Joker{ --BlueEgg
    key = 'blueEgg',
    atlas = 'Jokers',
    pos = {x = 2, y = 0},
    rarity = 1,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    config = {},
    calculate = function(self,card,context)
        if context.end_of_round and context.cardarea == G.jokers then
            return{
                dollars = 1
            }
        end
        if context.selling_card and context.card == card then
            if #G.jokers.cards < G.jokers.config.card_limit then
                _create(card,'Joker', G.jokers,false,false)
            else
                SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
            end  
        end
    end
}

SMODS.Joker{ --KingOfJacks
    key = 'kingOfJacks',
    atlas = 'Jokers',
    pos = {x = 3, y = 0},
    rarity = 3,
    cost = 9,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        add = 0.05,
        base = 1
    }
    },
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.add, center.ability.extra.base}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 11 then
            if not context.blueprint then
                card.ability.extra.base = card.ability.extra.base + card.ability.extra.add
            end
        end

        if context.joker_main then
            if card.ability.extra.base ~= 1 then
                return {
                    card = card,
                    Xmult_mod = card.ability.extra.base,
                    message = 'X' .. card.ability.extra.base,
                    colour = G.C.MULT
                }
            end
        end
    end
}

SMODS.Joker{ --FunnyCrown
    key = 'funnyCrown',
    atlas = 'Jokers',
    pos = {x = 4, y = 0},
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        round = 2
    }
    },
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return{vars = {center.ability.extra.round}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.cardarea == G.jokers then
            if card.ability.extra.round > 0 then
                card.ability.extra.round = card.ability.extra.round - 1
            end
        end

        if context.selling_card and context.card == card then
            if card.ability.extra.round <= 0 then
                if #G.jokers.cards < G.jokers.config.card_limit then
                    SMODS.add_card{key = "j_giga_kingOfJacks"}
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
                local suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('giga_funnyCrown'))
			    local card = create_playing_card({
				    front = G.P_CARDS[suit..'_J'],
				    center = G.P_CENTERS.m_bonus
			    }, G.hand, false,false,nil)
			    card:add_to_deck()
            end
        end
    end
}

SMODS.Joker{ --SnapchatGirl
    key = 'snapchatGirl',
    atlas = 'Jokers',
    pos = {x = 5, y = 0},
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
            odds = 1,
            chances = 7,
            cash = -20
        }
    },
    loc_vars = function(self,info_queue,center)
        local odds, chances = SMODS.get_probability_vars(center, center.ability.extra.odds, center.ability.extra.chances, 'prob')
        return{vars = {odds, chances, center.ability.extra.cash}}
    end,
    calculate = function(self,card,context)
        if context.selling_card and context.card == card then
            if #G.jokers.cards - 1 < G.jokers.config.card_limit then
                if SMODS.pseudorandom_probability(card, 'giga_snapchatGirl', card.ability.extra.odds, card.ability.extra.chances, 'scg_prob') then
                    SMODS.add_card({set = 'Joker', rarity = 'Legendary'})
                else
                    return {
                        dollars = card.ability.extra.cash,
                    }
                end
            end  
        end
    end
}

SMODS.Joker{ --HighRiskHighReward
    key = 'highRiskHighReward',
    atlas = 'Jokers',
    pos = {x = 0, y = 1},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 6,
        odds = 1,
        chances = 3
    }},
    loc_vars = function(self, info_queue, center)
        local odds, chances = SMODS.get_probability_vars(center, center.ability.extra.odds, center.ability.extra.chances, 'prob')
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        return {vars = {center.ability.extra.mult, odds, chances}}
    end,
    calculate = function(self, card, context)
        if context.scoring_name == 'High Card' then
            if context.joker_main then
                return {
                    card = card,
                    Xmult_mod = card.ability.extra.mult,
                    message = 'X' .. card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
            if context.final_scoring_step then
                if SMODS.pseudorandom_probability(card, 'giga_highRiskHighReward', card.ability.extra.odds, card.ability.extra.chances, 'hrhr_prob') then
                    local to_destroy = context.full_hand[1]
                    G.E_MANAGER:add_event(Event({
                        blocking = true,
                        func = function()
                            to_destroy:start_dissolve()
                            G.E_MANAGER:add_event(Event({
                                delay = 0.4,
                                func = function()
                                    to_destroy:remove()
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                end
            end
        end
    end
}

SMODS.Joker{ --ShreddedAce
    key = 'shreddedAce',
    atlas = 'Jokers',
    pos = {x = 1, y = 1},
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 1
    }
    },
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            local suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('giga_shreddedAce'))
			local card = create_playing_card({
				front = G.P_CARDS[suit..'_'..'A']
			}, G.hand, false,false,nil)
			card:add_to_deck()
        end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            return {
                    card = card,
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult,
                    colour = G.C.MULT
                }
        end
    end
}

SMODS.Joker{ --Pablo
    key = 'pablo',
    atlas = 'Jokers',
    pos = {x = 3, y = 1},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        round_left = 1,
        round_switch = true
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {colours={HEX('F7070BFF')}, center.ability.extra.round_left}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.cardarea == G.jokers then
            if card.ability.extra.round_left > 0 then
                card.ability.extra.round_left = card.ability.extra.round_left - 1
            else
                if card.ability.extra.round_switch then
                    if #G.consumeables.cards < G.consumeables.config.card_limit then
                        local food1 = create_card('Food',G.consumeables, nil, nil, nil, nil, 'c_giga_tacos', 'createFood1')
                        food1:add_to_deck()
                        G.consumeables:emplace(food1)
                    end
                    card.ability.extra.round_switch = false
                elseif not card.ability.extra.round_switch then
                    if #G.consumeables.cards < G.consumeables.config.card_limit then
                        local food2 = create_card('Food',G.consumeables, nil, nil, nil, nil, 'c_giga_guacamole', 'createFood1')
                        food2:add_to_deck()
                        G.consumeables:emplace(food2)
                    end
                    card.ability.extra.round_switch = true
                end
                card.ability.extra.round_left = 1
            end
        end
    end
}

SMODS.Joker{ --JackMutator
    key = 'jackMutator',
    atlas = 'Jokers',
    pos = {x = 4, y = 1},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        round = 3,
        round_left = 3,
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.round + 1, center.ability.extra.round_left}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and context.first_hand_drawn then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                    local tpool = {}
                    for i, k in pairs(G.hand.cards) do
                        table.insert(tpool, k)
                    end
                    local selected_card = pseudorandom_element(tpool, pseudoseed("jackMutator"))
                    local suit = string.sub(selected_card.base.suit, 1, 1) .. '_'
                    local rank = selected_card:get_id()
                    if rank == 11 then
                        if SMODS.has_enhancement(selected_card, 'm_giga_richSoil') then
                            selected_card:set_ability(G.P_CENTERS["m_giga_fossilSoil"])
                        elseif SMODS.has_enhancement(selected_card, 'm_giga_soil') then
                            selected_card:set_ability(G.P_CENTERS["m_giga_richSoil"])
                        else
                            selected_card:set_ability(G.P_CENTERS["m_giga_soil"])
                        end
                    else
                        selected_card:set_base(G.P_CARDS[suit..'J'])
                    end
                    selected_card:juice_up(0.3, 0.5)
                    return true 
                end 
            }))
            card.ability.extra.round_left = card.ability.extra.round
        end
    end
}

SMODS.Joker{ --Paleontologist
    key = 'paleontologist',
    atlas = 'Jokers',
    pos = {x = 5, y = 3},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 30,
        s1chips = 75,
        s2chips = 150,
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.chips}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_giga_soil') then
                return {
                    card = card,
                    chips_mod = card.ability.extra.chips,
                    message = '+' .. card.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            elseif SMODS.has_enhancement(context.other_card, 'm_giga_richSoil') then
                return {
                    card = card,
                    chips_mod = card.ability.extra.s1chips,
                    message = '+' .. card.ability.extra.s1chips,
                    colour = G.C.CHIPS
                }
            elseif SMODS.has_enhancement(context.other_card, 'm_giga_fossilSoil') then
                return {
                    card = card,
                    chips_mod = card.ability.extra.s2chips,
                    message = '+' .. card.ability.extra.s2chips,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}

SMODS.Joker{ --PaleoExpert
    key = 'paleoExpert',
    atlas = 'Jokers',
    pos = {x = 6, y = 3},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 4,
        s1mult = 10,
        s2mult = 25,
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_giga_soil') then
                return {
                    card = card,
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult,
                    colour = G.C.CHIPS
                }
            elseif SMODS.has_enhancement(context.other_card, 'm_giga_richSoil') then
                return {
                    card = card,
                    mult_mod = card.ability.extra.s1mult,
                    message = '+' .. card.ability.extra.s1mult,
                    colour = G.C.CHIPS
                }
            elseif SMODS.has_enhancement(context.other_card, 'm_giga_fossilSoil') then
                return {
                    card = card,
                    mult_mod = card.ability.extra.s2mult,
                    message = '+' .. card.ability.extra.s2mult,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}

SMODS.Joker{ --Refinery
    key = 'refinery',
    atlas = 'Jokers',
    pos = {x = 7, y = 3},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 4,
        cashNow = 0
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return{vars = {center.ability.extra.cash, center.ability.extra.cashNow}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.has_enhancement(context.other_card, 'm_stone')then
                card.ability.extra.cashNow = card.ability.extra.cashNow + card.ability.extra.cash
                return {
                    message_card = card,
                    message = 'Upgraded',
                    colour = G.C.MONEY
                }
            else
                if card.ability.extra.cashNow ~= 0 then
                    card.ability.extra.cashNow = 0
                    return {
                        message_card = card,
                        message = 'Reset',
                        colour = G.C.MULT
                    }
                end
            end
        end
        if context.end_of_round and context.main_eval then
            return {
                dollars = card.ability.extra.cashNow,
            }
        end
    end
}

SMODS.Joker { --CrystalOfHungriness
    key = "crystalOfHungriness",
    atlas = "Jokers",
    pos = { x = 0, y = 4 },
    cost = 6,
    rarity = 2,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        add = 0.05,
        base = 1
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.base, card.ability.extra.add, colours={HEX('F7070BFF')}}}
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Giga_Food' and not context.blueprint then
            card.ability.extra.base = card.ability.extra.base + card.ability.extra.add
        end
        if context.joker_main and card.ability.extra.base ~= 1 then
            return {
                card = card,
                Xmult_mod = card.ability.extra.base,
                message = 'X' .. card.ability.extra.base,
                colour = G.C.MULT
            }
        end
    end
}

SMODS.Joker { --DoubleFork
    key = "doubleFork",
    atlas = "Jokers",
    pos = { x = 1, y = 4 },
    cost = 5,
    rarity = 1,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        chips = 2,
        txt = 'Innactive',
        active = false
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.txt, colours={HEX('F7070BFF')}}}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.in_blind then
            if context.using_consumeable and context.consumeable.ability.set == 'Giga_Food' and not context.blueprint then
                if not card.ability.extra.active then
                    card.ability.extra.txt = 'Active'
                    card.ability.extra.active = true
                end
            end
        end
        if context.joker_main then
            if card.ability.extra.active then
                return {
                    x_chips = card.ability.extra.chips
                }
            end
        end
        if context.end_of_round and not context.blueprint then
            if card.ability.extra.active then
                card.ability.extra.txt = 'Innactive'
                card.ability.extra.active = false
            end
        end
    end
}

SMODS.Joker { --CrackedSkull
    key = "crackedSkull",
    atlas = "Jokers",
    pos = { x = 0, y = 1 },
    cost = 6,
    rarity = 1,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        mult = 2.5,
        txt = 'Innactive',
        active = false
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.txt}}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.in_blind then
            if context.using_consumeable and context.consumeable.ability.set == 'Spectral' and not context.blueprint then
                if not card.ability.extra.active then
                    card.ability.extra.txt = 'Active'
                    card.ability.extra.active = true
                end
            end
        end
        if context.joker_main then
            if card.ability.extra.active then
                return {
                    x_mult = card.ability.extra.mult
                }
            end
        end
        if context.end_of_round and not context.blueprint then
            if card.ability.extra.active then
                card.ability.extra.txt = 'Innactive'
                card.ability.extra.active = false
            end
        end
    end
}

SMODS.Joker{ --PinkTourmaline
    key = 'pinkTourmaline',
    atlas = 'Jokers',
    pos = {x = 7, y = 1},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 12
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local nb_holo = 0
            for i, held_card in ipairs(G.hand.cards) do
                local is_play = false
                for j, card_play in ipairs(G.play.cards) do
                    if held_card == card_play then
                        is_play = true
                        break
                    end
                end
                if not is_play and held_card.edition and held_card.edition.type == 'holo' then
                    nb_holo = nb_holo + 1
                end
            end
            if nb_holo > 0 then
                return {
                    card = card,
                    mult_mod = nb_holo * card.ability.extra.mult,
                    message = '+' .. nb_holo * card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end
    end
}

SMODS.Joker{ --Moonstone
    key = 'moonstone',
    atlas = 'Jokers',
    pos = {x = 6, y = 2},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 65
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local nb_foil = 0
            for i, card_held in ipairs(G.hand.cards) do
                local is_play = false
                for j, card_play in ipairs(G.play.cards) do
                    if card_held == card_play then
                        is_play = true
                        break
                    end
                end
                if not is_play and card_held.edition and card_held.edition.type == 'foil' then
                    nb_foil = nb_foil + 1
                end
            end
            if nb_foil > 0 then
                return {
                    card = card,
                    chip_mod = nb_foil * card.ability.extra.chips,
                    message = '+' .. nb_foil * card.ability.extra.chips,
                    colour = G.C.CHIP
                }
            end
        end
    end
}

SMODS.Joker{ --RainbowQuartz
    key = 'rainbowQuartz',
    atlas = 'Jokers',
    pos = {x = 7, y = 2},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        xmult = 0.7
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_poly
        return {vars = {center.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local nb_poly = 0
            for i, card_held in ipairs(G.hand.cards) do
                local is_play = false
                for j, card_play in ipairs(G.play.cards) do
                    if card_held == card_play then
                        is_play = true
                        break
                    end
                end
                if not is_play and card_held.edition and card_held.edition.type == 'polychrome' then
                    nb_poly = nb_poly + 1
                end
            end
            if nb_poly > 0 then
                local xmult_to_add = 1 + (nb_poly * card.ability.extra.xmult)
                return {
                    card = card,
                    xmult_mod = xmult_to_add,
                    message = 'X' .. xmult_to_add,
                    colour = G.C.MULT
                }
            end
        end
    end
}

SMODS.Joker{ --TRex
    key = 'tRex',
    atlas = 'Jokers',
    pos = {x = 6, y = 0},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 0,
        mult_add = 5,
        chips = 0,
        chips_add = 25,
        round = 1
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult_add, center.ability.extra.chips_add, center.ability.extra.mult, center.ability.extra.chips, center.ability.extra.round}}
    end,
    calculate = function(self, card, context)
        local has_velociraptor = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_velocyraptor' then
                has_velociraptor = true
                break
            end
        end
        local has_pteranodon = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_pteranodon' then
                has_pteranodon = true
                break
            end
        end
        if has_pteranodon then
            card.ability.extra.chips_add = 35
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.round = (card.ability.extra.round) - 1
            if card.ability.extra.round <= -1 then
                card.ability.extra.round = 1
                if #G.consumeables.cards > 0 then
                    local to_destroy = pseudorandom_element(G.consumeables.cards, pseudoseed('tRex_destroy'))
                    G.E_MANAGER:add_event(Event({
                        blocking = true,
                        func = function()
                            to_destroy:start_dissolve()
                            G.E_MANAGER:add_event(Event({
                                delay = 0.4,
                                func = function()
                                    to_destroy:remove()
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                    if not context.blueprint then
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_add
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_add
                    end
                end
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    if has_velociraptor then
                        _create(card,'Spectral',G.consumeables,false,false)
                    else
                        _create(card,'Tarot', G.consumeables,false,false)
                    end
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
            end
        end
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                card = card,
                mult_mod = card.ability.extra.mult,
                message = '+' .. card.ability.extra.mult,
                colour = G.C.MULT
            }
        end
        if context.cardarea == G.jokers and context.joker_main and card.ability.extra.chips > 0 then
            return {
                chip_mod = card.ability.extra.chips,
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}
            }
        end
    end
}

SMODS.Joker{ --Velocyraptor
    key = 'velocyraptor',
    atlas = 'Jokers',
    pos = {x = 7, y = 0},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 6
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        local has_tRex = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_tRex' then
                has_tRex = true
                break
            end
        end
        if has_tRex then
            card.ability.extra.mult = 8
        end
        local has_ace = false
        for i, c in ipairs(context.full_hand or {}) do
            if c:get_id() == 14 then
                has_ace = true
                break
            end
        end
        if context.joker_main and card.ability.extra.mult > 0 and not has_ace then
            return {
                card = card,
                mult_mod = card.ability.extra.mult,
                message = '+' .. card.ability.extra.mult,
                colour = G.C.MULT
            }
        end
    end
}

SMODS.Joker{ --Pteranodon
    key = 'pteranodon',
    atlas = 'Jokers',
    pos = {x = 2, y = 1},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 2
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.cash}}
    end,
    calculate = function(self, card, context)
        local has_tRex = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_tRex' then
                has_tRex = true
                break
            end
        end
        if has_tRex then
            card.ability.extra.cash = 4
        end
        local has_velociraptor = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_velocyraptor' then
                has_velociraptor = true
                break
            end
        end
        if context.scoring_name == 'High Card' then
            if context.individual and context.cardarea == G.play and context.other_card:get_id() == 5 then
                local to_destroy = context.full_hand[1]
                G.E_MANAGER:add_event(Event({
                    blocking = true,
                    func = function()
                        to_destroy:start_dissolve()
                        G.E_MANAGER:add_event(Event({
                            delay = 0.4,
                            func = function()
                                to_destroy:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    if has_velociraptor then
                        _create(card,'Spectral',G.consumeables,false,false)
                    else
                        _create(card,'Planet',G.consumeables,false,false)
                    end
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
                return {
                    dollars = card.ability.extra.cash,
                }
            end
        end
    end
}

SMODS.Joker{ --BlueEyesWhiteDragon
    key = 'blueEyesWhiteDragon',
    atlas = 'Jokers',
    pos = {x = 6, y = 1},
    soul_pos = {x = 5, y = 1},
    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 12,
        xmult = 1.75
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return{vars = {center.ability.extra.mult, center.ability.extra.xmult}}
    end,
    calculate = function(self,card,context)
        local byud_ready = 0
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_blueEyesWhiteDragon' then
                byud_ready = byud_ready + 1
                if byud_ready >= 3 then
                    break
                end 
            end
        end
        local has_byud = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_byud' then
                has_byud = true
                break
            end
        end
        if context.setting_blind and byud_ready >= 3 then
            if not has_byud then
                SMODS.add_card{key = "j_giga_byud", edition = "e_negative"}
            end
            G.E_MANAGER:add_event(Event({
                blocking = true,
                func = function()
                    card:start_dissolve()
                    G.E_MANAGER:add_event(Event({
                        delay = 0.8,
                        func = function()
                            card:remove()
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
        if context.individual and context.cardarea == G.play then
            local effects = {}
            if context.other_card:is_suit("Clubs", true) then
                table.insert(effects, {
                    card = card,
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult,
                    colour = G.C.MULT,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() == 8 then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult,
                    message = 'X' .. card.ability.extra.xmult,
                    colour = G.C.MULT,
                    delay = 0.4
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}

SMODS.Joker{ --RedEyesBlackDragon
    key = 'redEyesBlackDragon',
    atlas = 'Jokers',
    pos = {x = 1, y = 2},
    soul_pos = {x = 0, y = 2},
    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 12,
        xmult = 1.75
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        return{vars = {center.ability.extra.mult, center.ability.extra.xmult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local effects = {}
            if context.other_card:is_suit("Spades", true) then
                table.insert(effects, {
                    card = card,
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult,
                    colour = G.C.MULT,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() == 11 then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult,
                    message = 'X' .. card.ability.extra.xmult,
                    colour = G.C.MULT,
                    delay = 0.4
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}

SMODS.Joker{ --BYUD
    key = 'byud',
    atlas = 'secret1',
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    cost = 20,
    rarity = 'giga_megaLegendary',
    blueprint_compat = true,
    eternal_compat = true,
    no_collection = true,
    config = { extra = {
        mult = 50,
        xmult1 = 1.5,
        xmult2 = 4
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'byud_effect'}
    end,
    calculate = function(self,card,context)
        local dmk_ready = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_blackLusterSoldier' then
                dmk_ready = true
                break
            end
        end
        if context.setting_blind and dmk_ready then
            SMODS.add_card{key = "j_giga_dmk", edition = "e_negative"}
            G.E_MANAGER:add_event(Event({
                blocking = true,
                func = function()
                    card:start_dissolve()
                    G.E_MANAGER:add_event(Event({
                        delay = 0.8,
                        func = function()
                            card:remove()
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
        if context.individual and context.cardarea == G.play then
            local effects = {}
            table.insert(effects, {
                card = card,
                mult_mod = card.ability.extra.mult,
                message = '+' .. card.ability.extra.mult,
                colour = G.C.MULT,
                delay = 0.6
            })
            if context.other_card:is_suit("Clubs", true) then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult1,
                    message = 'X' .. card.ability.extra.xmult1,
                    colour = G.C.MULT,
                    delay = 0.6
                })
            end
            if context.other_card:get_id() >= 8 then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult2,
                    message = 'X' .. card.ability.extra.xmult2,
                    colour = G.C.MULT,
                    delay = 0.6
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}

SMODS.Joker{ --DMK
    key = 'dmk',
    atlas = 'secret2',
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    cost = 25,
    rarity = 'giga_megaLegendary',
    blueprint_compat = true,
    eternal_compat = true,
    no_collection = true,
    config = { extra = {
        mult = 80,
        xmult1 = 2.5,
        xmult2 = 6
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'dmk_effect'}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local effects = {}
            table.insert(effects, {
                card = card,
                mult_mod = card.ability.extra.mult,
                message = '+' .. card.ability.extra.mult,
                colour = G.C.MULT,
                delay = 0.6
            })
            if context.other_card:is_suit("Clubs", true) then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult1,
                    message = 'X' .. card.ability.extra.xmult1,
                    colour = G.C.MULT,
                    delay = 0.6
                })
            end
            if context.other_card:get_id() >= 7 then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult2,
                    message = 'X' .. card.ability.extra.xmult2,
                    colour = G.C.MULT,
                    delay = 0.6
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}

SMODS.Joker{ --BlackLusterSoldier
    key = 'blackLusterSoldier',
    atlas = 'Jokers',
    pos = {x = 3, y = 2},
    soul_pos = {x = 2, y = 2},
    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 8,
        xmult = 1.75
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return{vars = {center.ability.extra.mult, center.ability.extra.xmult}}
    end,
    calculate = function(self,card,context)
        local dmk_ready = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_byud' then
                dmk_ready = true
                break
            end
        end
        local moc_ready = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_darkMagician' then
                moc_ready = true
                break
            end
        end
        if context.setting_blind and (dmk_ready or moc_ready) then
            G.E_MANAGER:add_event(Event({
                blocking = true,
                func = function()
                    card:start_dissolve()
                    G.E_MANAGER:add_event(Event({
                        delay = 0.8,
                        func = function()
                            card:remove()
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
        if context.individual and context.cardarea == G.play then
            local effects = {}
            table.insert(effects, {
                card = card,
                mult_mod = card.ability.extra.mult,
                message = '+' .. card.ability.extra.mult,
                colour = G.C.MULT,
                delay = 0.4
            })
            if context.other_card:get_id() == 9 then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult,
                    message = 'X' .. card.ability.extra.xmult,
                    colour = G.C.MULT,
                    delay = 0.4
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}

SMODS.Joker{ --DarkMagician
    key = 'darkMagician',
    atlas = 'Jokers',
    pos = {x = 5, y = 2},
    soul_pos = {x = 4, y = 2},
    cost = 15,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 12,
        xmult = 1.75
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return{vars = {center.ability.extra.mult, center.ability.extra.xmult}}
    end,
    calculate = function(self,card,context)
        local moc_ready = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_blackLusterSoldier' then
                moc_ready = true
                break
            end
        end
        if context.setting_blind and moc_ready then
            SMODS.add_card{key = "j_giga_moc", edition = "e_negative"}
            G.E_MANAGER:add_event(Event({
                blocking = true,
                func = function()
                    card:start_dissolve()
                    G.E_MANAGER:add_event(Event({
                        delay = 0.8,
                        func = function()
                            card:remove()
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
        if context.individual and context.cardarea == G.play then
            local effects = {}
            if context.other_card:is_suit("Diamonds", true) then
                table.insert(effects, {
                    card = card,
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult,
                    colour = G.C.MULT,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() == 7 then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult,
                    message = 'X' .. card.ability.extra.xmult,
                    colour = G.C.MULT,
                    delay = 0.4
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}

SMODS.Joker{ --MOC
    key = 'moc',
    atlas = 'secret3',
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    cost = 15,
    rarity = 'giga_megaLegendary',
    blueprint_compat = true,
    eternal_compat = true,
    no_collection = true,
    config = { extra = {
        mult1 = 15,
        mult2 = 25,
        xmult = 3
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'moc_effect'}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local effects = {}
            table.insert(effects, {
                card = card,
                mult_mod = card.ability.extra.mult1,
                message = '+' .. card.ability.extra.mult1,
                colour = G.C.MULT,
                delay = 0.6
            })
            if context.other_card:is_suit("Diamonds", true) then
                table.insert(effects, {
                    card = card,
                    mult_mod = card.ability.extra.mult2,
                    message = '+' .. card.ability.extra.mult2,
                    colour = G.C.MULT,
                    delay = 0.6
                })
            end
            if context.other_card:get_id() <= 9 then
                table.insert(effects, {
                    card = card,
                    Xmult_mod = card.ability.extra.xmult,
                    message = 'X' .. card.ability.extra.xmult,
                    colour = G.C.MULT,
                    delay = 0.6
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}

SMODS.Joker{ --LLOTFO
    key = 'llotfo',
    atlas = 'Jokers',
    pos = {x = 0, y = 3},
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 75
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Spades", true) then
                return {
                    card = card,
                    chip_mod = card.ability.extra.chips,
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                    colour = G.C.CHIP
                }
            end
        end
    end
}

SMODS.Joker{ --RLOTFO
    key = 'rlotfo',
    atlas = 'Jokers',
    pos = {x = 1, y = 3},
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 75
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Clubs", true) then
                return {
                    card = card,
                    chip_mod = card.ability.extra.chips,
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                    colour = G.C.CHIP
                }
            end
        end
    end
}

SMODS.Joker{ --LAOTFO
    key = 'laotfo',
    atlas = 'Jokers',
    pos = {x = 2, y = 3},
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 75
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Hearts", true) then
                return {
                    card = card,
                    chip_mod = card.ability.extra.chips,
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                    colour = G.C.CHIP
                }
            end
        end
    end
}

SMODS.Joker{ --RAOTFO
    key = 'raotfo',
    atlas = 'Jokers',
    pos = {x = 3, y = 3},
    cost = 10,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 75
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Diamonds", true) then
                return {
                    card = card,
                    chip_mod = card.ability.extra.chips,
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                    colour = G.C.CHIP
                }
            end
        end
    end
}

SMODS.Joker{ --ETFO
    key = 'etfo',
    atlas = 'Jokers',
    pos = {x = 4, y = 3},
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 20
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        local tlei_ready = false
        local bool1 = false
        local bool2 = false
        local bool3 = false
        local bool4 = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_llotfo' then
                bool1 = true
            end
            if j.ability and j.ability.name == 'j_giga_rlotfo' then
                bool2 = true
            end
            if j.ability and j.ability.name == 'j_giga_laotfo' then
                bool3 = true
            end
            if j.ability and j.ability.name == 'j_giga_raotfo' then
                bool4 = true
            end
            if bool1 and bool2 and bool3 and bool4 then
                tlei_ready = true
                break
            end
        end
        if context.setting_blind and tlei_ready then
            SMODS.add_card{key = "j_giga_tlei", edition = "e_negative"}
            G.E_MANAGER:add_event(Event({
                blocking = true,
                func = function()
                    card:start_dissolve()
                    G.E_MANAGER:add_event(Event({
                        delay = 0.8,
                        func = function()
                            card:remove()
                            return true
                        end
                    }))
                    return true
                end
            }))
            for i, j in ipairs(G.jokers.cards) do
                if j.ability and (j.ability.name == 'j_giga_llotfo' or
                                  j.ability.name == 'j_giga_rlotfo' or
                                  j.ability.name == 'j_giga_laotfo' or
                                  j.ability.name == 'j_giga_raotfo') then
                    G.E_MANAGER:add_event(Event({
                        blocking = true,
                        func = function()
                            j:start_dissolve()
                            G.E_MANAGER:add_event(Event({
                                delay = 0.8,
                                func = function()
                                    j:remove()
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                end
            end
        end
        if context.individual and context.cardarea == G.play then
            return {
                card = card,
                chip_mod = card.ability.extra.chips,
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                colour = G.C.CHIP
            }
        end
    end
}

SMODS.Joker{ --TLEI
    key = 'tlei',
    atlas = 'secret4',
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    cost = 25,
    rarity = 'giga_megaLegendary',
    blueprint_compat = true,
    eternal_compat = true,
    no_collection = true,
    config = { extra = {
        mult = 50,
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'tlei_effect'}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
        end
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.mult,
                message = 'X' .. card.ability.extra.mult,
                colour = G.C.MULT
            }
        end
    end
}