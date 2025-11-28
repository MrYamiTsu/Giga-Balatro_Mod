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
    if key == 'm_giga_soil' then
        return enhancement_yapping(card, 'm_giga_soil') or enhancement_yapping(card, 'm_giga_richSoil') or enhancement_yapping(card, 'm_giga_fossilSoil')
    end
    return ret
end
-- Thx Somethingcom515 for help with this one
local copy_me = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    local ret = copy_me(other, new_card, card_scale, playing_card, strip_edition)
    if other.config.center.giga_data and other.config.center.giga_data.uncopiable then
        SMODS.destroy_cards(ret)
        ret.states.visible = false
        SMODS.calculate_effect({message = localize('k_not_allowed_ex')}, ret)
    end
    return ret
end
local eddy_the_edition = Card.set_edition
function Card:set_edition(edition, immediate, silent, delay)
    if not G.SETTINGS.paused then
        if math.random(25) == 1 then
            if edition == 'e_foil' then
                edition = 'e_giga_s_foil'
            end
            if edition == 'e_holo' then
                edition = 'e_giga_s_holo'
            end
            if edition == 'e_polychrome' then
                edition = 'e_giga_s_poly'
            end
        end
    end
    return eddy_the_edition(self, edition, immediate, silent, delay)
end