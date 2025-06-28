SMODS.load_file("items/joker.lua")()
SMODS.load_file("items/food.lua")()
SMODS.load_file("items/enhancement.lua")()

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

SMODS.Rarity({
	key = "megaLegendary",
	loc_txt = {
        name = "Mega Legendary",
    },
	badge_colour = HEX("dbd809"),
})