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
            'A delicious Tacos that',
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
            'A delicious Guacamole that',
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
            'A delicious Hot-Dog that',
            'enhance {C:attention}#1#{} card',
            'into {C:dark_edition}Soil{}',
            '{s:0.5}"I wonder what could happen if its already soil"{}'
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
                local check = false
                for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_fossilSoil') then
                        check = true
                        break
                    end
                end
                if not check then
                    return true
                end
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

SMODS.Consumable{ --CaesarSalad
    key = 'caesarSalad',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 0},
    loc_txt = {
        name = 'Caesar Salad',
        text = {
            'A delicious Caesar Salad that',
            'will give a {C:tarot}Tarot{} in {C:attention}#1#{} rounds',
            '{C:inactive}#2#{}'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        round = 1,
        round_left = 1,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.round, center.ability.extra.txt}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards < G.consumeables.config.card_limit then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        local tarot = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'createTarot')
        if card.edition and card.edition.type == 'negative' then
            tarot:set_edition('e_negative', true)
        end
        tarot:add_to_deck()
        G.consumeables:emplace(tarot)
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards then
            card.ability.extra.txt = 'Ready'
        end
    end
}

SMODS.Consumable{ --ClubSandwich
    key = 'clubSandwich',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 0},
    loc_txt = {
        name = 'Club Sandwich',
        text = {
            'A delicious Club Sandwich that',
            'will give a {C:planet}Planet{} in {C:attention}#1#{} rounds',
            '{C:inactive}#2#{}'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        round = 1,
        round_left = 1,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.round, center.ability.extra.txt}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards < G.consumeables.config.card_limit then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        local planet = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'createPlanet')
        if card.edition and card.edition.type == 'negative' then
            planet:set_edition('e_negative', true)
        end
        planet:add_to_deck()
        G.consumeables:emplace(planet)
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards then
            card.ability.extra.txt = 'Ready'
        end
    end
}

SMODS.Consumable{ --Pho
    key = 'pho',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 0},
    loc_txt = {
        name = 'Pho',
        text = {
            'A delicious Pho that will give a',
            '{C:spectral}Spectral{} card in {C:attention}#1#{} rounds',
            '{C:inactive}#2#{}'
        }
    },
    rarity = 2,
    cost = 2,
    config = { extra = {
        round = 2,
        round_left = 2,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.round, center.ability.extra.txt}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards < G.consumeables.config.card_limit then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        local spectral = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'createSpectral')
        if card.edition and card.edition.type == 'negative' then
            spectral:set_edition('e_negative', true)
        end
        spectral:add_to_deck()
        G.consumeables:emplace(spectral)
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards then
            card.ability.extra.txt = 'Ready'
        end
    end
}

SMODS.Consumable{ --Spaghetti
    key = 'spaghetti',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = 'Spaghetti',
        text = {
            'A delicious Spaghetti that',
            'enhance {C:attention}#1#{} card',
            'into {C:dark_edition}Bonus{}'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
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
            selected_card:set_ability(G.P_CENTERS["m_bonus"])
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

SMODS.Consumable{ --Steak
    key = 'steak',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 1},
    loc_txt = {
        name = 'Steak',
        text = {
            'A delicious Steak that',
            'enhance {C:attention}#1#{} card',
            'into {C:dark_edition}Stone{}'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
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
            selected_card:set_ability(G.P_CENTERS["m_stone"])
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

SMODS.Consumable{ --BirthdayCake
    key = 'birthdayCake',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 2, y = 1},
    soul_pos = {x = 3, y = 1},
    loc_txt = {
        name = 'Birthday Cake',
        text = {
            'A delicious Birthday Cake that will',
            'permanently give you {C:attention}+#1#{} Consumable',
            'slot in {C:attention}#2#{} rounds',
            '{C:inactive}#3#{}'
        }
    },
    rarity = 4,
    hidden = true,
    cost = 4,
    config = { extra = {
        round = 1,
        round_left = 1,
        consumSlot = 1,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.consumSlot, center.ability.extra.round, center.ability.extra.txt}}
    end,
    can_use = function (self,card)
		if card.ability.extra.round_left <= 0 then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                return true
            end
        }))
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and #G.consumeables.cards then
            card.ability.extra.txt = 'Ready'
        end
    end
}