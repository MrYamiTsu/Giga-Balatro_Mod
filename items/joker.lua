-- NO CATEGORY JOKERS --
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
        chips = 25
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

        if context.joker_main then --other two checks shouldnt be needed since they are for values that dont change here
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
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    config = {},
    calculate = function(self,card,context)
        if not context.blueprint then
            if context.end_of_round and context.cardarea == G.jokers then
                return{
                    dollars = 1
                }
            end
            if context.selling_card and context.card == card then
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        SMODS.add_card({
                            key = "j_egg"
                        })
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
        }
    },
    loc_vars = function(self,info_queue,center)
        local odds, chances = SMODS.get_probability_vars(center, center.ability.extra.odds, center.ability.extra.chances, 'prob')
        return{vars = {odds, chances, center.ability.extra.cash}}
    end,
    calculate = function(self,card,context)
        if not context.blueprint then
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
            if context.destroy_card and context.destroy_card == context.full_hand[1] and SMODS.pseudorandom_probability(card, 'giga_highRiskHighReward', card.ability.extra.odds, card.ability.extra.chances) then
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
        info_queue[#info_queue+1] = G.P_CENTERS.m_giga_soil --what was here before doesnt exist, so i assume its meant to be this?
        return{vars = {center.ability.extra.mult}}
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
        cash = 3,
        cashNow = 0
    }},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return{vars = {center.ability.extra.cash, center.ability.extra.cashNow}}
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
        if context.end_of_round and context.main_eval then --was this supposed to be like gold joker?
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
        chips = 2,
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
                    card.ability.extra.txt = 'v_loyalty_active'
                    card.ability.extra.active = true
                    return {
                        message = localize('v_loyalty_active'),
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
        mult = 2.5,
        txt = 'k_inactive',
        active = false
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.txt}}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.in_blind then
            if context.using_consumeable and context.consumeable.ability.set == 'Spectral' and not context.blueprint then
                if not card.ability.extra.active then
                    card.ability.extra.txt = 'v_loyalty_active'
                    card.ability.extra.active = true
                    return {
                        message = localize("v_loyalty_active"),
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
                card.ability.extra.txt = 'k_inactive'
                card.ability.extra.active = false
                return {
                    message = localize('k_inactive'),
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
        chips = 90,
        txt = 'k_inactive',
        active = false
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.txt}}
    end,
    calculate = function(self, card, context)
        if G.GAME.blind.in_blind then
            if context.using_consumeable and context.consumeable.ability.set == 'Planet' and not context.blueprint then
                if not card.ability.extra.active then
                    card.ability.extra.txt = "v_loyalty_active"
                    card.ability.extra.active = true
                    return {
                        card = card,
                        message = localize("v_loyalty_active"),
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
SMODS.Joker{ --ColourfulCrystal
    key = 'colourfulCrystal',
    atlas = "Jokers",
    pos = {x = 6, y = 5},
    cost = 6,
    rarity = 1,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 16,
        nerf_mult = -30
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
        chips = 35,
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
                elseif card.ability.extra.suit == 'Diamond' then
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
        cash1 = 2,
        cash2 = 4
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.cash1, center.ability.extra.cash2}}
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
        mult = 5,
        rank = nil
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
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
        for _, c in pairs(G.playing_cards) do
            if c:is_suit(center.ability.extra.suit) then
                cards = cards+1
            end
        end
        return {vars = {colours={G.C.SUITS[center.ability.suit]}, center.ability.extra.mult, center.ability.extra.suit, center.ability.extra.mult*cards}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local mult = 0
            for _, c in pairs(G.playing_cards) do
                if c.base.suit == card.ability.extra.suit then
                    mult = mult + card.ability.extra.mult
                end
            end
            return {
                mult = mult
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
        odd= 1,
        chance = 2,
        jokerSlot = 1
    }},
    loc_vars = function(self,info_queue,center)
        local numerator, denominator = SMODS.get_probability_vars(center, center.ability.extra.odd, center.ability.extra.chance, 'giga_hergosu')
        return{vars = {numerator, denominator, center.ability.extra.jokerSlot},
            info = {
                {set = 'Other', key = 'j_giga_hergosu'}
            }
        }
    end,
    calculate = function(self,card,context)
        if context.using_consumeable and context.consumeable.config.center.key == 'c_soul' then
            if SMODS.pseudorandom_probability(card, 'giga_hergosu', card.ability.extra.odd, card.ability.extra.chance) then
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
            else
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.SECONDARY_SET.Tarot
                }
            end
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
                if SMODS.pseudorandom_probability(card, 'giga_stockMarket1', 3, 8, 'st_prob1') then
                    if SMODS.pseudorandom_probability(card, 'giga_stockMarket2', 1, 9, 'st_prob2') then
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
                    if SMODS.pseudorandom_probability(card, 'giga_stockMarket3', 1, 10, 'st_prob3') then
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
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if card.ability.extra.cash > 0 then
                return {
                    dollars = card.ability.extra.cash,
                    func = function()
                        card.ability.extra.cash = 0
                        return true
                    end
                }
            end
        end
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
    config = { extra = {
        i = 1
    }},
    calculate = function(self,card,context)
        if #G.play.cards >= 5 then
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                local mult_to_give = math.floor(G.hand.cards[card.ability.extra.i]:get_id() / 2)
                card.ability.extra.i = card.ability.extra.i + 1
                return {
                    mult = mult_to_give
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
    cost = 10,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'aij_back_credit'}
    end,
    calculate = function(self,card,context)
        if context.before and context.main_eval and not context.blueprint then
            if #G.play.cards > 0 then
                for i = 1, 2 do
                    if #G.play.cards >= i then
                        local c = G.play.cards[i]
                        if check_upgrade(c.config.center.key) then
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.15,
                                func = function()
                                    card:juice_up()
                                    upgrade_enhencement(c)
                                    return true
                                end
                            }))
                        end
                    else
                        break
                    end
                end
            end
        end
    end
}

-- JACKS JOKERS --
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
        round = 2,
        round_left = 2,
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
                    if selected_card:get_id() == 11 then
                        if selected_card.config.center.key == "m_giga_soil" then
                            upgrade_enhencement_specific(selected_card,'m_giga_richSoil')
                        else
                            upgrade_enhencement_specific(selected_card,'m_giga_soil')
                        end
                    else
                        SMODS.change_base(selected_card, nil, 'Jack')
                    end
                    selected_card:juice_up(0.3, 0.5)
                    return true 
                end 
            }))
            card.ability.extra.round_left = card.ability.extra.round
        end
    end
}

-- GEMS JOKERS --
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
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.edition and context.other_card.edition.type == 'foil' then
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
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.edition and context.other_card.edition.type == 'holo' then
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
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card.edition and context.other_card.edition.type == 'polychrome' then
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
    end
}

-- PREHISTORICS JOKERS --
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
        round = 1,
        interac = {
            velo = false,
            ptera = false,
            trice = false
        },
        txt = 'Tarot',
        colour = G.C.SECONDARY_SET.Tarot
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {colours={center.ability.extra.colour}, center.ability.extra.txt, center.ability.extra.mult_add, center.ability.extra.chips_add, center.ability.extra.mult, center.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        --Interaction
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_pteranodon' then
                card.ability.extra.interac.ptera = true
                break
            else
                card.ability.extra.interac.ptera = false
            end
        end
        if card.ability.extra.interac.ptera then
            card.ability.extra.chips_add = 35
        else
            card.ability.extra.chips_add = 25
        end
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_velocyraptor' then
                card.ability.extra.interac.velo = true
                break
            else
                card.ability.extra.interac.velo = false
            end
        end
        if card.ability.extra.interac.velo then
            card.ability.extra.txt = 'Spectral'
            card.ability.extra.colour = G.C.SECONDARY_SET.Spectral
        else
            card.ability.extra.txt = 'Tarot'
            card.ability.extra.colour = G.C.SECONDARY_SET.Tarot
        end
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_triceratops' then
                card.ability.extra.interac.trice = true
                break
            else
                card.ability.extra.interac.trice = false
            end
        end
        if card.ability.extra.interac.ptera then
            card.ability.extra.mult_add = 6
        else
            card.ability.extra.mult_add = 5
        end
        --Calculate
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
                    _create(card,card.ability.extra.txt,G.consumeables,false,false)
                    delay(0.4)
                else
                    SMODS.calculate_effect({ message = localize('k_no_room_ex') }, card)
                end
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
    pos = {x = 7, y = 0},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 6,
        interac = {
            rex = false
        }
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        --Interaction
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_tRex' then
                card.ability.extra.interac.rex = true
                break
            else
                card.ability.extra.interac.rex = false
            end
        end
        if card.ability.extra.interac.rex then
            card.ability.extra.mult = 10
        else
            card.ability.extra.mult = 6
        end
        --Calculate
        if context.joker_main and card.ability.extra.mult > 0 then
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
    pos = {x = 2, y = 1},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        cash = 3,
        interac = {
            rex = false,
            velo = false
        },
        txt = 'Planet',
        colour = G.C.SECONDARY_SET.Planet
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {colours={center.ability.extra.colour}, center.ability.extra.txt, center.ability.extra.cash}}
    end,
    calculate = function(self, card, context)
        --Interaction
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_tRex' then
                card.ability.extra.interac.rex = true
                break
            else
                card.ability.extra.interac.rex = false
            end
        end
        if card.ability.extra.interac.rex then
            card.ability.extra.cash = 8
        else
            card.ability.extra.cash = 3
        end
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_velocyraptor' then
                card.ability.extra.interac.velo = true
                break
            else
                card.ability.extra.interac.velo = false
            end
        end
        if card.ability.extra.interac.velo then
            card.ability.extra.txt = 'Spectral'
            card.ability.extra.colour = G.C.SECONDARY_SET.Spectral
        else
            card.ability.extra.txt = 'Planet'
            card.ability.extra.colour = G.C.SECONDARY_SET.Planet
        end
        --Calculate
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
    pos = {x = 4, y = 5},
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        odds = 1,
        chances = 9,
        interac = {
            ptera = false
        }
    }},
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances, 'prob')
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
        -- Interaction
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_pteranodon' then
                card.ability.extra.interac.ptera = true
                break
            else
                card.ability.extra.interac.ptera = false
            end
        end
        if card.ability.extra.interac.ptera then
            card.ability.extra.chances = 8
        else
            card.ability.extra.chips_add = 9
        end
        -- Calculate
        if context.individual and context.cardarea == G.play then 
            if SMODS.has_enhancement(context.other_card, 'm_mult') then
                if SMODS.pseudorandom_probability(card, 'giga_triceratops', card.ability.extra.odds, card.ability.extra.chances, 'tcrtp_prob1') then
                    return {
                        level_up = true,
                        message = localize('k_level_up_ex')
                    }
                end
            end
            if SMODS.has_enhancement(context.other_card, 'm_giga_multPlus') then
                if SMODS.pseudorandom_probability(card, 'giga_triceratops', card.ability.extra.odds * 2, card.ability.extra.chances, 'tcrtp_prob2') then
                    return {
                        level_up = true,
                        message = localize('k_level_up_ex')
                    }
                end
            end
        end
    end
}

-- YU-GI-OH JOKERS --
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
        return {vars ={center.ability.extra.mult, center.ability.extra.xmult1, center.ability.extra.xmult2}}
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
        return {vars ={center.ability.extra.mult, center.ability.extra.xmult1, center.ability.extra.xmult2}}
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
        return {vars ={center.ability.extra.mult1, center.ability.extra.mult2, center.ability.extra.xmult}}
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
        return {vars ={center.ability.extra.mult}}
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