SMODS.Atlas{
    key = "modicon", 
    path = "modicon.png", 
    px = 32,
    py = 32
}

SMODS.Atlas{
    key = 'Jokers',
    path = 'Joker.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'Foods',
    path = 'Food.png',
    px = 71,
    py = 95
}

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

SMODS.Joker { --KingOfJacks
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
        sell_price = 0,
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
        info_queue[#info_queue+1] = {set = 'Other', key = 'hrhr_credit'}
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

SMODS.Joker{ --Marcos
    key = 'marcos',
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
                        local food2 = create_card('Food',G.consumeables, nil, nil, nil, nil, 'c_giga_nachos', 'createFood1')
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

--CONSUMABLE
SMODS.ConsumableType{
    key = 'food',
    primary_colour = HEX("F7070BFF"),
    secondary_colour = HEX("F2A5A6FF"),
    loc_txt = {
        collection = 'Food Cards',
        name = 'Food'
    },
    collection_rows = {5,6},
    shop_rate = 0
}

SMODS.Consumable{ --Tacos
    key = 'tacos',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    loc_txt = {
        name = 'Tacos',
        text = {
            'A delicious tacos that',
            'gives you {C:money}$#1#{}'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        money = 3
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.money}}
    end,
    can_use = function (self,card)
        return true
    end,
    use = function (self,card,area,copier)
        SMODS.calculate_effect({dollars = card.ability.extra.money}, card)
    end
}

SMODS.Consumable{ --Nachos
    key = 'nachos',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 0},
    loc_txt = {
        name = 'Nachos',
        text = {
            'A delicious nachos that',
            'makes you draw {C:attention}#1#{} card',
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                for i = 1, card.ability.extra.card do
                    draw_card(G.deck, G.hand, i * 100 / 2, 'up', true)
                end
                return true
            end
        }))
    end
}