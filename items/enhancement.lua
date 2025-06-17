SMODS.Enhancement({ --Soil
	key = "soil",
	atlas = "Enhancements",
	pos = { x = 0, y = 0 },
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	overrides_base_rank = false,
	any_suit = false,
	always_scores = false,
	weight = 0,
	config = { extra = { 
        chips = 1.1
    }},
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.chips}}
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				x_chips = card.ability.extra.chips,
			}
		end
	end
})

SMODS.Enhancement({ --RichSoil
	key = "richSoil",
	atlas = "Enhancements",
	pos = { x = 1, y = 0 },
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	overrides_base_rank = true,
	any_suit = false,
	always_scores = false,
	weight = 0,
    no_collection = true,
	config = { extra = { 
        chips = 1.5,
        mult = 7
    }},
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.chips, card.ability.extra.mult}}
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				x_chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
			}
		end
	end
})

SMODS.Enhancement({ --FossilSoil
	key = "fossilSoil",
	atlas = "Enhancements",
	pos = { x = 2, y = 0 },
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	overrides_base_rank = true,
	any_suit = false,
	always_scores = false,
	weight = 0,
    no_collection = true,
	config = { extra = { 
        chips = 2,
        mult = 1.5
    }},
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.chips, card.ability.extra.mult}}
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				x_chips = card.ability.extra.chips,
                x_mult = card.ability.extra.mult
			}
		end
	end
})