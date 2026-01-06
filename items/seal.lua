--#region NEW SEALS
SMODS.Seal{ --Pink
    key = 'pinkseal',
    atlas = "Seals",
    giga_seal_upgrade = 'giga_pinkplus',
    giga_data = {
        seal_upgrade = 'giga_pinkplus'
    },
    pos = {x = 0, y = 0},
    discovered = true,
	unlocked = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card({set = 'Giga_Food'})
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                    return true
                end,
                message = '+1 Food',
                colour = HEX('F2A5A6FF')
            }
            end
        end
    end,
    badge_colour = HEX("FF00E6")
}
SMODS.Seal{ --Aqua
    key = "aquaseal",
    atlas = "Seals",
    giga_data = {
        seal_upgrade = 'giga_aquaplus'
    },
    pos = {x = 2, y = 0},
    discovered = true,
	unlocked = true,
    config = { extra = {
        chips = 10
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            card.ability.perma_bonus = (card.ability.perma_bonus or 0) + self.config.extra.chips
            return {
                message = 'Upgraded',
                colour = G.C.CHIPS
            }
        end
    end,
    badge_colour = HEX("00FFF0")
}
SMODS.Seal{ --Crimson
    key = "crimsonseal",
    atlas = "Seals",
    giga_data = {
        seal_upgrade = 'giga_crimsonplus'
    },
    pos = {x = 1, y = 0},
    discovered = true,
	unlocked = true,
    config = { extra = {
        mult = 1
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            card.ability.perma_mult = (card.ability.perma_mult or 0) + self.config.extra.mult
            return {
                message = 'Upgraded',
                colour = G.C.MULT
            }
        end
    end,
    badge_colour = HEX("DC143C")
}
--#endregion
--#region VANILLA + SEALS --
SMODS.Seal{ --Red+
    key = 'redplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true,
        seal_upgrade = 'giga_redplusplus'
    },
    pos = {x = 0, y = 1},
    discovered = true,
	unlocked = true,
    config = { extra = {
        rep = 2,
        repPlus = 1,
        odds = 1,
        chances = 4
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'prob')
        return {vars = {self.config.extra.rep, odds, chances, self.config.extra.repPlus}}
    end,
    in_pool = function(self)
		return false
	end,
    calculate = function(self, card, context)
        if context.repetition then
            if SMODS.pseudorandom_probability(card, pseudoseed('giga_redPlus'), self.config.extra.odds, self.config.extra.chances, 'rp_prob') then
                return {
                    repetitions = self.config.extra.rep + self.config.extra.repPlus
                }
            else
                return {
                    repetitions = self.config.extra.rep
                }
            end
        end
    end,
    badge_colour = G.C.RED
}
SMODS.Seal{ --Blue+
    key = 'blueplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true,
        seal_upgrade = 'giga_blueplusplus'
    },
    pos = {x = 1, y = 1},
    discovered = true,
	unlocked = true,
    config = { extra = {
        odds = 1,
        chances = 10
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'giga_bluePlus')
        return {vars = {odds, chances}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        -- From VanillaRemade (so thx VanillaRemade)
        if context.after and context.cardarea == G.hand and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if SMODS.pseudorandom_probability(card, pseudoseed('giga_bluePlus'), self.config.extra.odds, self.config.extra.chances) then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card({key = 'c_black_hole'})
                                return true
                            end
                        }))
                    else
                        if G.GAME.last_hand_played then
                            local planet = nil
                            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                                if v.config.hand_type == G.GAME.last_hand_played and not string.find(v.key, 'aij_') and not string.find(v.key, 'giga_ast') then
                                    planet = v.key
                                end
                            end
                            if planet then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        SMODS.add_card({key = planet})
                                        return true
                                    end
                                }))
                            end
                        end
                    end
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
            return {
                message = localize('k_plus_planet'),
                colour = G.C.SECONDARY_SET.Planet
            }
        end
    end,
    badge_colour = G.C.BLUE,
}
SMODS.Seal{ --Gold+
    key = 'goldplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true,
        seal_upgrade = 'giga_goldplusplus'
    },
    pos = {x = 2, y = 1},
    discovered = true,
	unlocked = true,
    config = { extra = {
        cash = 6,
        cashPlus = 6,
    }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return {vars = {self.config.extra.cash, self.config.extra.cashPlus}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local has_pGold, has_gold
            for i, c in ipairs(context.full_hand or {}) do
                if SMODS.has_enhancement(c, 'm_giga_perfectGold') then
                    has_pGold = true
                elseif SMODS.has_enhancement(c, 'm_gold') then
                    has_gold = true
                end
                if has_pGold then
                    break
                end
            end
            if has_pGold then
                return {
                    dollars = self.config.extra.cash + (self.config.extra.cashPlus * 2)
                }
            elseif has_gold then
                return {
                    dollars = self.config.extra.cash + self.config.extra.cashPlus
                }
            else
                return {
                    dollars = self.config.extra.cash
                }
            end
        end
    end,
    -- From VanillaRemade (so thx VanillaRemade)
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            G.shared_seals[card.seal].role.draw_major = card
            G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
            G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end,
    badge_colour = G.C.GOLD
}
SMODS.Seal{ --Purple+
    key = 'purpleplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true,
        seal_upgrade = 'giga_purpleplusplus'
    },
    pos = {x = 3, y = 0},
    discovered = true,
	unlocked = true,
    config = { extra = {
        card = 2,
        odds = 1,
        chances = 12
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'giga_purplePlus')
        return {vars = {self.config.extra.card, odds, chances}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            for _ = 1, self.config.extra.card, 1 do
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    local spectral = false
                    if SMODS.pseudorandom_probability(card, pseudoseed('giga_purplePlus'), self.config.extra.odds, self.config.extra.chances) then
                        spectral = true
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            if spectral then
                                SMODS.add_card({set = 'Spectral'})
                            else
                                SMODS.add_card({set = 'Tarot'})
                            end
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize(spectral and "k_plus_spectral" or "k_plus_tarot"), colour = G.C.PURPLE }, card)
                end
		    end
        end
    end,
    badge_colour = G.C.PURPLE
}
--#endregion
--#region NEW + SEALS
SMODS.Seal{ --Pink+
    key = 'pinkplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true,
        seal_upgrade = 'giga_pinkplusplus'
    },
    pos = {x = 3, y = 2},
    discovered = true,
	unlocked = true,
    config = { extra = {
        reduce = 5,
        odds = 1,
        chances = 3
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'giga_pinkPlus')
        return {vars = {odds, chances, self.config.extra.reduce,}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            -- From TogaStuff (so thx TogaStuff)
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 - card.ability.seal.extra.reduce / 100))
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
					G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
					G.HUD_blind:recalculate()
					G.hand_text_area.blind_chips:juice_up()
					card:juice_up()
                    return true
                end
            }))
            local mes = '+1 Food'
            return {
                func = function()
                    if SMODS.pseudorandom_probability(card, pseudoseed('giga_pinkPlus'), self.config.extra.odds, self.config.extra.chances) then
                        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card({set = 'Giga_Food'})
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            return true
                        else
                            mes = nil
                        end
                    else
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card({set = 'Giga_Food', edition = 'e_negative'})
                                return true
                            end
                        }))
                    end
                    return true
                end,
                message = mes,
                colour = HEX('F2A5A6FF')
            }
        end
    end,
    badge_colour = HEX("FF00E6")
}
SMODS.Seal{ --Aqua+
    key = "aquaplus",
    atlas = "Seals",
    giga_data = {
        is_upgraded = true,
        seal_upgrade = 'giga_aquaplusplus'
    },
    pos = {x = 2, y = 3},
    discovered = true,
	unlocked = true,
    config = { extra = {
        chips = 20,
        mult = 1.2
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.chips, self.config.extra.mult}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            card.ability.perma_bonus = (card.ability.perma_bonus or 0) + self.config.extra.chips
            return {
                message = 'Upgraded',
                colour = G.C.CHIPS
            }
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_mult = self.config.extra.mult
            }
        end
    end,
    badge_colour = HEX("00FFF0")
}
SMODS.Seal{ --Crimson+
    key = "crimsonplus",
    atlas = "Seals",
    giga_data = {
        is_upgraded = true,
        seal_upgrade = 'giga_crimsonplusplus'
    },
    pos = {x = 1, y = 3},
    discovered = true,
	unlocked = true,
    config = { extra = {
        mult = 2,
        chips = 1.2
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.mult, self.config.extra.chips}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            card.ability.perma_mult = (card.ability.perma_mult or 0) + self.config.extra.mult
            return {
                message = 'Upgraded',
                colour = G.C.MULT
            }
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_chips = self.config.extra.chips
            }
        end
    end,
    badge_colour = HEX("DC143C")
}
--#endregion
--#region VANILLA ++ SEALS --
SMODS.Seal{ --Red++
    key = 'redplusplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true
    },
    pos = {x = 3, y = 1},
    discovered = true,
	unlocked = true,
    config = { extra = {
        rep = 3
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.rep}}
    end,
    in_pool = function(self)
		return false
	end,
    calculate = function(self, card, context)
        if context.repetition then
            local additionalRep = 0
            for _, c in ipairs(G.hand.cards) do
                if c:get_seal() == "giga_redplusplus" then
                    additionalRep = additionalRep + 1
                end
            end
            for _, c in ipairs(context.full_hand or {}) do
                if c:get_seal() == "giga_redplusplus" then
                    additionalRep = additionalRep + 1
                end
            end
            additionalRep = math.floor(additionalRep / 2 - 0.5)
            return {
                repetitions = self.config.extra.rep + additionalRep
            }
        end
    end,
    badge_colour = G.C.RED
}
SMODS.Seal{ --Blue++
    key = 'blueplusplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true
    },
    pos = {x = 0, y = 2},
    discovered = true,
	unlocked = true,
    config = { extra = {
        odds = 1,
        chances = 6
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'giga_bluePlusPlus')
        return {vars = {odds, chances}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        -- From VanillaRemade (so thx VanillaRemade)
        if context.after and (context.cardarea == G.hand or context.cardarea == G.play)and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if SMODS.pseudorandom_probability(card, pseudoseed('giga_bluePlusPlus'), self.config.extra.odds, self.config.extra.chances) then
                        SMODS.add_card({key = 'c_black_hole', edition = 'e_negative'})
                        G.GAME.consumeable_buffer = 0
                    else
                        if G.GAME.last_hand_played then
                            local planet = nil
                            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                                if v.config.hand_type == G.GAME.last_hand_played and not string.find(v.key, 'aij_') and not string.find(v.key, 'giga_ast') then
                                    planet = v.key
                                end
                            end
                            if planet then
                                SMODS.add_card({key = planet, edition = 'e_negative'})
                            end
                            G.GAME.consumeable_buffer = 0
                        end
                    end
                    return true
                end
            }))
            return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
        end
    end,
    badge_colour = G.C.BLUE,
}
SMODS.Seal{ --Gold++
    key = 'goldplusplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true
    },
    pos = {x = 2, y = 2},
    discovered = true,
	unlocked = true,
    config = { extra = {
        cash = 8,
        cashAdd = 2,
        cashPlus = 6,
    }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return {vars = {self.config.extra.cash + (card.ability.giga_goldplusplus_increase or 0), self.config.extra.cashAdd, self.config.extra.cashPlus}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.hand then
            return {
                message = 'Upgraded',
                colour = G.C.MONEY,
                func = function()
                    self.config.extra.cash = self.config.extra.cash + self.config.extra.cashAdd
                    return true
                end
            }
        end
        if context.main_scoring and context.cardarea == G.play then
            local has_pGold, has_gold
            for i, c in ipairs(context.full_hand or {}) do
                if SMODS.has_enhancement(c, 'm_giga_perfectGold') then
                    has_pGold = true
                elseif SMODS.has_enhancement(c, 'm_gold') then
                    has_gold = true
                end
                if has_pGold then
                    break
                end
            end
            if has_pGold then
                return {
                    dollars = self.config.extra.cash + (self.config.extra.cashPlus * 2)
                }
            elseif has_gold then
                return{
                    dollars = self.config.extra.cash + self.config.extra.cashPlus,
                }
            else
                return {
                    dollars = self.config.extra.cash
                }
            end
        end
        if context.end_of_round and context.main_eval then
            if self.config.extra.cash > 8 then
                return {
                    message = 'Reset',
                    colour = G.C.MULT,
                    func = function()
                        self.config.extra.cash = 8
                        return true
                    end
                }
            end
        end
    end,
    -- From VanillaRemade (so thx VanillaRemade)
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            G.shared_seals[card.seal].role.draw_major = card
            G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
            G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end,
    badge_colour = G.C.GOLD
}
SMODS.Seal{ --Purple++
    key = 'purpleplusplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true
    },
    pos = {x = 1, y = 2},
    discovered = true,
	unlocked = true,
    config = { extra = {
        card = 2,
        odds = 1,
        chances = 9,
    }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = 'Tag', key = 'tag_charm' }
        info_queue[#info_queue + 1] = { set = 'Tag', key = 'tag_ethereal'}
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'giga_purplePlusPlus')
        return {vars = {self.config.extra.card, odds, chances}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            for i = 1, self.config.extra.card, 1 do
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        SMODS.add_card({set = 'Tarot', edition = 'e_negative'})
                        return true
                    end
                }))
		    end
            G.E_MANAGER:add_event(Event({
                func = (function()
                    if SMODS.pseudorandom_probability(card, pseudoseed('giga_purplePlusPlus'), self.config.extra.odds, self.config.extra.chances) then
                        add_tag(Tag('tag_ethereal'))
                    else
                        add_tag(Tag('tag_charm'))
                    end
                    return true
                end)
            }))
        end
    end,
    badge_colour = G.C.PURPLE
}
--#endregion
--#region NEW ++ SEALS
SMODS.Seal{ --Pink++
    key = 'pinkplusplus',
    atlas = "Seals",
    giga_data = {
        is_upgraded = true
    },
    pos = {x = 0, y = 3},
    discovered = true,
	unlocked = true,
    config = { extra = {
        card = 2,
        reduce = 10,
        odds = 1,
        chances = 40
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'giga_pinkPlusPlus')
        return {vars = {self.config.extra.card, self.config.extra.reduce, odds, chances}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 - card.ability.seal.extra.reduce / 100))
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate()
                    G.hand_text_area.blind_chips:juice_up()
                    card:juice_up()
                    return true
                end
            }))
            return {
                func = function()
                    for i = 1, self.config.extra.card, 1 do
                        if SMODS.pseudorandom_probability(card, pseudoseed('giga_pinkPlusPlus'), self.config.extra.odds, self.config.extra.chances) then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local cons = Giga.POOLS.r_food[math.random(#Giga.POOLS.r_food)]
                                    SMODS.add_card({key = cons, edition = 'e_negative'})
                                    return true
                                end
                            }))
                        else
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card({set = 'Giga_Food', edition = 'e_negative'})
                                    return true
                                end
                            }))
                        end
                    end
                    return true
                end,
                message = '+'..self.config.extra.card..' Food',
                colour = HEX('F2A5A6FF')
            }
        end
    end,
    badge_colour = HEX("FF00E6")
}
SMODS.Seal{ --Aqua++
    key = "aquaplusplus",
    atlas = "Seals",
    giga_data = {
        is_upgraded = true
    },
    pos = {x = 0, y = 4},
    discovered = true,
	unlocked = true,
    config = { extra = {
        chips = 30,
        chips_plus = 10,
        mult = 1.4,
        mult_plus = 0.1
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.chips,self.config.extra.chips_plus, self.config.extra.mult, self.config.extra.mult_plus}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            card.ability.perma_bonus = (card.ability.perma_bonus or 0) + self.config.extra.chips + self.config.extra.chips_plus * #G.jokers.cards
            return {
                message = 'Upgraded',
                colour = G.C.CHIPS
            }
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_mult = self.config.extra.mult + self.config.extra.mult_plus * #G.consumeables.cards
            }
        end
    end,
    badge_colour = HEX("00FFF0")
}
SMODS.Seal{ --Crimson++
    key = "crimsonplusplus",
    atlas = "Seals",
    giga_data = {
        is_upgraded = true
    },
    pos = {x = 3, y = 3},
    discovered = true,
	unlocked = true,
    config = { extra = {
        mult = 3,
        mult_plus = 1,
        chips = 1.4,
        chips_plus = 0.1
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.mult, self.config.extra.mult_plus, self.config.extra.chips, self.config.extra.chips_plus}}
    end,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            card.ability.perma_mult = (card.ability.perma_mult or 0) + self.config.extra.mult + self.config.extra.mult_plus * #G.play.cards
            return {
                message = 'Upgraded',
                colour = G.C.MULT
            }
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_chips = self.config.extra.chips + self.config.extra.chips_plus * #G.hand.cards
            }
        end
    end,
    badge_colour = HEX("DC143C")
}
--#endregion