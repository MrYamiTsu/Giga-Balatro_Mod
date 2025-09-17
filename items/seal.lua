-- UPGRADED SEALS --
SMODS.Seal{ --Red+
    key = 'redplus',
    atlas = "Seals",
    pos = {x = 0, y = 1},
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
            if SMODS.pseudorandom_probability(card, 'giga_redPlus', self.config.extra.odds, self.config.extra.chances, 'rp_prob') then
                return {
                    repetitions = self.config.extra.rep + self.config.extra.repPlus
                }
            else
                return {
                    repetitions = self.config.extra.rep,
                }
            end
        end
    end,
    badge_colour = G.C.RED
}
SMODS.Seal{ --Blue+
    key = 'blueplus',
    atlas = "Seals",
    pos = {x = 1, y = 1},
    config = { extra = {
        odds = 1,
        chances = 6
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'prob')
        return {vars = {odds, chances}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        -- From VanillaRemade (so thx VanillaRemade)
        if context.main_scoring and context.cardarea == G.hand and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'giga_bluePlus', self.config.extra.odds, self.config.extra.chances, 'bp_prob') then
                        SMODS.add_card({key = 'c_black_hole'})
                        G.GAME.consumeable_buffer = 0
                    else
                        if G.GAME.last_hand_played then
                            local planet = nil
                            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                                if v.config.hand_type == G.GAME.last_hand_played and not string.find(v.key, 'aij_')then
                                    planet = v.key
                                end
                            end
                            if planet then
                                SMODS.add_card({key = planet})
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
SMODS.Seal{ --Gold+
    key = 'goldplus',
    atlas = "Seals",
    pos = {x = 2, y = 1},
    config = { extra = {
        cash = 6,
        cashPlus = 6,
        interac = {
            has_gold = false,
            has_pGold = false
        }
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
            for i, c in ipairs(context.full_hand or {}) do
                if SMODS.has_enhancement(c, 'm_giga_perfectGold') then
                    self.config.extra.interac.has_pGold = true
                elseif SMODS.has_enhancement(c, 'm_gold') then
                    self.config.extra.interac.has_gold = true
                end
                if self.config.extra.interac.has_pGold then
                    break
                end
            end
            local effects = {}
            if self.config.extra.interac.has_pGold then
                table.insert(effects, {
                    dollars = self.config.extra.cash + (self.config.extra.cashPlus * 2),
                    delay = 0.6
                })
            elseif self.config.extra.interac.has_gold then
                table.insert(effects, {
                    dollars = self.config.extra.cash + self.config.extra.cashPlus,
                    delay = 0.6
                })
            else
                table.insert(effects, {
                    dollars = self.config.extra.cash,
                    delay = 0.6
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
            self.config.extra.interac.has_pGold = false
            self.config.extra.interac.has_gold = false
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
    pos = {x = 3, y = 0},
    config = { extra = {
        card = 2,
        odds = 1,
        chances = 8
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'prob')
        return {vars = {self.config.extra.card, odds, chances}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            for i = 1, self.config.extra.card, 1 do
                if SMODS.pseudorandom_probability(card, 'giga_purplePlus', self.config.extra.odds, self.config.extra.chances, 'pp_prob') then
                    _create(self,'Spectral', G.consumeables,false,false)
                    delay(0.4)
                else
                    _create(self,'Tarot', G.consumeables,false,false)
                    delay(0.4)
                end
		    end
        end
    end,
    badge_colour = G.C.PURPLE
}
SMODS.Seal{ --Red++
    key = 'redplusplus',
    atlas = "Seals",
    pos = {x = 3, y = 1},
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
            local additionalRep = -1
            for i, c in pairs(G.hand.cards) do
                if c:get_seal() == 'giga_redPlusPlus' then
                    additionalRep = additionalRep + 0.5
                end
            end
            for i, c in pairs(context.full_hand or {}) do
                if c:get_seal() == 'giga_redPlusPlus' then
                    additionalRep = additionalRep + 0.5
                end
            end
            math.floor(additionalRep)
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
    pos = {x = 0, y = 2},
    config = { extra = {
        odds = 1,
        chances = 3
    }},
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'prob')
        return {vars = {odds, chances}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        -- From VanillaRemade (so thx VanillaRemade)
        if context.main_scoring and (context.cardarea == G.hand or context.cardarea == G.play)and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if SMODS.pseudorandom_probability(card, 'giga_bluePlus', self.config.extra.odds, self.config.extra.chances, 'bp_prob') then
                        SMODS.add_card({key = 'c_black_hole', edition = 'e_negative'})
                        G.GAME.consumeable_buffer = 0
                    else
                        if G.GAME.last_hand_played then
                            local planet = nil
                            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                                if v.config.hand_type == G.GAME.last_hand_played and not string.find(v.key, 'aij_')then
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
    pos = {x = 2, y = 2},
    config = { extra = {
        cash = 8,
        cashAdd = 2,
        cashPlus = 6,
        interac = {
            has_gold = false,
            has_pGold = false
        }
    }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return {vars = {self.config.extra.cash, self.config.extra.cashAdd, self.config.extra.cashPlus}}
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
            for i, c in ipairs(context.full_hand or {}) do
                if SMODS.has_enhancement(c, 'm_giga_perfectGold') then
                    self.config.extra.interac.has_pGold = true
                elseif SMODS.has_enhancement(c, 'm_gold') then
                    self.config.extra.interac.has_gold = true
                end
                if self.config.extra.interac.has_pGold then
                    break
                end
            end
            local effects = {}
            if self.config.extra.interac.has_pGold then
                table.insert(effects, {
                    dollars = self.config.extra.cash + (self.config.extra.cashPlus * 2),
                    delay = 0.6
                })
            elseif self.config.extra.interac.has_gold then
                table.insert(effects, {
                    dollars = self.config.extra.cash + self.config.extra.cashPlus,
                    delay = 0.6
                })
            else
                table.insert(effects, {
                    dollars = self.config.extra.cash,
                    delay = 0.6
                })
            end
            if self.config.extra.cash > 8 then
                table.insert(effects, {
                    message = 'Reset',
                    colour = G.C.MULT,
                    func = function()
                        self.config.extra.cash = 8
                        return true
                    end,
                    delay = 0.6
                })
            end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
            self.config.extra.interac.has_pGold = false
            self.config.extra.interac.has_gold = false
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
    pos = {x = 1, y = 2},
    config = { extra = {
        card = 2,
        odds = 1,
        chances = 6,
    }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = 'Tag', key = 'tag_charm' }
        info_queue[#info_queue + 1] = { set = 'Tag', key = 'tag_ethereal'}
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'prob1')
        return {vars = {self.config.extra.card, odds, chances}}
    end,
    in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            for i = 1, self.config.extra.card, 1 do
                _create(self,'Tarot', G.consumeables,true,false)
                delay(0.4)
		    end
            G.E_MANAGER:add_event(Event({
                func = (function()
                    if SMODS.pseudorandom_probability(card, 'giga_purplePlusPlus', self.config.extra.odds, self.config.extra.chances, 'ppp_prob') then
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

-- NEW SEALS
SMODS.Seal { --Pink
    key = 'pinkseal',
    atlas = "Seals",
    pos = {x = 0, y = 0},
    config = { extra = {
        card = 1
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.card}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            for i = 1, self.config.extra.card, 1 do
                _create(card, 'Giga_Food', G.consumeables,true,true)
                delay(0.4)
		    end
            return {
                message = 'Create !',
                colour = G.C.MONEY,
				delay = 0.6
            }
        end
    end,
    badge_colour = HEX("FF00E6")
}
SMODS.Seal { --Crimson
    key = "crimsonseal",
    atlas = "Seals",
    pos = {x = 1, y = 0},
    config = { extra = {
        mult = 1
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            card.ability.perma_mult = card.ability.perma_mult + self.config.extra.mult
            return {
                message = 'Upgraded',
                colour = G.C.MULT
            }
        end
    end,
    badge_colour = HEX("DC143C")
}
SMODS.Seal { --Aqua
    key = "aquaseal",
    atlas = "Seals",
    pos = {x = 2, y = 0},
    config = { extra = {
        chips = 15
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            card.ability.perma_bonus = card.ability.perma_bonus + self.config.extra.chips
            return {
                message = 'Upgraded',
                colour = G.C.MULT
            }
        end
    end,
    badge_colour = HEX("00FFF0")
}