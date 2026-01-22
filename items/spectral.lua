--#region NORMAL --
SMODS.Consumable{ --Salt
    key = 'salt',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 1, y = 0},
    rarity = 1,
    config = { extra = { seal = 'giga_pinkseal' }, max_highlighted = 1 },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_SEALS.giga_pinkseal
        return{vars = {colours={HEX('FF00E6')}, center.ability.max_highlighted}}
    end,
    use = function (self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i, _c in pairs(G.hand.highlighted) do
                    _c:set_seal(card.ability.extra.seal, nil, true)
                end
                return true
            end
        }))
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}
SMODS.Consumable{ --Compass
    key = 'compass',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 2, y = 0},
    rarity = 1,
    config = { extra = { seal = 'giga_crimsonseal' }, max_highlighted = 2 },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_SEALS.giga_crimsonseal
        return{vars = {colours={HEX('DC143C')}, center.ability.max_highlighted}}
    end,
    use = function (self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i, _c in pairs(G.hand.highlighted) do
                    _c:set_seal(card.ability.extra.seal, nil, true)
                end
                return true
            end
        }))
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}
SMODS.Consumable{ --Wand
    key = 'wand',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 3, y = 0},
    rarity = 1,
    config = { extra = { seal = 'giga_aquaseal' }, max_highlighted = 1 },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_SEALS.giga_aquaseal
        return{vars = {colours={HEX('00FFF0')}, center.ability.max_highlighted}}
    end,
    use = function (self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i, _c in pairs(G.hand.highlighted) do
                    _c:set_seal(card.ability.extra.seal, nil, true)
                end
                return true
            end
        }))
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}
SMODS.Consumable{ --Firefly
    key = 'firefly',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 3, y = 1},
    rarity = 1,
    config = { max_highlighted = 2 },
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.max_highlighted}}
    end,
    use = function (self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i, _c in pairs(G.hand.highlighted) do
                    Giga.set_overcharge(_c, Giga.POOLS.Overcharges[math.random(#Giga.POOLS.Overcharges)])
                end
                return true
            end
        }))
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}
SMODS.Consumable{ --UpgradeSpectral
    key = 'upgradeSpectral',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 1, y = 1},
    rarity = 1,
    config = { extra = {
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'jogla_art_credit'}
        if G.hand then
            for i, _card in ipairs(G.hand.highlighted) do
                if _card:get_seal() ~= nil and G.P_SEALS[_card:get_seal()].giga_data then
                    local sl = G.P_SEALS[_card:get_seal()].giga_data.seal_upgrade
                    local duplicate = false
                    for _, v in ipairs(info_queue) do
                        if v == G.P_SEALS[sl] then
                            duplicate = true
                            break
                        end
                    end
                    if G.P_SEALS[sl] and not duplicate then
                        info_queue[#info_queue+1] = G.P_SEALS[sl]
                    end
                end
            end
        end
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
                local has_seal = false
				for i, selected_card in pairs(G.hand.highlighted) do
                    if selected_card:get_seal() and G.P_SEALS[selected_card:get_seal()].giga_data and
                    G.P_SEALS[selected_card:get_seal()].giga_data.seal_upgrade then
                        has_seal = true
                    else
                        has_seal = false
                        break
                    end
		        end
                if has_seal then
                    return true
                end
			end
		end
		return false
    end,
    in_pool = function (self)
        for _, c in pairs(G.playing_cards or {}) do
            if c:get_seal() ~= nil and G.P_SEALS[c:get_seal()].giga_data and G.P_SEALS[c:get_seal()].giga_data.seal_upgrade then
                return true
            end
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
            	func = function()
                	Giga.upgrade_seal(selected_card)
                	return true
            	end
            }))
		end
    end
}
--#endregion
--#region ASTRALS --
SMODS.Consumable {
    key = 'astral_blackHole',
    set = 'Spectral',
    atlas = 'Planets',
    pos = {x = 0, y = 2},
    config = {
        extra = {
            amount = 2
        }
    },
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_astral_chance', vars = {Giga.config.astral_chance[1] / Giga.config.astral_chance[2] * 100, 'Black Hole'}}
        end
        return{vars = {card.ability.extra.amount}}
    end,
    use = function(self, card, area, copier)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' }
        )
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        delay(0.5)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..card.ability.extra.amount })
        delay(1.2)
        for i = 1, card.ability.extra.amount do
            for poker_hand_key, _ in pairs(G.GAME.hands) do
                SMODS.smart_level_up_hand(card, poker_hand_key, true)
            end
        end
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' }
        )
    end,
    in_pool = function(self)
        return false
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_spectral'), get_type_colour(card.config.center or card.config, card), SMODS.ConsumableTypes.Spectral.text_colour, 1.2)
        badges[#badges+1] = create_badge(localize('k_giga_astrals_badge'), {0.2078, 0.2588, 0.2706, 1}, {1, 0.7882, 0.0549, 1}, 1.1)
    end
}
--#endregion