return {
    descriptions = {
        Back={
            b_giga_foodie = {
                name = "Baraja de comida",
                text = {
                    'Crea una carta de ',
                    '{V:1}comida{} al comienzo',
                    'de cada ronda.',
                    'Comienza con un {C:attention,T:v_giga_foodTruck}puesto de comida{}'
                }
            },
            b_giga_reverseCheckered = {
                name = "Baraja cuadriculada al revés",
                text = {
                    'Comienza la partida con',
                    '{C:attention}26{C:clubs} tréboles{} y',
                    '{C:attention}26{C:diamonds} diamantes{} en la baraja'
                },
            },
            b_giga_momentum = {
                name = 'Baraja de momento',
                text = {
                    'Las apuestas iniciales',
                    'aumentan más rápido',
                    '{C:inactive}(1>2>4>6>8)',
                    '{C:money}+#1#{} tamaño de mano'
                }
            },
            b_giga_drrunnkiDaecpk = {
                name = 'Baraaajea ébria',
                text = {
                    'Naaaaaaaaaaaah, NOOo estoy',
                    'borracho, tú comes piiiiiiizza',
                    'Oh mieeerda, me he cagado'
                }
            }
        },
        Blind={},
        Edition={},
        Enhanced={
            m_giga_soil = {
				name = 'Carta de barro',
				text = {
					'{X:chips,C:white}X#1#{} fichas'
				}
			},
            m_giga_richSoil = {
                name = 'Carta de barro enriquecido',
                text = {
                    '{X:chips,C:white}X#1#{} fichas',
                    '{C:mult}+#2#{} multi'
                }
            },
            m_giga_fossilSoil = {
                name = 'Carta de barro fosilizado',
                text = {
                    '{X:chips,C:white}X#1#{} fichas',
                    '{X:mult,C:white}X#2#{} multi'
                }
            },
            m_giga_bigBonus = {
                name = 'Carta adicional grande',
                text = {
                    '{C:chips}+#1#{} fichas extra',
                    'Siempre anota'
                }
            },
            m_giga_polishStone = {
                name = 'Carta de piedra pulida',
                text = {
                    '{C:chips}+#1#{} fichas',
                    '{X:chips,C:white}X#2#{} fichas',
                    'Sin categoría ni palo'
                }
            },
            m_giga_multPlus = {
                name = 'Carta multi extra',
                text = {
                    '{C:mult}+#1#{} multi',
                    'Siempre anota'
                }
            },
            m_giga_luckiest = {
                name = 'Carta suertuda',
                text = {
                    '{C:green}#1# en #2#{} de probabilidades',
                    'para {C:mult}+#3#{} multi',
                    '{C:green}#4# en #5#{} de probabilidades',
                    'para ganar {C:money}$#6#{}',
                    '{C:green}#7# in #8#{} de probabilidades',
                    'de crear {C:attention}#9#{} {V:1}comída{} {C:dark_edition}negativa{} '
                }
            },
            m_giga_perfectGold = {
                name = 'Carta de oro perfecto',
                text = {
                    '{C:money}$#1#{} si está',
                    'carta está en tu mano',
                    'al final de la ronda',
                    'Aumenta en {C:money}$#2#{} al jugarla',
                }
            },
            m_giga_titanium = {
                name = 'Carta de titanio',
                text = {
                    '{X:mult,C:white}X#1#{} mientras esta',
                    'carta esté en tu mano',
                    'Aumenta en {X:mult,C:white}X#2#{} al jugarla',
                }
            },
            m_giga_reinforcedGlass = {
                name = 'Carta de cristal reforzado',
                text = {
                    '{X:mult,C:white}X#1#{} multi',
                    '{C:green}#2# en #3#{} probabilidades',
                    'de destruir la carta y',
                    'crear una carta {C:spectral}espectral{}'
                }
            }
        },
        Giga_Food = {
            c_giga_tacos = {
                name = 'Tacos',
                text = {
                    'Un delicioso tacos que',
                    'te dá {C:money}$#1#{}'
                }
            },
            c_giga_guacamole = {
                name = 'Guacamole',
                text = {
                    'Un delicioso guacamole que',
                    'te hace sacar {C:attention}#1#{} cartas',
                }
            },
            c_giga_hotDog = {
                name = 'Perrito caliente',
                text = {
                    'Un delicioso perrito caliente que',
                    'mejora {C:attention}#1#{} carta',
                    'a {C:attention}carta de barro{}',
                    '{s:0.5}"Me pregunto que pasaría si ya es una carta de barro."{}'
                }
            },
            c_giga_caesarSalad = {
                name = 'Ensalada Caesar',
                text = {
                    'Una delicioso ensalada Caesar que',
                    'creará una carta de {C:tarot}tarot{} en {C:attention}#1#{} rondas',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_clubSandwich = {
                name = 'Sandwich',
                text = {
                    'Un delicioso sandwich que',
                    'creará una carta de {C:planet}planeta{} en {C:attention}#1#{} rondas',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_pho = {
                name = 'Pho',
                text = {
                    'Un delicioso Pho que',
                    'creará una carta {C:spectral}espectral{} en {C:attention}#1#{} rondas',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_spaghetti = {
                name = 'Spaghetti',
                text = {
                    'Un delicioso Spaghetti que',
                    'mejura {C:attention}#1#{} carta',
                    'a una {C:attention}carta adicional{}'
                }
            },
            c_giga_steak = {
                name = 'Filete',
                text = {
                    'Un delicioso filete que',
                    'mejora {C:attention}#1#{} carta',
                    'a una {C:attention}carta de piedra{}'
                }
            },
            c_giga_sushis = {
                name = 'Sushis',
                text = {
                    'Unos deliciosos Sushis que',
                    'mejoran {C:attention}#1#{} carta',
                    'a una {C:attention}carta multi{}'
                }
            },
            c_giga_sugarPie = {         
                name = 'Tarta de azúcar',
                text = {
                    'Una delicioso targa de azúcar que',
                    'mejora {C:attention}#1#{} carta',
                    'a una {C:attention}carta de la suerte{}'
                }
            },
            c_giga_Untitled2 = {            
                name = '[Untitled]',
                text = {
                    'Some delicious [Untitled] that',
                    'enhance {C:attention}#1#{} card',
                    'into a {C:attention}Glass card{}'
                }
            },
            c_giga_salmon = {
                name = 'Salmón',
                text = {
                    'Un delicioso salmón que',
                    'mejora {C:attention}#1#{} carta',
                    'a una {C:attention}carta de oro{}'
                }
            },
            c_giga_waffle = {
                name = 'Tortitas',
                text = {
                    'Unas deliciosas tortitas que',
                    'mejoran {C:attention}#1#{} carta',
                    'a una {C:attention}carta versátil{}'
                }
            },
            c_giga_lollipop = {
                name = 'Piruleta',
                text = {
                    'Una delicioso piruleta que',
                    'mejora {C:attention}#1#{} carta',
                    'a una {C:attention}carta de acero{}'
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
            c_giga_paella = {
                name = 'Paella',
                text = {
                    'Una delicioso paella que',
                    'crea {C:attention}#1#{} carta de ',
                    '{C:spades}diamantes{} aleatoria'
                }
            },
           c_giga_gummyBear = {
                name = 'Osito gominola',
                text = {
                    'Un delicioso osito gominola que',
                    'crea {C:attention}#1#{} carta de',
                    '{C:diamonds}diamantes{} aleatoria'
                }
            },
            c_giga_Untitled8 = {
                name = '[Untitled]',
                text = {
                    'Some delicious [Untitled] que',
                    'crean {C:attention}#1#{} carta de',
                    '{C:clubs}tréboles{} aleatoria'
                }
            },
            c_giga_pBJSandwich = {
                name = 'Sandwich de mantequilla y cacahuete',
                text = {
                    'Un delicioso sandwich de mantequilla',
                    'y cacahuete que',
                    'añade permanentemente {C:mult}+#1#{} multi',
                    'a {C:attention}#2#{} una carta seleccionada'
                }
            },
            c_giga_burger = {
                name = 'Hamburguesa',
                text = {
                    'Una delicioso Hamburguesa que',
                    'añade permanentemente {C:chips}+#1#{} fichas',
                    'a {C:attention}#2#{} carta seleccionada'
                }
            },
            c_giga_fruitSalad = {
                name = 'Ensalada de frutas',
                text = {
                    'Una deliciosa ensalada de frutas que',
                    '{C:attention}mejora{} la mejora',
                    'de {C:attention}#1#{} carta'
                }
            },
            c_giga_ramen = {
                name = 'Ramen',
                text = {
                    'Un delicioso ramen que',
                    'convierte el palo de {C:attention}#1#{} carta',
                    'en {C:hearts}corazones{}'
                }
            },
            c_giga_chocolateBar = {
                name = 'Barra de chocolate',
                text = {
                    'Una delicioso barra de chocolate que',
                    'convierte el palo de {C:attention}#1#{} carta',
                    'en {C:spades}picas{}'
                }
            },
            c_giga_macNCheese = {
                name = "Macarrones con queso",
                text = {
                    "Unos deliciosos delicioso macarrones con queso",
                    'que convierten el palo de {C:attention}#1#{} carta',
                    'en {C:diamonds}diamantes{}'
                }
            },
            c_giga_Untitled12 = {
                name = '[Untitled]',
                text = {
                    'Un delicioso [Untitled]',
                    'que convierte el palo de {C:attention}#1#{} carta',
                    'en {C:clubs}tréboles{}'
                }
            },
            c_giga_Untitled13 = {
                name = '[Untitled]',
                text = {
                    'Un delicioso [Untitled] que',
                    'agrega un {V:1}sello rosa{} a {C:attention}#1#{}',
                    'carta en {C:attention}#2#{} rondas',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_cranberryJuice = {
                name = 'Zumo de arándanos',
                text = {
                    'Un delicioso zumo de arándanos que',
                    'agrega un {V:1}sello carmesí{}',
                    'a {C:attention}#1#{} una carta en {C:attention}#2#{} ronas',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_Untitled15 = {
                name = '[Untitled]',
                text = {
                    'Un delicioso [Untitled] que',
                    'agrega un {V:1}sello aguamarina{} a {C:attention}#1#{}',
                    'carta en {C:attention}#2#{} rondas',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_bagOfCandy = {
                name = 'Bolsa de caramelos',
                text = {
                    'Una deliciosa bolsa de caramelos',
                    'que {C:attention}mejora{} el sello',
                    'de {C:attention}#1#{} carta'
                }
            },
            c_giga_birthdayCake = {
                name = 'pastél de cumpleaños',
                text = {
                    'Un delicioso pastél de cumpleaños que',
                    'proporciona {C:attention}+#1#{} ranora de comsumible',
                    'en {C:attention}#2#{} rondas',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_turkey = {
                name = 'Pollo asado',
                text = {
                    'Un delicioso pollo asado que',
                    'proporciona {C:dark_edition}+#1#{} ranura de comodín',
                    'en {C:attention}#2#{} rondas',
                    '{C:inactive}#3#{}'
                }
            },
            c_giga_hawaiianPizza = {
                name = 'Pizza hawaiana',
                text = {
                    'Una delicioso Hawaiian hawaiana que',
                    'crea una carta de {C:cry_code}código{} en {C:attention}#1#{} rondas',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_UntitledCM1 = {
                name = '[UntitleCM]',
                text = {
                    'Un delicioso [UntitledCM] que',
                    'crea {C:attention}#1#{} carta',
                    'de {C:paperback_crowns}Crown{} aleatoria'
                }
            },
            c_giga_UntitledCM2 = {
                name = '[UntitleCM]',
                text = {
                    'Un delicioso [UntitledCM] que',
                    'crea {C:attention}#1#{} carta',
                    'de {C:paperback_stars}Star{} aleatoria'
                }
            },
            c_giga_UntitledCM3 = {
                name = '[UntitleCM]',
                text = {
                    'Un delicioso [UntitledCM] que',
                    'creará un {C:paperback_minor_arcana}paquete arcana menor{} en',
                    '{C:attention}#1#{} rondas',
                    '{C:inactive}#2#{}'
                }
            },
            c_giga_UntitledCM4 = {
                name = '[UntitledCM]',
                text = {
                    'Un delicioso [UntitledCM]',
                    'que convierte {C:attention}#1#{} cartas',
                    'en {C:clubs}Crown{}'
                }
            },
            c_giga_UntitledCM5 = {
                name = '[UntitledCM]',
                text = {
                    'Un delicioso [UntitledCM]',
                    'que convierte {C:attention}#1#{} cartas',
                    'en {C:paperback_stars}Star{}'
                }
            },
        },
        Joker={
            j_giga_cashPass = {
                name = 'Pase adinerado',
                text = {
                    'Cuando se selecciona una ciega,',
                    'gana {C:money}$#1#{}',
                    '{X:mult,C:white}X#2#{} multi'
                }
            },
            j_giga_blueChicken = {
                name = 'Pollo azul',
                text = {
                    '{C:chips}+#1#{} fichas',
                    'Crea u {C:attention}huevo azul{}',
                    'cada {C:attention}3{} rondas',
                    '{C:inactive}(Actualmente: {C:attention}#2#{C:inactive} rondas restantes)',
                    '{C:inactive}(Debe haber espacio)'
                }
            },
            j_giga_blueEgg = {
                name = 'Huevo azul',
                text = {
                    'Este huevo se siente... ¡¿¡¿azul?!?!'
                }
            },
            j_giga_kingOfJacks = {
                name = 'Rey de sotas',
                text = {
                    'Gana {X:mult,C:white}X#1#{} multi por ',
                    'cada {C:attention}sota{} jugada',
                    '{C:inactive}(Actualmente {X:mult,C:white}X#2#{}{C:inactive} multi)'
                }
            },
            j_giga_funnyCrown = {
                name = 'Corona graciosa',
                text = {
                    'Tras {C:attention}2{} rondas,',
                    'vende este comodín para crear',
                    'un {C:attention}rey de sotas{} y',
                    'y una {C:attention}sota{} {C:chips}adicional{} ',
                    '{C:inactive}(Actualmente: {C:attention}#1#{}{C:inactive} rondas restantes)',
                    '{C:inactive}(Debe haber espacio)'
                }
            },
            j_giga_snapchatGirl = {
                name = 'Chica de Snapchat',
                text = {
                    '{C:green}#1# en #2#{} probabilidades de',
                    'crear un comodín {C:legendary}legendario{} al',
                    'ser vedido, si no, {C:money}$#3#{}'
                }
            },
            j_giga_tRex = {
                name = 'T-Rex',
                text = {
                    'Cada dos rondas, create un carta de {V:1}#1#{}',
                    'y destruye un consumible aleatorio',
                    'para ganar {C:mult}+#2#{} multi y {C:chips}+#3# fichas{}',
                    '(Actualmente {C:mult}+#4#{} multi / {C:chips}+#5#{} fichas)',
                }
            },
            j_giga_velocyraptor = {
                name = 'Velociraptor',
                text = {
                    '{C:mult}+#1#{} multi si la mano',
                    'no contiene un {C:attention}As{}'
                }
            },
            j_giga_highRiskHighReward = {
                name = 'Grán riesgo, grán recompensa',
                text = {
                    '{X:mult,C:white}X#1#{} multi si la mano de póker es',
                    'una {C:money}cárta más alta{}',
                    '{C:green}#2# en #3#{} probabilidades de',
                    'destruir la carta'
                }
            },
            j_giga_shreddedAce = {
                name = 'As triturado',
                text = {
                    'Crea un {C:attention}As{} cuando',
                    'se seleccione una ciega',
                    '{C:mult}+#1#{} multi por cada',
                    '{C:attention}As{} jugado'
                }
            },
            j_giga_pteranodon = {
                name = 'Pteranodon',
                text = {
                    'Si la mano que anota es un solo {C:attention}5{},',
                    'destruyelo y crea una carta de {V:1}#1#{}',
                    'y gana {C:money}$#2#{}'
                }
            },
            j_giga_pablo = {
                name = 'Pablo',
                text = {
                    'Cada dos rondas, Pablo cocina',
                    'un poco de {V:1}comida{} mejicana para tí',
                    '{C:inactive}(Quedan {C:attention}#1#{C:inactive} rondas)',
                    '{C:inactive}(Debe haber espacio)'
                }
            },
            j_giga_jackMutator = {
                name = 'Mutador de sotas',
                text = {
                    'Modifica la categoría de una',
                    'carta aleatoria a',
                    'una sota cada {C:attention}#1#{} rondas',
                    '{C:inactive}(Actualmente: {C:attention}#2#{C:inactive} rondas restantes)',
                    '{s:0.5}"Me pregunto qué pasaría si ya es una sota"{}'
                }
            },
            j_giga_blueEyesWhiteDragon = {
                name = 'Dragón blanco de ojos azules',
                text = {
                    '{C:mult}+#1#{} multi por cada carta de',
                    '{C:clubs}tréboles{} jugada y {X:mult,C:white}X#2#{} multi',
                    'por cada {C:attention}8{}'
                }
            },
            j_giga_redEyesBlackDragon = {
                name = 'Dragón negro de ojos rojos',
                text = {
                    '{C:mult}+#1#{} multi por cada carta de',
                    '{C:spades}picas{} jugada y {X:mult,C:white}X#2#{} multi',
                    'por cada {C:attention}sota{}'
                }
            },
            j_giga_byud = {
                name = 'Dragón jefe de ojos azules',
                text = {{
                    '{s:1.25}Dicen que tres dragones{}',
                    '{s:1.25}es mejor que uno. Yo no{}',
                    '{s:1.25}lo creo así{}',
                },{
                    '{C:mult}+#1#{} multi por cada carta',
                    '{X:mult,C:white}X#2#{} multi por cada carta de {C:clubs}tréboles{}',
                    '{X:mult,C:white}X#3#{} multi por cada carta cuya',
                    'categoría sea mayor o igual a {C:attention}8{}'
                }}
            },
            j_giga_dmk = {
                name = 'Rey maestro de dragones',
                text = {{
                    '{s:1.25}¿Sabes que es más fuerte que un dragón jefe?{}',
                    '{s:1.25}Un dragón jefe domesticado,{}',
                },{
                    '{C:mult}+#1#{} multi por cada carta',
                    '{X:mult,C:white}X#2#{} multi por cada carta de {C:clubs}tréboles{}',
                    '{X:mult,C:white}X#2#{} multi por cada carta cuya',
                    'categoría sea mayor o igual a {C:attention}7{}'
                }}
            },
            j_giga_blackLusterSoldier = {
                name = 'Soldado negro brillante',
                text = {
                    '{C:mult}+#1#{} multi por cada',
                    'carta jugada',
                    '{X:mult,C:white}X#2#{} multi',
                    'por cada {C:attention}9{}'
                }
            },
            j_giga_darkMagician = {
                name = 'Mago oscuro',
                text = {
                    '{C:mult}+#1#{} multi por cada',
                    'carta de {C:diamond}diamantes{}',
                    '{X:mult,C:white}X#2#{} multi',
                    'por cada {C:attention}7{}'
                }
            },
            j_giga_moc = {
                name = 'Maestro del caos',
                text = {{
                    '{s:1.25}Imagina un soldado{}',
                    '{s:1.25}que ha perfeccionado la magia.{}',
                    '{s:1.25}¡Ese es él!{}'
                },{
                    '{C:mult}+#1#{} multi por cada carta',
                    '{C:mult}+#2#{} multi por cada carta de{C:diamonds}diamantes{}',
                    '{X:mult,C:white}X#3#{} multi por cada carta cuya',
                    'categoría sea menor o igual a {C:attention}9{}'
                }}
            },
            j_giga_pinkTourmaline = {
                name = 'Turmalina rosa',
                text = {
                    '{C:mult}+#1#{} multi por cada carta',
                    '{C:dark_edition}holográfica{} en la mano'
                }
            },
            j_giga_moonstone = {
                name = 'Piedra lunar',
                text = {
                    '{C:chips}+#1#{} fichas por cada carta',
                    '{C:dark_edition}laminada{} en la mano'
                }
            },
            j_giga_rainbowQuartz = {
                name = 'Cuarzo arcoiris',
                text = {
                    '{X:mult,C:white}X#1#{} multi por cada carta',
                    '{C:dark_edition}policromática{} en la mano'
                }
            },
            j_giga_llotfo = {
                name = {'Pierna izquierda', 'del prohibido'},
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta de {C:spades}picas{} jugada'
                }
            },
            j_giga_rlotfo = {
                name = {'Right Leg of', 'del prohibido'},
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta de {C:clubs}tréboles{} jugada'
                }
            },
            j_giga_raotfo = {
                name = {'Right Arm of', 'del prohibido'},
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta de {C:diamonds}diamantes{} jugada'
                }
            },
            j_giga_laotfo = {
                name = {'Left Arm of', 'del prohibido'},
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta de {C:hearts}corazones{} jugada'
                }
            },
            j_giga_etfo = {
                name = {'{s:1.2}Exodia{}', 'del prohibido'},
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta jugada'
                }
            },
            j_giga_tlei = {
                name = {'La legendaria', 'encarnación Exodia'},
                text = {{
                    '{s:1.4,E:1}Desata a la bestia{}'
                },{
                    'Deshabilita la {C:attention}ciega jefe{}',
                    '{X:mult,C:white}X#1#{} multi'
                }}
            },
            j_giga_paleontologist = {
                name = 'Paleontólogo',
                text = {
                    '{C:chips}+#1#{} fichas por cada',
                    '{C:attention}carta de tierra{} jugada'
                }
            },
            j_giga_paleoExpert = {
                name = 'Paleontólogo experto',
                text = {
                    '{C:mult}+#1#{} fichas por cada',
                    '{C:attention}carta de tierra{} jugada'
                }
            },
            j_giga_refinery = {
                name = 'Refinería',
                text = {
                    'Gana {C:money}$#1#{} al final de la ronda  ',
                    'por cada {C:attention}carta de piedra{} consecutiva',
                    'jugada esta ronda. Se reinicia si no se juega una carta de piedra',
                    '{C:inactive}Actualmente: {C:money}$#2#{}'
                }
            },
            j_giga_crystalOfHungriness = {
                name = 'Cristal de hambruna',
                text = {
                    '{X:mult,C:white}X#1#{} multi, aumenta',
                    'en {X:mult,C:white}X#2#{} por cada',
                    'carta de {V:1}comida{} usada',
                }
            },
            j_giga_doubleFork = {
                name = 'Tenedor dividido',
                text = {
                    'Usar una carta de {V:1}comida{}',
                    'durante una ciega da',
                    '{X:chips,C:white}X#1#{} fichas temporales',
                    '{C:inactive}#2#'
                }
            },
            j_giga_crackedSkull = {
                name = 'Cráneo agrietado',
                text = {
                    'Usar una carta {C:spectral}espectral{}',
                    'durante una ciega da',
                    '{X:mult,C:white}X#1#{} multi temporalmente',
                    '{C:inactive}#2#'
                }
            },
            j_giga_sagittariusA = {
                name = 'Sagittarius A*',
                text = {
                    'Usar una carta de {C:planet}planeta{}',
                    'durante una ciega da',
                    '{C:chips}+#1#{} fichas temporales',
                    '{C:inactive}#2#'
                }
            },
            j_giga_colourfulCrystal = {
                name = 'Cristales coloridos',
                text = {
                    '{C:mult}+#1#{} multi si la mano jugada',
                    'contiene un {C:attention}color{}',
                    'si no, {C:mult}#2#{} multi'
                }
            },
            j_giga_4thEffect = {
                name = 'Cuarto efecto',
                text = {
                    'Gana {C:chips}+#1#{} fichas y {X:mult,C:white}X#2#{} multi',
                    'por cada {C:attention}4{}, {C:attention}5{} o {C:attention}6{} de {V:1}#3#{}',
                    '{C:inactive}(El palo cambia por cada carta jugada){}'
                }
            },
            j_giga_upgradedTicket = {
                name = 'Ticket mejorado',
                text = {
                    'Cards con {C:attention}mejoras mejoradas{}',
                    'dan {C:money}$#1#{} cada una y con',
                    '{C:attention}sellos mejorados{} dan {C:money}$#2#{}',
                    'al ser {C:attention}descartadas{}'
                }
            },
            j_giga_healthyRoots = {
                name = 'Raices sanas',
                text = {
                    '{C:mult}+#1#{} multi por',
                    'por cada cuya categoría',
                    'sea la miasma que la de la{C:attention}primera{}',
                    'carta en la {C:attention}held{mano}'
                }
            },
            j_giga_nahnahu = {
                name = 'Nahnahu',
                text = {
                    '{C:mult}+#1#{} multi por cada',
                    'carta de {V:1}#2#{} en el mazo',
                    '{C:inactive}(El palo cambia cada ronda){}'
                }
            },
            j_giga_hergosu = {
                name = 'Hergosu',
                text = {
                    '{C:green}#1# en #2#{} probabilidades de',
                    'ganar {C:dark_edition}+#3#{} ranura de comodín',
                    'al usar un {C:dark_edition}alma{}'
                }
            },
            j_giga_tabaosl = {
                name = 'Tabaosl',
                text = {
                    '{C:attention}Mejora{} la {C:attention}mejora{}',
                    'de la {C:attention}primera{} y',
                    '{C:attention}segunda{} carta jugada'
                }
            },
            j_giga_stockMarket = {
                name = 'Finanzas',
                text = {
                    'Cada vez que se juega una {C:attention}figura{}',
                    'invierte {C:money}$#1#{}',
                    'El dinero invertido fluctuará',
                    '{C:attention}al cobrar{} al final de',
                    'la ronda de la {C:attention}ciega jefe{}',
                    '{C:inactive}Actualmente: {C:money}$#2#{}'
                }
            },
            j_giga_triceratops = {
                name = 'Triceratops',
                text = {
                    '{C:green}#1# en #2#{} probabilidades de',
                    'aumentar el nivel de la mano',
                    'por cada carta{C:attention}multi{}',
                    'jugada'
                }
            },
            j_giga_bonoboJoker = {
                name = 'Comodín Bonobo',
                text = {
                    'Da {C:attention}la mitad{} de la {C:attention}categoría{} de',
                    'cada carta en las{C:attention}manos{}',
                    'como {C:mult}multi{}, si se juegan {C:attention}5{} cartas',
                }
            }
        },
        Other={
            --Undiscovered
            undiscovered_food = {
                name = 'Sin descubrir',
                text = {
                    'Comra o usa esta',
                    'carta en una partida',
                    'sin semilla para saber',
                    'lo que hace'
                }
            },
            -- Credit
            ledugs_credit = {
                name = 'Crédito',
                text = {
                    'Idea original',
                    'por {C:green,E:2}le_dugs{}'
                }
            },
            yugioh_credit = {
                name = 'Crédito',
                text = {
                    'Nombre y arte',
                    'por {C:red,E:2}Yu-Gi-Oh!{}'
                }
            },
            aij_back_credit = {
                name = 'Crédito',
                text = {
                    'Fondo legendario',
                    'de {C:attention,E:2}All-In-Jest{}'
                }
            },
            -- Enhancement
            soil_def = {
                name = 'Barro',
                text = {
                    '{X:chips,C:white}X1.1{} fichas'
                }
            },
            richSoil_def = {
                name = 'Barro enriquecido',
                text = {
                    '{X:chips,C:white}X#1.4{} fichas',
                    '{C:mult}+7{} multi'
                }
            },
            fossilSoil_def = {
                name = 'Barro fosilizado',
                text = {
                    '{X:chips,C:white}X2{} fichas',
                    '{X:mult,C:white}X1.5{} multi'
                }
            },
            -- Seal
            pinkSeal_def = {
                name = 'Sello rosa',
                text = {
                    'When this card is {C:attention}scored{},',
                    'create {C:attention}1{} Food card',
                }  
            },
            crimsonSeal_def = {
                name = 'Sello carmesí',
                text = {
                    'Gana {C:mult}+1{} multi',
                    'permanente si se',
                    'mantiene en la mano'
                }
            },
            aquaSeal_def = {
                name = 'Sello acuamarina',
                text = {
                'Gain {C:chips}+15{} fichas',
                'permanentes si se',
                'mantiene en la mano'
                }
            },
            giga_redplus_seal = {
                name = 'Sello rojo+',
                text = {
                    'Reactiva esta',
                    'carta {C:attention}#1#{} veces',
                    '{C:green}#2# en #3#{} probabilidades',
                    'de reactivar {C:attention}#4#{} vez más'
                }
            },
            giga_blueplus_seal = {
                name = 'Sello azul+',
                text = {
                    'Crea una carta de {C:planet}planeta{}',
                    'si esta carta se',
                    '{C:attention}mantiene{} en la mano',
                    '{C:green}#1# en #2#{} probabilidades de',
                    'crear un {T:c_black_hole}agujero negro{}'
                }
            },
            giga_goldplus_seal = {
                name = 'Sello dorado+',
                text = {
                    'Gana {C:money}$#1#{} cuando se',
                    'juega esta carta y',
                    'gana {C:money}+$#2#{} si la mano',
                    'contiene una {C:attention}carta dorada{}'
                }
            },
            giga_purpleplus_seal = {
                name = 'Sello morado+',
                text = {
                    'Crea {C:attention}#1#{} carta de {C:tarot}Tarot{}',
                    'cuando es {C:attention}descartada{}',
                    '{C:green}#2# en #3#{} de crear una ',
                    'carta {C:spectral}espectral{}'
                }
            },
            giga_redplusplus_seal = {
                name = 'Sello rojo++',
                text = {
                    'Reactiva esta carta {C:attention}#1#{}',
                    'veces. Reactiva {C:attention}1{} vez adicional',
                    'por cada {C:attention}2{} sellos {C:attention}rojos++{}',
                    '{C:attention}jugados{} o {C:attention}en la mano{}'
                }
            },
            giga_blueplusplus_seal = {
                name = 'Sello azul++',
                text = {
                    'Crea una carta {C:planet}Planet{} {C:dark_edition}negativa{} ',
                    'si se {C:attention}juega{} o se {C:attention}mantiene{}',
                    'esta carta en la mano',
                    '{C:green}#1# en #2#{} probabilidades de crear',
                    'un {T:c_black_hole}agujero negro{}'
                }
            },
            giga_goldplusplus_seal = {
                name = 'Sello dorado++',
                text = {
                    'Gana {C:money}$#1#{} cuando esta',
                    'card es jugada, aumenta',
                    'en {C:money}$#2#{} tras jugar la mano',
                    'y gana{C:money}+$#3#{} si la mano',
                    'contiene una {C:attention}carta dorada{}',
                    'Se reinicia al final de la ronda'
                }
            },
            giga_purpleplusplus_seal = {
                name = 'Sello morado++',
                text = {
                    'Crea {C:attention}#1#{} carta de {C:tarot}Tarot{} {C:dark_edition}negativa{}',
                    'y una {C:attention}etiqueta encantada{}',
                    'cuando es {C:attention}descartada{}',
                    '{C:green}#2# en #3#{} probabilidad de crear',
                    'una {C:attention}etiqueta etérea{}'
                }
            }
        },
        Partner = {
            pnr_giga_pabloJr = {
                name = 'Pablo Jr.',
                text = {
                    '{C:green}#1# en #2#{} probabilidades',
                    'de {C:attention}mejorar{} la',
                    'mejora de las',
                    'cartas jugadas'
                }
            }
        },
        Planet={},
        Sleeve = {
            sleeve_giga_reverseCheckeredSleeve = {
                name = "Funda cuadriculada al revés",
                text = {
                    'Comienza la partida con',
                    '{C:attention}26{C:clubs} tréboles{} y',
                    '{C:attention}26{C:diamonds} diamantes{} en la baraja'
                },
            },
            sleeve_giga_reverseCheckeredSleeve_alt = {
                name = 'Funda cuadriculada al revés',
                text = {
                    'Los {C:clubs}tréboles{} se convierten en cartas {T:m_bonus,C:attention}adicionales{} y',
                    'los {C:diamonds}diamantes{} se convierten en cartas {T:m_mult,C:attention}multi{}'
                }
            },
            sleeve_giga_foodieSleeve = {
                name = "Funda de comida",
                text = {
                    'Crea una carta de {V:1}comida{}',
                    'al comienzo de',
                    'cada ronda'

                }
            }
        },
        Spectral={
            c_giga_salt = {
                name = 'Sal',
                text = {
                    'Add un {V:1}sello rosa{}',
                    'a {C:attention}#1#{} carta',
                    'seleccionada',
                }
            },
            c_giga_compass = {
                name = 'Brújula',
                text = {
                    'Añade un {V:1}sello carmesí{}',
                    'a {C:attention}#1#{} carta',
                    'seleccionada'
                }
            },
            c_giga_wand = {
                name = 'Barita',
                text = {
                    'Añade un {V:1}sello acuamarina{}',
                    'a {C:attention}#1#{} carta',
                    'seleccionada'
                }
            }
        },
        Stake={},
        Tag={},
        Tarot={
            c_giga_cook = {
                name = 'Cocina',
                text = {
                    'Crea hasta {C:attention}#1#{}',
                    'cartas de {V:1}comida{}'
                }
            },
        },
        Voucher={
            v_giga_newMenu = {
                name = 'Nuevo menú',
                text = {
                    'Paquetes de restaurante',
                    'tiene {C:attention}#1#{} carta más'
                }
            },
            v_giga_5courseMeal = {
                name = 'Comida de 5 platos',
                text = {
                    'Los paquetes de restaurante',
                    'tienen {C:attention}#1#{} opción más'
                }
            },
            v_giga_foodStand = {
                name = 'Puesto de comida',
                text = {
                    'Cartas de {V:1}comida{}',
                    'pueden aparecer en la {C:attention}tienda'
                }
            },
            v_giga_homeDelivery = {
                name = 'Pedido a domicilio',
                text = {
                    "Las cartas de {V:1}comida{} aparecen",
                    "{C:attention}X 2.5{} más frecuente"
                }
            }
        },
        ["Content Set"] = {
            set_giga_megaLegendary = {
                name = 'Mega legendario'
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
            k_restaurant_pack = "Paquete de restaurante",
            b_giga_custom_menu_card = "Deshabilitar menú personalizado de comodines"
        },
        high_scores={},
        labels={
            giga_pinkseal_seal = 'Sello rosa',
            giga_crimsonseal_seal = 'Sello carmesí',
            giga_aquaseal_seal = 'Sello acuamarina',
            giga_redplus_seal = 'Rojo+',
            giga_blueplus_seal = 'azul+',
            giga_goldplus_seal = 'Dorado+',
            giga_purpleplus_seal = 'Morado+',
            giga_redplusplus_seal = 'Rojo++',
            giga_blueplusplus_seal = 'Azul++',
            giga_goldplusplus_seal = 'Dorado++',
            giga_purpleplusplus_seal = 'Morado++'
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={
			pnr_giga_pabloJr_1 = {
				'Hola, mi amigo'
			},
			pnr_giga_pabloJr_2 = {
				"Trabajando duro', mi amigo",
			},
			pnr_giga_pabloJr_3 = {
				'Papá te puede dar',
                'unos tacos, mi amigo'
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