--#region COLLECTION --
SMODS.current_mod.custom_collection_tabs = function()
    return {
        UIBox_button({
            button = 'your_collection_giga_overcharges',
            id = 'your_collection_giga_overcharges',
            label = { localize('giga_overcharge_collection_label') },
            count = { tally = #Giga.POOLS.Overcharges, of = #Giga.POOLS.Overcharges },
            minw = 5,
            minh = 1
      })
    }
end
local function ovch_ui_collection()
    local ovch = {}
    for k, i in pairs(SMODS.Stickers) do
        if Giga.is_overcharge(k) then
            ovch[k] = i
        end
    end
    return SMODS.card_collection_UIBox(ovch, { 5, 5 }, {
        snap_back = true,
        hide_single_page = true,
        collapse_single_page = true,
        center = 'c_base',
        h_mod = 1.18,
        back_func = 'your_collection_other_gameobjects',
        modify_card = function(card, center)
            card.ignore_pinned = true
            center:apply(card, true)
        end
    })
end
G.FUNCS.your_collection_giga_overcharges = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = ovch_ui_collection()
    }
end
local function wrap_without_overcharges(func)
    local dump = {}
    for k, i in pairs(SMODS.Stickers) do
        if Giga.is_overcharge(k) then
            dump[k] = i
            SMODS.Stickers[k] = nil
        end
    end
    local ret = func()
    for k, i in pairs(dump) do
        SMODS.Stickers[k] = i
    end
    return ret
end
local stickers_ui_ref = create_UIBox_your_collection_stickers
create_UIBox_your_collection_stickers = function()
    return wrap_without_overcharges(stickers_ui_ref)
end
local other_objects_ref = create_UIBox_Other_GameObjects
create_UIBox_Other_GameObjects = function()
    return wrap_without_overcharges(other_objects_ref)
end
--#endregion
--#region MAIN MENU --
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
--#endregion