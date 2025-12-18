--#region Astrals --
SMODS.Consumable{ --AstralMercury
    key = 'astralMercury',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 3, y = 1},
    cost = 3,
    config = {
        hand_type = 'Pair',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Mercury'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Consumable{ --AstralVenus
    key = 'astralVenus',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 0, y = 1},
    cost = 3,
    config = {
        hand_type = 'Three of a Kind',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Venus'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Consumable{ --AstralEarth
    key = 'astralEarth',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 1, y = 1},
    cost = 3,
    config = {
        hand_type = 'Full House',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Earth'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Consumable{ --AstralMars
    key = 'astralMars',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 5, y = 1},
    cost = 3,
    config = {
        hand_type = 'Four of a Kind',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Mars'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Consumable{ --AstralJupiter
    key = 'astralJupiter',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 4, y = 1},
    cost = 3,
    config = {
        hand_type = 'Flush',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Jupiter'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Consumable{ --AstralSaturn
    key = 'astralSaturn',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 0, y = 0},
    cost = 3,
    config = {
        hand_type = 'Straight',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Saturn'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Consumable{ --AstralUranus
    key = 'astralUranus',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 1, y = 0},
    cost = 3,
    config = {
        hand_type = 'Two Pair',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Uranus'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Consumable{ --AstralNeptune
    key = 'astralNeptune',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 2, y = 0},
    cost = 3,
    config = {
        hand_type = 'Straight Flush',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Neptune'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end
}
SMODS.Consumable{ --AstralPluto
    key = 'astralPluto',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 3, y = 0},
    cost = 3,
    config = {
        hand_type = 'High Card',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Pluto'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}
SMODS.Consumable{ --AstralPlanetX
    key = 'astralPlanetX',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 4, y = 0},
    cost = 3,
    config = {
        hand_type = 'Five of a Kind',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Planet X'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_planet_q'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}
SMODS.Consumable{ --AstralCeres
    key = 'astralCeres',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 2, y = 1},
    cost = 3,
    config = {
        hand_type = 'Flush House',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Ceres'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}
SMODS.Consumable{ --AstralEris
    key = 'astralEris',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 5, y = 0},
    cost = 3,
    config = {
        hand_type = 'Flush Five',
        extra = {
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {'Eris'}}
        end
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
    end,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_dwarf_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}
--#endregion