--- STEAMODDED HEADER
--- MOD_NAME: Giga
--- MOD_ID: GIGA
--- MOD_AUTHOR: [MrYamiTsu]
--- MOD_DESCRIPTION: A mod that add some random thing to the game.
--- PREFIX: giga
----------------------------------------------------------
--------------------- MOD CODE ---------------------------
----------------------------------------------------------


-- assert(SMODS.load_file('description.lua'))()

SMODS.Atlas{
    key = 'Jokers',
    path = 'Joker.png',
    px = 71,
    py = 95
}

SMODS.Joker{ --CashPass
    key = 'cashPass',
    loc_txt = {
        name = 'Cash Pass',
        text = {
            'When blind is selected,',
            'earn {C:money}$#1#{}',
            '{X:mult,C:white}X#2#{} Mult'
        }
    },
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
                dollars = cash
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
    loc_txt = {
        name = 'Blue Chicken',
        text = {
            'Create a {C:attention}Blue Egg{}',
            'every {C:attention}4{} round and',
            'gain {C:chips}+#1#{} Chips',
            '{C:inactive}(Currently {C:attention}#2#{C:inactive} round left)',
            '{C:inactive}(Must have room)'
        }
    },
    atlas = 'Jokers',
    pos = {x = 1, y = 0},
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        round = 0,
        config_round = 3,
        chips = 10
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
    loc_txt = {
        name = 'Blue Egg',
        text = {
            'This egg feels... blue'
        }
    },
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
    loc_txt = {
        name = 'King of Jacks',
        text = {
            'Gain {X:mult,C:white}X#1#{} Mult for',
            'each {C:attention}Jack{} played',
            '{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)'
        }
    },
    atlas = 'Jokers',
    pos = {x = 3, y = 0},
    rarity = 3,
    cost = 9,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        add = 0.1,
        base = 1
    }
    },
    loc_vars = function(self,info_queue,center)
        return{vars = {center.ability.extra.add, center.ability.extra.base}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 11 then
            card.ability.extra.base = card.ability.extra.base + card.ability.extra.add
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
    loc_txt = {
        name = 'Funny Crown',
        text = {
            'After {C:attention}2{} round,',
            'sell this Joker to create',
            'a {C:attention}King of Jacks{} and',
            'a {C:chips}Bonus{} {C:attention}Jack{}',
            '{C:inactive}(Currently {C:attention}#1#/2{}{C:inactive} round left)',
            '{C:inactive}(Must have room)'
        }
    },
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
    loc_txt = {
        name = 'Snapchat Girl',
        text = {
            '{C:green}#1# in #2#{} to create',
            'a {C:legendary}Legendary{} Joker on',
            'selling, otherwise {C:money}$#3#{}'
        }
    },
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
            chances = 6,
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
    loc_txt = {
        name = 'T-Rex',
        text = {
            'Every other rounds, create a {C:tarot}Tarot{}',
            'and destroy a random comsumable',
            'for gaining {C:mult}+#2#{} Mult and {C:chips}+#3# Chips{}',
            '(Currently {C:mult}+#4#{} Mult / {C:chips}+#5#{} Chips)',
            '{C:inactive}(Currently {C:attention}#6#{C:inactive} round left)'
        }
    },
    atlas = 'Jokers',
    pos = {x = 6, y = 0},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 0,
        mult_add = 6,
        chips = 0,
        chips_add = 25,
        round = 1
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.text, center.ability.extra.mult_add, center.ability.extra.chips_add, center.ability.extra.mult, center.ability.extra.chips, center.ability.extra.round}}
    end,
    calculate = function(self, card, context)
        local has_velociraptor = false
        for i, j in ipairs(G.jokers.cards) do
            if j.ability and j.ability.name == 'j_giga_velocyraptor' then
                has_velociraptor = true
                break
            end
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.round = (card.ability.extra.round) - 1
            if card.ability.extra.round <= -1 then
                card.ability.extra.round = 1
                if #G.consumeables.cards > 0 then
                    local to_destroy = pseudorandom_element(G.consumeables.cards, pseudoseed('tRex_destroy'))
                    to_destroy:remove()
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_add
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_add
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
    loc_txt = {
        name = 'Velocyraptor',
        text = {
            '{C:mult}+#1#{} Mult if played hand does not',
            'contains an {C:attention}Ace{}'
        }
    },
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

--Don't touch this, it make the game crash
--[[SMODS.Joker{ --HighRiskHighReward
    key = 'highRiskHighReward',
    loc_txt = {
        name = 'High Risk, High Reward',
        text = {
            '{X:mult,C:white}X#1#{} Mult if played poker hand',
            'is {C:money}High Card{}',
            '{C:green}#2# in #3#{} to destroy the card'
        }
    },
    atlas = 'Jokers',
    pos = {x = 0, y = 1},
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    config = { extra = {
        mult = 5,
        odds = 1,
        chances = 3
    }},
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'info_queue', key = 'hrhr_credit'}
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
            local odds = card.ability.extra.odds or 1
            local chances = card.ability.extra.chances or 3
            local roll = pseudorandom('giga_highRiskHighReward', pseudoseed(card, context))
            if roll <= (odds / chances) then
                if context.destroying_card then
                    return {}
                end
            end
        end
    end
}]]--

SMODS.Joker{ --ShreddedAce
    key = 'shreddedAce',
    loc_txt = {
        name = 'Shredded Ace',
        text = {
            'Create an {C:attention}Ace{} when blind is selected',
            '{C:mult}+#1#{} Mult for each {C:attention}Ace{} played'
        }
    },
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
----------------------------------------------------------
------------------- MOD CODE END -------------------------
----------------------------------------------------------