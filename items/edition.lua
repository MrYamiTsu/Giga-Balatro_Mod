SMODS.Shader{
    key = 'shiny_foil',
    path = 'shiny_foil.fs'
}
SMODS.Edition{
    key = 'shiny_foil',
    shader = 'shiny_foil',
    loc_txt = {
        name = "Shiny Foil",
        text = {
            "{C:chips}+#1#{} Chips"
        }
    },
    in_shop = false,
    weight = 0,
    extra_cost = 3,
    sound = {sound = "foil1", per = 1.2, vol = 0.6},
    config = { chips = 100 },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_shiny_chance', vars = {2 / 25 * 100, 'Foil'}}
        end
        return {vars = { self.config.chips }}
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = card.edition.chips
            }
        end
    end,
    in_pool = function(self)
        return false
    end,
    badge_colour = G.C.DARK_EDITION
}

SMODS.Shader{
    key = 'shiny_holo',
    path = 'shiny_holo.fs'
}
SMODS.Edition{
    key = 'shiny_holo',
    shader = 'shiny_holo',
    loc_txt = {
        name = {"Shiny", "Holographic"},
        text = {
            "{C:mult}+#1#{} Mult"
        }
    },
    in_shop = false,
    weight = 0,
    extra_cost = 4,
    sound = {sound = "holo1", per = 1.2 * 1.58, vol = 0.6},
    config = { mult = 20 },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_shiny_chance', vars = {2 / 25 * 100, 'Holographic'}}
        end
        return {vars = { self.config.mult }}
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                mult = card.edition.mult
            }
        end
    end,
    in_pool = function(self)
        return false
    end,
    badge_colour = G.C.DARK_EDITION
}

SMODS.Shader{
    key = 'shiny_poly',
    path = 'shiny_poly.fs'
}
SMODS.Edition{
    key = 'shiny_poly',
    shader = 'shiny_poly',
    loc_txt = {
        name = {"Shiny", "Polychrome"},
        text = {
            "{X:mult,C:white}X#1#{} Mult"
        }
    },
    in_shop = false,
    weight = 0,
    extra_cost = 6,
    sound = {sound = "polychrome1", per = 1.2, vol = 0.9},
    config = { x_mult = 3 },
    loc_vars = function(self, info_queue, card)
        if G.SETTINGS.paused then
            info_queue[#info_queue+1] = {set = 'Other', key = 'giga_shiny_chance', vars = {2 / 25 * 100, 'Polychrome'}}
        end
        return {vars = { self.config.x_mult }}
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.edition.x_mult
            }
        end
    end,
    in_pool = function(self)
        return false
    end,
    badge_colour = G.C.DARK_EDITION
}