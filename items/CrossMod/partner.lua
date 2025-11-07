-- ATLAS --
SMODS.Atlas{
    key = "Partners",
    path = "Partner.png",
    px = 46,
    py = 58,
}

-- PARTNERS --
Partner_API.Partner{
    key = "pabloJr",
    name = "Pablo Jr. Partner",
    unlocked = true,
    discovered = true,
    individual_quips = true,
    pos = { x = 0, y = 0 },
    atlas = "Partners",
    config = { extra = {
        odds = 1,
        chances = 6
    }
    },
    loc_vars = function(self, info_queue, card)
        local odds, chances = SMODS.get_probability_vars(card, card.ability.extra.odds, card.ability.extra.chances, 'prob')
        return {vars = {odds, chances}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(context.other_card, 'giga_pabloJr', card.ability.extra.odds, card.ability.extra.chances, 'pjr_prob') then
                upgrade_enhencement(context.other_card)
            end
        end
    end
}