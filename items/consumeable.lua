-- TAROTS --
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
        return{vars = {center.ability.extra.card, colours={HEX('F7070BFF')}}}
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

-- SPECTRALS --
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
            G.E_MANAGER:add_event(Event({
				func = function()
					selected_card:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					selected_card:set_seal("giga_pinkseal")
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
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
        for i, selected_card in pairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
				func = function()
					selected_card:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					selected_card:set_seal("giga_crimsonseal")
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
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
        for i, selected_card in pairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
				func = function()
					selected_card:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					selected_card:set_seal("giga_aquaseal")
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
    end
}