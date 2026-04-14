--#region COLLECTION --
Giga.custom_collection_tabs = function()
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
    Giga.menu_cards = function()
	    return {
		    {key = 'j_giga_myt_own'}
	    }
    end
end
--[[local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
    local ret = oldfunc(change_context)
    local SC_scale = 1.1 * (G.debug_splash_size_toggle and 0.8 or 1)
    G.SPLASH_giga_logo = Sprite(0, 0,
        6 * SC_scale,
        6 * SC_scale * (G.ASSET_ATLAS["giga_logo"].py / G.ASSET_ATLAS["giga_logo"].px),
        G.ASSET_ATLAS["giga_logo"], { x = 0, y = 0 }
    )
    G.SPLASH_giga_logo:set_alignment({
        major = G.title_top,
        type = 'cm',
        bond = 'Strong',
        offset = { x = 0, y = 3 }
    })
    G.SPLASH_giga_logo:define_draw_steps({{
        shader = 'dissolve',
    }})
    G.SPLASH_giga_logo.tilt_var = { mx = 0, my = 0, dx = 0, dy = 0, amt = 0 }
    G.SPLASH_giga_logo.dissolve_colours = { G.C.MULT, G.C.CHIPS }
    G.SPLASH_giga_logo.dissolve = 1
    G.SPLASH_giga_logo.states.collide.can = true
    function G.SPLASH_giga_logo:click()
        play_sound('tarot1', 1, 0.3)
        G.FUNCS['openModUI_Giga']()
    end
    function G.SPLASH_giga_logo:hover()
        G.SPLASH_giga_logo:juice_up(0.05, 0.03)
        play_sound('tarot1', math.random() * 0.2 + 0.9, 0.35)
        Node.hover(self)
    end
    function G.SPLASH_giga_logo:stop_hover() Node.stop_hover(self) end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = change_context == 'splash' and 3.6 or change_context == 'game' and 4 or 1,
        blockable = false,
        blocking = false,
        func = (function()
            play_sound('glass' .. (change_context == 'splash' and 2 or 3),
            (change_context == 'splash' and 1 or 1.3), 0.9)
            play_sound('tarot1', 0.2, 0.8)
            ease_value(G.SPLASH_giga_logo, 'dissolve', -1, nil, nil, nil,
                change_context == 'splash' and 2.3 or 0.9)
            G.VIBRATION = G.VIBRATION + 1.5
            return true
        end)
    }))
    G.SPLASH_BACK:define_draw_steps({ {
        shader = 'splash',
        send = {
            { name = 'time',       ref_table = G.TIMERS,  ref_value = 'REAL_SHADER' },
            { name = 'vort_speed', val = 0.4 },
            { name = 'colour_1',   ref_table = G.C, ref_value = 'MULT' },
            { name = 'colour_2',   ref_table = G.C, ref_value = 'CHIPS' },
        }
    } })
    return ret
end]]
--#endregion