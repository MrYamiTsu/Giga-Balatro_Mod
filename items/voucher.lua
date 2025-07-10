--Do not work
--[[SMODS.Voucher{ --NewMenu
	key = "newMenu",
	atlas = "Vouchers",
	pos = {x = 0, y = 0},
	cost = 10,
    config = {extra = {
        choice = 1
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.choice}}
    end,
    redeem = function(self, card)
        if not G.GAME.shop then return end
        if G.shop_booster and G.shop_booster.cards then
            for _, booster in ipairs(G.shop_booster.cards) do
                if booster.config.center.key == 'k_giga_booster_restaurantPackNormal1' or
                   booster.config.center.key == 'k_giga_booster_restaurantPackNormal2' or 
                   booster.config.center.key == 'k_giga_booster_restaurantPackJumbo' or
                   booster.config.center.key == 'k_giga_booster_restaurantPackMega' then
                    booster.ability.extra = booster.ability.extra + 1
                end
            end
        end
    end
}]]--

SMODS.Voucher{ --FoodTruck
    key = 'foodTruck',
    atlas = 'Vouchers',
    pos = {x = 1, y = 0},
	cost = 10,
    loc_vars = function(self, info_queue)
        return { vars = {colours={HEX('F7070BFF')}} }
    end,
    redeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.food_rate = 2
                return true
            end
        }))
    end
}

SMODS.Voucher{ --HomeDelivery
    key = 'homeDelivery',
    atlas = 'Vouchers',
    pos = {x = 1, y = 0},
    cost = 10,
    loc_vars = function(self, info_queue)
        return {vars = {colours={HEX('F7070BFF')}}}
    end,
    requires = {'v_giga_foodTruck'},
    redeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.food_rate = 5
                return true
            end
        }))
    end
}