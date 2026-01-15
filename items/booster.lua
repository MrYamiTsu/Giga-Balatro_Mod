--#region FOOD BOOSTER --
SMODS.Booster { --RestaurantNormal1
    key = 'restaurantPackNormal1',
    atlas = 'Boosters',
    pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Restaurant Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:giga_Food}Food{} cards to',
            'add to your consumeables'
        }
    },
    cost = 2,
    config = {extra = 3, choose = 1, extras = {reset = 3}},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.choose, center.ability.extra, colours={HEX('F7070BFF')}}}
    end,
    group_key = 'k_restaurant_pack',
    create_card = function(self, card, i)
        return {set = "Giga_Food", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "giga"}
    end,
    select_card = "consumeables",
    weight = 0.48,
    kind = 'Restaurant'
}
SMODS.Booster { --RestaurantNormal2
    key = 'restaurantPackNormal2',
    atlas = 'Boosters',
    pos = {x = 1, y = 0},
   loc_txt = {
        name = 'Restaurant Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:giga_Food}Food{} cards to',
            'add to your consumeables'
        }
    },
    cost = 2,
    config = {extra = 3, choose = 1},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.choose, center.ability.extra}}
    end,
    group_key = 'k_restaurant_pack',
    create_card = function(self, card, i)
        return {set = "Giga_Food", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "giga"}
    end,
    select_card = "consumeables",
    weight = 0.48,
    kind = 'Restaurant'
}
SMODS.Booster { --RestaurantJumbo
    key = 'restaurantPackJumbo',
    atlas = 'Boosters',
    pos = {x = 2, y = 0},
    loc_txt = {
        name = 'Jumbo Restaurant Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:giga_Food}Food{} cards to',
            'add to your consumeables'
        }
    },
    cost = 3,
    config = {extra = 5, choose = 1},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.choose, center.ability.extra}}
    end,
    group_key = 'k_restaurant_pack',
    create_card = function(self, card, i)
        return {set = "Giga_Food", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "giga"}
    end,
    select_card = "consumeables",
    weight = 0.36,
    kind = 'Restaurant'
}
SMODS.Booster { --RestaurantMega
    key = 'restaurantPackMega',
    atlas = 'Boosters',
    pos = {x = 3, y = 0},
    loc_txt = {
        name = 'Mega Restaurant Pack',
        text = {
            'Choose {C:attention}#1#{} of up to',
            '{C:attention}#2#{} {C:giga_Food}Food{} cards to',
            'add to your consumeables'
        }
    },
    cost = 4,
    config = {extra = 5, choose = 2},
    loc_vars = function (self,info_queue,center)
        return{vars = {center.ability.choose, center.ability.extra, colours={HEX('F7070BFF')}}}
    end,
    group_key = 'k_restaurant_pack',
    create_card = function(self, card, i)
        return {set = "Giga_Food", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "giga"}
    end,
    select_card = "consumeables",
    weight = 0.24,
    kind = 'Restaurant'
}
--#endregion