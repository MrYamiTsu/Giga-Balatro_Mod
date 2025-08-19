Giga = SMODS.current_mod
Giga_path = SMODS.current_mod.path
Giga_config = SMODS.current_mod.config

-- LOADING FILES --
SMODS.load_file("util.lua")()
SMODS.load_file("items/booster.lua")()
SMODS.load_file("items/consumeable.lua")()
SMODS.load_file("items/deck.lua")()
SMODS.load_file("items/enhancement.lua")()
SMODS.load_file("items/food.lua")()
SMODS.load_file("items/joker.lua")()
SMODS.load_file("items/seal.lua")()
SMODS.load_file("items/voucher.lua")()
if next(SMODS.find_mod("Cryptid")) then
	SMODS.load_file("items/CrossMod/cryptid.lua")()
end
if next(SMODS.find_mod("partner")) then
	SMODS.load_file("items/CrossMod/partner.lua")()
end
if next(SMODS.find_mod("paperback")) then
	SMODS.load_file("items/CrossMod/paperback.lua")()
end

-- ATLAS --
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

-- RARITY --
SMODS.Rarity{
	key = "megaLegendary",
	loc_txt = {
        name = "Mega Legendary",
    },
	badge_colour = HEX("dbd809"),
}

-- CONFIG --
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

-- MAIN MENU --
if not Giga_config.menu_card then
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
	    end
    }
    --From Revo'sVault, that was from Cryptid. (So thx Cryptid)
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
end

-- IDK --
-- From TogaStuff (so thx TogaStuff)
function ShuffleMyTable(t, seed)
	seed = seed or 'shuffley'
	local rt = {}
	for i = 1, #t do
		rt[#rt+1] = t[i]
	end
	pseudoshuffle(rt, pseudoseed(seed))
	return rt
end
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