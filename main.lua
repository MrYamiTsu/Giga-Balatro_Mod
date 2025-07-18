-- Loading Files --
SMODS.load_file("items/booster.lua")()
SMODS.load_file("items/enhancement.lua")()
SMODS.load_file("items/food.lua")()
SMODS.load_file("items/joker.lua")()
SMODS.load_file("items/voucher.lua")()

if next(SMODS.find_mod("Cryptid")) then
	SMODS.load_file("items/CrossMod/cryptid.lua")()
end

-- Atlas --
SMODS.Atlas{
    key = "modicon", 
    path = "modicon.png", 
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
    path = 'Vouchers.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'Boosters',
    path = 'Boosters.png',
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

SMODS.Rarity{
	key = "megaLegendary",
	loc_txt = {
        name = "Mega Legendary",
    },
	badge_colour = HEX("dbd809"),
}

-- Main Menu --

SMODS.Joker{
	key = "mainMenuJoker",
	atlas = "Jokers",
	rarity = "giga_megaLegendary",
	cost = 0,
	unlocked = true,
	discovered = true,
	no_collection = true,
	pos = {x = 4, y = 1},
	in_pool = function(self)
		return false
	end,
}

local oldfunc = Game.main_menu 
Game.main_menu = function(change_context)
	local idk = oldfunc(change_context)
	local newcard = Card(
		G.title_top.T.x,
		G.title_top.T.y,
		G.CARD_W,
		G.CARD_H,
		G.P_CARDS.empty,
		G.P_CENTERS.j_giga_mainMenuJoker,
		{ bypass_discovery_center = true }
	)
    G.title_top.T.w = G.title_top.T.w * 1.3
	G.title_top.T.x = G.title_top.T.x - 0.8
	G.title_top:emplace(newcard)
    newcard.T.w = newcard.T.w * 1.1 * 1.25
	newcard.T.h = newcard.T.h * 1.1 * 1.25
	newcard.no_ui = true
	newcard.states.visible = true
end
-- From Revo'sVault, that was from Cryptid. (So thx Cryptid)