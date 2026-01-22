--#region NO CATEGORY JOKERS --
SMODS.Joker{ --CashPass
    key = 'cashPass',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_cashPass_alt'
    },
    pos = {x = 0, y = 0},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 12,
        mult = 0.8
    }
    },
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.cash, center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            return {
                dollars = card.ability.extra.cash
            }
        end
        if context.joker_main then
            return {
                x_mult = card.ability.extra.mult
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
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        round = 0,
        config_round = 2,
        chips = 30
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
                card.ability.extra.round = card.ability.extra.config_round or 2
            end
        end
        if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end
    end
}
SMODS.Joker{ --BlueEgg
    key = 'blueEgg',
    atlas = 'Jokers',
    pos = {x = 2, y = 0},
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        cash = 2
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS['j_egg']
        return{vars = {center.ability.extra.cash}}
    end,
    calculate = function(self,card,context)
        if not context.blueprint then
            if context.end_of_round and context.cardarea == G.jokers then
                return{
                    dollars = card.ability.extra.cash
                }
            end
            if context.selling_card and context.card == card then
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        SMODS.add_card({
                            key = "j_egg"
                        })
                        return true
                    end
                }))
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
    }},
    loc_vars = function(self,info_queue,center)
        local odds, chances = SMODS.get_probability_vars(center, center.ability.extra.odds, center.ability.extra.chances, 'prob')
        return{vars = {odds, chances, center.ability.extra.cash}}
    end,
    calculate = function(self,card,context)
        if not context.blueprint then
            if context.selling_card and context.card == card then
                if #G.jokers.cards - 1 < G.jokers.config.card_limit then
                    if SMODS.pseudorandom_probability(card, pseudoseed('giga_snapchatGirl'), card.ability.extra.odds, card.ability.extra.chances, 'scg_prob') then
                        SMODS.add_card({set = 'Joker', rarity = 'Legendary'})
                    else
                        return {
                            dollars = card.ability.extra.cash,
                        }
                    end
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
        local odds, chances = SMODS.get_probability_vars(center, center.ability.extra.odds, center.ability.extra.chances, 'giga_highRiskHighReward')
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        return {vars = {center.ability.extra.mult, odds, chances}}
    end,
    calculate = function(self, card, context)
        if context.scoring_name == 'High Card' then
            if context.joker_main then
                return {
                    x_mult = card.ability.extra.mult
                }
            end
            if context.destroy_card and context.destroy_card == context.full_hand[1] and SMODS.pseudorandom_probability(card, pseudoseed('giga_highRiskHighReward'), card.ability.extra.odds, card.ability.extra.chances) then
                return {
                    remove = true
                }
            end
        end
    end
}
SMODS.Joker{ --ShreddedAce
    key = 'shreddedAce',
    atlas = 'Jokers',
    pos = {x = 1, y = 1},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 4
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            return {
                func = function() 
					local suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('giga_shreddedAce'))
			        local card = create_playing_card({
				        front = G.P_CARDS[suit..'_'..'A']
			        }, G.hand, false,false,nil)
			        card:add_to_deck()
				end,
				message = 'Create !',
                colour = G.C.SECONDARY_SET.Tarot
            }
        end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            return {
                    mult = card.ability.extra.mult,
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
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        round_left = 1,
        round_switch = true
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.round_left}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
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
                        local food2 = create_card('Food',G.consumeables, nil, nil, nil, nil, 'c_giga_guacamole', 'createFood2')
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
        info_queue[#info_queue+1] = G.P_CENTERS.m_giga_soil
        return{vars = {center.ability.extra.chips}}
    end,
    in_pool = function(self)
        for _, c in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(c, 'm_giga_soil') or
               SMODS.has_enhancement(c, 'm_giga_richSoil') or
               SMODS.has_enhancement(c, 'm_giga_fossilSoil') then
                return true
            end
        end
        return false
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_giga_soil') then
                return {
                    chips = card.ability.extra.chips
                }
            elseif SMODS.has_enhancement(context.other_card, 'm_giga_richSoil') then
                return {
                    chips = card.ability.extra.s1chips
                }
            elseif SMODS.has_enhancement(context.other_card, 'm_giga_fossilSoil') then
                return {
                    chips = card.ability.extra.s2chips
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
        info_queue[#info_queue+1] = G.P_CENTERS.m_giga_soil
        return{vars = {center.ability.extra.mult}}
    end,
    in_pool = function(self)
        for _, c in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(c, 'm_giga_soil') or
               SMODS.has_enhancement(c, 'm_giga_richSoil') or
               SMODS.has_enhancement(c, 'm_giga_fossilSoil') then
                return true
            end
        end
        return false
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_giga_soil') then
                return {
                    mult = card.ability.extra.mult
                }
            elseif SMODS.has_enhancement(context.other_card, 'm_giga_richSoil') then
                return {
                    mult = card.ability.extra.s1mult
                }
            elseif SMODS.has_enhancement(context.other_card, 'm_giga_fossilSoil') then
                return {
                    mult = card.ability.extra.s2mult
                }
            end
        end
    end
}
SMODS.Joker{ --Refinery
    key = 'refinery',
    atlas = 'Jokers',
    pos = {x = 3, y = 4},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 2,
        cashNow = 0
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return{vars = {center.ability.extra.cash, center.ability.extra.cashNow}}
    end,
    in_pool = function(self)
        local counter = 0
        for _, c in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(c, 'm_stone') or
               SMODS.has_enhancement(c, 'm_giga_polishStone') then
                counter = counter + 1
            end
        end
        if counter > 2 then
            return true
        end
        return false
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.has_enhancement(context.other_card, 'm_stone') or
               SMODS.has_enhancement(context.other_card, 'm_giga_polishStone') then
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
                        message = localize("k_reset"),
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
SMODS.Joker{ --CrystalOfHungriness
    key = 'crystalOfHungriness',
    atlas = "Jokers",
    pos = {x = 0, y = 4},
    cost = 6,
    rarity = 2,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        add = 0.1,
        base = 1
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.base, card.ability.extra.add}}
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Giga_Food' and not context.blueprint then
            card.ability.extra.base = card.ability.extra.base + card.ability.extra.add
            return {
                message = 'Upgraded !',
                colour = G.C.MONEY,
            }
        end
        if context.joker_main and card.ability.extra.base ~= 1 then
            return {
                xmult = card.ability.extra.base,
            }
        end
    end
}
SMODS.Joker{ --DoubleFork
    key = 'doubleFork',
    atlas = "Jokers",
    pos = {x = 1, y = 4},
    cost = 5,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 2.5,
        txt = 'k_inactive',
        active = false
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, localize(card.ability.extra.txt)}}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.in_blind then
            if context.using_consumeable and context.consumeable.ability.set == 'Giga_Food' and not context.blueprint then
                if not card.ability.extra.active then
                    card.ability.extra.txt = 'k_active'
                    card.ability.extra.active = true
                    return {
                        message = localize('k_active'),
                        colour = G.C.GREEN
                    }
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
                card.ability.extra.txt = 'k_inactive'
                card.ability.extra.active = false
                return {
                    card = card,
                    message = localize("k_inactive"),
                    colour = G.C.RED
                }
            end
        end
    end
}
SMODS.Joker{ --CrackedSkull
    key = 'crackedSkull',
    atlas = "Jokers",
    pos = {x = 4, y = 4},
    cost = 6,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 4,
        txt = 'k_inactive',
        active = false
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, localize(card.ability.extra.txt)}}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.in_blind then
            if context.using_consumeable and context.consumeable.ability.set == 'Spectral' and not context.blueprint then
                if not card.ability.extra.active then
                    card.ability.extra.txt = 'k_active'
                    card.ability.extra.active = true
                    return {
                        message = localize("k_active"),
                        colour = G.C.GREEN
                    }
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
                card.ability.extra.txt = "k_inactive"
                card.ability.extra.active = false
                return {
                    message = localize("k_inactive"),
                    colour = G.C.RED
                }
            end
        end
    end
}
SMODS.Joker{ --SagittariusA
    key = 'sagittariusA',
    atlas = "Jokers",
    pos = {x = 2, y = 4},
    cost = 5,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 180,
        txt = 'k_inactive',
        active = false
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, localize(card.ability.extra.txt)}}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.in_blind then
            if context.using_consumeable and context.consumeable.ability.set == 'Planet' and not context.blueprint then
                if not card.ability.extra.active then
                    card.ability.extra.txt = "k_active"
                    card.ability.extra.active = true
                    return {
                        card = card,
                        message = localize("k_active"),
                        colour = G.C.GREEN
                    }
                end
            end
        end
        if context.joker_main then
            if card.ability.extra.active then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
        if context.end_of_round and not context.blueprint then
            if card.ability.extra.active then
                card.ability.extra.txt = "k_inactive"
                card.ability.extra.active = false
                return {
                    card = card,
                    message = localize("k_inactive"),
                    colour = G.C.RED
                }
            end
        end
    end
}
SMODS.Joker{ --MonochromeCrystal
    key = 'monochromeCrystal',
    atlas = "Jokers",
    pos = {x = 6, y = 5},
    cost = 6,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 24,
        nerf_mult = -16
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.nerf_mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if next(context.poker_hands['Flush']) then
                return {
                    mult = card.ability.extra.mult
                }
            else
                return {
                    mult = card.ability.extra.nerf_mult
                }
            end
        end
    end
}
SMODS.Joker{ --MarvinTheFourth
    key = 'marvinTheFourth',
    atlas = "Jokers",
    pos = {x = 7, y = 5},
    cost = 7,
    rarity = 2,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 45,
        mult = 1.5,
        suit = 'Spades'
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {colours={G.C.SUITS[center.ability.extra.suit]}, center.ability.extra.chips, center.ability.extra.mult, center.ability.extra.suit}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local effects = {}
            if context.other_card:is_suit(card.ability.extra.suit, true) and
               context.other_card:get_id() >= 4 and
               context.other_card:get_id() <= 6 then
                table.insert(effects, {
                    chips = card.ability.extra.chips,
                    delay = 0.6
                })
                table.insert(effects, {
                    x_mult = card.ability.extra.mult,
                    delay = 0.6
                })
            end
            if not context.blueprint then
                if card.ability.extra.suit == 'Spades' then
                    card.ability.extra.suit = 'Hearts'
                elseif card.ability.extra.suit == 'Hearts' then
                    card.ability.extra.suit = 'Diamonds'
                elseif card.ability.extra.suit == 'Diamonds' then
                    card.ability.extra.suit = 'Clubs'
                elseif card.ability.extra.suit == 'Clubs' then
                    card.ability.extra.suit = 'Spades'
                end
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}
SMODS.Joker{ --UpgradedTicket
    key = 'upgradedTicket',
    atlas = "Jokers",
    pos = {x = 5, y = 4},
    cost = 5,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash1 = 4,
        cash2 = 6
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.cash1, center.ability.extra.cash2}}
    end,
    in_pool = function(self)
        for _, c in pairs(G.playing_cards or {}) do
            local counter  = 0
            if upgraded_enh_condition(c) or upgraded_seal_condition(c) then
                counter = counter + 1
            end
            if counter >= 2 then
                return true
            end
        end
        return false
    end,
    calculate = function(self, card, context)
        if context.discard then
            if upgraded_enh_condition(context.other_card) and upgraded_seal_condition(context.other_card) then
                return {
                    dollars = card.ability.extra.cash1 + card.ability.extra.cash2,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            elseif upgraded_enh_condition(context.other_card) then
                return {
                    dollars = card.ability.extra.cash1,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            elseif upgraded_seal_condition(context.other_card) then
                return {
                    dollars = card.ability.extra.cash2,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}
SMODS.Joker{ --HealthyRoots
    key = 'healthyRoots',
    atlas = "Jokers",
    pos = {x = 6, y = 4},
    cost = 6,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 5
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.before then
            if #G.hand.cards > 0 then
                return {
                    card = G.hand.cards[1],
                    message = 'Set',
                    colour = G.C.MONEY
                }
            end
        end
        if context.individual and context.cardarea == G.play then
            if G.hand.cards[1] and context.other_card:get_id() == G.hand.cards[1]:get_id() then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
SMODS.Joker{ --Nahnahu
    key = 'nahnahu',
    atlas = "Jokers",
    pos = {x = 3, y = 5},
    cost = 6,
    rarity = 2,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 2,
        suit = 'Clubs'
    }},
    loc_vars = function(self, info_queue, center)
        local cards = 0
        for _, c in pairs(G.playing_cards or {}) do
            if c:is_suit(center.ability.extra.suit) then
                cards = cards + 1
            end
        end
        return {vars = {colours={G.C.SUITS[center.ability.extra.suit]}, center.ability.extra.mult, center.ability.extra.suit, center.ability.extra.mult * cards}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local cards = 0
            for _, c in pairs(G.playing_cards or {}) do
                if c:is_suit(card.ability.extra.suit) then
                    cards = cards + 1
                end
            end
            return {
                mult = cards * card.ability.extra.mult
            }
        end
        if context.end_of_round and not context.blueprint then
            if card.ability.extra.suit == 'Spades' then
                card.ability.extra.suit = 'Hearts'
            elseif card.ability.extra.suit == 'Hearts' then
                card.ability.extra.suit = 'Diamonds'
            elseif card.ability.extra.suit == 'Diamonds' then
                card.ability.extra.suit = 'Clubs'
            elseif card.ability.extra.suit == 'Clubs' then
                card.ability.extra.suit = 'Spades'
            end
        end
    end
    
}
SMODS.Joker{ --Hergosu
    key = 'hergosu',
    atlas = 'Jokers',
    pos = {x = 7, y = 4},
    cost = 5,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        jokerSlot = 1
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.jokerSlot}}
    end,
    calculate = function(self,card,context)
        if context.using_consumeable and context.consumeable.config.center.key == 'c_soul' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerSlot
                    return true
                end
            }))
            return {
                message = '+' .. card.ability.extra.jokerSlot .. ' Joker slot',
                colour = G.C.MULT
            }
        end
    end
}
SMODS.Joker{ --StockMarket
    key = 'stockMarket',
    atlas = 'Jokers',
    pos = {x = 2, y = 5},
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        cash = 0,
        cashPerFace = 2
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.cashPerFace, center.ability.extra.cash}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:is_face() then
                if to_big(G.GAME.dollars) >= to_big(card.ability.extra.cashPerFace) then
                    return {
                        dollars = -card.ability.extra.cashPerFace,
                        func = function()
                            card.ability.extra.cash = card.ability.extra.cash + card.ability.extra.cashPerFace
                            return true
                        end
                    }
                end
            end
        end
        if context.final_scoring_step and context.cardarea == G.jokers and not context.blueprint then
            if card.ability.extra.cash > 0 then
                if SMODS.pseudorandom_probability(card, pseudoseed('giga_stockMarket1'), 3, 8, 'st_prob1') then
                    if SMODS.pseudorandom_probability(card, pseudoseed('giga_stockMarket2'), 1, 12, 'st_prob2') then
                        return {
                            func = function()
                                card.ability.extra.cash = 0
                                return true
                            end,
                            message = 'Crash!',
                            colour = G.C.MULT
                        }
                    else
                        return {
                            func = function()
                                card.ability.extra.cash = round_number(card.ability.extra.cash / 2, 0)
                                return true
                            end,
                            message = '/2',
                            colour = G.C.MONEY
                        }
                    end
                else
                    if SMODS.pseudorandom_probability(card, pseudoseed('giga_stockMarket3'), 1, 10, 'st_prob3') then
                        return {
                            func = function()
                                card.ability.extra.cash = round_number(card.ability.extra.cash * 2.5)
                                return true
                            end,
                            message = 'X2.5',
                            colour = G.C.MONEY
                        }
                    else
                        return {
                            func = function()
                                card.ability.extra.cash = round_number(card.ability.extra.cash * 1.5, 0) 
                                return true
                            end,
                            message = 'X1.5',
                            colour = G.C.MONEY
                        }
                    end
                end
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        local cash = nil
        if G.GAME.blind.boss then
            cash = card.ability.extra.cash
            card.ability.extra.cash = 0
        end
        return cash
    end
}
SMODS.Joker{ --BonoboJoker
    key = 'bonoboJoker',
    atlas = 'Jokers',
    pos = {x = 5, y = 5},
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    calculate = function(self,card,context)
        if #G.play.cards >= 5 then
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                return {
                    mult = math.floor(context.other_card.base.nominal / 2)
                }
            end
        end
    end
}
SMODS.Joker{ --OnTheClock
    key = 'onTheClock',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_onTheClock_alt'
    },
    pos = {x = 0, y = 6},
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    calculate = function(self,card,context)
        if context.joker_main then
            local time = os.date("*t")
            return {
                mult = time.hour,
                chips = time.min
            }
        end
    end
}
SMODS.Joker{ --AliveBook
    key = 'aliveBook',
    atlas = 'Jokers',
    pos = {x = 2, y = 6},
    cost = 6,
    rarity = 2,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    loc_vars = function(self,info_queue,center)
        local name = ''
        if G.jokers and #G.jokers.cards > 0 then
            if G.jokers.cards[1] ~= center then
                name = localize{type = "name_text", key = G.jokers.cards[1].config.center.key, set = G.jokers.cards[1].ability.set}
            end
        end
        return{vars = {#name}}
    end,
    calculate = function(self,card,context)
        local name = ''
        if G.jokers and #G.jokers.cards > 0 then
            if G.jokers.cards[1] ~= card then
                name = localize{type = "name_text", key = G.jokers.cards[1].config.center.key, set = G.jokers.cards[1].ability.set}
            end
        end
        if context.joker_main and #name > 0 then
            return {
                mult = #name
            }
        end
    end
}
SMODS.Joker{ --Roposiel
    key = 'roposiel',
    atlas = 'Jokers',
    pos = {x = 1, y = 6},
    cost = 6,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    config = { extra = {
        mult_add = 9,
        mult = 0
    }},
    loc_vars = function(self,info_queue,center)
        if G.jokers and #G.jokers.cards > 0 then
            center.ability.extra.mult = 0
            for i = 1, #G.jokers.cards do
                local name = localize{type = "name_text", key = G.jokers.cards[i].config.center.key, set = G.jokers.cards[i].ability.set}
                if string.match(name, "%d") or string.match(name, "[^%w%s]") then
                    center.ability.extra.mult = (center.ability.extra.mult or 0) + center.ability.extra.mult_add
                end
            end
        end
        return{vars = {center.ability.extra.mult_add, center.ability.extra.mult}}
    end,
    in_pool = function(self)
        return #G.jokers.cards > 0
    end,
    calculate = function(self,card,context)
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
SMODS.Joker{ --Factolord
    key = 'factolord',
    atlas = 'Jokers',
    pos = {x = 7, y = 6},
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    loc_vars = function(self,info_queue,center)
        local facto = 0
        if G.jokers and #G.jokers.cards > 0 then
            facto = 4 * Factorial((G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_giga_factolord", true))
        end
        return{vars = {colours={HEX('FFA500')}, facto}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local facto = 4 * Factorial((G.jokers.config.card_limit - #G.jokers.cards) + #SMODS.find_card("j_giga_factolord", true))
            if facto > 0 then
                return {
                    chips = facto
                }
            end
        end
    end
}
SMODS.Joker{ --RescuePacket
    key = 'rescuePacket',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_rescuePacket_alt'
    },
    pos = {x = 0, y = 7},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        shop_size = 1,
        switcher = false
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.shop_size}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.main_eval and G.GAME.blind and G.GAME.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    change_shop_size(card.ability.extra.shop_size)
                    card.ability.extra.switcher = true
                    return true
                end
            }))
        end
        if card.ability.extra.switcher and context.ending_shop then
            G.E_MANAGER:add_event(Event({
                func = function()
                    change_shop_size(-card.ability.extra.shop_size)
                    card.ability.extra.switcher = false
                    return true
                end
            }))
        end
    end
}
SMODS.Joker{ --LinearLink
    key = 'linearLink',
    atlas = 'Jokers',
    pos = {x = 1, y = 7},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        retrigger = 1
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.retrigger}}
    end,
    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play and next(context.poker_hands['giga_Linked Pairs']) then
            return {
                repetitions = card.ability.extra.retrigger
            }
        end
    end
}
SMODS.Joker{ --LiarVadko
    key = 'liarVadko',
    atlas = 'Jokers',
    pos = {x = 2, y = 7},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 6
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if not card.debuff and context.individual and context.cardarea == 'unscored' then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
SMODS.Joker{ --Big31
    key = 'big31',
    atlas = 'Jokers',
    pos = {x = 7, y = 3},
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        confirm_open = false
    }},
    calculate = function(self,card,context)
        if not context.blueprint and context.open_booster then
            G.hand:change_size(G.hand.config.card_limit)
            card.ability.extra.confirm_open = true
        end
        if not context.blueprint and context.ending_booster and card.ability.extra.confirm_open then
            G.hand:change_size(-G.hand.config.card_limit / 2)
            card.ability.extra.confirm_open = false
        end
    end
}
SMODS.Joker{ --NoCashForYou
    key = 'noCashForYou',
    atlas = 'Jokers',
    pos = {x = 7, y = 3},
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        mult = 0.2
    }},
    loc_vars = function(self,info_queue,center)
        local mult = 1
        if G.GAME.dollars:to_number() < 0 then
            mult = 1 + math.abs(G.GAME.dollars:to_number()) * center.ability.extra.mult
        end
        return{vars = {center.ability.extra.mult, mult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main and G.GAME.dollars:to_number() < 0 then
            return {
                xmult = 1 + math.abs(G.GAME.dollars:to_number()) * card.ability.extra.mult
            }
        end
    end
}
--#endregion
--#region JACKS JOKERS --
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
                return {
                    func = function()
                        card.ability.extra.base = card.ability.extra.base + card.ability.extra.add
                        return true
                    end,
                    message_card = card,
                    message = 'X'..card.ability.extra.base..' Mult',
                    color = G.C.MULT
                }
            end
        end

        if context.joker_main then
            if card.ability.extra.base ~= 1 then
                return {
                    xmult = card.ability.extra.base
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
        round = 2,
        shaking = false
    }
    },
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        info_queue[#info_queue+1] = G.P_CENTERS['j_giga_kingOfJacks']
        return{vars = {center.ability.extra.round}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.main_eval then
            if card.ability.extra.round > 0 then
                card.ability.extra.round = card.ability.extra.round - 1
            end
            if card.ability.extra.round <= 0 and not card.ability.extra.shaking then
                local check_remove = function(card) 
                    return not card.REMOVED
                end
                juice_card_until(card, check_remove, true)
                card.ability.extra.shaking = true
            end
        end
        if context.selling_card and context.card == card then
            if card.ability.extra.round <= 0 then
                if #G.jokers.cards < G.jokers.config.card_limit then
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            SMODS.add_card{key = "j_giga_kingOfJacks"}
                            return true
                        end
                    }))
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        SMODS.add_card({
                            rank = 'Jack',
                            enhancement = 'm_bonus',
                            area = G.deck
                        })
                    end
                }))
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
        round = 1,
        round_left = 1,
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.round + 1, center.ability.extra.round_left}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            if card.ability.extra.round_left > 0 then
                card.ability.extra.round_left = card.ability.extra.round_left - 1
            else
                card.ability.extra.round_left = card.ability.extra.round
            end
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
                    local _card = pseudorandom_element(tpool, pseudoseed("jackMutator"))
                    if _card ~= nil and _card:get_id() == 11 then
                        if _card.config.center.key == "m_giga_fossilSoil" then
                            if _card.config.center.key == "m_giga_soil" or _card.config.center.key == "m_giga_richSoil"then
                                Giga.upgrade_enhancement(_card)
                            else
                                _card:set_enhancement("m_giga_soil")
                            end
                        end
                    else
                        SMODS.change_base(_card, nil, 'Jack')
                    end
                    _card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end
}
--#endregion
--#region GEMS JOKERS --
SMODS.Joker{ --Moonstone
    key = 'moonstone',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_moonstone_alt'
    },
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
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
SMODS.Joker{ --PinkTourmaline
    key = 'pinkTourmaline',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_pinkTourmaline_alt'
    },
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
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
SMODS.Joker{ --RainbowQuartz
    key = 'rainbowQuartz',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_rainbowQuartz_alt'
    },
    pos = {x = 7, y = 2},
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        xmult = 1.75
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.e_poly
        return {vars = {center.ability.extra.xmult}}
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
                    x_mult = card.ability.extra.xmult
                }
            end
        end
    end
}
--#endregion
--#region PREHISTORICS JOKERS --
SMODS.Joker{ --TRex
    key = 'tRex',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_tRex_alt'
    },
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
        round = 1,
        interac = {
            trice_mult = 6,
            ptera_chips = 35
        }
    }},
    loc_vars = function(self, info_queue, center)
        local set = next(SMODS.find_card("j_giga_velocyraptor" or "j_giga_velocyraptor_alt")) and 'Spectral' or 'Tarot'
        local _mult = next(SMODS.find_card("j_giga_triceratops" or "j_giga_triceratops_alt")) and center.ability.extra.interac.trice_mult or center.ability.extra.mult_add
        local _chips = next(SMODS.find_card("j_giga_pteranodon" or "j_giga_pteranodon_alt")) and center.ability.extra.interac.ptera_chips or center.ability.extra.chips_add
        return {vars = {colours={G.C.SECONDARY_SET[set]}, localize(set:lower(), "labels"), _mult, _chips, center.ability.extra.mult, center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.round = (card.ability.extra.round) - 1
            if card.ability.extra.round <= -1 then
                card.ability.extra.round = 1
                if #G.consumeables.cards > 0 then
                    SMODS.destroy_cards(pseudorandom_element(G.consumeables.cards, pseudoseed('tRex_destroy')))
                    if not context.blueprint then
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_add
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_add
                    end
                end
                G.E_MANAGER:add_event(Event({
                    blocking = true,
                    func = function()
                        if #G.consumeables.cards < G.consumeables.config.card_limit then
                            local set = next(SMODS.find_card("j_giga_velocyraptor" or "j_giga_velocyraptor_alt")) and 'Spectral' or 'Tarot'
                            SMODS.add_card({set = set})
                        else
                            SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                        end
                        return true
                    end
                }))
            end
        end
        if context.joker_main then
            local effects = {}
            if card.ability.extra.mult > 0 then
                table.insert(effects, {
                    mult = card.ability.extra.mult
                })
            end
            if card.ability.extra.chips > 0 then
                table.insert(effects, {
                    chips = card.ability.extra.chips
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
        end
    end
}
SMODS.Joker{ --Velocyraptor
    key = 'velocyraptor',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_velocyraptor_alt'
    },
    pos = {x = 7, y = 0},
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
        local _mult = next(SMODS.find_card("j_giga_tRex" or "j_giga_trex_alt")) and center.ability.extra.interac.rex_mult or center.ability.extra.mult
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
}
SMODS.Joker{ --Pteranodon
    key = 'pteranodon',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_pteranodon_alt'
    },
    pos = {x = 2, y = 1},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 3,
        txt = 'Planet',
        colour = G.C.SECONDARY_SET.Planet,
        interac = {
            rex_cash = 8,
            velo = false
        }
    }},
    loc_vars = function(self, info_queue, center)
        local cash = next(SMODS.find_card("j_giga_tRex" or "j_giga_tRex_alt")) and center.ability.extra.interac.rex_cash or center.ability.extra.cash
        local set = center.ability.extra.txt
        return {vars = {colours={G.C.SECONDARY_SET[set]}, localize(set:lower(), "labels"), cash}}
    end,
    calculate = function(self, card, context)
        if next(SMODS.find_card("j_giga_velocyraptor" or "j_giga_velocyraptor_alt")) then
            card.ability.extra.txt = 'Spectral'
        else
            card.ability.extra.txt = 'Planet'
        end
        if context.scoring_name == 'High Card' then
            if context.individual and context.cardarea == G.play and context.other_card:get_id() == 5 then
                local to_destroy = context.full_hand[1]
                G.E_MANAGER:add_event(Event({
                    blocking = true,
                    func = function()
                        SMODS.destroy_cards(to_destroy)
                        return true
                    end
                }))
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                     _create(card,card.ability.extra.txt,G.consumeables,false,false)
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
SMODS.Joker{ --Triceratops
    key = 'triceratops',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_triceratops_alt'
    },
    pos = {x = 4, y = 5},
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        odds = 1,
        chances = 9,
        interac = {
            ptera_chance = 7
        }
    }},
    loc_vars = function(self, info_queue, card)
        local chances = next(SMODS.find_card("j_giga_pteranodon" or "j_giga_pteranodon_alt")) and card.ability.extra.interac.ptera_chance or card.ability.extra.chances
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.odds, chances, 'prob')
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
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
--#endregion
--#region LEGENDARY JOKERS --
SMODS.Joker{ --MrYamiTsu
    key = 'myt_own',
    atlas = 'Jokers',
    fg_data = {
        is_alternate = false,
        alternate_key = 'j_giga_myt_own_alt'
    },
    pos = {x = 5, y = 6},
    soul_pos = {x = 6, y = 6},
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    config = { extra = {
        mult = 2
    }},
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if upgraded_enh_condition(context.other_card) or upgraded_seal_condition(context.other_card) then
                return {
                    x_mult = card.ability.extra.mult
                }
            end
        end
    end
}
SMODS.Joker{ --Tabaosl
    key = 'tabaosl',
    atlas = 'Jokers',
    pos = {x = 0, y = 5},
    soul_pos = {x = 1, y = 5},
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aij_back_credit'}
    end,
    calculate = function(self,card,context)
        if context.initial_scoring_step and not context.blueprint then
            if #G.play.cards > 0 then
                for i = 1, 2 do
                    if #G.play.cards >= i then
                        local c = G.play.cards[i]
                        if c.config.center_key and G.P_CENTERS[c.config.center_key].giga_data and
                           G.P_CENTERS[c.config.center_key].giga_data.enh_upgrade then
                            Giga.upgrade_enhancement(c)
                        end
                    else
                        break
                    end
                end
            end
        end
    end
}
SMODS.Joker{ --Rog-Ano
    key = 'rogAno',
    atlas = 'Jokers',
    pos = {x = 3, y = 6},
    soul_pos = {x = 4, y = 6},
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult_add = 0.5
    }},
    loc_vars = function(self,info_queue,center)
        local x_mult = 1
        for _, c in ipairs(G.playing_cards or {}) do
            if c:get_seal() ~= nil then
                x_mult = x_mult + center.ability.extra.mult_add
            end
        end
        return{vars = {center.ability.extra.mult_add, x_mult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local x_mult = 1
            for _, c in ipairs(G.playing_cards or {}) do
                if c:get_seal() ~= nil then
                    x_mult = x_mult + card.ability.extra.mult_add
                end
            end
            return {
                xmult = x_mult
            }
        end
    end
}
--#endregion
--#region YU-GI-OH JOKERS --
SMODS.Joker{ --BlueEyesWhiteDragon
    key = 'blueEyesWhiteDragon',
    atlas = 'Jokers',
    pos = {x = 6, y = 1},
    soul_pos = {x = 5, y = 1},
    cost = 20,
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
        if context.individual and context.cardarea == G.play then
            local effects = {}
            if context.other_card:is_suit("Clubs", true) then
                table.insert(effects, {
                    mult = card.ability.extra.mult,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() == 8 then
                table.insert(effects, {
                    x_mult = card.ability.extra.xmult,
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
    cost = 20,
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
                    mult = card.ability.extra.mult,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() == 11 then
                table.insert(effects, {
                    xmult = card.ability.extra.xmult,
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
    giga_data = {
        merge_materials = {
            'j_giga_blueEyesWhiteDragon',
            'j_giga_blueEyesWhiteDragon',
            'j_giga_blueEyesWhiteDragon'
        }
    },
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    cost = 50,
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
        return {vars ={center.ability.extra.mult, center.ability.extra.xmult1, center.ability.extra.xmult2}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local effects = {}
            table.insert(effects, {
                mult = card.ability.extra.mult,
                delay = 0.4
            })
            if context.other_card:is_suit("Clubs", true) then
                table.insert(effects, {
                    xmult = card.ability.extra.xmult1,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() >= 8 then
                table.insert(effects, {
                    xmult = card.ability.extra.xmult2,
                    delay = 0.4
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
    giga_data = {
        merge_materials = {
            'j_giga_byud',
            'j_giga_blackLusterSoldier'
        }
    },
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    cost = 60,
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
        return {vars ={center.ability.extra.mult, center.ability.extra.xmult1, center.ability.extra.xmult2}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local effects = {}
            table.insert(effects, {
                mult = card.ability.extra.mult,
                delay = 0.4
            })
            if context.other_card:is_suit("Clubs", true) then
                table.insert(effects, {
                    xmult = card.ability.extra.xmult1,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() >= 7 then
                table.insert(effects, {
                    xmult = card.ability.extra.xmult2,
                    delay = 0.4
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
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 7,
        xmult = 1.75
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return{vars = {center.ability.extra.mult, center.ability.extra.xmult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local effects = {}
            table.insert(effects, {
                mult = card.ability.extra.mult,
                delay = 0.4
            })
            if context.other_card:get_id() == 9 then
                table.insert(effects, {
                    x_mult = card.ability.extra.xmult,
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
    cost = 20,
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
        if context.individual and context.cardarea == G.play then
            local effects = {}
            if context.other_card:is_suit("Diamonds", true) then
                table.insert(effects, {
                    mult = card.ability.extra.mult,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() == 7 then
                table.insert(effects, {
                    xmult = card.ability.extra.xmult,
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
    giga_data = {
        merge_materials = {
            'j_giga_blackLusterSoldier',
            'j_giga_darkMagician'
        }
    },
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    cost = 35,
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
        return {vars ={center.ability.extra.mult1, center.ability.extra.mult2, center.ability.extra.xmult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            local effects = {}
            table.insert(effects, {
                mult = card.ability.extra.mult1,
                delay = 0.4
            })
            if context.other_card:is_suit("Diamonds", true) then
                table.insert(effects, {
                    mult = card.ability.extra.mult2,
                    delay = 0.4
                })
            end
            if context.other_card:get_id() <= 9 then
                table.insert(effects, {
                    xmult = card.ability.extra.xmult,
                    delay = 0.4
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
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 45
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
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
SMODS.Joker{ --RLOTFO
    key = 'rlotfo',
    atlas = 'Jokers',
    pos = {x = 1, y = 3},
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 45
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
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
SMODS.Joker{ --LAOTFO
    key = 'laotfo',
    atlas = 'Jokers',
    pos = {x = 2, y = 3},
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 45
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
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
SMODS.Joker{ --RAOTFO
    key = 'raotfo',
    atlas = 'Jokers',
    pos = {x = 3, y = 3},
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        chips = 45
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
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
SMODS.Joker{ --ETFO
    key = 'etfo',
    atlas = 'Jokers',
    pos = {x = 4, y = 3},
    cost = 8,
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
        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
SMODS.Joker{ --TLEI
    key = 'tlei',
    atlas = 'secret4',
    giga_data = {
        merge_materials = {
            'j_giga_llotfo',
            'j_giga_rlotfo',
            'j_giga_laotfo',
            'j_giga_raotfo',
            'j_giga_etfo',
        }
    },
    pos = {x = 1, y = 0},
    soul_pos = {x = 0, y = 0},
    cost = 25,
    rarity = 'giga_megaLegendary',
    blueprint_compat = true,
    eternal_compat = true,
    no_collection = true,
    config = { extra = {
        mult = 50
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'ledugs_credit'}
        info_queue[#info_queue+1] = {set = 'Other', key = 'yugioh_credit'}
        return {vars ={center.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
        end
        if context.joker_main then
            return {
                x_mult = card.ability.extra.mult
            }
        end
    end
}
--#endregion