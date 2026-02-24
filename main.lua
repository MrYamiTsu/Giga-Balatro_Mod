Giga = SMODS.current_mod
Giga_path = SMODS.current_mod.path
Giga_config = SMODS.current_mod.config

Giga.calculate = function (self, context)
    if context.end_of_round and context.main_eval then
        G.GAME.giga.discarded_overcharge = 0
        for _, card in pairs(G.playing_cards) do
            card.ability.giga_goldplusplus_increase = nil
        end
    end
    if context.discard then
        if not context.other_card.debuff and Giga.has_overcharge(context.other_card) then
            G.GAME.giga.discarded_overcharge = G.GAME.giga.discarded_overcharge + 1
        end
    end
    if context.ending_shop then
        Giga.check_fusion()
    end
end

--#region LOADING FILES --
local load_u = {
    'function',
    'hook',
    'ownership',
    'pool',
    'ui'
}
for _, v in pairs(load_u) do
    assert(SMODS.load_file('utils/'..v..'.lua'))()
end
local load_i = {
    'artefact',
    'blind',
    'booster',
    'deck',
    'deckskin',
    'edition',
    'enhancement',
    'food',
    'joker',
    'overcharge',
    'planet',
    'pokerhand',
    'seal',
    'spectral',
    'tarot',
    'voucher'
}
for _, v in pairs(load_i) do
    assert(SMODS.load_file('items/'..v..'.lua'))()
end
if next(SMODS.find_mod('foolsGambit')) then
    local full = FG.config.version
    local major, minor = tonumber(string.sub(full,1,1)), tonumber(string.sub(full,3,3))
    if major == 0 and minor >= 3 then
        local load_fg = {
            'food',
            'joker'
        }
        for _,v in pairs(load_fg) do
            assert(SMODS.load_file('items/CrossMod/foolsgambit/'..v..'.lua'))()
        end
    else
        error("Your version of Fool's Gambit isn't supported. Please update to version 0.3.0.")
    end
end
if CardSleeves then
	SMODS.load_file('items/CrossMod/cardsleeves.lua')()
end
if next(SMODS.find_mod('partner')) then
	SMODS.load_file('items/CrossMod/partner.lua')()
end
if next(SMODS.find_mod('paperback')) then
	SMODS.load_file('items/CrossMod/paperback.lua')()
end
--#endregion
--#region ATLAS --
SMODS.Atlas{
    key = 'modicon', 
    path = 'modicon.png', 
    px = 32,
    py = 32
}
SMODS.Atlas{
    key = 'Jokers',
    path = 'Joker.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Foods',
    path = 'Food.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Enhancements',
    path = 'Enhancement.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Vouchers',
    path = 'Voucher.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Boosters',
    path = 'Booster.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Decks',
    path = 'Deck.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Consumeables',
    path = 'Consumeable.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Seals',
    path = 'Seal.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Blinds',
    path = 'Blind.png',
    px = 34,
    py = 34,
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Atlas{
    key = 'Planets',
    path = 'Planet.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Overcharges',
    path = 'Overcharge.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'Artefacts',
    path = 'Artefact.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
	key = 'skin_lc',
	path = 'Skin_Opt1.png',
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'skin_hc',
	path = 'Skin_Opt2.png',
	px = 71,
	py = 95
}
SMODS.Atlas{
    key = 'secret1',
    path = 'secret1.png',
    px = 166,
    py = 162
}
SMODS.Atlas{
    key = 'secret2',
    path = 'secret2.png',
    px = 252,
    py = 173
}
SMODS.Atlas{
    key = 'secret3',
    path = 'secret3.png',
    px = 147,
    py = 184
}
SMODS.Atlas{
    key = 'secret4',
    path = 'secret4.png',
    px = 191,
    py = 170
}
--#endregion
--#region RARITY --
SMODS.Rarity{
	key = 'megaLegendary',
	loc_txt = {
        name = 'Mega Legendary',
    },
	badge_colour = HEX('dbd809'),
}
--#endregion
--#region CUSTOM COLOUR --
loc_colour()
G.ARGS.LOC_COLOURS.giga_Food = HEX('F2A5A6FF')
G.ARGS.LOC_COLOURS.giga_Artefact = HEX('444444FF')
--#endregion
--#region CONFIG --
-- From Maximus (so thx Maximus)
Giga.config_tab = function()
    return{
        n = G.UIT.ROOT,
        config = { align = "m", r = 0.1, padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 6 },
        nodes = {
            { n = G.UIT.R, config = { align = "cl", padding = 0, minh = 0.1 }, nodes = {} },
            {
                n = G.UIT.R,
                config = { align = "cl", padding = 0 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cl", padding = 0.05 },
                        nodes = {
                            create_toggle { col = true, label = "", scale = 1, w = 0, shadow = true, ref_table = Giga_config, ref_value = "menu_card" },
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = { align = "c", padding = 0 },
                        nodes = {
                            { n = G.UIT.T, config = { text = localize('b_giga_custom_menu_card'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT } },
                        }
                    }
                }
            }
        }
    }
end
--#endregion
--#region INITIALISATION --
Giga.reset_game_globals = function(run_start)
    if run_start then
        G.GAME.giga = {}
        G.GAME.giga.vouchers = {}
        G.GAME.giga.astral_chance = {1, 20}
        G.GAME.giga.shiny_chance = {2, 25}
        G.GAME.giga.discarded_overcharge = 0
    end
end
--#endregion
--#region RANDOM SCORING ORDER --
-- From TogaStuff (so thx TogaStuff)
Giga.preprocess = function(context, input)
	local output = input or context.cardarea and context.cardarea.cards or nil
	if not output then
		if context.cardarea == G.play then output = context.full_hand
		elseif context.cardarea == G.hand then output = G.hand.cards
		elseif context.cardarea == 'unscored' then output = context.full_hand end
	end
	if not output then return end
	if G.GAME.modifiers.giga_randomscore then output = ShuffleMyTable(output, 'kjgas') end
	return output
end
Giga.areaprocess = function(t)
	t = t or {}
	local output = t
	if G.GAME.modifiers.giga_randomscore then output = ShuffleMyTable(output, 'kjgas') end
	return output
end
Giga.areaorderprocess = function(t)
	return Giga.areaprocess(t)
end
--#endregion