SMODS.Blind {
    key = "selfish",
    dollars = 5,
    mult = 2,
    atlas = "Blinds",
    pos = {x = 0, y = 0},
    boss = {min = 2},
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.discard and not context.blueprint and G.GAME.current_round.discards_used >= 0 and #context.full_hand == 5 then
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
    boss_colour = HEX("6D7CD4"),
}