SMODS.Shader{
    key = 's_foil',
    path = 's_foil.fs'
}
SMODS.Edition{
    key = 's_foil',
    shader = 's_foil',
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
        return {vars = { card.edition.chips }}
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
    key = 's_holo',
    path = 's_holo.fs'
}
SMODS.Edition{
    key = 's_holo',
    shader = 's_holo',
    loc_txt = {
        name = "Shiny Holographic",
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
        return {vars = { card.edition.mult }}
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
    key = 's_poly',
    path = 's_poly.fs'
}
SMODS.Edition{
    key = 's_poly',
    shader = 's_poly',
    loc_txt = {
        name = "Shiny Polychrome",
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
        return {vars = { card.edition.x_mult }}
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