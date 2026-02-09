SMODS.Consumable{ --Cook
    key = 'cook',
    set = 'Tarot',
    atlas = 'Consumeables',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 3,
    config = { extra = {
        card = 3
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'jogla_art_credit'}
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or (card.area == G.consumeables)
    end,
    use = function (self,card,area,copier)
        for i = 1, math.min(card.ability.extra.card, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        SMODS.add_card({ set = 'Giga_Food' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end
}
SMODS.Consumable{ --Gardener
    key = 'gardener',
    set = 'Tarot',
    atlas = 'Consumeables',
    pos = {x = 2, y = 1},
    rarity = 1,
    cost = 3,
    config = { max_highlighted = 2, mod_conv = 'm_giga_soil' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'jogla_art_credit'}
        info_queue[#info_queue+1] = G.P_CENTERS['m_giga_soil']
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --
    key = 'aTarot',
    set = 'Tarot',
    atlas = 'Consumeables',
    pos = {x = 2, y = 1},
    rarity = 1,
    cost = 3,
    config = { max_highlighted = 2, mod_conv = 'm_giga_potery' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS['m_giga_potery']
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --UpgradeTarot
    key = 'upgradeTarot',
    set = 'Tarot',
    atlas = 'Consumeables',
    pos = {x = 0, y = 1},
    rarity = 1,
    cost = 3,
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
                    Giga.upgrade_enhancement(selected_card)
                    return true
                end
            }))
		end
    end
}