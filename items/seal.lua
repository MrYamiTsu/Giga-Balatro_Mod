SMODS.Seal { --Pink
    key = 'pinkSeal',
    atlas = "Seals",
    pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Pink Seal',
        text = {
            'When this card is {C:attention}scored{},',
            'create {C:attention}#1#{} {V:1}Food{} card',
        },
        label = 'Pink Seal'
    },
    config = { extra = {
        card = 1
    }},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.extra.card, colours={HEX('F7070BFF')}}}
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
    key = "crimsonSeal",
    atlas = "Seals",
    pos = {x = 1, y = 0},
    loc_txt = {
        name = 'Crimson Seal',
        text = {
            'Gain {C:mult}+#1#{} Mult',
            'permanently while',
            'held in hand'
        },
        label = 'Crimson Seal'
    },
    config = { extra = {
        mult = 2
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
    key = "aquaSeal",
    atlas = "Seals",
    pos = {x = 2, y = 0},
    loc_txt = {
        name = 'Aqua Seal',
        text = {
            'Gain {C:chips}+#1#{} Chips',
            'permanently while',
            'held in hand'
        },
        label = 'Aqua Seal'
    },
    config = { extra = {
        chips = 20
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