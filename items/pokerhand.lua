SMODS.PokerHandPart{
    key = 'consecutive',
    func = function(hand)
        if #hand < 4 then
            return {}
        end
        local counts = {}
        for _, card in ipairs(hand) do
            local v = card.base.id
            counts[v] = (counts[v] or 0) + 1
        end
        if (counts[14] or 0) >= 2 and (counts[2] or 0) >= 2 then
            local result = {}
            for _, card in ipairs(hand) do
                if card.base.id == 14 or card.base.id == 2 then
                    table.insert(result, card)
                end
            end
            if #result == 4 then
                return {result}
            end
        end
        for v, n in pairs(counts) do
            if n >= 2 and (counts[v + 1] or 0) >= 2 then
                local result = {}
                for _, card in ipairs(hand) do
                    if card.base.id == v then
                        table.insert(result, card)
                        if #result == 2 then break end
                    end
                end
                for _, card in ipairs(hand) do
                    if card.base.id == v + 1 then
                        table.insert(result, card)
                        if #result == 4 then
                            break
                        end
                    end
                end
                return {result}
            end
        end
        return {}
    end
}

SMODS.PokerHand{ --LinkedPairs
    key = 'Linked Pairs',
    visible = true,
    mult = 3,
    chips = 20,
    l_mult = 1,
    l_chips = 20,
    example = {
        {'H_T', true},
        {'S_T', true},
        {'C_J', true},
        {'S_J', true},
        {'D_4', false}
    },
    evaluate = function(parts, hand)
        return parts.giga_consecutive or {}
    end
}