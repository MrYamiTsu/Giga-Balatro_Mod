-- TYPE --
SMODS.ConsumableType{
    key = 'Giga_Food',
    primary_colour = HEX("F7070BFF"),
    secondary_colour = HEX("F2A5A6FF"),
    loc_txt = {
        collection = 'Food Cards',
        name = 'Food'
    },
    collection_rows = {5,6},
    default = 'c_giga_fruitSalad', 
    shop_rate = 0
}

-- NORMAL --
SMODS.Consumable{ --Tacos
    key = 'tacos',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        money = 5
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 2
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G.GAME.blind.in_blind then
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS['m_giga_soil']
        if G.hand then
            local has_enhancement1 = false
            local has_enhancement2 = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_giga_soil') then
                    has_enhancement1 = true
                    break
                end
            end
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_giga_richSoil') then
                    has_enhancement2 = true
                    break
                end
            end
            if has_enhancement1 then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_richSoil']
            end
            if has_enhancement2 then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_fossilSoil']
            end
        end
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
                upgrade_enhencement_specific(selected_card, 'm_giga_richSoil')
            else
                upgrade_enhencement_specific(selected_card, 'm_giga_soil')
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 0},
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
        if card.ability.extra.round_left <= 0 then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        _create(card, 'Giga_Food', G.consumeables,true,true)
        delay(0.4)
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 0},
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
        if card.ability.extra.round_left <= 0 then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        _create(card, 'Giga_Food', G.consumeables,true,true)
        delay(0.4)
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 0},
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
        if card.ability.extra.round_left <= 0 then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        _create(card, 'Giga_Food', G.consumeables,true,true)
        delay(0.4)
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 2},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        if G.hand then
            local has_enhancement = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_bonus') then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_bigBonus']
            end
        end
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
            upgrade_enhencement_specific(selected_card, 'm_bonus')
		end
    end
}
SMODS.Consumable{ --Steak
    key = 'steak',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 2},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        if G.hand then
            local has_enhancement = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_stone') then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_polishStone']
            end
        end
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
            upgrade_enhencement_specific(selected_card, 'm_stone')
		end
    end
}
SMODS.Consumable{ --Sushis
    key = 'sushis',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        if G.hand then
            local has_enhancement = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_mult') then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_multPlus']
            end
        end
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
            upgrade_enhencement_specific(selected_card, 'm_mult')
		end
    end
}
SMODS.Consumable{ --SugarPie
    key = 'sugarPie',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        if G.hand then
            local has_enhancement = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_lucky') then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_luckiest']
            end
        end
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
            upgrade_enhencement_specific(selected_card, 'm_lucky')
		end
    end
}
SMODS.Consumable{ --[Untitled2]
    key = 'Untitled2',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        if G.hand then
            local has_enhancement = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_glass') then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_reinforcedGlass']
            end
        end
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_reinforcedGlass') then
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
            upgrade_enhencement_specific(selected_card, 'm_glass')
		end
    end
}
SMODS.Consumable{ --Salmon
    key = 'salmon',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 2},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        if G.hand then
            local has_enhancement = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_gold') then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_perfectGold']
            end
        end
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
            upgrade_enhencement_specific(selected_card, 'm_gold')
		end
    end
}
SMODS.Consumable{ --Waffle
    key = 'waffle',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
        if G.hand then
            local has_enhancement = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_wild') then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_evolvedWild']
            end
        end
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        if G.hand then
            local has_enhancement = false
            for i, _card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(_card, 'm_steel') then
                    has_enhancement = true
                    break
                end
            end
            if has_enhancement then
                info_queue[#info_queue+1] = G.P_CENTERS['m_giga_titanium']
            end
        end
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
        if G and G.hand then
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				for i, selected_card in pairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(selected_card, 'm_giga_titanium') then
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
            upgrade_enhencement_specific(selected_card, 'm_steel')
		end
    end
}
SMODS.Consumable{ --QuicheLorraine
    key = 'quicheLorraine',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		if G.GAME.blind.in_blind then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i = 1, card.ability.extra.card do
            SMODS.add_card { set = "Base", suit = "Hearts", area = G.hand }
        end
    end
}
SMODS.Consumable{ --Paella
    key = 'paella',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		if G.GAME.blind.in_blind then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i = 1, card.ability.extra.card do
            SMODS.add_card { set = "Base", suit = "Spades", area = G.hand }
        end
    end
}
SMODS.Consumable{ --GummyBear
    key = 'gummyBear',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 2},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		if G.GAME.blind.in_blind then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i = 1, card.ability.extra.card do
            SMODS.add_card { set = "Base", suit = "Diamonds", area = G.hand }
        end
    end
}
SMODS.Consumable{ --[Untitled8]
    key = 'Untitled8',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.card}}
    end,
    can_use = function (self,card)
		if G.GAME.blind.in_blind then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i = 1, card.ability.extra.card do
            SMODS.add_card { set = "Base", suit = "Clubs", area = G.hand }
        end
    end
}
SMODS.Consumable{ --PB&JSandwich
    key = 'pBJSandwich',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 1},
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        chips = 10,
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center, card)
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
                    if SMODS.has_enhancement(selected_card, 'm_giga_richSoil') or
                       SMODS.has_enhancement(selected_card, 'm_giga_soil') or
                       SMODS.has_enhancement(selected_card, 'm_bonus') or
                       SMODS.has_enhancement(selected_card, 'm_stone') or
                       SMODS.has_enhancement(selected_card, 'm_mult') or
                       SMODS.has_enhancement(selected_card, 'm_lucky') or
                       SMODS.has_enhancement(selected_card, 'm_gold') or
                       SMODS.has_enhancement(selected_card, 'm_glass') or
                       SMODS.has_enhancement(selected_card, 'm_steel') or
                       SMODS.has_enhancement(selected_card, 'm_wild') then
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
            upgrade_enhencement(selected_card)
		end
    end
}
SMODS.Consumable{ --Ramen
    key = 'ramen',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
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
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				return true
			end
		end
		return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            SMODS.change_base(selected_card, 'Hearts')
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
SMODS.Consumable{ --ChocolateBar
    key = 'chocolateBar',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 2},
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
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				return true
			end
		end
		return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            SMODS.change_base(selected_card, 'Spades')
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
SMODS.Consumable{ --MacN'Cheese
    key = 'macNCheese',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 2},
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
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				return true
			end
		end
		return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            SMODS.change_base(selected_card, 'Diamonds')
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
SMODS.Consumable{ --[Untitled12]
    key = 'Untitled12',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
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
			if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				return true
			end
		end
		return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            SMODS.change_base(selected_card, 'Clubs')
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
SMODS.Consumable{ --[Untitled13]
    key = 'Untitled13',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1,
        round = 1,
        round_left = 1,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'giga_pinkseal_seal'}
        return{vars = {colours={HEX('FF00E6')}, center.ability.extra.card, center.ability.extra.round, center.ability.extra.txt}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 then
            if G and G.hand then
			    if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				    return true
			    end
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
			selected_card:set_seal("giga_pinkseal")
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
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
SMODS.Consumable{ --CranberryJuice
    key = 'cranberryJuice',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 3},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1,
        round = 1,
        round_left = 1,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'giga_crimsonseal_seal'}
        return{vars = {colours={HEX('DC143C')}, center.ability.extra.card, center.ability.extra.round, center.ability.extra.txt}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 then
            if G and G.hand then
			    if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				    return true
			    end
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
			selected_card:set_seal("giga_crimsonseal")
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
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
SMODS.Consumable{ --[Untitled15]
    key = 'Untitled15',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1,
        round = 1,
        round_left = 1,
        txt = 'Not ready yet'
    }},
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'giga_aquaseal_seal'}
        return{vars = {colours={HEX('00FFF0')}, center.ability.extra.card, center.ability.extra.round, center.ability.extra.txt}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 then
            if G and G.hand then
			    if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.card then
				    return true
			    end
		    end
        end
        return false
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
				delay = 0.2,
				func = function()
					selected_card:juice_up(0.3, 0.5)
					return true
				end,
			}))
			selected_card:set_seal("giga_aquaSeal")
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
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
SMODS.Consumable{ --BagOfCandy
    key = 'bagOfCandy',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 2},
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
                local has_seal = false
				for i, selected_card in pairs(G.hand.highlighted) do
                    if selected_card:get_seal() == "Red" or
                       selected_card:get_seal() == "Blue" or
                       selected_card:get_seal() == "Gold" or
                       selected_card:get_seal() == "Purple" or
                       selected_card:get_seal() == "giga_redplus" or
                       selected_card:get_seal() == "giga_blueplus" or
                       selected_card:get_seal() == "giga_goldplus" or
                       selected_card:get_seal() == "giga_purpleplus" then
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
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            upgrade_seal(selected_card)
		end
    end
}

-- RARE --
SMODS.Consumable{ --BirthdayCake
    key = 'birthdayCake',
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 2, y = 1},
    soul_pos = {x = 3, y = 1},
    rarity = 4,
    cost = 4,
    hidden = true,
    soul_set = 'Giga_Food',
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
    set = 'Giga_Food',
    atlas = 'Foods',
    pos = {x = 2, y = 1},
    soul_pos = {x = 0, y = 1},
    rarity = 4,
    cost = 4,
    hidden = true,
    soul_set = 'Giga_Food',
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