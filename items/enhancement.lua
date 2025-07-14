SMODS.Enhancement{ --Soil
	key = "soil",
	atlas = "Enhancements",
	pos = { x = 0, y = 0 },
	discovered = true,
	unlocked = true,
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
}

SMODS.Enhancement{ --RichSoil
	key = "richSoil",
	atlas = "Enhancements",
	pos = { x = 1, y = 0 },
	discovered = true,
	unlocked = true,
	weight = 0,
    no_collection = true,
	config = { extra = { 
        chips = 1.5,
        mult = 7
    }},
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.chips, card.ability.extra.mult}}
	end,
	in_pool = function(self) 
		return false 
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				x_chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
			}
		end
	end
}

SMODS.Enhancement{ --FossilSoil
	key = "fossilSoil",
	atlas = "Enhancements",
	pos = { x = 2, y = 0 },
	discovered = true,
	unlocked = true,
	weight = 0,
    no_collection = true,
	config = { extra = { 
        chips = 2,
        mult = 1.5
    }},
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.chips, card.ability.extra.mult}}
	end,
	in_pool = function(self) 
		return false 
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				x_chips = card.ability.extra.chips,
                x_mult = card.ability.extra.mult
			}
		end
	end
}

SMODS.Enhancement{ --BigBonus
	key = "bigBonus",
	atlas = "Enhancements",
	pos = { x = 3, y = 0 },
	discovered = true,
	unlocked = true,
	weight = 0,
	always_scores = true,
	config = { extra = { 
        chips = 60,
    }},
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.chips}}
	end,
	in_pool = function(self) 
		return false 
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				chips = card.ability.extra.chips,
			}
		end
	end
}

SMODS.Enhancement{ --PolishStone
	key = "polishStone",
	atlas = "Enhancements",
	pos = { x = 4, y = 0 },
	discovered = true,
	unlocked = true,
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	weight = 0,
	config = { extra = { 
        chips = 15,
		xchips = 1.4
    }},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips, card.ability.extra.xchips}}
	end,
	in_pool = function(self) 
		return false 
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				chips = card.ability.extra.chips,
				x_chips = card.ability.extra.xchips
			}
		end
	end
}

SMODS.Enhancement{ --MultPlus
	key = 'multPlus',
	atlas = "Enhancements",
	pos = { x = 5, y = 0 },
	discovered = true,
	unlocked = true,
	always_scores = true,
	weight = 0,
	config = { extra = { 
        mult = 8
    }},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult}}
	end,
	in_pool = function(self) 
		return false 
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				mult = card.ability.extra.mult,
			}
		end
	end
}