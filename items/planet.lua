SMODS.Consumable{ --AstralMercury
    key = 'astralMercury',
    set = 'Planet',
    atlas = 'Consumeables',
    pos = {x = 3, y = 1},
    cost = 3,
    config = {
        hand_type = 'Pair',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.hand_type
        for i = 1, card.ability.extra.amount do
            update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			    handname = localize(ht, "poker_hands"),
			    chips = G.GAME.hands[ht].chips,
			    mult = G.GAME.hands[ht].mult,
			    level = G.GAME.hands[ht].level,
		    })
            level_up_hand(consum, ht, nil, 1)
        end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
    in_pool = function(self)
        return false
    end
}
SMODS.Consumable{ --AstralJupiter
    key = 'astralJupiter',
    set = 'Planet',
    atlas = 'Consumeables',
    pos = {x = 4, y = 1},
    cost = 3,
    config = {
        hand_type = 'Flush',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.hand_type
        for i = 1, card.ability.extra.amount do
            update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			    handname = localize(ht, "poker_hands"),
			    chips = G.GAME.hands[ht].chips,
			    mult = G.GAME.hands[ht].mult,
			    level = G.GAME.hands[ht].level,
		    })
            level_up_hand(consum, ht, nil, 1)
        end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
    in_pool = function(self)
        return false
    end
}
SMODS.Consumable{ --AstralPluto
    key = 'astralPluto',
    set = 'Planet',
    atlas = 'Consumeables',
    pos = {x = 4, y = 0},
    cost = 3,
    config = {
        hand_type = 'High Card',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.hand_type
        for i = 1, card.ability.extra.amount do
            update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			    handname = localize(ht, "poker_hands"),
			    chips = G.GAME.hands[ht].chips,
			    mult = G.GAME.hands[ht].mult,
			    level = G.GAME.hands[ht].level,
		    })
            level_up_hand(consum, ht, nil, 1)
        end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
    in_pool = function(self)
        return false
    end
}
SMODS.Consumable{ --AstralEris
    key = 'astralEris',
    set = 'Planet',
    atlas = 'Consumeables',
    pos = {x = 6, y = 0},
    cost = 3,
    config = {
        hand_type = 'Flush Five',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.hand_type
        for i = 1, card.ability.extra.amount do
            update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			    handname = localize(ht, "poker_hands"),
			    chips = G.GAME.hands[ht].chips,
			    mult = G.GAME.hands[ht].mult,
			    level = G.GAME.hands[ht].level,
		    })
            level_up_hand(consum, ht, nil, 1)
        end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
    in_pool = function(self)
        return false
    end
}
SMODS.Consumable{ --AstralPlanetX
    key = 'astralPlanetX',
    set = 'Planet',
    atlas = 'Consumeables',
    pos = {x = 5, y = 0},
    cost = 3,
    config = {
        hand_type = 'Five of a Kind',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.hand_type
        for i = 1, card.ability.extra.amount do
            update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			    handname = localize(ht, "poker_hands"),
			    chips = G.GAME.hands[ht].chips,
			    mult = G.GAME.hands[ht].mult,
			    level = G.GAME.hands[ht].level,
		    })
            level_up_hand(consum, ht, nil, 1)
        end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
    in_pool = function(self)
        return false
    end
}