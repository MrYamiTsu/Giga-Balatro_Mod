return {
    descriptions = {
        Back={
            b_giga_foodie = {
                name = "Foodie's Deck",
                text = {
                    'Create a {V:1}Food{}',
                    'card at the start',
                    'of every round and',
                    'start with {C:attention,T:v_giga_foodTruck}Food Truck{}'
                }
            }
        },
        Blind={},
        Edition={},
        Enhanced={
            m_giga_soil = {
				name = 'Soil Card',
				text = {
					'{X:chips,C:white}X#1#{} Chips'
				}
			},
            m_giga_richSoil = {
                name = 'Rich Soil Card',
                text = {
                    '{X:chips,C:white}X#1#{} Chips',
                    '{C:mult}+#2#{} Mult'
                }
            },
            m_giga_fossilSoil = {
                name = 'Fossil Soil Card',
                text = {
                    '{X:chips,C:white}X#1#{} Chips',
                    '{X:mult,C:white}X#2#{} Mult'
                }
            },
            m_giga_bigBonus = {
                name = 'Big Bonus Card',
                text = {
                    '{C:chips}+#1#{} extra chips',
                    'Always scores'
                }
            },
            m_giga_polishStone = {
                name = 'Polished Stone Card',
                text = {
                    '{C:chips}+#1#{} chips',
                    '{X:chips,C:white}X#2#{} chips',
                    'no rank or suit'
                }
            },
            m_giga_multPlus = {
                name = 'Mult Plus Card',
                text = {
                    '{C:mult}+#1#{} Mult',
                    'Always scores'
                }
            },
            m_giga_luckiest = {
                name = 'Luckiest Card',
                text = {
                    '{C:green}#1# in #2#{} chance',
                    'for {C:mult}+#3#{} Mult',
                    '{C:green}#4# in #5#{} chance',
                    'to win {C:money}$#6#{}',
                    '{C:green}#7# in #8#{} chance',
                    'to create {C:attention}#9#{} {C:dark_edition}Negative{} {V:1}Food{}',
                }
            },
            m_giga_perfectGold = {
                name = 'Perfect Gold Card',
                text = {
                    '{C:money}$#1#{} if this',
                    'card is held in hand',
                    'at end of round',
                    'Increase by {C:money}$#2#{} if played',
                }
            },
        },
        Giga_Food = {
            c_giga_tacos = {
                name = 'Tacos',
                text = {
                    'A delicious Tacos that',
                    'gives you {C:money}$#1#{}'
                }
            },
            c_giga_guacamole = {
                name = 'Guacamole',
                text = {
                    'A delicious Guacamole that',
                    'makes you draw {C:attention}#1#{} card',
                }
            },
            c_giga_hotDog = {
                name = 'Hot-Dog',
                text = {
                    'A delicious Hot-Dog that',
                    'enhance {C:attention}#1#{} card',
                    'into {C:dark_edition}Soil{} card',
                    '{s:0.5}"I wonder what could happen if its already soil"{}'
                }
            },
            c_giga_caesarSalad = {
                name = 'Caesar Salad',
                text = {
                    'A delicious Caesar Salad that',
                    'will give a {C:tarot}Tarot{} in {C:attention}#1#{} rounds',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_clubSandwich = {
                name = 'Club Sandwich',
                text = {
                    'A delicious Club Sandwich that',
                    'will give a {C:planet}Planet{} in {C:attention}#1#{} rounds',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_pho = {
                name = 'Pho',
                text = {
                    'A delicious Pho that will give a',
                    '{C:spectral}Spectral{} card in {C:attention}#1#{} rounds',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_spaghetti = {
                name = 'Spaghetti',
                text = {
                    'A delicious Spaghetti that',
                    'enhance {C:attention}#1#{} card',
                    'into {C:dark_edition}Bonus{} card'
                }
            },
            c_giga_steak = {
                name = 'Steak',
                text = {
                    'A delicious Steak that',
                    'enhance {C:attention}#1#{} card',
                    'into {C:dark_edition}Stone{} card'
                }
            },
            c_giga_sushis = {
                name = 'Sushis',
                text = {
                    'Some delicious Sushis that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:dark_edition}Mult{} card'
                }
            },
            c_giga_sugarPie = {         
                name = 'Sugar Pie',
                text = {
                    'A delicious Sugar Pie that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:dark_edition}Lucky{} card'
                }
            },
            c_giga_Untitled2 = {            
                name = '[Untitled]',
                text = {
                    'Some delicious [Untitled] that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:dark_edition}Glass{} card'
                }
            },
            c_giga_salmon = {
                name = 'Salmon',
                text = {
                    'A delicious Salmon that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:dark_edition}Gold{} card'
                }
            },
            c_giga_Untitled4 = {
                name = '[Untitled]',
                text = {
                    'Some delicious [Untitled] that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:dark_edition}Wild{} card'
                }
            },
            c_giga_lollipop = {
                name = 'Lollipop',
                text = {
                    'A delicious Lollipop that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:dark_edition}Steel{} card'
                }
            },
            c_giga_Untitled5 = {
                name = '[Untitled]',
                text = {
                    'Some delicious [Untitled] that',
                    'create {C:attention}#1#{} random',
                    '{C:hearts}Heart{} suit card'
                }
            },
            c_giga_Untitled6 = {
                name = '[Untitled]',
                text = {
                    'Some delicious [Untitled] that',
                    'create {C:attention}#1#{} random',
                    '{C:spades}Spade{} suit card'
                }
            },
           c_giga_gummyBear = {
                name = 'Gummy Bear',
                text = {
                    'A delicious Gummy Bear that',
                    'create {C:attention}#1#{} random',
                    '{C:diamonds}Diamond{} suit card'
                }
            },
            c_giga_Untitled8 = {
                name = '[Untitled]',
                text = {
                    'Some delicious [Untitled] that',
                    'create {C:attention}#1#{} random',
                    '{C:clubs}Club{} suit card'
                }
            },
            c_giga_pBJSandwich = {
                name = 'PB&J Sandwich',
                text = {
                    'A delicious PB&J Sandwich that',
                    'permenantly add {C:mult}+#1#{} Mult',
                    'to {C:attention}#2#{} selected card'
                }
            },
            c_giga_burger = {
                name = 'Burger',
                text = {
                    'A delicious Burger that',
                    'permenantly add {C:chips}+#1#{} Chips',
                    'to {C:attention}#2#{} selected card'
                }
            },
            c_giga_fruitSalad = {
                name = 'Fruit Salad',
                text = {
                    'A delicious Fruit Salad that',
                    '{C:attention}upgrade{} the enhancement of',
                    '{C:attention}#1#{} card'
                }
            },
            c_giga_Untitled9 = {
                name = '[Untitled]',
                text = {
                    'A delicious [Untitled] that',
                    'that convert {C:attention}#1#{} card',
                    'into {C:hearts}Heart{} suit'
                }
            },
            c_giga_Untitled10 = {
                name = '[Untitled]',
                text = {
                    'A delicious [Untitled]',
                    'that convert {C:attention}#1#{} card',
                    'into {C:spades}Spade{} suit'
                }
            },
            c_giga_Untitled11 = {
                name = '[Untitled]',
                text = {
                    'A delicious [Untitled]',
                    'that convert {C:attention}#1#{} card',
                    'into {C:diamonds}Diamond{} suit'
                }
            },
            c_giga_Untitled12 = {
                name = '[Untitled]',
                text = {
                    'A delicious [Untitled]',
                    'that convert {C:attention}#1#{} card',
                    'into {C:clubs}Club{} suit'
                }
            },
            c_giga_birthdayCake = {
                name = 'Birthday Cake',
                text = {
                    'A delicious Birthday Cake that will',
                    'permanently give you {C:attention}+#1#{} Consumable',
                    'slot in {C:attention}#2#{} rounds',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_turkey = {
                name = 'Turkey',
                text = {
                    'A delicious Turkey that will',
                    'permanently give you {C:dark_edition}+#1#{}',
                    'Joker slot in {C:attention}#2#{} rounds',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_hawaiianPizza = {
                name = 'Hawaiian Pizza',
                text = {
                    'A delicious Hawaiian Pizza that',
                    'will give a {C:cry_code}Code{} in {C:attention}#1#{} rounds',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_UntitledCM1 = {
                name = '[UntitleCM]',
                text = {
                    'A delicious [UntitledCM] that',
                    'create {C:attention}#1#{} random',
                    '{C:paperback_crowns}Crown{} suit card'
                }
            },
            c_giga_UntitledCM2 = {
                name = '[UntitleCM]',
                text = {
                    'A delicious [UntitledCM] that',
                    'create {C:attention}#1#{} random',
                    '{C:paperback_stars}Star{} suit card'
                }
            },
            c_giga_UntitledCM3 = {
                name = '[UntitleCM]',
                text = {
                    'A delicious [UntitledCM] that',
                    'will give a {C:paperback_minor_arcana}Minor Arcana{} in',
                    '{C:attention}#1#{} rounds',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_UntitledCM4 = {
                name = '[UntitledCM]',
                text = {
                    'A delicious [UntitledCM]',
                    'that convert {C:attention}#1#{} card',
                    'into {C:clubs}Crown{} suit'
                }
            },
            c_giga_UntitledCM5 = {
                name = '[UntitledCM]',
                text = {
                    'A delicious [UntitledCM]',
                    'that convert {C:attention}#1#{} card',
                    'into {C:paperback_stars}Star{} suit'
                }
            },
        },
        Joker={
            j_giga_cashPass = {
                name = 'Cash Pass',
                text = {
                    'When blind is selected,',
                    'earn {C:money}$#1#{}',
                    '{X:mult,C:white}X#2#{} Mult'
                }
            },
            j_giga_blueChicken = {
                name = 'Blue Chicken',
                text = {
                    'Create a {C:attention}Blue Egg{}',
                    'every {C:attention}4{} round and',
                    'gain {C:chips}+#1#{} Chips',
                    '{C:inactive}(Currently: {C:attention}#2#{C:inactive} round left)',
                    '{C:inactive}(Must have room)'
                }
            },
            j_giga_blueEgg = {
                name = 'Blue Egg',
                text = {
                    'This egg feels... Blue ?!?!'
                }
            },
            j_giga_kingOfJacks = {
                name = 'King of Jacks',
                text = {
                    'Gain {X:mult,C:white}X#1#{} Mult for',
                    'each {C:attention}Jack{} played',
                    '{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)'
                }
            },
            j_giga_funnyCrown = {
                name = 'Funny Crown',
                text = {
                   'After {C:attention}2{} round,',
                    'sell this Joker to create',
                    'a {C:attention}King of Jacks{} and',
                    'a {C:chips}Bonus{} {C:attention}Jack{}',
                    '{C:inactive}(Currently: {C:attention}#1#{}{C:inactive} round left)',
                    '{C:inactive}(Must have room)'
                }
            },
            j_giga_snapchatGirl = {
                name = 'Snapchat Girl',
                text = {
                    '{C:green}#1# in #2#{} to create',
                    'a {C:legendary}Legendary{} Joker on',
                    'selling, otherwise {C:money}$#3#{}'
                }
            },
            j_giga_tRex = {
                name = 'T-Rex',
                text = {
                    'Every other rounds, create a {C:tarot}Tarot{}',
                    'and destroy a random comsumable',
                    'for gaining {C:mult}+#1#{} Mult and {C:chips}+#2# Chips{}',
                    '(Currently {C:mult}+#3#{} Mult / {C:chips}+#4#{} Chips)',
                    '{C:inactive}(Currently: {C:attention}#5#{C:inactive} round left)'
                }
            },
            j_giga_velocyraptor = {
                name = 'Velocyraptor',
                text = {
                    '{C:mult}+#1#{} Mult if played hand does not',
                    'contains an {C:attention}Ace{}'
                }
            },
            j_giga_highRiskHighReward = {
                name = 'High Risk, High Reward',
                text = {
                    '{X:mult,C:white}X#1#{} Mult if played poker hand',
                    'is {C:money}High Card{}',
                    '{C:green}#2# in #3#{} to destroy the card'
                }
            },
            j_giga_shreddedAce = {
                name = 'Shredded Ace',
                text = {
                    'Create an {C:attention}Ace{} when',
                    'blind is selected',
                    '{C:mult}+#1#{} Mult for each',
                    '{C:attention}Ace{} played'
                }
            },
            j_giga_pteranodon = {
                name = 'Pteranodon',
                text = {
                    'If scored hand is a single {C:attention}5{},',
                    'destroy it to create a {C:planet}Planet{}',
                    'and gain {C:money}$#1#{}'
                }
            },
            j_giga_pablo = {
                name = 'Pablo',
                text = {
                    'Each other round, Pablo cook',
                    'some Mexican {V:1}Food{} for you',
                    '{C:inactive}(Currently: {C:attention}#1#{C:inactive} round left)',
                    '{C:inactive}(Must have room)'
                }
            },
            j_giga_jackMutator = {
                name = 'Jack Mutator',
                text = {
                    'Modify rank of a random card',
                    'to Jack every {C:attention}#1#{} round',
                    '{C:inactive}(Currently: {C:attention}#2#{C:inactive} round left)',
                    '{s:0.5}"I wonder what could happen if its already a Jack"{}'
                }
            },
            j_giga_blueEyesWhiteDragon = {
                name = 'Blue-Eyes White Dragon',
                text = {
                    'Give {C:mult}+#1#{} Mult for each',
                    '{C:clubs}Club{} played and {X:mult,C:white}X#2#{} Mult',
                    'for each {C:attention}8{}'
                }
            },
            j_giga_redEyesBlackDragon = {
                name = 'Red-Eyes Black Dragon',
                text = {
                    'Give {C:mult}+#1#{} Mult for each',
                    '{C:spades}Spade{} played and {X:mult,C:white}X#2#{} Mult',
                    'for each {C:attention}Jack{}'
                }
            },
            j_giga_byud = {
                name = 'Blue-Eyes Ultimate Dragon',
                text = {
                    '{s:1.25}They say that three dragons{}',
                    '{s:1.25}is better than one, I dont{}',
                    '{s:1.25}think so{}',
                }
            },
            j_giga_dmk = {
                name = 'Dragon Master Knight',
                text = {
                    '{s:1.25}You know what is stronger{}',
                    '{s:1.25}than a Ultimate Dragon,{}',
                    '{s:1.25}a Tamed Ultimate Dragon{}',
                }
            },
            j_giga_blackLusterSoldier = {
                name = 'Black Luster Soldier',
                text = {
                    'Give {C:mult}+#1#{} Mult for each',
                    'card played and {X:mult,C:white}X#2#{} Mult',
                    'for each {C:attention}9{}'
                }
            },
            j_giga_darkMagician = {
                name = 'Dark Magician',
                text = {
                    'Give {C:mult}+#1#{} Mult for each',
                    '{C:diamond}Diamond{} played and {X:mult,C:white}X#2#{} Mult',
                    'for each {C:attention}7{}'
                }
            },
            j_giga_moc = {
                name = 'Master of Chaos',
                text = {
                    '{s:1.25}Imagine an absolute soldier{}',
                    '{s:1.25}that has mastered magic.{}',
                    '{s:1.25}Thats him !{}'
                }
            },
            j_giga_pinkTourmaline = {
                name = 'Pink Tourmaline',
                text = {
                    '{C:mult}+#1#{} Mult for each',
                    '{C:dark_edition}Holographic{} card held in hand'
                }
            },
            j_giga_moonstone = {
                name = 'Moonstone',
                text = {
                    '{C:chips}+#1#{} Chips for each',
                    '{C:dark_edition}Foil{} card held in hand'
                }
            },
            j_giga_rainbowQuartz = {
                name = 'Rainbow Quartz',
                text = {
                    '{X:mult,C:white}X#1#{} Mult for each',
                    '{C:dark_edition}Polychrome{} card held in hand',
                    '{s:0.9,C:inactive}Start at X1 Mult{}'
                }
            },
            j_giga_llotfo = {
                name = {'Left Leg of', 'The Forbidden One'},
                text = {
                    '{C:chips}+#1#{} Chips',
                    'for each {C:spades}Spade{} played'
                }
            },
            j_giga_rlotfo = {
                name = {'Right Leg of', 'The Forbidden One'},
                text = {
                    '{C:chips}+#1#{} Chips',
                    'for each {C:clubs}Club{} played'
                }
            },
            j_giga_raotfo = {
                name = {'Right Arm of', 'The Forbidden One'},
                text = {
                    '{C:chips}+#1#{} Chips',
                    'for each {C:diamonds}Diamond{} played'
                }
            },
            j_giga_laotfo = {
                name = {'Left Arm of', 'The Forbidden One'},
                text = {
                    '{C:chips}+#1#{} Chips',
                    'for each {C:hearts}Heart{} played'
                }
            },
            j_giga_etfo = {
                name = {'{s:1.2}Exodia{}', 'The Forbidden One'},
                text = {
                    '{C:chips}+#1#{} Chips',
                    'for each card played'
                }
            },
            j_giga_tlei = {
                name = {'The Legendary', 'Exodia Incarnate'},
                text = {
                    '{s:1.4,E:1}Unleash the Beast{}'
                }
            },
            j_giga_paleontologist = {
                name = 'Paleontologist',
                text = {
                    '{C:chips}+#1#{} Chips for each',
                    '{C:dark_edition}Soil{} card played'
                }
            },
            j_giga_paleoExpert = {
                name = 'Paleo Expert',
                text = {
                    '{C:mult}+#1#{} Chips for each',
                    '{C:dark_edition}Soil{} card played'
                }
            },
            j_giga_refinery = {
                name = 'Refinery',
                text = {
                    'Earn {C:money}$#1#{} for each consecutive',
                    '{C:dark_edition}Stone{} card played at the end of',
                    'the round. Reset otherwise',
                    '{C:inactive}Curently: {C:money}$#2#{}'
                }
            },
            j_giga_crystalOfHungriness = {
                name = 'Crystal of Hungriness',
                text = {
                    '{X:mult,C:white}X#1#{} Mult, increase',
                    'by {X:mult,C:white}X#2#{} for each',
                    '{V:1}Food{} card used',
                }
            },
            j_giga_doubleFork = {
                name = 'Double Fork',
                text = {
                    'Using a {V:1}Food{} card',
                    'during a blind, give a',
                    'temporary {X:chips,C:white}X#1#{} Chips',
                    '{C:inactive}#2#'
                }
            },
            j_giga_crackedSkull = {
                name = 'Cracked Skull',
                text = {
                    'Using a {C:spectral}Spectral{} card',
                    'during a blind, give a',
                    'temporary {X:mult,C:white}X#1#{} Mult',
                    '{C:inactive}#2#'
                }
            },
            j_giga_sagittariusA = {
                name = 'Sagittarius A*',
                text = {
                    'Using a {C:planet}Planet{} card',
                    'during a blind, give a',
                    'temporary {C:chips}+#1#{} Chips',
                    '{C:inactive}#2#'
                }
            },
            j_giga_colourfulCrystal = {
                name = 'Colourful Crystal',
                text = {
                    '{C:mult}+#1#{} Mult if played',
                    'hand contains a {C:attention}Flush{}',
                    'otherwise {C:mult}#2#{} Mult'
                }
            },
        },
        Other={
            --Undiscovered
            undiscovered_food = {
                name = "Not Discovered",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does"
                }
            },
            -- Credit
            ledugs_credit = {
                name = "Credit",
                text = {
                    "Original idea",
                    "by {C:green,E:2}le_dugs{}",
                }
            },
            yugioh_credit = {
                name = "Credit",
                text = {
                    'Artwork and name',
                    'from {C:red,E:2}Yu-Gi-Oh!{}'
                }
            },
            -- Enhancement
            soil_def = {
                name = "Soil",
                text = {
                    '{X:chips,C:white}X1.1{} Chips'
                }
            },
            richSoil_def = {
                name = "Rich Soil",
                text = {
                    '{X:chips,C:white}X#1.4{} Chips',
                    '{C:mult}+7{} Mult'
                }
            },
            fossilSoil_def = {
                name = "Fossil Soil",
                text = {
                    '{X:chips,C:white}X2{} Chips',
                    '{X:mult,C:white}X1.5{} Mult'
                }
            },
            -- Secret Joker
            byud_effect = {
                name = 'Effects',
                text = {
                    '{C:mult}+50{} Mult for each card',
                    '{X:mult,C:white}X1.5{} Mult for each {C:clubs}Club{}',
                    '{X:mult,C:white}X4{} Mult for card that',
                    'equal or over {C:attention}8{}'
                }
            },
            dmk_effect = {
                name = 'Effects',
                text = {
                    '{C:mult}+80{} Mult for each card',
                    '{X:mult,C:white}X2.5{} Mult for each {C:clubs}Club{}',
                    '{X:mult,C:white}X6{} Mult for card that',
                    'equal or over {C:attention}7{}'
                }
            },
            moc_effect = {
                name = 'Effects',
                text = {
                    '{C:mult}+15{} Mult for each card',
                    '{C:mult}+25{} Mult for each {C:diamonds}Diamond{}',
                    '{X:mult,C:white}X3{} Mult for card that',
                    'equal or under {C:attention}9{}'
                }
            },
            tlei_effect = {
                name = 'Effects',
                text = {
                    'Disable the {C:attention}Boss Blind{}',
                    '{X:mult,C:white}X50{} Mult'
                }
            }

        },
        Partner = {
            pnr_giga_pabloJr = {
                name = 'Pablo Jr.',
                text = {
                    '{C:green}#1# in #2#{} chance',
                    'to {C:attention}upgrade{} the',
                    'enhancement of',
                    'played card'
                }
            }
        },
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Tarot={
            c_giga_cook = {
                name = 'Cook',
                text = {
                    'Create up to {C:attention}#1#{}',
                    '{V:1}Food{} cards'
                }
            },
        },
        Voucher={
            v_giga_newMenu = {
                name = 'New Menu',
                text = {
                    'Restaurant Pack have',
                    '{C:attention}#1#{} more choice'
                }
            },
            v_giga_foodTruck = {
                name = 'Food Truck',
                text = {
                    '{V:1}Food{} cards can',
                    'appear in the {C:attention}shop'
                }
            },
            v_giga_homeDelivery = {
                name = 'Home Delivery',
                text = {
                    "{V:1}Food{} cards appear",
                    "{C:attention}2.5X{} more frequently"
                }
            }
        },
        ["Content Set"] = {
            set_giga_megaLegendary = {
                name = 'Mega Legendary'
            }   
        }
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_stakes={},
        challenge_names={},
        collabs={},
        dictionary={
            k_restaurant_pack = "Restaurant Pack",
            b_giga_custom_menu_card = "Disable Custom Menu Joker"
        },
        high_scores={},
        labels={},
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorials={},
        v_dictionary={},
        v_texts={}
    }
}