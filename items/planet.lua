--#region NEW PLANETS --
SMODS.Consumable{ --Titania
    key = 'titania',
    set = 'Planet',
    atlas = 'Planets',
    giga_data = {
        astral_variant = "c_giga_astral_titania"
    },
    pos = {x = 3, y = 2},
    cost = 3,
    config = {
        hand_type = 'giga_Linked Pairs'
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
		    chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
	    })
        level_up_hand(consum, ht, nil, 1)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_giga_moon'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}
SMODS.Consumable{ --Sylvia
    key = 'sylvia',
    set = 'Planet',
    atlas = 'Planets',
    giga_data = {
        astral_variant = "c_giga_astral_sylvia"
    },
    pos = {x = 1, y = 2},
    cost = 3,
    config = {
        extra = {
            hand_type1 = 'High Card',
            hand_type2 = 'Pair'
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type1].level,
                G.GAME.hands[card.ability.extra.hand_type2].level,
                localize(card.ability.extra.hand_type1, "poker_hands"),
                localize(card.ability.extra.hand_type2, "poker_hands"),
                colours = { (G.GAME.hands[card.ability.extra.hand_type1].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type1].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type1
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
		    chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
	    })
        level_up_hand(consum, ht, nil, 1)
        delay(0.5)
        ht = card.ability.extra.hand_type2
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
		    chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
	    })
        level_up_hand(consum, ht, nil, 1)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
    set_ability = function(self, card, initial, delay_sprites)
        if G.SETTINGS.paused then
            card.ability.extra.hand_type1 = 'High Card'
            card.ability.extra.hand_type2 = 'Pair'
        else
            local hands = {}
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v] and G.GAME.hands[v].visible then
                    hands[#hands+1] = v
                end
            end
            card.ability.extra.hand_type1 = pseudorandom_element(hands, pseudoseed('111111111111'))
            card.ability.extra.hand_type2 = pseudorandom_element(hands, pseudoseed('000000000000'))
            while card.ability.extra.hand_type2 == card.ability.extra.hand_type1 do
                card.ability.extra.hand_type2 = pseudorandom_element(hands, pseudoseed(pseudoseed('010101010101')))
            end
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_giga_asteroid'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
    end
}
--#endregion
--#region ASTRALS --
SMODS.Consumable{ --AstralMercury
    key = 'astral_mercury',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 3, y = 1},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Pair',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Mercury'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralVenus
    key = 'astral_venus',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 0, y = 1},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Three of a Kind',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Venus'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralEarth
    key = 'astral_earth',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 1, y = 1},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Full House',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Earth'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralMars
    key = 'astral_mars',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 5, y = 1},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Four of a Kind',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Mars'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralJupiter
    key = 'astral_jupiter',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 4, y = 1},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Flush',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Jupiter'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralSaturn
    key = 'astral_saturn',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 0, y = 0},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Straight',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Saturn'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralUranus
    key = 'astral_uranus',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 1, y = 0},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Two Pair',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Uranus'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralNeptune
    key = 'astral_neptune',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 2, y = 0},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Straight Flush',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Neptune'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralPluto
    key = 'astral_pluto',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 3, y = 0},
    cost = 3,
    config = {
        extra = {
            hand_type = 'High Card',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Pluto'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_dwarf_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralPlanetX
    key = 'astral_planetX',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 4, y = 0},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Five of a Kind',
            softlock = true,
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Planet X'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_planet_q'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralCeres
    key = 'astral_ceres',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 2, y = 1},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Flush House',
            softlock = true,
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Ceres'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_dwarf_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralEris
    key = 'astral_eris',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 5, y = 0},
    cost = 3,
    config = {
        extra = {
            hand_type = 'Flush Five',
            softlock = true,
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Eris'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_dwarf_planet'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralTitania
    key = 'astral_titania',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 4, y = 2},
    cost = 3,
    config = {
        extra = {
            hand_type = 'giga_Linked Pairs',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Titania'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.extra.hand_type].l_mult,
                G.GAME.hands[card.ability.extra.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.extra.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
		    handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
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
        badges[#badges+1] = create_badge(localize('k_giga_moon'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
SMODS.Consumable{ --AstralSylvia
    key = 'astral_sylvia',
    set = 'Planet',
    atlas = 'Planets',
    pos = {x = 2, y = 2},
    cost = 3,
    config = {
        extra = {
            hand_type1 = 'High Card',
            hand_type2 = 'Pair',
            amount = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Sylvia'}}
        end
        return {
            vars = {
                G.GAME.hands[card.ability.extra.hand_type1].level,
                G.GAME.hands[card.ability.extra.hand_type2].level,
                card.ability.extra.amount,
                localize(card.ability.extra.hand_type1, "poker_hands"),
                localize(card.ability.extra.hand_type2, "poker_hands"),
                colours = { (G.GAME.hands[card.ability.extra.hand_type1].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.extra.hand_type1].level)]) }
            }
        }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
		local consum = copier or card
		local ht = card.ability.extra.hand_type1
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(ht, "poker_hands"),
		    chips = G.GAME.hands[ht].chips,
		    mult = G.GAME.hands[ht].mult,
		    level = G.GAME.hands[ht].level,
	    })
        for i = 1, card.ability.extra.amount do
            level_up_hand(consum, ht, nil, 1)
        end
        delay(0.5)
        ht = card.ability.extra.hand_type2
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
			handname = localize(ht, "poker_hands"),
			chips = G.GAME.hands[ht].chips,
			mult = G.GAME.hands[ht].mult,
			level = G.GAME.hands[ht].level,
		})
        for i = 1, card.ability.extra.amount do
            level_up_hand(consum, ht, nil, 1)
        end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
    set_ability = function(self, card, initial, delay_sprites)
        if G.SETTINGS.paused then
            card.ability.extra.hand_type1 = 'High Card'
            card.ability.extra.hand_type2 = 'Pair'
        else
            local hands = {}
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v] and G.GAME.hands[v].visible then
                    hands[#hands+1] = v
                end
            end
            card.ability.extra.hand_type1 = pseudorandom_element(hands, pseudoseed('111111111111'))
            card.ability.extra.hand_type2 = pseudorandom_element(hands, pseudoseed('000000000000'))
            while card.ability.extra.hand_type2 == card.ability.extra.hand_type1 do
                card.ability.extra.hand_type2 = pseudorandom_element(hands, pseudoseed(pseudoseed('010101010101')))
            end
        end
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
        badges[#badges+1] = create_badge(localize('k_giga_asteroid'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Planet.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
--#endregion