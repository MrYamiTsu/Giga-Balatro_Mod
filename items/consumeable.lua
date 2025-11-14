--#region TAROTS --
SMODS.Consumable{ --Cook
    key = 'cook',
    set = 'Tarot',
    atlas = 'Consumeables',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 3
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'jogla_art_credit'}
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		return true
    end,
    use = function (self,card,area,copier)
        for i = 1, card.ability.extra.card, 1 do
            _create(card, 'Giga_Food', G.consumeables,true,true)
            delay(0.4)
		end
    end
}
SMODS.Consumable{ --Gardener
    key = 'gardener',
    set = 'Tarot',
    atlas = 'Consumeables',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 2, mod_conv = 'm_giga_soil' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS['m_giga_soil']
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --UpgradeTarot
    key = 'upgradeTarot',
    set = 'Tarot',
    atlas = 'Consumeables',
    pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        if G.hand then
            for i, _card in ipairs(G.hand.highlighted) do
                if _card.config.center_key ~= 'c_base' and G.P_CENTERS[_card.config.center_key].giga_data then
                    local enh = G.P_CENTERS[_card.config.center_key].giga_data.enh_upgrade
                    local duplicate = false
                    for _, v in ipairs(info_queue) do
                        if v == G.P_CENTERS[enh] then
                            duplicate = true
                            break
                        end
                    end
                    if G.P_CENTERS[enh] and not duplicate then
                        info_queue[#info_queue+1] = G.P_CENTERS[enh]
                    end
                end
            end
        end
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
                local has_enhancement = false
				for i, selected_card in pairs(G.hand.highlighted) do
                    if selected_card.config.center_key and G.P_CENTERS[selected_card.config.center_key].giga_data and
                       G.P_CENTERS[selected_card.config.center_key].giga_data.enh_upgrade then
                        has_enhancement = true
                    else
                        has_enhancement = false
                        break
                    end
		        end
                if has_enhancement then
                    return true
                end
			end
		end
		return false
    end,
    in_pool = function (self)
        for _, c in pairs(G.playing_cards or {}) do
            if c.config.center_key ~= nil and G.P_CENTERS[c.config.center_key].giga_data and
               G.P_CENTERS[c.config.center_key].giga_data.enh_upgrade then
                return true
            end
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
                func = function ()
                    upgrade_enhencement(selected_card)
                    return true
                end
            }))
		end
    end
}
--#endregion
--#region SPECTRALS --
SMODS.Consumable{ --Salt
    key = 'salt',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 1, y = 0},
    rarity = 1,
    cost = 2,
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
    cost = 2,
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
    cost = 2,
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
SMODS.Consumable{ --UpgradeSpectral
    key = 'upgradeSpectral',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 1, y = 1},
    rarity = 1,
    cost = 2,
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
                	upgrade_seal(selected_card)
                	return true
            	end
            }))
		end
    end
}
--#endregion