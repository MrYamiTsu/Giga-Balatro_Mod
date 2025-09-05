-- BOOSTER UPGRADE --
SMODS.Voucher{ --NewMenu
	key = "newMenu",
	atlas = "Vouchers",
	pos = {x = 0, y = 0},
	cost = 10,
    config = {extra = {
        card = 1
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.card}}
    end,
    redeem = function(self, vouchers)
        G.GAME.giga.vouchers.newMenu = (G.GAME.giga.vouchers.newMenu or 0) + vouchers.ability.extra.card
    end
}
SMODS.Voucher{ --5-CourseMeal
    key = '5courseMeal',
    atlas = 'Vouchers',
    pos = {x = 1, y = 0},
	cost = 10,
    config = {extra = {
        choice = 1
    }},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.choice}}
    end,
    requires = {'v_giga_newMenu'},
    redeem = function(self, vouchers)
        G.GAME.giga.vouchers._courseMeal = (G.GAME.giga.vouchers._courseMeal or 0) + vouchers.ability.extra.choice
    end
}

-- SHOP APPEARANCE --
SMODS.Voucher{ --FoodStand
    key = 'foodStand',
    atlas = 'Vouchers',
    pos = {x = 2, y = 0},
	cost = 10,
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
    requires = {'v_giga_foodTruck'},
    redeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.Game.food_rate < 5 then
                    G.GAME.food_rate = G.GAME.food_rate * 2.5
                end
                return true
            end
        }))
    end
}