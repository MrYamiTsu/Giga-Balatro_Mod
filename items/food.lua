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
            'into {C:dark_edition}Soil{} card',
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
            'into {C:dark_edition}Bonus{} card'
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
				local check = false
                for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_bigBonus') then
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
            if SMODS.has_enhancement(selected_card, 'm_bonus') then
                selected_card:set_ability(G.P_CENTERS["m_giga_bigBonus"])
            else
                selected_card:set_ability(G.P_CENTERS["m_bonus"])
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

SMODS.Consumable{ --Steak
    key = 'steak',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = 'Steak',
        text = {
            'A delicious Steak that',
            'enhance {C:attention}#1#{} card',
            'into {C:dark_edition}Stone{} card'
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
				local check = false
                for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_polishStone') then
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
            if SMODS.has_enhancement(selected_card, 'm_stone') then
                selected_card:set_ability(G.P_CENTERS["m_giga_polishStone"])
            else
                selected_card:set_ability(G.P_CENTERS["m_stone"])
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

SMODS.Consumable{ --Sushis
    key = 'sushis',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = 'Sushis',
        text = {
            'Some delicious Sushis that',
            'enhance {C:attention}#1#{} card',
            'into a {C:dark_edition}Mult{} card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				local check = false
                for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_multPlus') then
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
            if SMODS.has_enhancement(selected_card, 'm_mult') then
                selected_card:set_ability(G.P_CENTERS["m_giga_multPlus"])
            else
                selected_card:set_ability(G.P_CENTERS["m_mult"])
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

SMODS.Consumable{ --SugarPie
    key = 'sugarPie',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = 'Sugar Pie',
        text = {
            'A delicious Sugar Pie that',
            'enhance {C:attention}#1#{} card',
            'into a {C:dark_edition}Lucky{} card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_luckiest') then
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
            if SMODS.has_enhancement(selected_card, 'm_lucky') then
                selected_card:set_ability(G.P_CENTERS["m_giga_luckiest"])
            else
                selected_card:set_ability(G.P_CENTERS["m_lucky"])
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

SMODS.Consumable{ --[Untitled2]
    key = '[Untitled2]',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = '[Untitled]',
        text = {
            'Some delicious [Untitled] that',
            'enhance {C:attention}#1#{} card',
            'into a {C:dark_edition}Glass{} card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
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
            selected_card:set_ability(G.P_CENTERS["m_glass"])
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

SMODS.Consumable{ --[Untitled3]
    key = '[Untitled3]',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = '[Untitled]',
        text = {
            'Some delicious [Untitled] that',
            'enhance {C:attention}#1#{} card',
            'into a {C:dark_edition}Gold{} card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_perfectGold') then
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
            if SMODS.has_enhancement(selected_card, 'm_lucky') then
                selected_card:set_ability(G.P_CENTERS["m_giga_perfectGold"])
            else
                selected_card:set_ability(G.P_CENTERS["m_gold"])
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

SMODS.Consumable{ --[Untitled4]
    key = '[Untitled4]',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = '[Untitled]',
        text = {
            'Some delicious [Untitled] that',
            'enhance {C:attention}#1#{} card',
            'into a {C:dark_edition}Wild{} card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
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
            selected_card:set_ability(G.P_CENTERS["m_wild"])
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

SMODS.Consumable{ --Lollipop
    key = 'lollipop',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 1},
    loc_txt = {
        name = 'Lollipop',
        text = {
            'A delicious Lollipop that',
            'enhance {C:attention}#1#{} card',
            'into a {C:dark_edition}Steel{} card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
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
            selected_card:set_ability(G.P_CENTERS["m_steel"])
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

SMODS.Consumable{ --[Untitled5]
    key = '[Untitled5]',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = '[Untitled]',
        text = {
            'Some delicious [Untitled] that',
            'create {C:attention}#1#{} random',
            '{C:hearts}Heart{} suit card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		return true
    end,
    use = function (self,card,area,copier)
        local rank = pseudorandom_element({'2','3','4','5','6','7','8','9','10','J','Q','K','A'}, pseudoseed('giga_[Untitiled5]'))
		local card = create_playing_card({
		    front = G.P_CARDS['H_'..rank],
		}, G.hand, false,false,nil)
		card:add_to_deck()
    end
}

SMODS.Consumable{ --[Untitled6]
    key = '[Untitled6]',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = '[Untitled]',
        text = {
            'Some delicious [Untitled] that',
            'create {C:attention}#1#{} random',
            '{C:spades}Spade{} suit card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		return true
    end,
    use = function (self,card,area,copier)
        local rank = pseudorandom_element({'2','3','4','5','6','7','8','9','10','J','Q','K','A'}, pseudoseed('giga_[Untitiled6]'))
		local card = create_playing_card({
		    front = G.P_CARDS['S_'..rank],
		}, G.hand, false,false,nil)
		card:add_to_deck()
    end
}

SMODS.Consumable{ --[Untitled7]
    key = '[Untitled7]',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = '[Untitled]',
        text = {
            'Some delicious [Untitled] that',
            'create {C:attention}#1#{} random',
            '{C:diamonds}Diamond{} suit card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		return true
    end,
    use = function (self,card,area,copier)
        local rank = pseudorandom_element({'2','3','4','5','6','7','8','9','10','J','Q','K','A'}, pseudoseed('giga_[Untitiled7]'))
		local card = create_playing_card({
		    front = G.P_CARDS['D_'..rank],
		}, G.hand, false,false,nil)
		card:add_to_deck()
    end
}

SMODS.Consumable{ --[Untitled8]
    key = '[Untitled8]',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = '[Untitled]',
        text = {
            'Some delicious [Untitled] that',
            'create {C:attention}#1#{} random',
            '{C:clubs}Club{} suit card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		return true
    end,
    use = function (self,card,area,copier)
        local rank = pseudorandom_element({'2','3','4','5','6','7','8','9','10','J','Q','K','A'}, pseudoseed('giga_[Untitiled8]'))
		local card = create_playing_card({
		    front = G.P_CARDS['C_'..rank],
		}, G.hand, false,false,nil)
		card:add_to_deck()
    end
}

SMODS.Consumable{ --PB&JSandwich
    key = 'pB&JSandwich',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 1},
    loc_txt = {
        name = 'PB&J Sandwich',
        text = {
            'A delicious PB&J Sandwich that',
            'permenantly add {C:mult}+#1#{} Mult',
            'to {C:attention}#2#{} selected card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        mult = 2,
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult, center.ability.extra.card}}
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
            selected_card.ability.perma_mult = selected_card.ability.perma_mult + card.ability.extra.mult
		end
    end
}

SMODS.Consumable{ --Burger
    key = 'burger',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = 'Burger',
        text = {
            'A delicious Burger that',
            'permenantly add {C:chips}+#1#{} Chips',
            'to {C:attention}#2#{} selected card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        chips = 8,
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.chips, center.ability.extra.card}}
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
            selected_card.ability.perma_bonus = selected_card.ability.perma_bonus + card.ability.extra.chips
		end
    end
}

SMODS.Consumable{ --FruitSalad
    key = 'fruitSalad',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 1},
    loc_txt = {
        name = 'Fruit Salad',
        text = {
            'A delicious Fruit Salad that',
            '{C:attention}upgrade{} the enhancement of',
            '{C:attention}#1#{} card'
        }
    },
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
                local has_enhancement = false
				for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_richSoil') or
                       SMODS.has_enhancement(selected_card, 'm_giga_soil') or
                       SMODS.has_enhancement(selected_card, 'm_bonus') or
                       SMODS.has_enhancement(selected_card, 'm_stone') or
                       SMODS.has_enhancement(selected_card, 'm_mult') or
                       SMODS.has_enhancement(selected_card, 'm_lucky') or
                       SMODS.has_enhancement(selected_card, 'm_gold') --[[or
                       SMODS.has_enhancement(selected_card, 'm_glass') or
                       SMODS.has_enhancement(selected_card, 'm_steel')]] then
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
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            if SMODS.has_enhancement(selected_card, 'm_giga_soil') then
                selected_card:set_ability(G.P_CENTERS["m_giga_richSoil"])
            elseif SMODS.has_enhancement(selected_card, 'm_giga_richSoil') then
                    selected_card:set_ability(G.P_CENTERS["m_giga_fossilSoil"])
            elseif SMODS.has_enhancement(selected_card, 'm_bonus') then
                selected_card:set_ability(G.P_CENTERS["m_giga_bigBonus"])
            elseif SMODS.has_enhancement(selected_card, 'm_stone') then
                selected_card:set_ability(G.P_CENTERS["m_giga_polishStone"])
            elseif SMODS.has_enhancement(selected_card, 'm_mult') then
                selected_card:set_ability(G.P_CENTERS["m_giga_multPlus"])
            elseif SMODS.has_enhancement(selected_card, 'm_lucky') then
                selected_card:set_ability(G.P_CENTERS["m_giga_luckiest"])
            elseif SMODS.has_enhancement(selected_card, 'm_gold') then
                selected_card:set_ability(G.P_CENTERS["m_giga_perfectGold"])
            --[[elseif SMODS.has_enhancement(selected_card, 'm_glass') then
                selected_card:set_ability(G.P_CENTERS["m_giga_reinforcedGlass"])
            elseif SMODS.has_enhancement(selected_card, 'm_steel') then
                selected_card:set_ability(G.P_CENTERS["m_giga_titanium"])]]
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

SMODS.Consumable{ --Turkey
    key = 'turkey',
    set = 'food',
    atlas = 'Foods',
    pos = {x = 2, y = 1},
    soul_pos = {x = 0, y = 1},
    loc_txt = {
        name = 'Turkey',
        text = {
            'A delicious Turkey that will',
            'permanently give you {C:attention}+#1#{}',
            'Joker slot in {C:attention}#2#{} rounds',
            '{C:inactive}#3#{}'
        }
    },
    rarity = 4,
    hidden = true,
    cost = 4,
    config = { extra = {
        round = 3,
        round_left = 3,
        jokerSlot = 1,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.jokerSlot, center.ability.extra.round, center.ability.extra.txt}}
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
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerSlot
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