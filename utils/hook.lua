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
        return enhancement_yapping(card, 'm_mult') or enhancement_yapping(card, 'm_giga_multPlus')
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
    if key == 'm_giga_richSoil' then
        return enhancement_yapping(card, 'm_giga_richSoil') or enhancement_yapping(card, 'm_giga_fossilSoil')
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
        if Giga.shiny_roll() then
            if edition == 'e_foil' then
                edition = 'e_giga_shiny_foil'
            end
            if edition == 'e_holo' then
                edition = 'e_giga_shiny_holo'
            end
            if edition == 'e_polychrome' then
                edition = 'e_giga_shiny_poly'
            end
        end
    end
    return eddy_the_edition(self, edition, immediate, silent, delay)
end
local darling_creates = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    if not center then
        return nil
    end
    if type(center) == "string" then
        assert(G.P_CENTERS[center])
        center = G.P_CENTERS[center]
    end
    if not G.SETTINGS.paused and center.set == 'Planet' and Giga.astral_roll() then
        local astrals = {
            c_mercury   = 'c_giga_astral_mercury',
            c_jupiter   = 'c_giga_astral_jupiter',
            c_pluto     = 'c_giga_astral_pluto',
            c_eris      = 'c_giga_astral_eris',
            c_planet_x  = 'c_giga_astral_planetX',
            c_saturn    = 'c_giga_astral_saturn',
            c_earth     = 'c_giga_astral_earth',
            c_mars      = 'c_giga_astral_mars',
            c_ceres     = 'c_giga_astral_ceres',
            c_venus     = 'c_giga_astral_venus',
            c_uranus    = 'c_giga_astral_uranus',
            c_neptune   = 'c_giga_astral_neptune',
            c_giga_sylvia = 'c_giga_astral_sylvia',
            c_giga_titania = 'c_giga_astral_titania'
        }
        if astrals[center.key] then
            center = G.P_CENTERS[astrals[center.key]]
        end
    end
    return darling_creates(self, center, initial, delay_sprites)
end