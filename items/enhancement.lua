SMODS.Enhancement({
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
	config = { extra = { chips = 1.1} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips} }
	end,
	calculate = function(self, card, context, effect)
		if context.main_scoring and context.cardarea == G.play then
			return {
				x_chips = card.ability.extra.chips,
			}
		end
	end
})