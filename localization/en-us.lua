return {
    descriptions = {
        Back={
            b_giga_foodie = {
                name = "Foodie's Deck",
                text = {
                    'Creates a {C:giga_Food}Food{}',
                    'card at the start',
                    'of every round and',
                    'starts with {C:attention,T:v_giga_foodTruck}Food Stand{}'
                }
            },
            b_giga_reverseCheckered = {
                name = "Reverse Checkered Deck",
                text = {
                    'Start run with',
                    '{C:attention}26{C:clubs} Clubs{} and',
                    '{C:attention}26{C:diamonds} Diamonds{} in deck'
                },
            },
            b_giga_momentum = {
                name = 'Momentum Deck',
                text = {
                    'Antes go faster',
                    '{C:inactive}(1>2>4>6>8)',
                    '{C:money}+#1#{} hand size'
                }
            },
            b_giga_gamblingAddict = {
                name = 'Gambling Addict Deck',
                text = {
                    "This game isn't",
                    'about winning, its',
                    'about {C:attention,E:1,T:j_giga_stockMarket}GAMBLING{}',
                }
            },
            b_giga_drrunnkiDaecpk = {
                name = 'Drrunnki Daecpk',
                text = {
                    'Naaaaaaaaaaaah, IIIIm not',
                    'drunk, you eat pizzzzzzzzza',
                    'Oh shiiiit, I shit on myself'
                }
            }
        },
        Blind={
            bl_giga_selfish = {
                name = 'The Selfish',
                text = {
                    'If 5 cards are',
                    'discard, loose $5'
                }
            },
            bl_giga_base = {
                name = 'The Base',
                text = {
                    '+0.25X blind size',
                    'for each upgraded',
                    'card in deck'
                }
            }
        },
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
                    'to create {C:attention}#9#{} {C:giga_Food}Food{}'
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
            m_giga_titanium = {
                name = 'Titanium Card',
                text = {
                    '{X:mult,C:white}X#1#{} if this',
                    'card is held in hand',
                    'Increase by {X:mult,C:white}X#2#{} if played',
                }
            },
            m_giga_reinforcedGlass = {
                name = 'Reinforced Glass Card',
                text = {
                    '{X:mult,C:white}X#1#{} Mult',
                    '{C:green}#2# in #3#{} chance to',
                    'destroy card and ',
                    'create {C:spectral}Spectral{} card'
                }
            },
            m_giga_evolvedWild = {
                name = 'Evolved Wild Card',
                text = {
                    '{C:mult}+#1#{} Mult, {C:chips}+#2#{} Chips',
                    'increase by {C:mult}+#3#{} Mult,',
                    '{C:chips}+#4#{} Chips when {C:attention}played{}',
                    '{C:inactive,s:0.7}This effect is temporary{}'
                }
            }
        },
        Giga_Food = {
            c_giga_tacos = {
                name = 'Tacos',
                text = {
                    'Some delicious Tacos that',
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
                    'into {C:attention}Soil card{}'
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
                    'into {C:attention}Bonus card{}'
                }
            },
            c_giga_steak = {
                name = 'Steak',
                text = {
                    'A delicious Steak that',
                    'enhance {C:attention}#1#{} card',
                    'into {C:attention}Stone card{}'
                }
            },
            c_giga_sushis = {
                name = 'Sushis',
                text = {
                    'Some delicious Sushis that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:attention}Mult card{}'
                }
            },
            c_giga_sugarPie = {         
                name = 'Sugar Pie',
                text = {
                    'A delicious Sugar Pie that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:attention}Lucky card{}'
                }
            },
            c_giga_durian = {            
                name = 'Durian',
                text = {
                    'A delicious Durian that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:attention}Glass card{}'
                }
            },
            c_giga_salmon = {
                name = 'Salmon',
                text = {
                    'A delicious Salmon that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:attention}Gold card{}'
                }
            },
            c_giga_waffle = {
                name = 'Waffle',
                text = {
                    'A delicious Waffle that',
                    'enhances {C:attention}#1#{} card',
                    'into a {C:attention}Wild card{}'
                }
            },
            c_giga_lollipop = {
                name = 'Lollipop',
                text = {
                    'A delicious Lollipop that',
                    'enhances {C:attention}#1#{} card',
                    'into a {C:attention}Steel card{}'
                }
            },
            c_giga_quicheLorraine = {
                name = 'Quiche Lorraine',
                text = {
                    'Some delicious Quiche Lorraine',
                    'that creates {C:attention}#1#{}',
                    'random {C:hearts}Heart{} suit card'
                }
            },
            c_giga_paella = {
                name = 'Paella',
                text = {
                    'A delicious Paella that',
                    'creates {C:attention}#1#{} random',
                    '{C:spades}Spade{} suit card'
                }
            },
           c_giga_gummyBear = {
                name = 'Gummy Bear',
                text = {
                    'A delicious Gummy Bear that',
                    'creates {C:attention}#1#{} random',
                    '{C:diamonds}Diamond{} suit card'
                }
            },
            c_giga_empanadas = {
                name = 'Empanadas',
                text = {
                    'Some delicious Empanadas that',
                    'creates {C:attention}#1#{} random',
                    '{C:clubs}Club{} suit card'
                }
            },
            c_giga_pBJSandwich = {
                name = 'PB&J Sandwich',
                text = {
                    'A delicious PB&J Sandwich that',
                    'permenantly adds {C:mult}+#1#{} Mult',
                    'to {C:attention}#2#{} selected card'
                }
            },
            c_giga_burger = {
                name = 'Burger',
                text = {
                    'A delicious Burger that',
                    'permanently add {C:chips}+#1#{} Chips',
                    'to {C:attention}#2#{} selected card'
                }
            },
            c_giga_fruitSalad = {
                name = 'Fruit Salad',
                text = {
                    'A delicious Fruit Salad that',
                    '{C:attention}upgrades{} the enhancement of',
                    '{C:attention}#1#{} card'
                }
            },
            c_giga_ramen = {
                name = 'Ramen',
                text = {
                    'A delicious Ramen that',
                    'that converts {C:attention}#1#{} card',
                    'into {C:hearts}Heart{} suit'
                }
            },
            c_giga_chocolateBar = {
                name = 'Chocolate Bar',
                text = {
                    'A delicious Chocolate Bar',
                    'that converts {C:attention}#1#{} card',
                    'into {C:spades}Spade{} suit'
                }
            },
            c_giga_macNCheese = {
                name = "Mac n' Cheese",
                text = {
                    "A delicious Mac n' Cheese",
                    'that converts {C:attention}#1#{} card',
                    'into {C:diamonds}Diamond{} suit'
                }
            },
            c_giga_blueberryMuffin = {
                name = 'Blueberry Muffin',
                text = {
                    'Some delicious Blueberry',
                    'Muffin that converts {C:attention}#1#{}',
                    'card into {C:clubs}Club{} suit'
                }
            },
            c_giga_donut = {
                name = 'Donut',
                text = {
                    'Some delicious Donuts',
                    'that adds a {V:1}Pink Seal{}',
                    'on {C:attention}#1#{} card in {C:attention}#2#{} rounds',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_cranberryJuice = {
                name = 'Cranberry Juice',
                text = {
                    'A delicious Cranberry Juice',
                    'that adds a {V:1}Crimson Seal{}',
                    'on {C:attention}#1#{} card in {C:attention}#2#{} rounds',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_bubbleTea = {
                name = 'Bubble Tea',
                text = {
                    'A delicious Bubble Tea that',
                    'adds an {V:1}Aqua Seal{} on {C:attention}#1#{}',
                    'card in {C:attention}#2#{} rounds',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_bagOfCandy = {
                name = 'Bag of Candy',
                text = {
                    'A delicious Bag of Candy',
                    'that {C:attention}upgrade{} the seal',
                    'of {C:attention}#1#{} card'
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
            c_giga_poutine = {
                name = 'Poutine',
                text = {
                    'A delicious Poutine that will',
                    'permanently give you {C:attention}+#1#{}',
                    'hand size in {C:attention}#2#{} rounds',
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
            c_giga_appleJuice = {
                name = 'Apple Juice',
                text = {
                    'A delicious Apple Juice that',
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
            c_giga_migas = {
                name = 'Migas',
                text = {
                    'Some delicious Migas that',
                    'will give an {C:purple}Aberration{}',
                    'card in {C:attention}#1#{} rounds',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_bananaSplit = {
                name = 'Banana Split',
                text = {
                    'A delicious Banana Split that',
                    'will give a {C:attention}Power{} card',
                    'in {C:attention}#1#{} rounds',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_marshmallow = {
                name = 'Marshmallows',
                text = {
                    'Some delicious Marshmallows that',
                    'will destroy {C:attention}#1#{} card'
                }
            }
        },
        Joker={
            --#Region Normal
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
                    '{C:chips}+#1#{} Chips',
                    'Create a {C:attention}Blue Egg{}',
                    'every {C:attention}3{} round',
                    '{C:inactive}(Currently: {C:attention}#2#{C:inactive} round left)',
                    '{C:inactive}(Must have room)'
                }
            },
            j_giga_blueEgg = {
                name = 'Blue Egg',
                text = {
                    'Give {C:money}$#1#{} at end',
                    'of round',
                    'Create an {C:attention}Egg{}',
                    'when sold'
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
                    '{C:green}#1# in #2#{} chance to',
                    'create a {C:legendary}Legendary{}',
                    'Joker on selling',
                    'Otherwise {C:money}$#3#{}'
                }
            },
            j_giga_tRex = {
                name = 'T-Rex',
                text = {
                    'Every other rounds, create a {V:1}#1#{}',
                    'and destroy a random comsumable',
                    'for gaining {C:mult}+#2#{} Mult and {C:chips}+#3#{} Chips',
                    '(Currently {C:mult}+#4#{} Mult / {C:chips}+#5#{} Chips)',
                }
            },
            j_giga_velocyraptor = {
                name = 'Velocyraptor',
                text = {
                    '{C:mult}+#1#{} Mult if played hand does',
                    'not contains an {C:attention}Ace{}'
                }
            },
            j_giga_highRiskHighReward = {
                name = 'High Risk, High Reward',
                text = {
                    '{X:mult,C:white}X#1#{} Mult if played poker hand',
                    'is {C:money}High Card{}',
                    '{C:green}#2# in #3#{} chance to destroy',
                    'the card'
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
                    'destroy it to create a {V:1}#1#{}',
                    'and gain {C:money}$#2#{}'
                }
            },
            j_giga_pablo = {
                name = 'Pablo',
                text = {
                    'Each other round, Pablo cook',
                    'some Mexican {C:giga_Food}Food{} for you',
                    '{C:inactive}({C:attention}#1#{C:inactive} round left)',
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
                text = {{
                    '{s:1.25}They say that three dragons{}',
                    '{s:1.25}is better than one, I dont{}',
                    '{s:1.25}think so{}',
                },{
                    '{C:mult}+#1#{} Mult for each card',
                    '{X:mult,C:white}X#2#{} Mult for each {C:clubs}Club{}',
                    '{X:mult,C:white}X#3#{} Mult for card that',
                    'is equal or over {C:attention}8{}'
                }}
            },
            j_giga_dmk = {
                name = 'Dragon Master Knight',
                text = {{
                    '{s:1.25}You know what is stronger{}',
                    '{s:1.25}than a Ultimate Dragon,{}',
                    '{s:1.25}a Tamed Ultimate Dragon{}',
                },{
                    '{C:mult}+#1#{} Mult for each card',
                    '{X:mult,C:white}X#2#{} Mult for each {C:clubs}Club{}',
                    '{X:mult,C:white}X#2#{} Mult for card that',
                    'is equal or over {C:attention}7{}'
                }}
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
                text = {{
                    '{s:1.25}Imagine an absolute soldier{}',
                    '{s:1.25}that has mastered magic.{}',
                    '{s:1.25}Thats him !{}'
                },{
                    '{C:mult}+#1#{} Mult for each card',
                    '{C:mult}+#2#{} Mult for each {C:diamonds}Diamond{}',
                    '{X:mult,C:white}X#3#{} Mult for card that',
                    'is equal or under {C:attention}9{}'
                }}
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
                    '{C:dark_edition}Polychrome{} card held in hand'
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
                text = {{
                    '{s:1.4,E:1}Unleash the Beast{}'
                },{
                    'Disable the {C:attention}Boss Blind{}',
                    '{X:mult,C:white}X#1#{} Mult'
                }}
            },
            j_giga_paleontologist = {
                name = 'Paleontologist',
                text = {
                    '{C:chips}+#1#{} Chips for each',
                    '{C:attention}Soil{} card played'
                }
            },
            j_giga_paleoExpert = {
                name = 'Paleo Expert',
                text = {
                    '{C:mult}+#1#{} Mult for each',
                    '{C:attention}Soil{} card played'
                }
            },
            j_giga_refinery = {
                name = 'Refinery',
                text = {
                    'Earn {C:money}$#1#{} for each consecutive',
                    '{C:attention}Stone{} card played at the end of',
                    'the round. Reset otherwise',
                    '{C:inactive}Curently: {C:money}$#2#{}'
                }
            },
            j_giga_crystalOfHungriness = {
                name = 'Crystal of Hungriness',
                text = {
                    '{X:mult,C:white}X#1#{} Mult, increase',
                    'by {X:mult,C:white}X#2#{} for each',
                    '{C:giga_Food}Food{} card used',
                }
            },
            j_giga_doubleFork = {
                name = 'Double Fork',
                text = {
                    'Using a {C:giga_Food}Food{} card',
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
            j_giga_monochromeCrystal = {
                name = 'Monochrome Crystal',
                text = {
                    '{C:mult}+#1#{} Mult if played',
                    'hand contains a {C:attention}Flush{}',
                    'otherwise {C:mult}#2#{} Mult'
                }
            },
            j_giga_marvinTheFourth = {
                name = 'Marvin, The Fourth',
                text = {
                    'Give {C:chips}+#1#{} Chips and {X:mult,C:white}X#2#{} Mult',
                    'for each {C:attention}4{}, {C:attention}5{} or {C:attention}6{} of {V:1}#3#{}',
                    '{C:inactive}Suit change for each card played{}'
                }
            },
            j_giga_upgradedTicket = {
                name = 'Upgraded Ticket',
                text = {
                    'Cards with {C:attention}upgraded enhancements{}',
                    'give {C:money}$#1#{} each and with',
                    '{C:attention}upgraded seals{} {C:money}$#2#{} each',
                    'when {C:attention}discard{}'
                }
            },
            j_giga_healthyRoots = {
                name = 'Healthy Roots',
                text = {
                    'Give {C:mult}+#1#{} for',
                    'each cards that as the',
                    'same rank as the {C:attention}first{}',
                    '{C:attention}held{} in hand card'
                }
            },
            j_giga_nahnahu = {
                name = 'Nahnahu',
                text = {
                    'Give {C:mult}+#1#{} Mult for each',
                    '{V:1}#2#{} card in the deck',
                    '{C:inactive}Suit change every round{}',
                    '{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)'
                }
            },
            j_giga_hergosu = {
                name = 'Hergosu',
                text = {
                    '{C:green}#1# in #2#{} chance to',
                    'give {C:dark_edition}+#3#{} Joker slot',
                    'when using a {C:dark_edition}Soul{}'
                }
            },
            j_giga_tabaosl = {
                name = 'Tabaosl',
                text = {
                    '{C:attention}Upgrade{} the {C:attention}enhancement{}',
                    'of the {C:attention}first{} and',
                    '{C:attention}second{} played card'
                }
            },
            j_giga_stockMarket = {
                name = 'Stock Market',
                text = {
                    'Each time you play a {C:attention}face{}',
                    'card, invest {C:money}$#1#{}',
                    'The cash invested will',
                    'fluctuate at end of hand',
                    '{C:attention}Cashout{} at the end',
                    'of {C:attention}Boss Blind{}',
                    '{C:inactive}Curently: {C:money}$#2#{}'
                }
            },
            j_giga_triceratops = {
                name = 'Triceratops',
                text = {
                    '{C:green}#1# in #2#{} chance to',
                    'level up played hand',
                    'for each {C:attention}Mult{}',
                    'card played'
                }
            },
            j_giga_bonoboJoker = {
                name = 'Bonobo Joker',
                text = {
                    'Give {C:attention}half{} the {C:attention}chip{} value',
                    'of each {C:attention}held{} in hand',
                    'cards as {C:mult}Mult{}, if {C:attention}5{} cards',
                    'are {C:attention}played{}'
                }
            },
            j_giga_onTheClock = {
                name = 'On The Clock',
                text = {
                    'Get {C:mult}Mult{} and {C:chips}Chips{} based',
                    'on the {C:attention}current time{}',
                    '{C:inactive}(Hours > Mult / Minutes > Chips)'
                }
            },
            j_giga_aliveBook = {
                name = 'Alive Book',
                text = {
                    'Get {C:mult}Mult{} equal to the',
                    '{C:attention}lenght{} of the {C:attention}name{} of',
                    'the leftmost {C:attention}Joker{}',
                    '{C:inactive}(Currently :{} {C:mult}+#1#{} {C:inactive}Mult)'
                }
            },
            j_giga_roposiel = {
                name = 'Roposiel',
                text = {
                    'Gains {C:mult}+#1#{} Mult for each Joker',
                    'name that contains a {C:attention}number{}',
                    'or a {C:attention}special character{}.',
                    '{C:inactive}(Currently :{} {C:mult}+#2#{} {C:inactive}Mult)'
                }
            },
            j_giga_rogAno = {
                name = 'Rog-Ano',
                text = {
                    'Gain {X:mult,C:white}X#1#{} Mult for',
                    'each {C:attention}seals{} in {C:attention}deck{}',
                    '{C:inactive}(Currently : {X:mult,C:white}X#2#{} {C:inactive}Mult)'
                }
            },
            j_giga_myt_own = {
                name = 'MrYamiTsu',
                text = {
                    'Played {C:attention}card{} with',
                    '{C:attention}upgraded enhancements{}',
                    'or {C:attention}seals{} give {X:mult,C:white}X#1#{} Mult',
                    'when scored'
                }
            },
            j_giga_factolord = {
                name = 'Factolord',
                text = {
                    'Gain {C:attention}X3{} the',
                    'factorial {B:1,C:white}(!){} for',
                    'the number of empty',
                    'Joker slots as {C:chips}Chips{}',
                    '{C:inactive}(Currently: {C:chips}+#1#{} {C:inactive}Chips)',
                }
            },
            --#endregion
            --#region CrossMod
            j_giga_triceratops_alt = {
                name = 'Triceratops?',
                text = {
                    'Every other rounds, create a {V:1}#1#{}',
                    'and destroy a random comsumable',
                    'for gaining {X:mult,C:white}X#2#{} Mult and {X:chips,C:white}X#3#{} Chips',
                    '(Currently {X:mult,C:white}X#4#{} Mult / {X:chips,C:white}X#5#{} Chips)',
                }
            },
            j_giga_tRex_alt = {
                name = 'T-Rex?',
                text = {
                    'If scored hand is a single {C:attention}6{},',
                    'destroy it to create a {V:1}#1#{}',
                    'and gain {C:money}$#2#{}'
                }
            },
            j_giga_pteranodon_alt = {
                name = 'Pteranodon?',
                text = {
                    '{C:mult}+#1#{} Mult if played hand does',
                    'not contains a {C:attention}2{}'
                }
            },
            j_giga_velocyraptor_alt = {
                name = 'Velocyraptor?',
                text = {
                    '{C:green}#1# in #2#{} chance to',
                    'level up played hand',
                    'for each {C:attention}Bonus{}',
                    'card played'
                }
            },
            j_giga_pinkTourmaline_alt = {
                name = 'Pink Tourmaline?',
                text = {
                    '{X:mult,C:white}X#1#{} Mult for each',
                    '{C:dark_edition}Holographic{} card held in hand'
                }
            },
            j_giga_moonstone_alt = {
                name = 'Moonstone?',
                text = {
                    '{C:mult}+#1#{} Mult for each',
                    '{C:dark_edition}Foil{} card held in hand'
                }
            },
            j_giga_rainbowQuartz_alt = {
                name = 'Rainbow Quartz?',
                text = {
                    '{C:chips}+#1#{} Chips for each',
                    '{C:dark_edition}Polychrome{} card held in hand'
                }
            },
            j_giga_myt_own_alt = {
                name = 'MrYamiTsu?',
                text = {
                    'Gain {X:mult,C:white}X#1#{} Mult for',
                    'each {C:attention}upgraded{} card {C:attention}scored{}',
                    '{C:inactive}(Currently : {X:mult,C:white}X#2#{}{C:inactive})'
                }
            }
            --#endregion
        },
        Other={
            --#region Undiscovered
            undiscovered_Giga_Food = {
                name = 'Not Discovered',
                text = {
                    'Purchase or use',
                    'this card in an',
                    'unseeded run to',
                    'learn what it does'
                }
            },
            --#endregion
            --#region Credit
            ledugs_credit = {
                name = 'Credit',
                text = {
                    'Original idea',
                    'by {C:green,E:2}le_dugs{}'
                }
            },
            jogla_credit = {
                name = 'Credit',
                text = {
                    'Original idea',
                    'by {C:green,E:2}Jogla{}'
                }
            },
            jogla_art_credit = {
                name = 'Credit',
                text = {
                    'Original artworks',
                    'by {C:green,E:2}Jogla{}'
                }
            },
            yugioh_credit = {
                name = 'Credit',
                text = {
                    'Artwork and name',
                    'from {C:red,E:2}Yu-Gi-Oh!{}'
                }
            },
            aij_back_credit = {
                name = 'Credit',
                text = {
                    'Legendary background',
                    'from {C:attention,E:2}All-In-Jest{}'
                }
            },
            --#endregion
            --#region Seal
            giga_pinkseal_seal = {
                name = 'Pink Seal',
                text = {
                    'When this card is {C:attention}scored{},',
                    'create {C:attention}1{} {C:giga_Food}Food{} card',
                }
            },
            giga_crimsonseal_seal = {
                name = 'Crimson Seal',
                text = {
                    'Gain {C:mult}+#1#{} Mult',
                    'permanently while',
                    'held in hand'
                }
            },
            giga_aquaseal_seal = {
                name = 'Aqua Seal',
                text = {
                'Gain {C:chips}+#1#{} Chips',
                'permanently while',
                'held in hand'
                }
            },
            giga_redplus_seal = {
                name = 'Red+ Seal',
                text = {
                    'Retrigger this',
                    'card {C:attention}#1#{} times',
                    '{C:green}#2# in #3#{} chance to',
                    'retrigger {C:attention}#4#{}',
                    'additionnal time'
                }
            },
            giga_blueplus_seal = {
                name = 'Blue+ Seal',
                text = {
                    'Create a {C:planet}Planet{} card',
                    'if this card is',
                    '{C:attention}held{} in hand',
                    '{C:green}#1# in #2#{} chance to',
                    'be {T:c_black_hole}Black Hole{}'
                }
            },
            giga_goldplus_seal = {
                name = 'Gold+ Seal',
                text = {
                    'Earn {C:money}$#1#{} when this',
                    'card is played and',
                    'earn {C:money}+$#2#{} if hand',
                    'contains a {C:attention}Gold{} card'
                }
            },
            giga_purpleplus_seal = {
                name = 'Purple+ Seal',
                text = {
                    'Create {C:attention}#1#{} {C:tarot}Tarot{} card',
                    'when {C:attention}discarded{}',
                    '{C:green}#2# in #3#{} chance to be',
                    '{C:spectral}Spectral{} card instead'
                }
            },
            giga_redplusplus_seal = {
                name = 'Red++ Seal',
                text = {
                    'Retrigger this card {C:attention}#1#{}',
                    'times. Retrigger {C:attention}1{} additionnal',
                    'time for each {C:attention}2{} {C:attention}Red++{} Seals',
                    '{C:attention}played{} or {C:attention}held{} in hand'
                }
            },
            giga_blueplusplus_seal = {
                name = 'Blue++ Seal',
                text = {
                    'Create a {C:dark_edition}Negative{} {C:planet}Planet{}',
                    'card if this card is {C:attention}played{}',
                    'or {C:attention}held{} in hand',
                    '{C:green}#1# in #2#{} chance to',
                    'be {T:c_black_hole}Black Hole{}'
                }
            },
            giga_goldplusplus_seal = {
                name = 'Gold++ Seal',
                text = {
                    'Earn {C:money}$#1#{} when this',
                    'card is played, increase',
                    'by {C:money}$#2#{} after hand played',
                    'and earn {C:money}+$#3#{} if hand',
                    'contains a {C:attention}Gold{} card',
                    'Reset at end of round'
                }
            },
            giga_purpleplusplus_seal = {
                name = 'Purple++ Seal',
                text = {
                    'Create {C:attention}#1#{} {C:dark_edition}Negative{} {C:tarot}Tarot{}',
                    'and a {C:attention}Charm Tag{}',
                    'when {C:attention}discarded{}',
                    '{C:green}#2# in #3#{} chance to be',
                    '{C:attention}Ethereal Tag{} instead'
                }
            },
            giga_pinkplus_seal = {
                name = 'Pink+ Seal',
                text = {
                    'When this card is {C:attention}scored{},',
                    'create {C:attention}1{} {C:giga_Food}Food{} card',
                    '{C:green}#1# in #2#{} chance to',
                    'be {C:dark_edition}Negative{}',
                    '{C:attention}Reduce{} blind size by {C:attention}#3#%{}'
                }
            },
            giga_pinkplusplus_seal = {
                name = 'Pink++ Seal',
                text = {
                    'When this card is {C:attention}scored{},',
                    'create {C:attention}#1#{} {C:dark_edition}Negative{}',
                    '{C:giga_Food}Food{} card',
                    '{C:green}#3# in #4#{} chance to be a',
                    '{C:rare}Rare{} {C:giga_Food}Food{} card',
                    '{C:attention}Reduce{} blind size by {C:attention}#2#%{}'
                }
            },
            giga_crimsonplus_seal = {
                name = 'Crimson+ Seal',
                text = {
                    'Gain {C:mult}+#1#{} Mult',
                    'permanently while',
                    'held in hand',
                    '{X:chips,C:white}X#2#{} Chips',
                }
            },
            giga_aquaplus_seal = {
                name = 'Aqua+ Seal',
                text = {
                    'Gain {C:chips}+#1#{} Chips',
                    'permanently while',
                    'held in hand',
                    '{X:mult,C:white}X#2#{} Mult',
                }
            },
            giga_crimsonplusplus_seal = {
                name = 'Crimson++ Seal',
                text = {
                    'Gain {C:mult}+#1#{} Mult',
                    'permanently while',
                    '{C:attention}held{} in hand',
                    'plus {C:mult}+#2#{} for each',
                    '{C:attention}card played{}',
                    '{X:chips,C:white}X#3#{} Chips plus',
                    '{X:chips,C:white}X#4#{} for each',
                    '{C:attention}card held{} in hand'
                }
            },
            giga_aquaplusplus_seal = {
                name = 'Aqua++ Seal',
                text = {
                    'Gain {C:chips}+#1#{} Chips',
                    'permanently while',
                    '{C:attention}held{} in hand',
                    'plus {C:chips}+#2#{} for each',
                    '{C:attention}Joker{} owned',
                    '{X:mult,C:white}X#3#{} Mult plus',
                    '{X:mult,C:white}X#4#{} for each',
                    '{C:attention}Consumable{} card'
                }
            },
            --#endregion
            --#region Real others
            giga_uncopiable_info = {
                name = 'Uncopiable',
                text = {
                    'This card is',
                    '{C:attention}uncopiable{}'
                }
            },
            giga_shiny_chance = {
                name = 'Shiny Chance',
                text = {
                    '{C:attention}8%{} chance to',
                    'replace a {C:dark_edition}#1#{}'

                }
            },
            giga_astral_chance = {
                name = 'Shiny Chance',
                text = {
                    '{C:attention}8%{} chance',
                    'to replace',
                    '{C:attention}#1#{}',

                }
            }
            --#endregion
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
        Planet={
            c_giga_astralMercury = {
                name = 'Astral Mercury',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralJupiter = {
                name = 'Astral Jupiter',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralPluto = {
                name = 'Astral Pluto',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralEris = {
                name = 'Astral Eris',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralPlanetX = {
                name = 'Astral Planet X',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralSaturn = {
                name = 'Astral Saturn',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralEarth = {
                name = 'Astral Earth',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralMars = {
                name = 'Astral Mars',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralCeres = {
                name = 'Astral Mars',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralVenus = {
                name = 'Astral Venus',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralNeptune = {
                name = 'Astral Neptune',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            },
            c_giga_astralUranus = {
                name = 'Astral Uranus',
                text = {
                    '({V:1}lvl.#1#{}) Level up',
                    '{C:attention}#2#{} times',
                    '{C:attention}#3#',
                    '{C:mult}+#4#{} Mult and',
                    '{C:chips}+#5#{} chips'
                }
            }
        },
        Sleeve = {
            sleeve_giga_reverseCheckeredSleeve = {
                name = 'Reversed Checkered Sleeve',
                text = {
                    'Start run with',
                    '{C:attention}26{} {C:clubs}Clubs{} and',
                    '{C:attention}26{} {C:diamonds}Diamonds{} in deck'
                }
            },
            sleeve_giga_reverseCheckeredSleeve_alt = {
                name = 'Reversed Checkered Sleeve',
                text = {
                    '{C:clubs}Clubs{} become {T:m_bonus,C:attention}Bonus{} and',
                    '{C:diamonds}Diamonds{} become {T:m_mult,C:attention}Mult{}'
                }
            },
            sleeve_giga_foodieSleeve = {
                name = "Foodie's Sleeve",
                text = {
                    'Create a {C:giga_Food}Food{}',
                    'card at the start',
                    'of every round'

                }
            }
        },
        Spectral={
            c_giga_salt = {
                name = 'Salt',
                text = {
                    'Add a {V:1}Pink Seal{}',
                    'to {C:attention}#1#{} selected',
                    'card in your hand'
                }
            },
            c_giga_compass = {
                name = 'Compass',
                text = {
                    'Add a {V:1}Crimson Seal{}',
                    'to {C:attention}#1#{} selected',
                    'card in your hand'
                }
            },
            c_giga_wand = {
                name = 'Wand',
                text = {
                    'Add a {V:1}Aqua Seal{}',
                    'to {C:attention}#1#{} selected',
                    'card in your hand'
                }
            },
            c_giga_upgradeSpectral = {
                name = 'Upgrade',
                text = {
                    '{C:attention}Upgrade{} up to',
                    '{C:attention}#1#{} seals'
                }
            }
        },
        Stake={},
        Tag={},
        Tarot={
            c_giga_cook = {
                name = 'The Cook',
                text = {
                    'Create up to {C:attention}#1#{}',
                    '{C:giga_Food}Food{} cards'
                }
            },
            c_giga_upgradeTarot = {
                name = 'Upgrade',
                text = {
                    '{C:attention}Upgrade{} up to',
                    '{C:attention}#1#{} enhancements'
                }
            },
            c_giga_gardener = {
                name = 'The Gardener',
                text = {
                    'Enhances {C:attention}#1#{}',
                    'selected cards to',
                    '{C:attention}Soil Cards{}'
                }
            }
        },
        Voucher={
            v_giga_newMenu = {
                name = 'New Menu',
                text = {
                    'Restaurant Pack have',
                    '{C:attention}#1#{} more card'
                }
            },
            v_giga_5courseMeal = {
                name = '5-Course Meal',
                text = {
                    'Restaurant Pack have',
                    '{C:attention}#1#{} more choice'
                }
            },
            v_giga_foodStand = {
                name = 'Food Stand',
                text = {
                    '{C:giga_Food}Food{} cards can',
                    'appear in the {C:attention}shop'
                }
            },
            v_giga_homeDelivery = {
                name = 'Home Delivery',
                text = {
                    "{C:giga_Food}Food{} cards appear",
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
            b_giga_custom_menu_card = "Disable Custom Menu Joker",
            k_inactive = "Inactive",
            k_active = "Active",
            b_Giga_Food = "Food Cards",
            k_giga_rd = "Ready",
            k_giga_notrd = "Not Ready Yet",
            k_not_allowed_ex = 'No!'
        },
        high_scores={},
        labels={
            giga_pinkseal_seal = 'Pink Seal',
            giga_crimsonseal_seal = 'Crimson Seal',
            giga_aquaseal_seal = 'Aqua Seal',
            giga_redplus_seal = 'Red+ Seal',
            giga_blueplus_seal = 'Blue+ Seal',
            giga_goldplus_seal = 'Gold+ Seal',
            giga_purpleplus_seal = 'Purple+ Seal',
            giga_redplusplus_seal = 'Red++ Seal',
            giga_blueplusplus_seal = 'Blue++ Seal',
            giga_goldplusplus_seal = 'Gold++ Seal',
            giga_purpleplusplus_seal = 'Purple++ Seal',
            giga_pinkplus_seal = 'Pink+ Seal',
            giga_pinkplusplus_seal = 'Pink++ Seal',
            giga_crimsonplus_seal = 'Crimson+ Seal',
            giga_aquaplus_seal = 'Aqua+ Seal',
            giga_crimsonplusplus_seal = 'Crimson++ Seal',
            giga_aquaplusplus_seal = 'Aqua++ Seal',
            Giga_Food = 'Food',
            giga_shiny_foil = 'Shiny Foil',
            giga_shiny_holo = 'Shiny Holographic',
            giga_shiny_poly = 'Shiny Polychrome'
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={
			pnr_giga_pabloJr_1 = {
				'Hola, mi amigo'
			},
			pnr_giga_pabloJr_2 = {
				"Working 'ard, mi amigo",
			},
			pnr_giga_pabloJr_3 = {
				'Papá can give you',
                'some Tacos, mi amigo'
			},
			pnr_giga_pabloJr_4 = {
				'Buena suerte, mi amigo'
			}
        },
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorials={},
        v_dictionary={},
        v_texts={}
    }
}