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
                if _card.config.center_key ~= 'c_base' then
                    local enh = check_upgrade(_card.config.center_key)
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
                    if check_upgrade(selected_card.config.center.key) then
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
    in_pool = function (self, args)
        for _, c in pairs(G.playing_cards or {}) do
            if c.config.center_key ~= 'c_base' then
                return true
            end
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            upgrade_enhencement(selected_card)
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
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_SEALS.giga_pinkseal
        return{vars = {colours={HEX('FF00E6')}, center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
			    return true
			end
		end
        return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            if selected_card:get_seal() == 'giga_pinkplus' then
                upgrade_seal_specific(selected_card, 'giga_pinkplus')
            else
                upgrade_seal_specific(selected_card, 'giga_pinkseal')
            end
		end
    end
}
SMODS.Consumable{ --Compass
    key = 'compass',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 2, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_SEALS.giga_crimsonseal
        return{vars = {colours={HEX('DC143C')}, center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
			    return true
			end
		end
        return false
    end,
    use = function (self,card,area,copier)
        for i, _card in pairs(G.hand.highlighted) do
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
                	_card:set_seal('giga_crimsonseal')
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
    end
}
SMODS.Consumable{ --Wand
    key = 'wand',
    set = 'Spectral',
    atlas = 'Consumeables',
    pos = {x = 3, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_SEALS.giga_aquaseal
        return{vars = {colours={HEX('00FFF0')}, center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
			    return true
			end
		end
        return false
    end,
    use = function (self,card,area,copier)
        for i, _card in pairs(G.hand.highlighted) do
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
                	_card:set_seal('giga_aquaseal')
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
        if G.hand then
            for i, _card in ipairs(G.hand.highlighted) do
                if _card:get_seal() ~= nil then
                    local sl = Giga.seal_upgrades[_card:get_seal()]
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
                    if Giga.seal_upgrades[selected_card:get_seal()] then
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
    in_pool = function (self, args)
        for _, c in pairs(G.playing_cards or {}) do
            if c:get_seal() ~= nil then
                return true
            end
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            upgrade_seal(selected_card)
		end
    end
}
--#endregion