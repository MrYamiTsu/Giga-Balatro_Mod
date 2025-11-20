-- HOOKS --
local talking_init = Game.init_game_object
function Game:init_game_object()
	local ret = talking_init(self)
	init_pools()
	return ret
end
local enhancement_yapping = SMODS.has_enhancement
function SMODS.has_enhancement(card, key)
    local ret = enhancement_yapping(card, key)
    if key == 'm_bonus' then
        return enhancement_yapping(card, 'm_lucky') or enhancement_yapping(card, 'm_giga_bigBonus')
    end
    if key == 'm_mult' then
        return enhancement_yapping(card, 'm_lucky') or enhancement_yapping(card, 'm_giga_multPlus')
    end
    if key == 'm_wild' then
        return enhancement_yapping(card, 'm_wild') or enhancement_yapping(card, 'm_giga_evolvedWild')
    end
    if key == 'm_glass' then
        return enhancement_yapping(card, 'm_glass') or enhancement_yapping(card, 'm_giga_reinforcedGlass')
    end
    if key == 'm_steel' then
        return enhancement_yapping(card, 'm_steel') or enhancement_yapping(card, 'm_giga_titanium')
    end
    if key == 'm_stone' then
        return enhancement_yapping(card, 'm_stone') or enhancement_yapping(card, 'm_giga_polishStone')
    end
    if key == 'm_gold' then
        return enhancement_yapping(card, 'm_gold') or enhancement_yapping(card, 'm_giga_perfectGold')
    end
    if key == 'm_lucky' then
        return enhancement_yapping(card, 'm_lucky') or enhancement_yapping(card, 'm_giga_luckiest')
    end
    return ret
end
--[[local seal_them = Card:get_seal
function Card:get_seal(bypass_debuff)
    local g = seal_them(self, bypass_debuff)

    return g
end]]