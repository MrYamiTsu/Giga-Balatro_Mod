SMODS.Rarity({
	key = "megaLegendary",
	loc_txt = {
        name = "Mega Legendary",
    },
	badge_colour = HEX("dbd809"),
})

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
                dollars = cash,
                message = localize{type='variable',key='a_cash',vars={card.ability.extra.cash}}
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
                    local egg = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_giga_blueEgg')
                    egg:add_to_deck()
                    G.jokers:emplace(egg)
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
                local egg = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_egg')
                egg:add_to_deck()
                G.jokers:emplace(egg)
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
                    local joker = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_giga_kingOfJacks')
                    joker:add_to_deck()
                    G.jokers:emplace(joker)
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
                local suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('giga_funnyCrown'))
			    local card = create_playing_card({
				    front = G.P_CARDS[suit..'_'..'J'],
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
    config = { 
        extra = {
            odds = 1,
            chances = 7,
            cash = -20
        }
    },
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.odds, center.ability.extra.chances, center.ability.extra.cash}}
    end,
    calculate = function(self,card,context)
        if context.selling_card and context.card == card then
            if #G.jokers.cards < G.jokers.config.card_limit then
                local odds = card.ability.extra.odds or 1
                local chances = card.ability.extra.chances or 6
                local roll = pseudorandom('giga_snapchatGirl_'..tostring(math.random()))
                if roll <= (odds / chances) then
                    SMODS.add_card({set = 'Joker', rarity = 'Legendary'})
                else
                    return {
                        dollars = card.ability.extra.cash
                    }
                end
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
                        local spectral = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'createSpectral')
                        spectral:add_to_deck()
                        G.consumeables:emplace(spectral)
                    else
                        local tarot = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'createTarot')
                        tarot:add_to_deck()
                        G.consumeables:emplace(tarot)
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
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        return {vars = {center.ability.extra.mult, center.ability.extra.odds, center.ability.extra.chances}}
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
                local odds = card.ability.extra.odds or 1
                local chances = card.ability.extra.chances or 3
                local seed = pseudoseed(tostring(card:get_id()) .. tostring(context.scoring_name))
                local roll = pseudorandom('giga_highRiskHighReward', seed)
                if roll <= (odds / chances) then
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
                        local spectral = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'createSpectral')
                        spectral:add_to_deck()
                        G.consumeables:emplace(spectral)
                    else
                        local planet = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'createPlanet')
                        planet:add_to_deck()
                        G.consumeables:emplace(planet)
                    end
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
                return {
                    dollars = card.ability.extra.cash,
                    message = localize{type='variable',key='a_cash',vars={card.ability.extra.cash}}
                }
            end
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
        return{vars = {center.ability.extra.round_left}}
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

SMODS.Joker{ --Jack Mutator
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
        mult = 10,
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
                local byud = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_giga_byud')
                byud:set_edition('e_negative', true)
                byud:add_to_deck()
                G.jokers:emplace(byud)
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
    config = {},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
    end,
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
            local ubywd = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_giga_dmk')
            ubywd:set_edition('e_negative', true)
            ubywd:add_to_deck()
            G.jokers:emplace(ubywd)
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
        mult = 10,
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
        mult = 15,
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
            local moc = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_giga_moc')
            moc:set_edition('e_negative', true)
            moc:add_to_deck()
            G.jokers:emplace(moc)
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