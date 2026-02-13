--#region UPGRADED VANILLA --
SMODS.Enhancement{ --BigBonus
	key = "bigBonus",
	atlas = "Enhancements",
	giga_data = {
		is_upgraded = true
	},
	pos = { x = 3, y = 0 },
	discovered = true,
	unlocked = true,
	weight = 0,
	always_scores = true,
	config = { bonus = 75 },
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
	giga_data = {
		is_upgraded = true
	},
	pos = { x = 5, y = 0 },
	discovered = true,
	unlocked = true,
	always_scores = true,
	weight = 0,
	config = { mult = 10 },
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
	giga_data = {
		is_upgraded = true
	},
	pos = { x = 4, y = 1 },
	discovered = true,
	unlocked = true,
	any_suit = true,
	weight = 0,
	config = { extra = {
		chipsAdd = 20,
		multAdd = 2,
		chips = 0,
		mult = 0
	}},
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.multAdd, card.ability.extra.chipsAdd}}
	end,
	in_pool = function(self)
		return false
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.chips =  card.ability.extra.chips + card.ability.extra.chipsAdd
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multAdd
			return {
				card = card,
				message = 'Evolved !',
				color = G.C.MULT,
			}
		end
		if context.main_scoring and context.cardarea == G.play then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips
			}
		end
	end
}
SMODS.Enhancement{ --ReinforcedGlass
    key = 'reinforcedGlass',
	atlas = "Enhancements",
	giga_data = {
		is_upgraded = true
	},
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
           SMODS.pseudorandom_probability(card, 'giga_reinforcedGlass', card.ability.extra.odds, card.ability.extra.chances) then
            card.glass_trigger = true
            return {
				func = function()
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    	G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
	                    G.E_MANAGER:add_event(Event({
    	                    func = function ()
        	                    SMODS.add_card({set = 'Spectral'})
            	                G.GAME.consumeable_buffer = 0
                	            return true
                    	    end
	                    }))
    	                SMODS.calculate_effect({ message = localize("k_plus_spectral"), colour = G.C.PURPLE }, card)
        	        end
					return true
				end,
				remove = true
			}
        end
    end
}
SMODS.Enhancement{ --Titanium
	key = 'titanium',
	atlas = "Enhancements",
	giga_data = {
		is_upgraded = true
	},
	pos = { x = 3, y = 1 },
	discovered = true,
	unlocked = true,
	always_scores = true,
	weight = 0,
	config = { extra = {
		mult_mod = 0.05
    }, h_x_mult = 2 },
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
	giga_data = {
		is_upgraded = true
	},
	pos = { x = 4, y = 0 },
	discovered = true,
	unlocked = true,
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	weight = 0,
	config = { bonus = 35, x_chips = 1.5 },
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
	giga_data = {
		is_upgraded = true
	},
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
	giga_data = {
		is_upgraded = true
	},
	pos = { x = 0, y = 1 },
	discovered = true,
	unlocked = true,
	weight = 0,
	config = { extra = { 
		odds = 1,
		chances1 = 3,
		chances2 = 9,
		chances3 = 12,
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
				card.lucky_trigger = true
                effects.mult = card.ability.extra.mult
            end
			if SMODS.pseudorandom_probability(card, 'giga_luckiest2', card.ability.extra.odds, card.ability.extra.chances2, 'luckiest_prob2') then
                card.lucky_trigger = true
                effects.dollars = card.ability.extra.cash
            end
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and
			   SMODS.pseudorandom_probability(card, 'giga_luckiest2', card.ability.extra.odds, card.ability.extra.chances3, 'luckiest_prob3') then
				card.lucky_trigger = true
				effects.func = function()
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({set = 'Giga_Food'})
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
				end
				effects.message = '+1 Food'
				effects.colour = HEX('F2A5A6FF')
			end
            G.E_MANAGER:add_event(Event({
               func = function()
                   card.lucky_trigger = nil
                   return true
               end
			}))
            return effects
		end
	end
}
--#endregion
--#region NEW --
SMODS.Enhancement{ --Soil
	key = "soil",
	atlas = "Enhancements",
	fg_data = {
  		base_enhancement = true
	},
	giga_data = {
		enh_upgrade = "m_giga_richSoil"
	},
	pos = { x = 0, y = 0 },
	unlocked = true,
	discovered = true,
	config = { x_chips = 1.1 },
	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.x_chips}}
	end
}
SMODS.Enhancement{ --RichSoil
	key = "richSoil",
	atlas = "Enhancements",
	giga_data = {
		is_upgraded = true,
		enh_upgrade = "m_giga_fossilSoil"
	},
	pos = { x = 1, y = 0 },
	unlocked = true,
	discovered = true,
	weight = 0,
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
	giga_data = {
		is_upgraded = true
	},
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
	end
}
SMODS.Enhancement{ --Potery
	key = "potery",
	atlas = "Enhancements",
	fg_data = {
  		base_enhancement = true
	},
	giga_data = {
		enh_upgrade = "m_giga_engravedPotery"
	},
	pos = { x = 5, y = 1 },
	unlocked = true,
	discovered = true,
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	config = { extra = {
		odds = 1,
		chances = 2
	}, bonus = 20},
	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances, 'prob')
		return {vars = {card.ability.bonus, numerator, denominator}}
	end,
	calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
           SMODS.pseudorandom_probability(card, 'giga_potery', card.ability.extra.odds, card.ability.extra.chances) then
            return {
				func = function()
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    	G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
	                    G.E_MANAGER:add_event(Event({
    	                    func = function ()
        	                    SMODS.add_card({set = 'Giga_Artefact'})
            	                G.GAME.consumeable_buffer = 0
                	            return true
                    	    end
	                    }))
    	                SMODS.calculate_effect({ message = localize("k_plus_artefact"), colour = HEX('444444FF') }, card)
        	        end
					return true
				end,
				remove = true
			}
        end
    end
}
SMODS.Enhancement{ --EngravedPotery
	key = "engravedPotery",
	atlas = "Enhancements",
	giga_data = {
		is_upgraded = true
	},
	pos = { x = 5, y = 1 },
	unlocked = true,
	discovered = true,
	replace_base_card = true,
	no_rank = true,
	no_suit = true,
	always_scores = true,
	config = { extra = {
		odds = 1,
		chances = 6
	}, bonus = 40},
	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances, 'prob')
		return {vars = {card.ability.bonus, numerator, denominator}}
	end,
	calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
           SMODS.pseudorandom_probability(card, 'giga_enpotery', card.ability.extra.odds, card.ability.extra.chances) then
            return {
				remove = true
			}
        end
		if context.final_scoring_step and context.cardarea == G.play then
			return {
				func = function()
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    	G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
	                    G.E_MANAGER:add_event(Event({
    	                    func = function ()
        	                    SMODS.add_card({set = 'Giga_Artefact'})
            	                G.GAME.consumeable_buffer = 0
                	            return true
                    	    end
	                    }))
    	                SMODS.calculate_effect({ message = localize("k_plus_artefact"), colour = HEX('444444FF') }, card)
        	        end
					return true
				end
			}
		end
    end,
	in_pool = function(self)
		return false
	end
}
--#endregion