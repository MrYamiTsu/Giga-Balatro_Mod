SMODS.ConsumableType{
    key = 'food',
    primary_colour = HEX("F7070BFF"),
    secondary_colour = HEX("F2A5A6FF"),
    loc_txt = {
        collection = 'Food Cards',
        name = 'Food'
    },
    collection_rows = {5,6},
    shop_rate = 0
}

SMODS.Consumable{ --Tacos
    key = 'tacos',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    loc_txt = {
        name = 'Tacos',
        text = {
            'A delicious tacos that',
            'gives you {C:money}$#1#{}'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        money = 3
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.money}}
    end,
    can_use = function (self,card)
        return true
    end,
    use = function (self,card,area,copier)
        SMODS.calculate_effect({dollars = card.ability.extra.money}, card)
    end
}

SMODS.Consumable{ --Guacamole
    key = 'guacamole',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 0},
    loc_txt = {
        name = 'Guacamole',
        text = {
            'A delicious guacamole that',
            'makes you draw {C:attention}#1#{} card',
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                for i = 1, card.ability.extra.card do
                    draw_card(G.deck, G.hand, i * 100 / 2, 'up', true)
                end
                return true
            end
        }))
    end
}

SMODS.Consumable{ --HotDog
    key = 'hotDog',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 0},
    loc_txt = {
        name = 'Hot-Dog',
        text = {
            'A delicious hot-dog that',
            'enhance {C:attention}#1#{} card',
            'into {C:dark_edition}Soil{}',
            '{s:0.4}"I wonder what could happen if it is already soil"{}'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'soil_def'}
        return{vars = {center.ability.extra.card}}
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
            if SMODS.has_enhancement(selected_card, 'm_giga_richSoil') then
                selected_card:set_ability(G.P_CENTERS["m_giga_fossilSoil"])
            elseif SMODS.has_enhancement(selected_card, 'm_giga_soil') then
                selected_card:set_ability(G.P_CENTERS["m_giga_richSoil"])
            else
                selected_card:set_ability(G.P_CENTERS["m_giga_soil"])
            end
            G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
			delay(0.5)
		end
    end
}