SMODS.Blind { --TheSelfish
    key = "selfish",
    dollars = 5,
    mult = 2,
    atlas = "Blinds",
    pos = {x = 0, y = 0},
    boss = {min = 2},
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.discard and not context.blueprint and G.GAME.current_round.discards_used >= 0 and #context.full_hand >= 5 then
                return {
                    func = function ()
                        ease_dollars(-1)
                        delay(0.25)
                        return true
                    end
                }
            end
        end
    end,
    boss_colour = HEX("6D7CD4")
}
SMODS.Blind { --TheBase
    key = "base",
    dollars = 5,
    mult = 2,
    atlas = "Blinds",
    pos = {x = 0, y = 1},
    boss = {min = 4},
    set_blind = function(self)
        local count = 0
        for _, c in ipairs(G.playing_cards) do
            if upgraded_enh_condition(c) or upgraded_seal_condition(c) then
                count = count + 1
            end
        end
        if count > 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips + (0.25 * count * G.GAME.blind.chips))
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
					G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
					G.HUD_blind:recalculate()
					G.hand_text_area.blind_chips:juice_up()
                    return true
                end
            }))
        end
    end,
    boss_colour = HEX("FF3C7F")
}
SMODS.Blind { --TheAltitude
    key = "altitude",
    dollars = 5,
    mult = 2,
    atlas = "Blinds",
    pos = {x = 0, y = 2},
    boss = {min = 2},
    calculate = function(self, blind, context)
        if context.individual and not context.other_card:is_face() and context.cardarea == G.play then
            return {
                xmult = 0.9
            }
        end
    end,
    boss_colour = HEX("008080")
}