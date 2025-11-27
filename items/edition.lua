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
    extra_cost = 2,
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