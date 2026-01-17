-- TYPE --
SMODS.ConsumableType{
    key = 'Giga_Food',
    primary_colour = HEX("F7070BFF"),
    secondary_colour = HEX("F2A5A6FF"),
    collection_rows = {5,6},
    default = 'c_giga_tacos',
    shop_rate = 0
}

--#region NORMAL --
SMODS.Consumable{ --Spaghetti
    key = 'spaghetti',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_spaghetti'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 2},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_bonus' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Sushis
    key = 'sushis',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_sushis'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 3},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_mult' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Waffle
    key = 'waffle',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_waffle'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 3},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_wild' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Durian
    key = 'durian',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_durian'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 3},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_glass' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Lollipop
    key = 'lollipop',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_lollipop'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 1},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_steel' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Steak
    key = 'steak',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_steak'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 2},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_stone' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Salmon
    key = 'salmon',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_salmon'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 2},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_gold' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --SugarPie
    key = 'sugarPie',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_sugar_pie'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 3},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_lucky' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --HotDog
    key = 'hotDog',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_hot_dog'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 3, y = 0},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1, mod_conv = 'm_giga_soil' },
    loc_vars = function (self,info_queue,center)
        info_queue[#info_queue+1] = G.P_CENTERS['m_giga_soil']
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Guacamole
    key = 'guacamole',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_guacamole'
    },
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
SMODS.Consumable{ --Tacos
    key = 'tacos',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_tacos'
    },
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
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card:juice_up(0.3, 0.5)
                ease_dollars(5, true)
                return true
            end
        }))
        delay(0.6)
    end
}
SMODS.Consumable{ --Donut
    key = 'donut',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_donut'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 4},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 3 , min_highlighted = 3 },
    can_use = function (self,card)
        if #G.hand.highlighted >= card.ability.min_highlighted and #G.hand.highlighted <= card.ability.max_highlighted then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        local leftmost = G.hand.highlighted[1]
        for i = 2, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x < leftmost.T.x then
                leftmost = G.hand.highlighted[i]
            end
        end
        local right_cards = {}
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i] ~= leftmost then
                right_cards[#right_cards + 1] = G.hand.highlighted[i]
            end
        end
        local source = right_cards[math.random(#right_cards)]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                copy_card(source, leftmost)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end
}
SMODS.Consumable{ --Marshmallow
    key = 'marshmallow',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_marshmallow'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 5},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.3)
    end
}
SMODS.Consumable{ --MacN'Cheese
    key = 'macNCheese',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_mac_n_cheese'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 2},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 2, suit_conv = "Diamonds"},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --GummyBear
    key = 'gummyBear',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_gummy_bear'
    },
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
SMODS.Consumable{ --BlueberryMuffin
    key = 'blueberryMuffin',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_blueberry_muffin'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 4},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 2, suit_conv = "Clubs"},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Empanadas
    key = 'empanadas',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_empanadas'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 3},
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
SMODS.Consumable{ --Ramen
    key = 'ramen',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_ramen'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 4},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 2, suit_conv = "Hearts" },
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --QuicheLorraine
    key = 'quicheLorraine',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_quiche_lorraine'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 4},
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
SMODS.Consumable{ --ChocolateBar
    key = 'chocolateBar',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_chocolate_bar'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 2},
    rarity = 1,
    cost = 2,
    config = { max_highlighted = 2, suit_conv = "Spades" },
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.max_highlighted}}
    end
}
SMODS.Consumable{ --Paella
    key = 'paella',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_paella'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 2, y = 4},
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
SMODS.Consumable{ --CaesarSalad
    key = 'caesarSalad',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_caesar_salad'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 4, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        round = 1,
        round_left = 1,
        txt = 'k_giga_notrd'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.round, localize(center.ability.extra.txt)}}
    end,
    can_use = function (self,card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or (card.area == G.consumeables)
    end,
    use = function (self,card,area,copier)
        SMODS.add_card({set = 'Tarot'})
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card)
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end
}
SMODS.Consumable{ --ClubSandwich
    key = 'clubSandwich',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_club_sandwich'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 0},
    rarity = 1,
    cost = 2,
    config = { extra = {
        round = 1,
        round_left = 1,
        txt = 'k_giga_notrd'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.round, localize(center.ability.extra.txt)}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 then
            return true
        end
        return false
    end,
    use = function (self,card,area,copier)
        SMODS.add_card({set = 'Planet'})
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card) 
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end
}
SMODS.Consumable{ --Pho
    key = 'pho',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_pho',
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 0},
    rarity = 2,
    cost = 2,
    config = { extra = {
        round = 2,
        round_left = 2,
        txt = 'k_giga_notrd'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.round, localize(center.ability.extra.txt)}}
    end,
    can_use = function (self,card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or (card.area == G.consumeables)
    end,
    use = function (self,card,area,copier)
        SMODS.add_card({set = 'Spectral'})
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card)
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end
}
SMODS.Consumable{ --Burger
    key = 'burger',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_burger'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 3},
    rarity = 1,
    cost = 2,
    config = { extra = {
        chips = 20,
    }, max_highlighted = 2},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.chips, center.ability.max_highlighted}}
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            selected_card.ability.perma_bonus = selected_card.ability.perma_bonus + card.ability.extra.chips
		end
    end
}
SMODS.Consumable{ --PB&JSandwich
    key = 'pBJSandwich',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_pbj_sandwich'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 6, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        mult = 2,
    }, max_highlighted = 2},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.mult, center.ability.max_highlighted}}
    end,
    use = function (self,card,area,copier)
        for i, selected_card in pairs(G.hand.highlighted) do
            selected_card.ability.perma_mult = selected_card.ability.perma_mult + card.ability.extra.mult
		end
    end
}
SMODS.Consumable{ --BubbleTea
    key = 'bubbleTea',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_bubble_tea'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 1, y = 4},
    rarity = 1,
    cost = 2,
    config = { extra = {
        round = 1,
        round_left = 1,
        txt = 'k_giga_notrd'},
        max_highlighted = 1
    },
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.max_highlighted, center.ability.extra.round, localize(center.ability.extra.txt)}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 and #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.max_highlighted then
            return true
        end
        return false
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
                    _c:set_seal(SMODS.poll_seal({guaranteed = true}), nil, true)
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
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card)
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end
}
SMODS.Consumable{ --CranberryJuice
    key = 'cranberryJuice',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_cranberry_juice'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 3},
    rarity = 1,
    cost = 2,
    config = { extra = {
        round = 1,
        round_left = 1,
        txt = 'k_giga_notrd'},
        max_highlighted = 1
    },
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.max_highlighted, center.ability.extra.round, localize(center.ability.extra.txt)}}
    end,
    can_use = function (self,card)
        if card.ability.extra.round_left <= 0 and #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.max_highlighted then
            return true
        end
        return false
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
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card)
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end
}
SMODS.Consumable{ --FruitSalad
    key = 'fruitSalad',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_fruit_salad'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 1},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
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
    in_pool = function (self)
        for _, c in pairs(G.playing_cards or {}) do
            if c.config.center_key ~= nil and G.P_CENTERS[c.config.center_key].giga_data and
               G.P_CENTERS[c.config.center_key].giga_data.enh_upgrade then
                return true
            end
        end
        return false
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
SMODS.Consumable{ --BagOfCandy
    key = 'bagOfCandy',
    set = 'Giga_Food',
    atlas = 'Foods',
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_bag_of_candy'
    },
    pos = {x = 0, y = 0},
    soul_pos = {x = 5, y = 2},
    rarity = 1,
    cost = 2,
    config = { extra = {
        card = 1
    }},
    loc_vars = function (self,info_queue,center)
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
    in_pool = function (self)
        for _, c in pairs(G.playing_cards or {}) do
            if c:get_seal() ~= nil and G.P_SEALS[c:get_seal()].giga_data and G.P_SEALS[c:get_seal()].giga_data.seal_upgrade then
                return true
            end
        end
        return false
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
--#region RARE --
SMODS.Consumable{ --BirthdayCake
    key = 'birthdayCake',
    set = 'Giga_Food',
    atlas = 'Foods',
    giga_data = {
        r_food = true,
        uncopiable = true
    },
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_birthday_cake'
    },
    pos = {x = 2, y = 1},
    soul_pos = {x = 3, y = 1},
    rarity = 4,
    cost = 10,
    hidden = true,
    soul_set = 'Giga_Food',
    config = { extra = {
        round = 2,
        round_left = 2,
        consumSlot = 1,
        txt = 'k_giga_notrd'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.consumSlot, center.ability.extra.round, localize(center.ability.extra.txt)}}
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
                G.consumeables:change_size(card.ability.extra.consumSlot)
                return true
            end
        }))
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card)
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_giga_rare_food'), SMODS.ConsumableTypes.Giga_Food.secondary_colour, G.C.WHITE, 1.2)
    end
}
SMODS.Consumable{ --Turkey
    key = 'turkey',
    set = 'Giga_Food',
    atlas = 'Foods',
    giga_data = {
        r_food = true,
        uncopiable = true
    },
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_turkey'
    },
    pos = {x = 2, y = 1},
    soul_pos = {x = 3, y = 4},
    rarity = 4,
    cost = 10,
    hidden = true,
    soul_set = 'Giga_Food',
    config = { extra = {
        round = 3,
        round_left = 3,
        jokerSlot = 1,
        txt = 'k_giga_notrd'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.jokerSlot, center.ability.extra.round, localize(center.ability.extra.txt)}}
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
                G.jokers:change_size(card.ability.extra.jokerSlot)
                return true
            end
        }))
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card)
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_giga_rare_food'), SMODS.ConsumableTypes.Giga_Food.secondary_colour, G.C.WHITE, 1.2)
    end
}
SMODS.Consumable{ --Poutine
    key = 'poutine',
    set = 'Giga_Food',
    atlas = 'Foods',
    giga_data = {
        r_food = true,
        uncopiable = true
    },
    fg_data = {
        is_alternate = false,
        alternate_key = 'c_fg__c_giga_poutine'
    },
    pos = {x = 2, y = 1},
    soul_pos = {x = 2, y = 5},
    rarity = 4,
    cost = 10,
    hidden = true,
    soul_set = 'Giga_Food',
    config = { extra = {
        round = 1,
        round_left = 1,
        handSize = 1,
        txt = 'k_giga_notrd'
    }},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.extra.handSize, center.ability.extra.round, localize(center.ability.extra.txt)}}
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
                G.hand:change_size(card.ability.extra.handSize)
                return true
            end
        }))
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.round_left = card.ability.extra.round_left - 1
        end
        if card.ability.extra.round_left <= 0 and card.ability.extra.txt == 'k_giga_notrd' and #G.consumeables.cards then
            local check_remove = function(card)
                return not card.REMOVED
            end
            juice_card_until(card, check_remove, true)
            card.ability.extra.txt = 'k_giga_rd'
        end
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_giga_rare_food'), SMODS.ConsumableTypes.Giga_Food.secondary_colour, G.C.WHITE, 1.2)
    end
}
--#endregion