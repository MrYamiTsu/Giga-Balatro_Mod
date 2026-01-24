Giga.Overcharge = SMODS.Sticker:extend {
    prefix_config = { key = true },
    should_apply = false,
    config = {},
    rate = 0,
    sets = {
        Default = true
    },
    draw = function(self, card)
        G.shared_stickers[self.key].role.draw_major = card
        G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center, nil, nil, 0)
    end,
    apply = function(self, card, val)
        card.ability[self.key] = val and copy_table(self.config) or nil
    end
}

Giga.Overcharge{ --RedOvercharge
    key = 'redOvercharge',
    set = 'Overcharge',
    atlas = 'Overcharges',
    pos = {x = 0, y = 0},
    discovered = true,
	unlocked = true,
    config = { extra = {
        mult = 1.5,
        ovch_add = 0.25
    }},
    loc_vars = function (self,info_queue,card)
        return{vars = {self.config.extra.mult + Giga.discarded_overcharge() * self.config.extra.ovch_add, self.config.extra.ovch_add}}
    end,
    calculate = function (self,card,context)
        if context.giga_pre_joker and context.cardarea == G.play then
            return {
                xmult = self.config.extra.mult + Giga.discarded_overcharge() * self.config.extra.ovch_add
            }
        end
    end,
    badge_colour = G.C.RED
}
Giga.Overcharge{ --BlueOvercharge
    key = 'blueOvercharge',
    set = 'Overcharge',
    atlas = 'Overcharges',
    pos = {x = 4, y = 0},
    discovered = true,
	unlocked = true,
    config = { extra = {
        chips = 2,
        ovch_add = 0.25
    }},
    loc_vars = function (self,info_queue,card)
        return{vars = {self.config.extra.chips + Giga.discarded_overcharge() * self.config.extra.ovch_add, self.config.extra.ovch_add}}
    end,
    calculate = function (self,card,context)
        if context.giga_pre_joker and context.cardarea == G.play then
            return {
                xchips = self.config.extra.chips + Giga.discarded_overcharge() * self.config.extra.ovch_add
            }
        end
    end,
    badge_colour = G.C.BLUE
}
Giga.Overcharge{ --YellowOvercharge
    key = 'yellowOvercharge',
    set = 'Overcharge',
    atlas = 'Overcharges',
    pos = {x = 1, y = 0},
    discovered = true,
	unlocked = true,
    config = { extra = {
        cash = 4,
        ovch_add = 1
    }},
    loc_vars = function (self,info_queue,card)
        return{vars = {self.config.extra.cash + math.floor(Giga.discarded_overcharge() / 2), self.config.extra.ovch_add, 2}}
    end,
    calculate = function (self,card,context)
        if context.giga_pre_joker and context.cardarea == G.play then
            return {
                dollars = self.config.extra.cash + math.floor(Giga.discarded_overcharge() / 2)
            }
        end
    end,
    badge_colour = G.C.GOLD
}
Giga.Overcharge{ --OrangeOvercharge
    key = 'orangeOvercharge',
    set = 'Overcharge',
    atlas = 'Overcharges',
    pos = {x = 2, y = 0},
    discovered = true,
	unlocked = true,
    config = { extra = {
        tarot = 1,
        odds = 1,
        chances = 3,
        ovch_add = 1
    }},
    loc_vars = function (self,info_queue,card)
        local odds, chances = SMODS.get_probability_vars(card, self.config.extra.odds, self.config.extra.chances, 'giga_orangeovercharge')
        return{vars = {self.config.extra.tarot + math.floor(Giga.discarded_overcharge() / 5), odds, chances, self.config.extra.ovch_add, 4}}
    end,
    calculate = function (self,card,context)
        if context.giga_pre_joker and context.cardarea == G.play then
            return {
                func = function()
                    for _ = 1, self.config.extra.tarot + math.floor(Giga.discarded_overcharge() / 5), 1 do
                        if SMODS.pseudorandom_probability(card, pseudoseed('giga_orangeovercharge'), self.config.extra.odds, self.config.extra.chances) then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function ()
                                    SMODS.add_card({set = 'Tarot', edition = 'e_negative'})
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            SMODS.calculate_effect({ message = localize("k_plus_tarot"), colour = G.C.PURPLE }, card)
                        else
                            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    func = function ()
                                        SMODS.add_card({set = 'Tarot'})
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect({ message = localize("k_plus_tarot"), colour = G.C.PURPLE }, card)
                            end
                        end
		            end
                    return true
                end
            }
        end
    end,
    badge_colour = G.C.ORANGE
}
Giga.Overcharge{ --GreenOvercharge
    key = 'greenOvercharge',
    set = 'Overcharge',
    atlas = 'Overcharges',
    pos = {x = 3, y = 0},
    discovered = true,
	unlocked = true,
    config = { extra = {
        level = 1,
        ovch_add = 1
    }},
    loc_vars = function (self,info_queue,card)
        return{vars = {self.config.extra.level + math.floor(Giga.discarded_overcharge() / 3), self.config.extra.ovch_add, 3}}
    end,
    calculate = function (self,card,context)
        if context.giga_pre_joker and context.cardarea == G.play then
            local hands = {}
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v] and G.GAME.hands[v].visible then
                    hands[#hands+1] = v
                end
            end
            for _ = 1, self.config.extra.level + math.floor(Giga.discarded_overcharge() / 3), 1 do
                local ht = pseudorandom_element(hands, pseudoseed('okokokok123'))
                update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		            handname = localize(ht, "poker_hands"),
		            chips = G.GAME.hands[ht].chips,
		            mult = G.GAME.hands[ht].mult,
		            level = G.GAME.hands[ht].level,
	            })
                level_up_hand(card, ht, nil, 1)
            end
        end
    end,
    badge_colour = G.C.GREEN
}
