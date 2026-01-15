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
        return{vars = {self.config.extra.mult + Giga.config.discarded_overcharge * self.config.extra.ovch_add, self.config.extra.ovch_add}}
    end,
    calculate = function (self,card,context)
        if context.final_scoring_step and context.cardarea == G.play then
            return {
                xmult = self.config.extra.mult + Giga.config.discarded_overcharge * self.config.extra.ovch_add
            }
        end
    end,
    badge_colour = G.C.RED
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
        return{vars = {self.config.extra.cash + math.floor(Giga.config.discarded_overcharge / 2), self.config.extra.ovch_add, 2}}
    end,
    calculate = function (self,card,context)
        if context.final_scoring_step and context.cardarea == G.play then
            return {
                dollars = self.config.extra.cash + math.floor(Giga.config.discarded_overcharge / 2)
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
        ovch_add = 1
    }},
    loc_vars = function (self,info_queue,card)
        return{vars = {self.config.extra.tarot + math.floor(Giga.config.discarded_overcharge / 5), self.config.extra.ovch_add, 5}}
    end,
    calculate = function (self,card,context)
        if context.final_scoring_step and context.cardarea == G.play then
            return {
                func = function()
                    for _ = 1, self.config.extra.tarot + math.floor(Giga.config.discarded_overcharge / 5), 1 do
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function ()
                                SMODS.add_card({set = 'Tarot', edition = 'e_negative'})
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        }))
                        SMODS.calculate_effect({ message = localize("k_plus_tarot"), colour = G.C.PURPLE }, card)
		            end
                    return true
                end
            }
        end
    end,
    badge_colour = G.C.ORANGE
}