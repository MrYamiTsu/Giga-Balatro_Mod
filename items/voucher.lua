-- BOOSTER UPGRADE --
--Does not work
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
    end
}]]

-- SHOP APPEARANCE --
SMODS.Voucher{ --FoodTruck
    key = 'foodTruck',
    atlas = 'Vouchers',
    pos = {x = 2, y = 0},
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
    pos = {x = 3, y = 0},
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