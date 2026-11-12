return {
    descriptions = {
        Back = {
            b_giga_foodie = {
                name = 'Baraja de comida',
                text = {
                    'Crea una carta de ',
                    '{C:giga_Food}comida{} al comienzo',
                    'de cada ronda.',
                    'Comienza con un {C:attention,T:v_giga_foodTruck}puesto de comida{}'
                }
            },
            b_giga_reverseCheckered = {
                name = 'Baraja cuadriculada al revés',
                text = {
                    'Comienza la partida con',
                    '{C:attention}26{C:clubs} tréboles{} y',
                    '{C:attention}26{C:diamonds} diamantes{} en la baraja'
                }
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
            },
            b_giga_gamblingAddict = {
                name = 'Baraja ludópata',
                text = {
                    'Este juego no va',
                    'de ganar, va de',
                    '{C:attention,E:1,T:j_giga_stockMarket}APOSTAR'
                }
            },
            b_giga_teal = {
                name = 'Baraja verde azulada',
                text = {
                    'Comienza con {C:attention}7{} niveles',
                    'repartidos en manos aleatorias'
                }
            },
            b_giga_gladiolus = {
                name = 'Baraja gladiolo',
                text = {
                    'Comienza la partida con el',
                    'vale {C:tarot,T:v_crystal_ball}Bola de cristal{}',
                    'Crea una carta {C:attention}modificada',
                    '{C:attention}aleatoria{} al inicio',
                    'de la ronda',
                    '{C:attention}#1#{} espacio de Joker'
                }
            }
        },
        Blind = {
            bl_giga_selfish = {
                name = 'El Egoísta',
                text = {
                    'Si descartas 5 cartas,',
                    'pierdes $5'
                }
            },
            bl_giga_base = {
                name = 'La Base',
                text = {
                    '+0.25X al tamaño de la ciega',
                    'por cada carta mejorada',
                    'en la baraja'
                }
            },
            bl_giga_altitude = {
                name = 'La Altitud',
                text = {
                    'X0.9 multi por',
                    'cada carta numérica',
                    'jugada'
                }
            },
            bl_giga_train = {
                name = 'El Tren',
                text = {
                    'Añade una carta de piedra',
                    'a la baraja al jugar',
                    'una mano'
                }
            }
        },
        Edition = {},
        Enhanced = {
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
                    'de crear {C:attention}#9#{} {C:giga_Food}comída{} {C:dark_edition}negativa{} '
                }
            },
            m_giga_perfectGold = {
                name = 'Carta de oro perfecto',
                text = {
                    '{C:money}$#1#{} si está',
                    'carta está en tu mano',
                    'al final de la ronda',
                    'Aumenta en {C:money}$#2#{} al jugarla'
                }
            },
            m_giga_titanium = {
                name = 'Carta de titanio',
                text = {
                    '{X:mult,C:white}X#1#{} mientras esta',
                    'carta esté en tu mano',
                    'Aumenta en {X:mult,C:white}X#2#{} al jugarla'
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
            },
            m_giga_evolvedWild = {
                name = 'Carta polivalente evolucionada',
                text = {
                    '{C:mult}+#1#{} multi, {C:chips}+#2#{} fichas',
                    'aumenta en {C:mult}+#3#{} multi,',
                    '{C:chips}+#4#{} fichas al ser {C:attention}jugada{}',
                    '{C:inactive,s:0.7}Este efecto es temporal'
                }
            },
            m_giga_pottery = {
                name = 'Carta de cerámica',
                text = {
                    '{C:chips}+#1#{} fichas',
                    '{C:green}#2# en #3#{} de probabilidades',
                    'de destruir la carta y crear',
                    'una carta de {C:giga_Artefact}artefacto{}',
                    'Sin categoría ni palo'
                }
            },
            m_giga_engravedPottery = {
                name = 'Carta de cerámica grabada',
                text = {
                    '{C:chips}+#1#{} fichas',
                    '{X:mult,C:white}X#2#{} multi',
                    '{C:green}#3# en #4#{} de probabilidades',
                    'de destruir la carta y crear',
                    'una carta de {C:giga_Artefact}artefacto{}',
                    'Sin categoría ni palo'
                }
            },
            m_giga_giga = {
                name = 'Carta giga',
                text = {
                    '{C:chips}+#1#{} fichas, {C:mult}+#2#{} multi',
                    '{X:chips,C:white}X#3#{} fichas, {X:mult,C:white}X#4#{} multi',
                    'Cuenta como cualquier palo'
                }
            },
            m_giga_gigaMax = {
                name = 'Carta giga max',
                text = {
                    '{C:chips}+#1#{} fichas, {C:mult}+#2#{} multi',
                    '{X:chips,C:white}X#3#{} fichas, {X:mult,C:white}X#4#{} multi',
                    '{C:money}$#5#{} si esta carta',
                    'se tiene en la mano al final',
                    'de la ronda',
                    'Cuenta como cualquier palo'
                }
            },
            m_giga_ultimateGigaMax = {
                name = 'Carta giga max definitiva',
                text = {
                    '{C:chips}+#1#{} fichas, {C:mult}+#2#{} multi',
                    '{X:chips,C:white}X#3#{} fichas, {X:mult,C:white}X#4#{} multi',
                    '{C:money}$#5#{} si esta carta',
                    'se tiene en la mano al final',
                    'de la ronda',
                    'Aumenta fichas y multi al ser jugada',
                    'Cuenta como cualquier palo'
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
                    'te hace sacar {C:attention}#1#{} cartas'
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
                name = 'Macarrones con queso',
                text = {
                    'Unos deliciosos delicioso macarrones con queso',
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
            c_giga_durian = {
                name = 'Durián',
                text = {
                    'Un delicioso durián que',
                    'transforma {C:attention}#1#{} carta',
                    'en una {C:attention}carta de vidrio{}'
                }
            },
            c_giga_quicheLorraine = {
                name = 'Quiche Lorraine',
                text = {
                    'Una deliciosa quiche lorraine que',
                    'crea {C:attention}#1#{} carta aleatoria',
                    'del palo de {C:hearts}corazones{}'
                }
            },
            c_giga_empanadas = {
                name = 'Empanadas',
                text = {
                    'Unas deliciosas empanadas que',
                    'crean {C:attention}#1#{} carta aleatoria',
                    'del palo de {C:clubs}tréboles{}'
                }
            },
            c_giga_blueberryMuffin = {
                name = 'Muffin de arándanos',
                text = {
                    'Un delicioso muffin de arándanos',
                    'que convierte {C:attention}#1#{} carta',
                    'al palo de {C:clubs}tréboles{}'
                }
            },
            c_giga_donut = {
                name = 'Dónut',
                text = {
                    'Unos deliciosos dónuts que',
                    'convierten la carta de la {C:attention}izquierda{}',
                    'en una de las {C:attention}2{} cartas',
                    'más a la {C:attention}derecha{}'
                }
            },
            c_giga_bubbleTea = {
                name = 'Té de burbujas',
                text = {
                    'Un delicioso té de burbujas que',
                    'añade un {C:attention}sello{} aleatorio a',
                    '{C:attention}#1#{} carta seleccionada en {C:attention}#2#{} rondas',
                    '{C:inactive}#3#'
                }
            },
            c_giga_marshmallow = {
                name = 'Malvaviscos',
                text = {
                    'Unos deliciosos malvaviscos que',
                    'destruyen {C:attention}#1#{} carta'
                }
            },
            c_giga_strawberries = {
                name = 'Fresas',
                text = {
                    'Unas deliciosas fresas que',
                    'transforman {C:attention}#1#{} carta',
                    'en {C:attention}carta de cerámica{}'
                }
            },
            c_giga_poutine = {
                name = 'Poutine',
                text = {
                    'Una deliciosa poutine que te',
                    'otorgará permanentemente {C:attention}+#1#{} al',
                    'tamaño de mano en {C:attention}#2#{} rondas',
                    '{C:inactive}#3#'
                }
            },
            c_giga_appleJuice = {
                name = 'Zumo de manzana',
                text = {
                    'Un delicioso zumo de manzana que',
                    'crea {C:attention}#1#{} carta aleatoria',
                    'del palo de {C:paperback_crowns}coronas{}'
                }
            },
            c_giga_migas = {
                name = 'Migas',
                text = {
                    'Unas deliciosas migas que',
                    'otorgan una carta de {C:purple}aberración{}',
                    'en {C:attention}#1#{} rondas',
                    '{C:inactive}#2#'
                }
            }
        },
        Joker = {
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
                    '(Actualmente {C:mult}+#4#{} multi / {C:chips}+#5#{} fichas)'
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
                    'un poco de {C:giga_Food}comida{} mejicana para tí',
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
                text = {
                    {
                        '{s:1.25}Dicen que tres dragones{}',
                        '{s:1.25}es mejor que uno. Yo no{}',
                        '{s:1.25}lo creo así{}'
                    },
                    {
                        '{C:mult}+#1#{} multi por cada carta',
                        '{X:mult,C:white}X#2#{} multi por cada carta de {C:clubs}tréboles{}',
                        '{X:mult,C:white}X#3#{} multi por cada carta cuya',
                        'categoría sea mayor o igual a {C:attention}8{}'
                    }
                }
            },
            j_giga_dmk = {
                name = 'Rey maestro de dragones',
                text = {
                    {
                        '{s:1.25}¿Sabes que es más fuerte que un dragón jefe?{}',
                        '{s:1.25}Un dragón jefe domesticado,{}'
                    },
                    {
                        '{C:mult}+#1#{} multi por cada carta',
                        '{X:mult,C:white}X#2#{} multi por cada carta de {C:clubs}tréboles{}',
                        '{X:mult,C:white}X#2#{} multi por cada carta cuya',
                        'categoría sea mayor o igual a {C:attention}7{}'
                    }
                }
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
                text = {
                    {
                        '{s:1.25}Imagina un soldado{}',
                        '{s:1.25}que ha perfeccionado la magia.{}',
                        '{s:1.25}¡Ese es él!{}'
                    },
                    {
                        '{C:mult}+#1#{} multi por cada carta',
                        '{C:mult}+#2#{} multi por cada carta de{C:diamonds}diamantes{}',
                        '{X:mult,C:white}X#3#{} multi por cada carta cuya',
                        'categoría sea menor o igual a {C:attention}9{}'
                    }
                }
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
                name = {
                    'Pierna izquierda',
                    'del prohibido'
                },
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta de {C:spades}picas{} jugada'
                }
            },
            j_giga_rlotfo = {
                name = {
                    'Right Leg of',
                    'del prohibido'
                },
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta de {C:clubs}tréboles{} jugada'
                }
            },
            j_giga_raotfo = {
                name = {
                    'Right Arm of',
                    'del prohibido'
                },
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta de {C:diamonds}diamantes{} jugada'
                }
            },
            j_giga_laotfo = {
                name = {
                    'Left Arm of',
                    'del prohibido'
                },
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta de {C:hearts}corazones{} jugada'
                }
            },
            j_giga_etfo = {
                name = {
                    '{s:1.2}Exodia{}',
                    'del prohibido'
                },
                text = {
                    '{C:chips}+#1#{} fichas',
                    'por cada carta jugada'
                }
            },
            j_giga_tlei = {
                name = {
                    'La legendaria',
                    'encarnación Exodia'
                },
                text = {
                    {
                        '{s:1.4,E:1}Desata a la bestia{}'
                    },
                    {
                        'Deshabilita la {C:attention}ciega jefe{}',
                        '{X:mult,C:white}X#1#{} multi'
                    }
                }
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
                    'carta de {C:giga_Food}comida{} usada'
                }
            },
            j_giga_doubleFork = {
                name = 'Tenedor dividido',
                text = {
                    'Usar una carta de {C:giga_Food}comida{}',
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
            j_giga_monochromeCrystal = {
                name = 'Cristales monochromes',
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
                    'como {C:mult}multi{}, si se juegan {C:attention}5{} cartas'
                }
            },
            j_giga_snokot = {
                name = 'Snokot',
                text = {
                    '{C:attention}#1#{} anotado otorga {C:mult}+#2#{} multi.',
                    'Gana {C:mult}+#3#{} multi por cada {C:attention}#1#{} anotado',
                    '{C:inactive}La categoría cambia y se reinicia',
                    '{C:inactive}al final de la apuesta inicial'
                }
            },
            j_giga_marvinTheFourth = {
                name = 'Marvin, El Cuarto',
                text = {
                    'Otorga {C:chips}+#1#{} fichas y {X:mult,C:white}X#2#{} multi',
                    'por cada {C:attention}4{}, {C:attention}5{} o {C:attention}6{} de {V:1}#3#{}',
                    '{C:inactive}El palo cambia con cada carta jugada'
                }
            },
            j_giga_onTheClock = {
                name = 'Contrarreloj',
                text = {
                    'Obtén {C:mult}multi{} y {C:chips}fichas{} según',
                    'la {C:attention}hora actual{}',
                    '{C:inactive}(Horas > multi / Minutos > fichas)'
                }
            },
            j_giga_aliveBook = {
                name = 'Libro viviente',
                text = {
                    'Obtén {C:mult}multi{} igual a la {C:attention}longitud{}',
                    'del {C:attention}nombre{} del Joker más a la izquierda',
                    '{C:inactive}(Actualmente: {C:mult}+#1#{} {C:inactive}multi)'
                }
            },
            j_giga_roposiel = {
                name = 'Roposiel',
                text = {
                    'Gana {C:mult}+#1#{} multi por cada nombre de Joker',
                    'que contenga un {C:attention}número{}',
                    'o un {C:attention}carácter especial{}.',
                    '{C:inactive}(Actualmente: {C:mult}+#2#{} {C:inactive}multi)'
                }
            },
            j_giga_rogAno = {
                name = 'Rog-Ano',
                text = {
                    '{X:mult,C:white}X#1#{} multi por cada',
                    '{C:attention}sello{} en la {C:attention}baraja{}',
                    '{C:inactive}(Actualmente: {X:mult,C:white}X#2#{} {C:inactive}multi)'
                }
            },
            j_giga_myt_own = {
                name = 'MrYamiTsu',
                text = {
                    'Las {C:attention}cartas jugadas{} con',
                    '{C:attention}mejoras avanzadas{} o {C:attention}sellos{}',
                    'otorgan {X:mult,C:white}X#1#{} multi al anotar'
                }
            },
            j_giga_factolord = {
                name = 'Señor factorial',
                text = {
                    'Gana {C:attention}X5{} el factorial {B:1,C:white}(!){}',
                    'del número de espacios libres de',
                    'Joker en forma de {C:chips}fichas{}',
                    '{C:inactive}(Actualmente: {C:chips}+#1#{} {C:inactive}fichas)'
                }
            },
            j_giga_rescuePacket = {
                name = 'Paquete de rescate',
                text = {
                    'Tras vencer a la {C:attention}ciega jefe{},',
                    'gana temporalmente {C:attention}+#1#{} espacio',
                    'de carta disponible en la tienda'
                }
            },
            j_giga_linearLink = {
                name = 'Enlace lineal',
                text = {
                    'Si la mano contiene {C:attention}parejas vinculadas{},',
                    '{C:attention}reactiva{} cada carta jugada'
                }
            },
            j_giga_liarVadko = {
                name = 'Vadko el mentiroso',
                text = {
                    'Las cartas {C:attention}no puntuadas{}',
                    'otorgan {C:mult}+#1#{} multi'
                }
            },
            j_giga_big31 = {
                name = 'Gran 31',
                text = {
                    '{C:attention}2X{} al tamaño de mano',
                    'en los paquetes de cartas'
                }
            },
            j_giga_noCashForYou = {
                name = 'Sin dinero para ti',
                text = {
                    '{X:mult,C:white}X#1#{} multi por',
                    'cada {C:money}dólar{} de deuda',
                    '{C:inactive}(Actualmente: {X:mult,C:white}X#2#{} {C:inactive}multi)'
                }
            },
            j_giga_likoyTonam = {
                name = 'Likoy-Tonam',
                text = {
                    'Tras la {C:attention}última mano{} de la ronda,',
                    '{C:attention}mejora{} el sello de la {C:attention}primera{}',
                    'carta {C:attention}retenida{} en la mano'
                }
            },
            j_giga_bearmanJeff = {
                name = 'Jeff el hombre oso',
                text = {
                    '{C:green}#1# en #2#{} de probabilidades de añadir',
                    'una {C:attention}sobrecarga{} a una carta aleatoria',
                    'al inicio de la ronda. Las {C:green}probabilidades{} aumentan',
                    'por cada {C:attention}consumible{} en posesión'
                }
            },
            j_giga_ohnyartemmys = {
                name = 'Ohnyartemmys',
                text = {
                    'Conserva la habilidad de {C:attention}Oro{} y {C:attention}Acero{}',
                    'durante la ronda al ser {C:attention}descartadas{}',
                    '{C:inactive}(Actualmente: {X:mult,C:white}X#1#{} {C:inactive}multi / {C:money}$#2#{}{C:inactive})'
                }
            },
            j_giga_kebfordius = {
                name = 'Kebfordius',
                text = {
                    'Crea hasta {C:attention}#1#{} cartas de',
                    '{C:planet}planeta{} si la mano jugada es',
                    '{C:attention}parejas vinculadas{}'
                }
            },
            j_giga_potteryJoker = {
                name = 'Joker de cerámica',
                text = {
                    'Este Joker gana {C:mult}+#1#{} multi por',
                    'cada carta de {C:giga_Artefact}artefacto{} creada en la partida',
                    '{C:inactive}(Actualmente: {C:mult}+#2#{} {C:inactive}multi)'
                }
            },
            j_giga_fuhdekun = {
                name = 'Fuhdekun',
                text = {
                    'Cuando se añade una {C:attention}carta de juego{},',
                    '{C:green}#1# en #2#{} de probabilidades de añadir',
                    'una {C:attention}copia{} a la baraja'
                }
            },
            j_giga_protectiveWax = {
                name = 'Cera protectora',
                text = {
                    'Cuando se crea una carta de',
                    '{C:giga_Artefact}artefacto{}, se vuelve {C:dark_edition}negativa{}'
                }
            },
            j_giga_roumuskusTheJoke = {
                name = 'Roumuskus El Joké',
                text = {
                    'Gana el valor en {C:chips}fichas{} de la {C:attention}primera',
                    '{C:attention}carta descartada{} como {C:mult}multi{}. Se reinicia',
                    'tras jugar una mano {C:inactive}(Actualmente: {C:mult}+#1# {C:inactive}multi)'
                }
            },
            j_giga_ajebguer = {
                name = 'Ajebguer',
                text = {
                    'Gana {C:mult}+#1#{} multi cuando una carta',
                    'con una {C:attention}sobrecarga{} es {C:attention}descartada{}',
                    '{C:inactive}(Actualmente: {C:mult}+#2#{} {C:inactive}multi)'
                }
            },
            j_giga_theCaskOfAmontillado = {
                name = 'El barril de amontillado',
                text = {
                    'Gana {X:mult,C:white}X#1#{} multi por cada carta',
                    '{C:attention}suertuda{} que {C:attention}no{} se activa',
                    '{C:inactive}(Actualmente: {X:mult,C:white}X#2#{} {C:inactive}multi)'
                }
            },
            j_giga_shootingStars = {
                name = 'Estrellas fugaces',
                text = {
                    'Los {C:giga_Astral}planetas astrales{} y las {C:edition}ediciones',
                    '{C:edition}brillantes{} aparecen {C:attention}#1#X{} más seguido'
                }
            },
            j_giga_triceratops_alt = {
                name = '¿Triceratops?',
                text = {
                    'Cada dos rondas, crea {V:1}#1#{} y destruye',
                    'un consumible aleatorio para ganar {X:mult,C:white}X#2#{} multi',
                    'y {X:chips,C:white}X#3#{} fichas (Actualmente {X:mult,C:white}X#4#{} multi / {X:chips,C:white}X#5#{} fichas)'
                }
            },
            j_giga_tRex_alt = {
                name = '¿T-Rex?',
                text = {
                    'Si la mano anotada es un solo {C:attention}6{},',
                    'destrúyelo para crear {V:1}#1#{}',
                    'y ganar {C:money}$#2#{}'
                }
            },
            j_giga_pteranodon_alt = {
                name = '¿Pteranodon?',
                text = {
                    '{C:mult}+#1#{} multi si la mano jugada',
                    'no contiene ningún {C:attention}2{}'
                }
            },
            j_giga_velocyraptor_alt = {
                name = '¿Velociraptor?',
                text = {
                    '{C:green}#1# en #2#{} de probabilidades de subir de nivel',
                    'la mano jugada por cada {C:attention}carta adicional{} jugada'
                }
            },
            j_giga_pinkTourmaline_alt = {
                name = '¿Turmalina rosa?',
                text = {
                    '{X:mult,C:white}X#1#{} multi por cada carta',
                    '{C:dark_edition}holográfica{} retenida en la mano'
                }
            },
            j_giga_moonstone_alt = {
                name = '¿Piedra lunar?',
                text = {
                    '{C:mult}+#1#{} multi por cada carta',
                    '{C:dark_edition}brillante{} retenida en la mano'
                }
            },
            j_giga_rainbowQuartz_alt = {
                name = '¿Cuarzo arcoiris?',
                text = {
                    '{C:chips}+#1#{} fichas por cada carta',
                    '{C:dark_edition}polícroma{} retenida en la mano'
                }
            },
            j_giga_myt_own_alt = {
                name = '¿MrYamiTsu?',
                text = {
                    'Gana {X:mult,C:white}X#1#{} multi por cada carta',
                    '{C:attention}mejorada{} que {C:attention}anota{}',
                    '{C:inactive}(Actualmente: {X:mult,C:white}X#2#{}{C:inactive})'
                }
            },
            j_giga_rescuePacket_alt = {
                name = '¿Paquete de rescate?',
                text = {
                    'Tras vencer a una {C:attention}ciega{}, {C:green}#1# en #2#{} de',
                    'probabilidades de ganar temporalmente {C:attention}+#3#{} espacio',
                    'de carta disponible en la tienda'
                }
            },
            j_giga_onTheClock_alt = {
                name = '¿Contrarreloj?',
                text = {
                    'Obtén {C:chips}fichas{} y {C:mult}multi{} según',
                    'la {C:attention}fecha actual{}',
                    '{C:inactive}(Día > fichas / Mes > multi)'
                }
            },
            j_giga_cashPass_alt = {
                name = '¿Pase adinerado?',
                text = {
                    '{X:mult,C:white}X#1#{} multi',
                    '{C:money}$#2#{} al seleccionar una ciega'
                }
            }
        },
        Other = {
            undiscovered_food = {
                name = 'Sin descubrir',
                text = {
                    'Comra o usa esta',
                    'carta en una partida',
                    'sin semilla para saber',
                    'lo que hace'
                }
            },
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
            pinkSeal_def = {
                name = 'Sello rosa',
                text = {
                    'Cuando esta carta {C:attention}puntua{},',
                    'crea {C:attention}1{} carta de {C:giga_Food}comida{}'
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
            },
            undiscovered_Giga_Food = {
                name = 'Sin descubrir',
                text = {
                    'Compra o usa esta carta',
                    'en una partida sin código',
                    'para descubrir qué hace'
                }
            },
            undiscovered_Giga_Artefact = {
                name = 'Sin descubrir',
                text = {
                    'Compra o usa esta carta',
                    'en una partida sin código',
                    'para descubrir qué hace'
                }
            },
            giga_pinkseal_seal = {
                name = 'Sello rosa',
                text = {
                    'Crea una carta de {C:giga_Food}comida{}',
                    'al jugarse y anotar'
                }
            },
            giga_crimsonseal_seal = {
                name = 'Sello carmesí',
                text = {
                    'Gana {C:mult}+#1#{} multi de forma',
                    'permanente mientras se',
                    'tenga en la mano'
                }
            },
            giga_aquaseal_seal = {
                name = 'Sello aguamarina',
                text = {
                    'Gana {C:chips}+#1#{} fichas de forma',
                    'permanente mientras se',
                    'tenga en la mano'
                }
            },
            giga_pinkplus_seal = {
                name = 'Sello rosa+',
                text = {
                    'Cuando esta carta {C:attention}anota{}, crea',
                    '{C:attention}1{} carta de {C:giga_Food}comida{}, {C:green}#1# en #2#{} de probabilidades',
                    'de ser {C:dark_edition}negativa{}. {C:attention}Reduce{} el tamaño',
                    'de la ciega en {C:attention}#3#%{}'
                }
            },
            giga_pinkplusplus_seal = {
                name = 'Sello rosa++',
                text = {
                    'Cuando esta carta {C:attention}anota{}, crea',
                    '{C:attention}#1#{} cartas de {C:giga_Food}comida{}, {C:green}#2# en #3#{} de probabilidades',
                    'de ser {C:dark_edition}negativa{}, {C:green}#4# en #5#{} de probabilidades de ser',
                    '{C:rare}rara{}. {C:attention}Reduce{} el tamaño de la ciega en {C:attention}#6#%{}'
                }
            },
            giga_crimsonplus_seal = {
                name = 'Sello carmesí+',
                text = {
                    'Gana {C:mult}+#1#{} multi de forma permanente mientras',
                    'se tenga en la mano, {X:chips,C:white}X#2#{} fichas'
                }
            },
            giga_aquaplus_seal = {
                name = 'Sello aguamarina+',
                text = {
                    'Gana {C:chips}+#1#{} fichas de forma permanente mientras',
                    'se tenga en la mano, {X:mult,C:white}X#2#{} multi'
                }
            },
            giga_crimsonplusplus_seal = {
                name = 'Sello carmesí++',
                text = {
                    'Gana {C:mult}+#1#{} multi de forma permanente mientras se tenga',
                    '{C:attention}en la mano{} más {C:mult}+#2#{} por carta {C:attention}#3#{} jugada.',
                    '{X:chips,C:white}X#4#{} fichas más {X:chips,C:white}X#5#{} por cada carta {C:attention}en mano{}'
                }
            },
            giga_aquaplusplus_seal = {
                name = 'Sello aguamarina++',
                text = {
                    'Gana {C:chips}+#1#{} fichas de forma permanente mientras se tenga',
                    '{C:attention}en la mano{} más {C:chips}+#2#{} por Joker {C:attention}#3#{} en posesión.',
                    '{X:mult,C:white}X#4#{} multi más {X:mult,C:white}X#5#{} por cada carta {C:attention}consumible{}'
                }
            },
            giga_amberseal_seal = {
                name = 'Sello ámbar',
                text = {
                    'Crea una carta de {C:giga_Artefact}artefacto{}',
                    'al jugarse y no anotar'
                }
            },
            giga_amberplus_seal = {
                name = 'Sello ámbar+',
                text = {
                    'Crea una carta de {C:giga_Artefact}artefacto{}, {C:green}#1# en #2#{} de',
                    'probabilidades de ser {C:dark_edition}negativa{}, y {C:green}#3# en #4#{} de ganar',
                    'un {C:red}descarte{} o una {C:blue}mano{} al no anotar'
                }
            },
            giga_amberplusplus_seal = {
                name = 'Sello ámbar++',
                text = {
                    'Crea {C:attention}#1#{} carta de {C:giga_Artefact}artefacto{}, {C:green}#2# en #3#{} de',
                    'probabilidades de ser {C:dark_edition}negativa{}, y {C:green}#4# en #5#{} de ganar',
                    'un {C:red}descarte{} y una {C:blue}mano{} al no anotar'
                }
            },
            giga_redOvercharge = {
                name = 'Sobrecarga roja',
                text = {
                    '{X:mult,C:white}X#1#{} multi al ser {C:attention}jugada{}. Aumenta en',
                    '{X:mult,C:white}X#2#{} por cada sobrecarga {C:attention}descartada{} esta ronda'
                }
            },
            giga_yellowOvercharge = {
                name = 'Sobrecarga amarilla',
                text = {
                    'Gana {C:money}$#1#{} al ser {C:attention}jugada{}. Aumenta en',
                    '{C:money}$#2#{} por cada {C:attention}#3#{} sobrecarga(s) {C:attention}descartada(s){} esta ronda'
                }
            },
            giga_orangeOvercharge = {
                name = 'Sobrecarga naranja',
                text = {
                    'Crea {C:attention}#1# {C:tarot}tarot{} al ser {C:attention}jugada{}, {C:green}#2# en #3#{} de',
                    'probabilidades de ser {C:dark_edition}negativa{}. Aumenta en {C:attention}#4#{} por cada',
                    '{C:attention}#5#{} sobrecarga(s) {C:attention}descartada(s){} esta ronda'
                }
            },
            giga_greenOvercharge = {
                name = 'Sobrecarga verde',
                text = {
                    'Sube de nivel una {C:attention}mano de póker{} aleatoria al ser {C:attention}jugada{}.',
                    'Aumenta en {C:attention}#2#{} por cada {C:attention}#3#{} sobrecarga(s) {C:attention}descartada(s){}'
                }
            },
            giga_blueOvercharge = {
                name = 'Sobrecarga azul',
                text = {
                    '{X:chips,C:white}X#1#{} fichas al ser {C:attention}jugada{}. Aumenta en',
                    '{X:chips,C:white}X#2#{} por cada sobrecarga {C:attention}descartada{} esta ronda'
                }
            },
            giga_purpleOvercharge = {
                name = 'Sobrecarga morada',
                text = {
                    'Crea {C:attention}#1# {C:giga_Food}comida{} al ser {C:attention}jugada{}, {C:green}#2# en #3#{} de',
                    'probabilidades de ser {C:dark_edition}negativa{}. Aumenta en {C:attention}#4#{} por cada {C:attention}#5#{} descartada(s)'
                }
            },
            giga_uncopiable_info = {
                name = 'Incopiable',
                text = {
                    'Esta carta no',
                    'se puede {C:attention}copiar{}'
                }
            },
            giga_shiny_chance = {
                name = 'Generación',
                text = {
                    '{C:attention}#1#%{} de probabilidad de',
                    'reemplazar una {C:dark_edition}#2#{}'
                }
            },
            giga_astral_chance = {
                name = 'Generación',
                text = {
                    '{C:attention}#1#%{} de probabilidad',
                    'de reemplazar {C:attention}#2#{}'
                }
            },
            giga_dinosaurs_info = {
                name = 'Dinosaurios',
                text = {
                    'Los Jokers Dinosaurios son',
                    '{C:attention}más fuertes{} al ser',
                    '{C:attention}jugados juntos{}'
                }
            },
            giga_suit_sequence_info = {
                name = 'Secuencia de palos',
                text = {
                    '{C:spades}Picas{} > {C:hearts}Corazones{} >',
                    '{C:diamonds}Diamantes{} > {C:clubs}Tréboles{} >'
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
        Planet = {
            c_giga_astral_mercury = {
                name = 'Mercurio astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_jupiter = {
                name = 'Júpiter astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_pluto = {
                name = 'Plutón astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_eris = {
                name = 'Eris astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_planetX = {
                name = 'Planeta X astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_saturn = {
                name = 'Saturno astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_earth = {
                name = 'Tierra astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_mars = {
                name = 'Marte astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_ceres = {
                name = 'Ceres astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_venus = {
                name = 'Venus astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_neptune = {
                name = 'Neptuno astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_astral_uranus = {
                name = 'Urano astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            },
            c_giga_sylvia = {
                name = 'Sylvia',
                text = {
                    '({V:1}Niv.#1#{})({V:2}Niv.#2#{})',
                    'Sube de nivel',
                    '{C:attention}#3#{},',
                    '{C:attention}#4#{}'
                }
            },
            c_giga_astral_sylvia = {
                name = 'Sylvia astral',
                text = {
                    '({V:1}Niv.#1#{})({V:2}Niv.#2#{})',
                    'Sube de nivel {C:attention}#3#{} veces',
                    '{C:attention}#4#{},',
                    '{C:attention}#5#{}'
                }
            },
            c_giga_titania = {
                name = 'Titania',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{}',
                    '{C:mult}+#3#{} multi y',
                    '{C:chips}+#4#{} fichas'
                }
            },
            c_giga_astral_titania = {
                name = 'Titania astral',
                text = {
                    '({V:1}Niv.#1#{}) Sube de nivel',
                    '{C:attention}#2#{} veces {C:attention}#3#{}',
                    '{C:mult}+#4#{} multi y',
                    '{C:chips}+#5#{} fichas'
                }
            }
        },
        Sleeve = {
            sleeve_giga_reverseCheckeredSleeve = {
                name = 'Funda cuadriculada al revés',
                text = {
                    'Comienza la partida con',
                    '{C:attention}26{C:clubs} tréboles{} y',
                    '{C:attention}26{C:diamonds} diamantes{} en la baraja'
                }
            },
            sleeve_giga_reverseCheckeredSleeve_alt = {
                name = 'Funda cuadriculada al revés',
                text = {
                    'Los {C:clubs}tréboles{} se convierten en cartas {T:m_bonus,C:attention}adicionales{} y',
                    'los {C:diamonds}diamantes{} se convierten en cartas {T:m_mult,C:attention}multi{}'
                }
            },
            sleeve_giga_foodieSleeve = {
                name = 'Funda de comida',
                text = {
                    'Crea una carta de {C:giga_Food}comida{}',
                    'al comienzo de',
                    'cada ronda'
                }
            },
            sleeve_giga_tealSleeve = {
                name = 'Funda verde azulada',
                text = {
                    'Comienza con {C:attention}7{} niveles',
                    'repartidos en manos aleatorias'
                }
            }
        },
        Spectral = {
            c_giga_salt = {
                name = 'Sal',
                text = {
                    'Add un {V:1}sello rosa{}',
                    'a {C:attention}#1#{} carta',
                    'seleccionada'
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
            },
            c_giga_upgradeSpectral = {
                name = 'Mejora',
                text = {
                    '{C:attention}Mejora{} hasta',
                    '{C:attention}#1#{} sellos'
                }
            },
            c_giga_astral_blackHole = {
                name = 'Agujero negro astral',
                text = {
                    'Mejora cada',
                    '{C:legendary,E:1}mano de póker{}',
                    'en {C:attention}#1#{} niveles'
                }
            },
            c_giga_firefly = {
                name = 'Luciérnaga',
                text = {
                    'Añade una {C:attention}sobrecarga{} aleatoria',
                    'a {C:attention}#1#{} carta seleccionada',
                    'en tu mano'
                }
            },
            c_giga_dragon = {
                name = 'Dragón',
                text = {
                    'Transforma {C:attention}#1#{} cartas',
                    'seleccionadas en',
                    '{C:attention}cartas giga{}'
                }
            },
            c_giga_stasis = {
                name = 'Éxtasis',
                text = {
                    'Añade un {V:1}sello ámbar{}',
                    'a {C:attention}#1#{} carta seleccionada',
                    'en tu mano'
                }
            }
        },
        Stake = {},
        Tag = {},
        Tarot = {
            c_giga_cook = {
                name = 'Cocina',
                text = {
                    'Crea hasta {C:attention}#1#{}',
                    'cartas de {C:giga_Food}comida{}'
                }
            },
            c_giga_upgradeTarot = {
                name = 'Mejora',
                text = {
                    '{C:attention}Mejora{} hasta',
                    '{C:attention}#1#{} cartas modificadas'
                }
            },
            c_giga_gardener = {
                name = 'El Jardinero',
                text = {
                    'Transforma {C:attention}#1#{} cartas',
                    'seleccionadas en {C:attention}cartas de barro{}'
                }
            },
            c_giga_trowel = {
                name = 'La Paleta',
                text = {
                    'Transforma {C:attention}#1#{} cartas',
                    'seleccionadas en {C:attention}cartas de cerámica{}'
                }
            }
        },
        Voucher = {
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
                    'Cartas de {C:giga_Food}comida{}',
                    'pueden aparecer en la {C:attention}tienda'
                }
            },
            v_giga_homeDelivery = {
                name = 'Pedido a domicilio',
                text = {
                    'Las cartas de {C:giga_Food}comida{} aparecen',
                    '{C:attention}X 2.5{} más frecuente'
                }
            }
        },
        ["Content Set"] = {
            set_giga_megaLegendary = {
                name = 'Mega legendario'
            }
        },
        Giga_Artefact = {
            c_giga_fishingHook = {
                name = 'Anzuelo',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_arrow = {
                name = 'Flecha',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_plate = {
                name = 'Plato',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_tablet = {
                name = 'Tablilla',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_helm = {
                name = 'Yelmo',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_mayaMask = {
                name = 'Máscara maya',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_pillar = {
                name = 'Pilar',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_silex = {
                name = 'Sílex',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_trident = {
                name = 'Tridente',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_totem = {
                name = 'Tótem',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_diadem = {
                name = 'Diadema',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_boneDie = {
                name = 'Dado de hueso',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            },
            c_giga_shellAmulet = {
                name = 'Amuleto de concha',
                text = {
                    'Otorga {X:mult,C:white}X#1#{} multi si la carta',
                    'que anota tiene rango #2#.',
                    '{C:green}#3# en #4#{} de probabilidades de aumentar su',
                    'valor de venta en {C:money}$#5#{} al final de la',
                    'ronda, de lo contrario disminuye en {C:money}$#6#{}'
                }
            }
        }
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_stakes = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            k_restaurant_pack = 'Paquete de restaurante',
            b_giga_custom_menu_card = 'Deshabilitar menú personalizado de comodines',
            k_giga_food = 'Comida',
            k_giga_rare_food = 'Comida rara',
            b_giga_food_cards = 'Cartas de comida',
            k_inactive = 'Inactivo',
            k_active = 'Activo',
            k_giga_rd = 'Listo',
            k_giga_notrd = 'Aún no listo',
            k_not_allowed_ex = '¡No!',
            k_giga_astrals_badge = 'Astral',
            k_giga_moon = 'Luna',
            k_giga_asteroid = 'Asteroide',
            giga_overcharge_collection_label = 'Sobrecargas',
            k_plus_food = '+1 Comida',
            k_plus_rarefood = '+1 Comida rara',
            k_giga_artefact = 'Artefacto',
            b_giga_artefact_cards = 'Cartas de artefacto',
            k_plus_artefact = '+1 Artefacto',
            k_giga_valueup = 'Valor aumentado',
            k_giga_valuedown = 'Valor disminuido'
        },
        high_scores = {},
        labels = {
            giga_pinkseal_seal = 'Sello rosa',
            giga_crimsonseal_seal = 'Sello carmesí',
            giga_aquaseal_seal = 'Sello acuamarina',
            giga_redplus_seal = 'Sello rojo+',
            giga_blueplus_seal = 'Sello azul+',
            giga_goldplus_seal = 'Sello dorado+',
            giga_purpleplus_seal = 'Sello morado+',
            giga_redplusplus_seal = 'Sello rojo++',
            giga_blueplusplus_seal = 'Sello azul++',
            giga_goldplusplus_seal = 'Sello dorado++',
            giga_purpleplusplus_seal = 'Sello morado++',
            Giga_Food = 'Comida',
            Giga_Artefact = 'Artefacto',
            giga_pinkplus_seal = 'Sello rosa+',
            giga_pinkplusplus_seal = 'Sello rosa++',
            giga_crimsonplus_seal = 'Sello carmesí+',
            giga_aquaplus_seal = 'Sello aguamarina+',
            giga_crimsonplusplus_seal = 'Sello carmesí++',
            giga_aquaplusplus_seal = 'Sello aguamarina++',
            giga_amberseal_seal = 'Sello ámbar',
            giga_amberplus_seal = 'Sello ámbar+',
            giga_amberplusplus_seal = 'Sello ámbar++',
            giga_redOvercharge = 'Sobrecarga roja',
            giga_yellowOvercharge = 'Sobrecarga amarilla',
            giga_orangeOvercharge = 'Sobrecarga naranja',
            giga_greenOvercharge = 'Sobrecarga verde',
            giga_blueOvercharge = 'Sobrecarga azul',
            giga_purpleOvercharge = 'Sobrecarga morada',
            giga_shiny_foil = 'Brillante',
            giga_shiny_holo = 'Holográfico brillante',
            giga_shiny_poly = 'Polícromo brillante',
            giga_art_credit = 'Arte de ',
            giga_idea_credit = 'Idea de '
        },
        poker_hand_descriptions = {
            ["giga_Linked Pairs"] = {
                '2 parejas de cartas con rangos consecutivos,',
                'se puede jugar con otra carta no puntuada'
            }
        },
        poker_hands = {
            ["giga_Linked Pairs"] = 'Parejas vinculadas'
        },
        quips = {
            pnr_giga_pabloJr_1 = {
                'Hola, mi amigo'
            },
            pnr_giga_pabloJr_2 = {
                "Trabajando duro', mi amigo"
            },
            pnr_giga_pabloJr_3 = {
                'Papá te puede dar',
                'unos tacos, mi amigo'
            },
            pnr_giga_pabloJr_4 = {
                'Buena suerte, mi amigo'
            }
        },
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorials = {},
        v_dictionary = {},
        v_texts = {}
    }
}
