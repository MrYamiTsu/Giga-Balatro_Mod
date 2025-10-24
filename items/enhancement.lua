--#region UPGRADED VANILLA --
SMODS.Enhancement{ --BigBonus
	key = "bigBonus",
	atlas = "Enhancements",
	pos = { x = 3, y = 0 },
	discovered = true,
	unlocked = true,
	weight = 0,
	always_scores = true,
	config = { bonus = 60 },
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.bonus}}
	end,
	in_pool = function(self) 
		return false 
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
	config = { mult = 8},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.mult}}
	end,
	in_pool = function(self) 
		return false 
	end
}
SMODS.Enhancement{ --EvolvedWild
	key = 'evolvedWild',
	atlas = "Enhancements",
	pos = { x = 4, y = 1 },
	discovered = true,
	unlocked = true,
	any_suit = true,
	weight = 0,
	config = { extra = { 
		chipsAdd = 20,
		multAdd = 2,
	}, bonus = 0, mult = 0},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.bonus, card.ability.mult, card.ability.extra.chipsAdd, card.ability.extra.multAdd}}
	end,
	in_pool = function(self) 
		return false
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.bonus = card.ability.bonus + card.ability.extra.chipsAdd
			card.ability.mult = card.ability.mult + card.ability.extra.multAdd
		end
	end
}
SMODS.Enhancement { --ReinforcedGlass
    key = 'reinforcedGlass',
	atlas = "Enhancements",
    pos = { x = 2, y = 1 },
	discovered = true,
	unlocked = true,
    config = { extra = {
		odds = 1,
		chances = 7
	}, x_mult = 3},
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances, 'prob')
        return { vars = { card.ability.x_mult, numerator, denominator } }
    end,
	in_pool = function(self) 
		return false 
	end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'giga_reinforcedGlass', card.ability.extra.odds, card.ability.extra.chances, 'rg_prob') then
            card.glass_trigger = true 
			_create(card,'Spectral',G.consumeables,true,true)
            return { 
				remove = true,
			}
        end
    end,
}
SMODS.Enhancement{ --Titanium
	key = 'titanium',
	atlas = "Enhancements",
	pos = { x = 3, y = 1 },
	discovered = true,
	unlocked = true,
	always_scores = true,
	weight = 0,
	config = { extra = {
		mult_mod = 0.05
    }, h_x_mult = 1.75 },
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.h_x_mult, card.ability.extra.mult_mod}}
	end,
	in_pool = function(self) 
		return false 
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step and context.cardarea == G.play then
			card.ability.h_x_mult = card.ability.h_x_mult + card.ability.extra.mult_mod
			return {
				card = card,
				message = 'Upgraded !',
				color = G.C.FLITER,
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
	config = { bonus = 40, x_chips = 1.4 },
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.bonus, card.ability.x_chips}}
	end,
	in_pool = function(self) 
		return false 
	end,
}
SMODS.Enhancement{ --PerfectGold
	key = 'perfectGold',
	atlas = "Enhancements",
	pos = { x = 1, y = 1 },
	discovered = true,
	unlocked = true,
	always_scores = true,
	weight = 0,
	config = { extra = { 
		cash_mod = 1
    }, h_dollars = 5 },
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.h_dollars, card.ability.extra.cash_mod}}
	end,
	in_pool = function(self) 
		return false 
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step and context.cardarea == G.play then
			card.ability.h_dollars = card.ability.h_dollars + card.ability.extra.cash_mod
			return {
				card = card,
				message = 'Upgraded !',
				color = G.C.MONEY,
			}
		end
	end
}
SMODS.Enhancement{ --Luckiest
	key = 'luckiest',
	atlas = "Enhancements",
	pos = { x = 0, y = 1 },
	discovered = true,
	unlocked = true,
	weight = 0,
	config = { extra = { 
		odds = 1,
		chances1 = 3,
		chances2 = 7,
		chances3 = 10,
		mult = 20,
		cash = 20,
		card = 1
	}},
	loc_vars = function(self, info_queue, card)
		local odds1, chances1 = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances1, 'prob1')
		local odds2, chances2 = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances2, 'prob2')
		local odds3, chances3 = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances3, 'prob3')
		return {vars = {odds1, chances1, card.ability.extra.mult, 
						odds2, chances2, card.ability.extra.cash, 
						odds3, chances3, card.ability.extra.card}}
	end,
	in_pool = function(self) 
		return false 
	end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
            local effects = {}
            if SMODS.pseudorandom_probability(card, 'giga_luckiest1', card.ability.extra.odds, card.ability.extra.chances1, 'luckiest_prob1') then
                table.insert(effects, {
                    mult = card.ability.extra.mult,
                    delay = 0.6
                })
            end
			if SMODS.pseudorandom_probability(card, 'giga_luckiest2', card.ability.extra.odds, card.ability.extra.chances2, 'luckiest_prob2') then
                table.insert(effects, {
                    dollars = card.ability.extra.cash,
                    delay = 0.6
                })
            end
			if SMODS.pseudorandom_probability(card, 'giga_luckiest2', card.ability.extra.odds, card.ability.extra.chances3, 'luckiest_prob3') then
				table.insert(effects, { 
					func = function() 
						_create(card, 'Giga_Food', G.consumeables,true,true)
            			delay(0.4)
					end,
					message = 'Create !',
                	colour = G.C.MONEY,
					delay = 0.6
				})
			end
            if #effects > 0 then
                return SMODS.merge_effects(effects)
            end
		end
	end
}
--#endregion
--#region NEW --
SMODS.Enhancement{ --Soil
	key = "soil",
	atlas = "Enhancements",
	pos = { x = 0, y = 0 },
	unlocked = true,
	discovered = true,
	config = { x_chips = 1.1 },
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.x_chips}}
	end,
}
SMODS.Enhancement{ --RichSoil
	key = "richSoil",
	atlas = "Enhancements",
	pos = { x = 1, y = 0 },
	unlocked = true,
	discovered = true,
	weight = 0,
    no_collection = true,
	config = { x_chips = 1.5, mult = 7 },
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.x_chips, card.ability.mult}}
	end,
	in_pool = function(self) 
		return false 
	end,
}
SMODS.Enhancement{ --FossilSoil
	key = "fossilSoil",
	atlas = "Enhancements",
	pos = { x = 2, y = 0 },
	unlocked = true,
	discovered = true,
	weight = 0,
    no_collection = true,
	config = { x_chips = 2, x_mult = 1.5 },
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.x_chips, card.ability.x_mult}}
	end,
	in_pool = function(self) 
		return false 
	end,
}
--#endregion