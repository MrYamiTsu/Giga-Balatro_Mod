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

local oldfunc = Game.main_menu
Game.main_menu = function(self, change_context)
    local ret = oldfunc(self, change_context)

    if G.SPLASH_giga_logo_uibox then
        G.SPLASH_giga_logo_uibox:remove()
        G.SPLASH_giga_logo_uibox = nil
    end

    local atlas = G.ASSET_ATLAS["giga_logo"]
    if atlas and G.title_top then
        local SC_scale = 1.1 * (G.debug_splash_size_toggle and 0.8 or 1)
        local w = 3.2 * SC_scale
        local h = w * (atlas.py / atlas.px)

        G.SPLASH_giga_logo = Sprite(0, 0, w, h, atlas, { x = 0, y = 0 })
        G.SPLASH_giga_logo:define_draw_steps({{
            shader = 'dissolve',
        }})
        G.SPLASH_giga_logo.dissolve_colours = { G.C.MULT, G.C.CHIPS }
        G.SPLASH_giga_logo.dissolve = (change_context == 'splash') and 1 or 0

        G.SPLASH_giga_logo_uibox = UIBox({
            definition = {
                n = G.UIT.ROOT,
                config = { align = "cm", colour = G.C.CLEAR },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {
                            align = "cm",
                            button = 'openModUI_' .. (Giga.id or 'GIGA'),
                            hover = true,
                            colour = G.C.CLEAR,
                            id = 'giga_main_menu_logo'
                        },
                        nodes = {
                            {
                                n = G.UIT.O,
                                config = {
                                    object = G.SPLASH_giga_logo
                                }
                            }
                        }
                    }
                }
            },
            config = {
                align = "tm",
                type = "cm",
                bond = "Weak",
                offset = { x = 0, y = -1.85 },
                major = G.title_top
            }
        })

        if change_context == 'splash' then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 3.6,
                blockable = false,
                blocking = false,
                func = function()
                    play_sound('glass2', 1, 0.9)
                    play_sound('tarot1', 0.2, 0.8)
                    ease_value(G.SPLASH_giga_logo, 'dissolve', -1, nil, nil, nil, 2.3)
                    G.VIBRATION = G.VIBRATION + 1.5
                    return true
                end
            }))
        end
    end

    return ret
end
--#endregion