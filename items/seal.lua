-- FOOD SEAL --
SMODS.Seal { --Pink
    key = 'pinkSeal',
    atlas = "Seals",
    pos = { x = 0, y = 0 },
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
                if #G.consumeables.cards - 1 < G.consumeables.config.card_limit then
                    _create(card, 'Giga_Food', G.consumeables,true,true)
                else
                    break
                end
		    end
        end
    end,
    badge_colour = HEX("FF00E6")
}

-- NORMAL SEAL --
SMODS.Seal { --PermaMult
    key = "permaMultSeal",
    atlas = "Seals",
    pos = {x= 1, y= 0},
    loc_txt = {
        name = 'Perma-Mult Seal',
        text = {
            'Gain {C:mult}+#1#{} Mult',
            'permanently while',
            'held in hand'
        },
        label = 'Perma-Mult Seal'
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
    badge_colour = HEX("ED1C24"),
}