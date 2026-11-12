return {
    descriptions = {
        Back = {
            b_giga_foodie = {
                name = 'Jeu du gourmand',
                text = {
                    'Crée une carte {C:giga_Food}Nourriture{}',
                    'au début de chaque manche',
                    'et commence avec le bon',
                    '{C:attention,T:v_giga_foodTruck}Stand de nourriture{}'
                }
            },
            b_giga_reverseCheckered = {
                name = 'Jeu à damier inversé',
                text = {
                    'Commence la partie avec',
                    '{C:attention}26{C:clubs} Trèfles{} et',
                    '{C:attention}26{C:diamonds} Carreaux{} dans le jeu'
                }
            },
            b_giga_momentum = {
                name = "Jeu d'élan",
                text = {
                    'Les mises augmentent plus vite',
                    '{C:inactive}(1>2>4>6>8)',
                    '{C:money}+#1#{} taille de main'
                }
            },
            b_giga_gamblingAddict = {
                name = 'Jeu du parieur fou',
                text = {
                    "Ce jeu n'a rien",
                    'à voir avec la victoire, mais',
                    'avec le {C:attention,E:1,T:j_giga_stockMarket}JEU DE HASARD'
                }
            },
            b_giga_drrunnkiDaecpk = {
                name = 'Jeuu bourrééé',
                text = {
                    'Naaaaaaaaaan, chuuuuut pas',
                    'bourré, mange de la pizzzza',
                    'Oh meeeeeerde, je me suis chié dessus'
                }
            },
            b_giga_teal = {
                name = 'Jeu sarcelle',
                text = {
                    'Commence avec {C:attention}7{} niveaux',
                    'répartis sur des mains aléatoires'
                }
            },
            b_giga_gladiolus = {
                name = 'Jeu glaïeul',
                text = {
                    'Commence la partie avec',
                    'le bon {C:tarot,T:v_crystal_ball}Boule de cristal{}',
                    'Crée une carte {C:attention}modifiée',
                    '{C:attention}aléatoire{} au début',
                    'de la manche',
                    '{C:attention}#1#{} emplacement de Joker'
                }
            }
        },
        Blind = {
            bl_giga_selfish = {
                name = "L'Égoïste",
                text = {
                    'Si 5 cartes sont',
                    'défaussées, perdez 5 $'
                }
            },
            bl_giga_base = {
                name = 'La Base',
                text = {
                    '+0,25X la taille de la blinde',
                    'pour chaque carte améliorée',
                    'dans le jeu'
                }
            },
            bl_giga_altitude = {
                name = "L'Altitude",
                text = {
                    'X0,9 Multi pour',
                    'chaque carte à numéro',
                    'jouée'
                }
            },
            bl_giga_train = {
                name = 'Le Train',
                text = {
                    'Ajoute une carte pierre',
                    "au jeu lorsqu'une",
                    'main est jouée'
                }
            }
        },
        Edition = {},
        Enhanced = {
            m_giga_soil = {
                name = 'Carte terre',
                text = {
                    '{X:chips,C:white}X#1#{} Jetons'
                }
            },
            m_giga_richSoil = {
                name = 'Carte terreau riche',
                text = {
                    '{X:chips,C:white}X#1#{} Jetons',
                    '{C:mult}+#2#{} Multi'
                }
            },
            m_giga_fossilSoil = {
                name = 'Carte terre fossile',
                text = {
                    '{X:chips,C:white}X#1#{} Jetons',
                    '{X:mult,C:white}X#2#{} Multi'
                }
            },
            m_giga_bigBonus = {
                name = 'Carte gros bonus',
                text = {
                    '{C:chips}+#1#{} Jetons supplémentaires',
                    'Marque toujours'
                }
            },
            m_giga_polishStone = {
                name = 'Carte pierre polie',
                text = {
                    '{C:chips}+#1#{} Jetons',
                    '{X:chips,C:white}X#2#{} Jetons',
                    'ni rang ni couleur'
                }
            },
            m_giga_multPlus = {
                name = 'Carte multi plus',
                text = {
                    '{C:mult}+#1#{} Multi',
                    'Marque toujours'
                }
            },
            m_giga_luckiest = {
                name = 'Carte hyperchanceuse',
                text = {
                    '{C:green}#1# chance(s) sur #2#{}',
                    'pour {C:mult}+#3#{} Multi',
                    '{C:green}#4# chance(s) sur #5#{}',
                    'de gagner {C:money}#6# ${}',
                    '{C:green}#7# chance(s) sur #8#{}',
                    'de créer {C:attention}#9# {C:giga_Food}Nourriture{}'
                }
            },
            m_giga_perfectGold = {
                name = 'Carte or parfait',
                text = {
                    '{C:money}#1# ${} si cette',
                    'carte est conservée en main',
                    'à la fin de la manche',
                    'Augmente de {C:money}#2# ${} si jouée'
                }
            },
            m_giga_titanium = {
                name = 'Carte titane',
                text = {
                    '{X:mult,C:white}X#1#{} Multi tant que',
                    'cette carte reste en main',
                    'Augmente de {X:mult,C:white}X#2#',
                    "lorsqu'elle est jouée"
                }
            },
            m_giga_reinforcedGlass = {
                name = 'Carte verre renforcé',
                text = {
                    '{X:mult,C:white}X#1#{} Multi',
                    '{C:green}#2# chance(s) sur #3#{} de',
                    'détruire la carte et créer',
                    'une carte {C:spectral}Spectrale{}'
                }
            },
            m_giga_evolvedWild = {
                name = 'Carte polyvalente évoluée',
                text = {
                    '{C:mult}+#1#{} Multi, {C:chips}+#2#{} Jetons',
                    'augmente de {C:mult}+#3#{} Multi,',
                    '{C:chips}+#4#{} Jetons si {C:attention}jouée{}',
                    '{C:inactive,s:0.7}Cet effet est temporaire'
                }
            },
            m_giga_pottery = {
                name = 'Carte poterie',
                text = {
                    '{C:chips}+#1#{} Jetons',
                    '{C:green}#2# chance(s) sur #3#{} de',
                    'détruire la carte et créer',
                    'une carte {C:giga_Artefact}Artefact{}',
                    'ni rang ni couleur'
                }
            },
            m_giga_engravedPottery = {
                name = 'Carte poterie gravée',
                text = {
                    '{C:chips}+#1#{} Jetons',
                    '{X:mult,C:white}X#2#{} Multi',
                    '{C:green}#3# chance(s) sur #4#{} de',
                    'détruire la carte et créer',
                    'une carte {C:giga_Artefact}Artefact{}',
                    'ni rang ni couleur'
                }
            },
            m_giga_giga = {
                name = 'Carte giga',
                text = {
                    '{C:chips}+#1#{} Jetons, {C:mult}+#2#{} Multi',
                    '{X:chips,C:white}X#3#{} Jetons, {X:mult,C:white}X#4#{} Multi',
                    "Peut être de n'importe quelle couleur"
                }
            },
            m_giga_gigaMax = {
                name = 'Carte giga max',
                text = {
                    '{C:chips}+#1#{} Jetons, {C:mult}+#2#{} Multi',
                    '{X:chips,C:white}X#3#{} Jetons, {X:mult,C:white}X#4#{} Multi',
                    '{C:money}#5# ${} si cette carte',
                    'est conservée en main',
                    'à la fin de la manche',
                    "Peut être de n'importe quelle couleur"
                }
            },
            m_giga_ultimateGigaMax = {
                name = 'Carte giga max ultime',
                text = {
                    '{C:chips}+#1#{} Jetons, {C:mult}+#2#{} Multi',
                    '{X:chips,C:white}X#3#{} Jetons, {X:mult,C:white}X#4#{} Multi',
                    '{C:money}#5# ${} si cette carte',
                    'est conservée en main',
                    'à la fin de la manche',
                    'Augmente les jetons et le multi si jouée',
                    "Peut être de n'importe quelle couleur"
                }
            }
        },
        Giga_Artefact = {
            c_giga_fishingHook = {
                name = 'Hameçon',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_arrow = {
                name = 'Flèche',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_plate = {
                name = 'Assiette',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_tablet = {
                name = 'Tablette',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_helm = {
                name = 'Heaume',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_mayaMask = {
                name = 'Masque maya',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_pillar = {
                name = 'Pilier',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_silex = {
                name = 'Silex',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_trident = {
                name = 'Trident',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_totem = {
                name = 'Totem',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_diadem = {
                name = 'Diadème',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_boneDie = {
                name = "Dé d'os",
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            },
            c_giga_shellAmulet = {
                name = 'Amulette de coquillage',
                text = {
                    'Donne {X:mult,C:white}X#1#{} Multi si la carte',
                    'marquée est de rang #2#.',
                    "{C:green}#3# chance(s) sur #4#{} d'augmenter sa valeur",
                    'de vente de {C:money}#5# ${} à la fin de la',
                    'manche, sinon diminue de {C:money}#6# ${}'
                }
            }
        },
        Giga_Food = {
            c_giga_cheeseburger = {
                name = 'Cheeseburger',
                text = {
                    'Un délicieux cheeseburger qui',
                    'donne {C:chips}+#1#{} Jetons',
                    'pendant {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_pizza = {
                name = 'Part de pizza',
                text = {
                    'Une délicieuse part de pizza qui',
                    'donne {C:mult}+#1#{} Multi',
                    'pendant {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_frenchFries = {
                name = 'Frites',
                text = {
                    'De délicieuses frites qui',
                    'augmentent la taille de main de {C:attention}+#1#{}',
                    'pendant {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_soda = {
                name = 'Soda',
                text = {
                    'Un délicieux soda qui',
                    'donne {C:attention}+#1#{} défausse',
                    'pendant {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_iceCream = {
                name = 'Glace',
                text = {
                    'Une délicieuse glace qui',
                    'donne {C:attention}+#1#{} main',
                    'pendant {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_tacos = {
                name = 'Tacos',
                text = {
                    'De délicieux tacos qui',
                    'donnent {X:mult,C:white}X#1#{} Multi',
                    'pendant {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_apple = {
                name = 'Pomme',
                text = {
                    'Une délicieuse pomme qui',
                    'crée {C:attention}#1#{} carte de tarot',
                    'aléatoire dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_banana = {
                name = 'Banane',
                text = {
                    'Une délicieuse banane qui',
                    'augmente le niveau de la dernière',
                    'main jouée de {C:attention}#1#{} dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_candy = {
                name = 'Bonbon',
                text = {
                    'Un délicieux bonbon qui',
                    'donne {C:money}#1# ${} dans',
                    '{C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_chocolate = {
                name = 'Chocolat',
                text = {
                    'Un délicieux chocolat qui',
                    'crée {C:attention}#1#{} carte planète',
                    'aléatoire dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_coffee = {
                name = 'Café',
                text = {
                    'Un délicieux café qui',
                    'donne {C:attention}+#1#{} réassort gratuit',
                    'dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_cookie = {
                name = 'Cookie',
                text = {
                    'Un délicieux cookie qui',
                    'améliore {C:attention}#1#{} carte sélectionnée',
                    'en {C:attention}Carte chance{}'
                }
            },
            c_giga_croissant = {
                name = 'Croissant',
                text = {
                    'Un délicieux croissant qui',
                    'améliore {C:attention}#1#{} carte sélectionnée',
                    'en {C:attention}Carte or{}'
                }
            },
            c_giga_hotDog = {
                name = 'Hot-dog',
                text = {
                    'Un délicieux hot-dog qui',
                    'améliore {C:attention}#1#{} carte sélectionnée',
                    'en {C:attention}Carte multi{}'
                }
            },
            c_giga_pancake = {
                name = 'Pancake',
                text = {
                    'Un délicieux pancake qui',
                    'améliore {C:attention}#1#{} carte sélectionnée',
                    'en {C:attention}Carte bonus{}'
                }
            },
            c_giga_sushi = {
                name = 'Sushi',
                text = {
                    'De délicieux sushis qui',
                    'améliorent {C:attention}#1#{} carte sélectionnée',
                    'en {C:attention}Carte polyvalente{}'
                }
            },
            c_giga_watermelon = {
                name = 'Pastèque',
                text = {
                    'Une délicieuse pastèque qui',
                    'améliore {C:attention}#1#{} carte sélectionnée',
                    'en {C:attention}Carte acier{}'
                }
            },
            c_giga_grapes = {
                name = 'Raisin',
                text = {
                    'De délicieux raisins qui',
                    'améliorent {C:attention}#1#{} carte sélectionnée',
                    'en {C:attention}Carte pierre{}'
                }
            },
            c_giga_orange = {
                name = 'Orange',
                text = {
                    'Une délicieuse orange qui',
                    'crée {C:attention}#1#{} carte aléatoire',
                    'de la couleur {C:diamonds}Carreau{}'
                }
            },
            c_giga_cherry = {
                name = 'Cerise',
                text = {
                    'Une délicieuse cerise qui',
                    'convertit {C:attention}#1#{} carte sélectionnée',
                    'en {C:hearts}Cœur{}'
                }
            },
            c_giga_lemon = {
                name = 'Citron',
                text = {
                    'Un délicieux citron qui',
                    'convertit {C:attention}#1#{} carte sélectionnée',
                    'en {C:diamonds}Carreau{}'
                }
            },
            c_giga_pear = {
                name = 'Poire',
                text = {
                    'Une délicieuse poire qui',
                    'crée {C:attention}#1#{} carte aléatoire',
                    'de la couleur {C:spades}Pique{}'
                }
            },
            c_giga_plum = {
                name = 'Prune',
                text = {
                    'Une délicieuse prune qui',
                    'convertit {C:attention}#1#{} carte sélectionnée',
                    'en {C:spades}Pique{}'
                }
            },
            c_giga_popcorn = {
                name = 'Pop-corn',
                text = {
                    'Du délicieux pop-corn qui',
                    'crée {C:attention}#1#{} carte {C:giga_Food}Nourriture{}',
                    'aléatoire'
                }
            },
            c_giga_cupcake = {
                name = 'Cupcake',
                text = {
                    'Un délicieux cupcake qui',
                    'applique une {C:attention}Édition{} aléatoire',
                    'sur un Joker sans édition'
                }
            },
            c_giga_donut = {
                name = 'Donut',
                text = {
                    'De délicieux donuts qui',
                    'convertissent la carte de {C:attention}gauche{}',
                    "en l'une des {C:attention}2{} cartes",
                    'les plus à {C:attention}droite{}'
                }
            },
            c_giga_durian = {
                name = 'Durian',
                text = {
                    'Un délicieux durian qui',
                    'transforme {C:attention}#1#{} carte',
                    'en {C:attention}Carte de verre{}'
                }
            },
            c_giga_quicheLorraine = {
                name = 'Quiche lorraine',
                text = {
                    'Une délicieuse quiche lorraine qui',
                    'crée {C:attention}#1#{} carte aléatoire',
                    'de la couleur {C:hearts}Cœur{}'
                }
            },
            c_giga_empanadas = {
                name = 'Empanadas',
                text = {
                    'De délicieuses empanadas qui',
                    'créent {C:attention}#1#{} carte aléatoire',
                    'de la couleur {C:clubs}Trèfle{}'
                }
            },
            c_giga_blueberryMuffin = {
                name = 'Muffin aux myrtilles',
                text = {
                    'Un délicieux muffin aux myrtilles qui',
                    'convertit {C:attention}#1#{} carte',
                    'en {C:clubs}Trèfle{}'
                }
            },
            c_giga_bubbleTea = {
                name = 'Bubble tea',
                text = {
                    'Un délicieux bubble tea qui',
                    'ajoute un {C:attention}Sceau{} aléatoire sur',
                    '{C:attention}#1#{} carte sélectionnée dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_marshmallow = {
                name = 'Guimauves',
                text = {
                    'De délicieuses guimauves qui',
                    'détruisent {C:attention}#1#{} carte sélectionnée'
                }
            },
            c_giga_strawberries = {
                name = 'Fraises',
                text = {
                    'De délicieuses fraises qui',
                    'transforment {C:attention}#1#{} carte',
                    'en {C:attention}Carte poterie{}'
                }
            },
            c_giga_poutine = {
                name = 'Poutine',
                text = {
                    'Une délicieuse poutine qui vous',
                    'donne de façon permanente {C:attention}+#1#{}',
                    'à la taille de main dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_appleJuice = {
                name = 'Jus de pomme',
                text = {
                    'Un délicieux jus de pomme qui',
                    'crée {C:attention}#1#{} carte aléatoire',
                    'de la couleur {C:paperback_crowns}Couronne{}'
                }
            },
            c_giga_migas = {
                name = 'Migas',
                text = {
                    'De délicieuses migas qui',
                    'donnent une carte {C:purple}Aberration{}',
                    'dans {C:attention}#1#{} manches',
                    '{C:inactive}#2#'
                }
            },
            c_giga_cake = {
                name = 'Gâteau',
                text = {
                    'Un délicieux gâteau qui',
                    'améliore de façon permanente {C:attention}#1#{}',
                    'carte sélectionnée au rang supérieur'
                }
            },
            c_giga_ramen = {
                name = 'Ramen',
                text = {
                    'Un délicieux ramen qui',
                    'donne {X:chips,C:white}X#1#{} Jetons',
                    'pendant {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_cheese = {
                name = 'Fromage',
                text = {
                    'Un délicieux fromage qui',
                    'diminue le coût du magasin de {C:money}#1# ${}',
                    'pendant {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_pepper = {
                name = 'Piment',
                text = {
                    'Un délicieux piment qui',
                    'applique une {C:attention}Surcharge{} aléatoire',
                    'sur {C:attention}#1#{} carte sélectionnée'
                }
            },
            c_giga_goldenApple = {
                name = 'Pomme dorée',
                text = {
                    'Une délicieuse pomme dorée qui',
                    'donne {C:money}#1# ${} et applique',
                    '{C:dark_edition}Négatif{} à une carte consommable'
                }
            },
            c_giga_guacamole = {
                name = 'Guacamole',
                text = {
                    'Un délicieux guacamole qui',
                    'vous fait piocher {C:attention}#1#{} carte'
                }
            },
            c_giga_caesarSalad = {
                name = 'Salade César',
                text = {
                    'Une délicieuse salade César qui',
                    'donne un {C:tarot}Tarot{} dans {C:attention}#1#{} manches',
                    '{C:inactive}#2#'
                }
            },
            c_giga_clubSandwich = {
                name = 'Club Sandwich',
                text = {
                    'Un délicieux club sandwich qui',
                    'donne une {C:planet}Planète{} dans {C:attention}#1#{} manches',
                    '{C:inactive}#2#'
                }
            },
            c_giga_pho = {
                name = 'Phở',
                text = {
                    'Un délicieux phở qui donne une',
                    'carte {C:spectral}Spectrale{} dans {C:attention}#1#{} manches',
                    '{C:inactive}#2#'
                }
            },
            c_giga_spaghetti = {
                name = 'Spaghettis',
                text = {
                    'De délicieux spaghettis qui',
                    'transforment {C:attention}#1#{} carte',
                    'en {C:attention}Carte bonus{}'
                }
            },
            c_giga_steak = {
                name = 'Steak',
                text = {
                    'Un délicieux steak qui',
                    'transforme {C:attention}#1#{} carte',
                    'en {C:attention}Carte pierre{}'
                }
            },
            c_giga_sushis = {
                name = 'Sushis',
                text = {
                    'De délicieux sushis qui',
                    'transforment {C:attention}#1#{} carte',
                    'en {C:attention}Carte multi{}'
                }
            },
            c_giga_sugarPie = {
                name = 'Tarte au sucre',
                text = {
                    'Une délicieuse tarte au sucre qui',
                    'transforme {C:attention}#1#{} carte',
                    'en {C:attention}Carte chance{}'
                }
            },
            c_giga_salmon = {
                name = 'Saumon',
                text = {
                    'Un délicieux saumon qui',
                    'transforme {C:attention}#1#{} carte',
                    'en {C:attention}Carte or{}'
                }
            },
            c_giga_waffle = {
                name = 'Gaufre',
                text = {
                    'Une délicieuse gaufre qui',
                    'transforme {C:attention}#1#{} carte',
                    'en {C:attention}Carte polyvalente{}'
                }
            },
            c_giga_lollipop = {
                name = 'Sucette',
                text = {
                    'Une délicieuse sucette qui',
                    'transforme {C:attention}#1#{} carte',
                    'en {C:attention}Carte acier{}'
                }
            },
            c_giga_paella = {
                name = 'Paella',
                text = {
                    'Une délicieuse paella qui',
                    'crée {C:attention}#1#{} carte aléatoire',
                    'de la couleur {C:spades}Pique{}'
                }
            },
            c_giga_gummyBear = {
                name = 'Ours en gélatine',
                text = {
                    'Un délicieux ours en gélatine qui',
                    'crée {C:attention}#1#{} carte aléatoire',
                    'de la couleur {C:diamonds}Carreau{}'
                }
            },
            c_giga_pBJSandwich = {
                name = 'Sandwich beurre de cacahuète et confiture',
                text = {
                    'Un délicieux sandwich PB&J qui',
                    'ajoute de façon permanente {C:mult}+#1#{} Multi',
                    'à {C:attention}#2#{} carte sélectionnée'
                }
            },
            c_giga_burger = {
                name = 'Burger',
                text = {
                    'Un délicieux burger qui ajoute',
                    'de façon permanente {C:chips}+#1#{} Jetons',
                    'à {C:attention}#2#{} carte sélectionnée'
                }
            },
            c_giga_fruitSalad = {
                name = 'Salade de fruits',
                text = {
                    'Une délicieuse salade de fruits qui',
                    '{C:attention}améliore{} la modification de',
                    '{C:attention}#1#{} carte'
                }
            },
            c_giga_chocolateBar = {
                name = 'Barre de chocolat',
                text = {
                    'Une délicieuse barre de chocolat',
                    'qui convertit {C:attention}#1#{} carte',
                    'en {C:spades}Pique{}'
                }
            },
            c_giga_macNCheese = {
                name = 'Macaronis au fromage',
                text = {
                    'De délicieux macaronis au fromage',
                    'qui convertissent {C:attention}#1#{} carte',
                    'en {C:diamonds}Carreau{}'
                }
            },
            c_giga_hawaiianPizza = {
                name = 'Pizza hawaïenne',
                text = {
                    'Une délicieuse pizza hawaïenne',
                    'qui crée une carte',
                    '{C:giga_Food}Nourriture{} aléatoire'
                }
            },
            c_giga_cranberryJuice = {
                name = 'Jus de canneberge',
                text = {
                    'Un délicieux jus de canneberge qui',
                    'ajoute une {C:attention}Surcharge{} aléatoire sur',
                    '{C:attention}#1#{} carte sélectionnée dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_bagOfCandy = {
                name = 'Sachet de bonbons',
                text = {
                    'Un délicieux sachet de bonbons',
                    'qui {C:attention}améliore{} le sceau',
                    'de {C:attention}#1#{} carte'
                }
            },
            c_giga_birthdayCake = {
                name = "Gâteau d'anniversaire",
                text = {
                    "Un délicieux gâteau d'anniversaire qui vous",
                    'donne de façon permanente {C:attention}+#1#{} emplacement',
                    'de consommable dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_turkey = {
                name = 'Dinde',
                text = {
                    'Une délicieuse dinde qui vous donne',
                    'de façon permanente {C:dark_edition}+#1#{} emplacement',
                    'de Joker dans {C:attention}#2#{} manches',
                    '{C:inactive}#3#'
                }
            },
            c_giga_UntitledCM2 = {
                name = '[UntitledCM]',
                text = {
                    'Un délicieux [UntitledCM] qui',
                    'crée {C:attention}#1#{} carte aléatoire',
                    'de la couleur {C:paperback_stars}Étoile{}'
                }
            },
            c_giga_UntitledCM3 = {
                name = '[UntitledCM]',
                text = {
                    'Un délicieux [UntitledCM] qui donne',
                    'un {C:paperback_minor_arcana}Arcane mineur{} dans',
                    '{C:attention}#1#{} manches',
                    '{C:inactive}#2#'
                }
            },
            c_giga_UntitledCM4 = {
                name = '[UntitledCM]',
                text = {
                    'Un délicieux [UntitledCM] qui',
                    'convertit {C:attention}#1#{} carte',
                    'en {C:clubs}Couronne{}'
                }
            },
            c_giga_UntitledCM5 = {
                name = '[UntitledCM]',
                text = {
                    'Un délicieux [UntitledCM] qui',
                    'convertit {C:attention}#1#{} carte',
                    'en {C:paperback_stars}Étoile{}'
                }
            }
        },
        Joker = {
            j_giga_cashPass = {
                name = 'Pass Adhérent',
                text = {
                    "{C:money}#1# ${} lorsqu'une blinde est choisie,",
                    '{X:mult,C:white}X#2#{} Multi'
                }
            },
            j_giga_blueChicken = {
                name = 'Poulet bleu',
                text = {
                    'Dans {C:attention}#2#{} manches, crée un',
                    "{C:attention,T:j_giga_blueEgg}Œuf bleu{} lorsqu'une",
                    'blinde est choisie',
                    '{C:chips}+#1#{} Jetons'
                }
            },
            j_giga_blueEgg = {
                name = 'Œuf bleu',
                text = {
                    "Crée un {C:attention,T:j_egg}Œuf{} lorsqu'il est vendu",
                    'Rapporte {C:money}#1# ${} à la fin de la manche'
                }
            },
            j_giga_kingOfJacks = {
                name = 'Roi des Valets',
                text = {
                    '{X:mult,C:white}X#1#{} Multi pour chaque',
                    '{C:attention}Valet{} dans votre main',
                    'lors du décompte'
                }
            },
            j_giga_snokot = {
                name = 'Snokot',
                text = {
                    'Chaque {C:attention}#1#{} marqué donne {C:mult}+#2#{} Multi.',
                    'Gagne {C:mult}+#3#{} Multi par {C:attention}#1#{} marqué',
                    '{C:inactive}Le rang change et se réinitialise',
                    '{C:inactive}à la fin de la mise'
                }
            },
            j_giga_snapchatGirl = {
                name = 'Fille Snapchat',
                text = {
                    '{C:chips}+#1#{} Jetons pour chaque {C:hearts}Cœur{}',
                    'dans votre main lors du décompte'
                }
            },
            j_giga_tRex = {
                name = 'T-Rex',
                text = {
                    'Si la main marquée est un simple {C:attention}6{},',
                    'détruisez-le et gagnez {C:money}#1# ${}'
                }
            },
            j_giga_velocyraptor = {
                name = 'Vélociraptor',
                text = {
                    "{C:green}#1# chance(s) sur #2#{} d'améliorer",
                    'le niveau de la main jouée pour',
                    'chaque {C:attention}Carte bonus{} jouée'
                }
            },
            j_giga_highRiskHighReward = {
                name = 'Gros Risque, Grosse Récompense',
                text = {
                    '{C:green}#1# chance(s) sur #2#{} de donner',
                    '{X:mult,C:white}X#3#{} Multi. {C:green}#4# chance(s) sur #5#{}',
                    'de perdre {C:money}#6# ${} à la fin de la manche'
                }
            },
            j_giga_shreddedAce = {
                name = 'As déchiqueté',
                text = {
                    '{X:mult,C:white}X#1#{} Multi pour chaque {C:attention}As{}',
                    'détruit cette partie',
                    '{C:inactive}(Actuellement : {X:mult,C:white}X#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_pteranodon = {
                name = 'Ptéranodon',
                text = {
                    '{C:mult}+#1#{} Multi si la main jouée',
                    'ne contient aucun {C:attention}2{}'
                }
            },
            j_giga_pablo = {
                name = 'Pablo',
                text = {
                    "Crée un {C:attention}Tacos{} lorsqu'une",
                    'blinde est choisie'
                }
            },
            j_giga_jackMutator = {
                name = 'Mutateur de Valets',
                text = {
                    'Transforme tous les {C:attention}Valets{}',
                    'joués en cartes {C:attention}Aléatoires{}'
                }
            },
            j_giga_blueEyesWhiteDragon = {
                name = 'Dragon Blanc aux Yeux Bleus',
                text = {
                    'Chaque {C:attention}Figure{} jouée donne',
                    '{C:chips}+#1#{} Jetons lors du décompte'
                }
            },
            j_giga_redEyesBlackDragon = {
                name = 'Dragon Noir aux Yeux Rouges',
                text = {
                    'Chaque {C:attention}Figure{} jouée donne',
                    '{C:mult}+#1#{} Multi lors du décompte'
                }
            },
            j_giga_byud = {
                name = 'Dragon Blanc aux Yeux Bleus Ultime',
                text = {
                    '{X:mult,C:white}X#1#{} Multi'
                }
            },
            j_giga_dmk = {
                name = 'Maître Cavalier Dragon',
                text = {
                    '{X:mult,C:white}X#1#{} Multi et {C:chips}+#2#{} Jetons',
                    'pour chaque {C:attention}Figure{} jouée'
                }
            },
            j_giga_blackLusterSoldier = {
                name = 'Soldat du Lustre Noir',
                text = {
                    'Chaque {C:attention}Figure{} jouée donne',
                    '{X:mult,C:white}X#1#{} Multi lors du décompte'
                }
            },
            j_giga_darkMagician = {
                name = 'Magicien Sombre',
                text = {
                    'Chaque {C:attention}Figure{} jouée donne',
                    '{C:chips}+#1#{} Jetons et {C:mult}+#2#{} Multi'
                }
            },
            j_giga_moc = {
                name = 'Maître du Chaos',
                text = {
                    'Chaque {C:attention}Figure{} jouée donne',
                    '{X:mult,C:white}X#1#{} Multi et {C:chips}+#2#{} Jetons'
                }
            },
            j_giga_pinkTourmaline = {
                name = 'Tourmaline rose',
                text = {
                    '{X:mult,C:white}X#1#{} Multi pour chaque carte',
                    '{C:dark_edition}Holographique{} conservée en main'
                }
            },
            j_giga_moonstone = {
                name = 'Pierre de lune',
                text = {
                    '{C:mult}+#1#{} Multi pour chaque carte',
                    '{C:dark_edition}Premium{} conservée en main'
                }
            },
            j_giga_rainbowQuartz = {
                name = 'Quartz arc-en-ciel',
                text = {
                    '{C:chips}+#1#{} Jetons pour chaque carte',
                    '{C:dark_edition}Polychrome{} conservée en main'
                }
            },
            j_giga_llotfo = {
                name = {
                    'Jambe Gauche de',
                    "l'Interdit"
                },
                text = {
                    '{C:chips}+#1#{} Jetons'
                }
            },
            j_giga_rlotfo = {
                name = {
                    'Jambe Droite de',
                    "l'Interdit"
                },
                text = {
                    '{C:chips}+#1#{} Jetons'
                }
            },
            j_giga_raotfo = {
                name = {
                    'Bras Droit de',
                    "l'Interdit"
                },
                text = {
                    '{C:mult}+#1#{} Multi'
                }
            },
            j_giga_laotfo = {
                name = {
                    'Bras Gauche de',
                    "l'Interdit"
                },
                text = {
                    '{C:mult}+#1#{} Multi'
                }
            },
            j_giga_etfo = {
                name = {
                    '{s:1.2}Exodia{}',
                    "l'Interdit"
                },
                text = {
                    '{X:mult,C:white}X#1#{} Multi'
                }
            },
            j_giga_tlei = {
                name = {
                    "L'Incarnation Légendaire",
                    "d'Exodia"
                },
                text = {
                    '{X:mult,C:white}X#1#{} Multi et {C:chips}+#2#{} Jetons.',
                    'Donne la victoire instantanée si vous possédez',
                    "toutes les pièces de l'Interdit"
                }
            },
            j_giga_paleontologist = {
                name = 'Paléontologue',
                text = {
                    'Crée un Joker {C:attention}Dinosaure{} aléatoire',
                    "lorsqu'une blinde Boss est vaincue"
                }
            },
            j_giga_paleoExpert = {
                name = 'Expert en paléontologie',
                text = {
                    'Les Jokers {C:attention}Dinosaures{} sont {C:attention}#1#X{}',
                    'plus puissants'
                }
            },
            j_giga_refinery = {
                name = 'Raffinerie',
                text = {
                    "Améliore le sceau ou l'amélioration d'une carte",
                    'aléatoire à la fin de la manche'
                }
            },
            j_giga_crystalOfHungriness = {
                name = 'Cristal de la faim',
                text = {
                    "Gagne {X:mult,C:white}X#1#{} Multi chaque fois qu'une",
                    'carte {C:giga_Food}Nourriture{} est consommée',
                    '{C:inactive}(Actuellement : {X:mult,C:white}X#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_doubleFork = {
                name = 'Fourchette double',
                text = {
                    'Les cartes {C:giga_Food}Nourriture{} se déclenchent',
                    '{C:attention}2{} fois'
                }
            },
            j_giga_crackedSkull = {
                name = 'Crâne fissuré',
                text = {
                    '{X:mult,C:white}X#1#{} Multi, mais {C:green}#2# chance(s) sur #3#{}',
                    'de se détruire à la fin de la manche'
                }
            },
            j_giga_sagittariusA = {
                name = 'Sagittarius A*',
                text = {
                    'Gagne {X:mult,C:white}X#1#{} Multi par carte {C:spectral}Spectrale{}',
                    'utilisée cette partie',
                    '{C:inactive}(Actuellement : {X:mult,C:white}X#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_monochromeCrystal = {
                name = 'Cristal monochrome',
                text = {
                    'Chaque carte de couleur {V:1}#1#{} jouée',
                    'donne {C:chips}+#2#{} Jetons et {C:mult}+#3#{} Multi'
                }
            },
            j_giga_marvinTheFourth = {
                name = 'Marvin, Le Quatrième',
                text = {
                    'Donne {C:chips}+#1#{} Jetons et {X:mult,C:white}X#2#{} Multi',
                    'pour chaque {C:attention}4{}, {C:attention}5{} ou {C:attention}6{} de {V:1}#3#{}',
                    '{C:inactive}La couleur change à chaque carte jouée'
                }
            },
            j_giga_upgradedTicket = {
                name = 'Ticket amélioré',
                text = {
                    "Gagnez {C:money}#1# ${} lorsqu'une carte avec",
                    'un sceau ou une amélioration avancée marque'
                }
            },
            j_giga_healthyRoots = {
                name = 'Racines saines',
                text = {
                    'Chaque carte {C:attention}Terre{} conservée en main',
                    'donne {C:mult}+#1#{} Multi à la fin de la manche'
                }
            },
            j_giga_nahnahu = {
                name = 'Nahnahu',
                text = {
                    '{C:chips}+#1#{} Jetons pour chaque défausse restante'
                }
            },
            j_giga_hergosu = {
                name = 'Hergosu',
                text = {
                    '{C:mult}+#1#{} Multi pour chaque main restante'
                }
            },
            j_giga_tabaosl = {
                name = 'Tabaosl',
                text = {
                    "{X:mult,C:white}X#1#{} Multi si aucune défausse n'a été utilisée"
                }
            },
            j_giga_stockMarket = {
                name = 'Marché boursier',
                text = {
                    '{C:green}#1# chance(s) sur #2#{} de doubler votre argent',
                    'à la fin de la manche, sinon perdez la moitié'
                }
            },
            j_giga_triceratops = {
                name = 'Tricératops',
                text = {
                    '{C:chips}+#1#{} Jetons si la main jouée',
                    'contient un {C:attention}Brelan{}'
                }
            },
            j_giga_bonoboJoker = {
                name = 'Joker Bonobo',
                text = {
                    '{C:mult}+#1#{} Multi pour chaque carte de rang pair jouée'
                }
            },
            j_giga_onTheClock = {
                name = 'Contre la montre',
                text = {
                    'Donne du {C:mult}Multi{} et des {C:chips}Jetons{} selon',
                    "l'{C:attention}heure actuelle{}",
                    '{C:inactive}(Heures > Multi / Minutes > Jetons)'
                }
            },
            j_giga_aliveBook = {
                name = 'Livre vivant',
                text = {
                    'Donne du {C:mult}Multi{} égal à la {C:attention}longueur{}',
                    'du {C:attention}nom{} du Joker le plus à gauche',
                    '{C:inactive}(Actuellement : {C:mult}+#1#{} {C:inactive}Multi)'
                }
            },
            j_giga_roposiel = {
                name = 'Roposiel',
                text = {
                    'Gagne {C:mult}+#1#{} Multi pour chaque nom de Joker',
                    'contenant un {C:attention}chiffre{}',
                    'ou un {C:attention}caractère spécial{}.',
                    '{C:inactive}(Actuellement : {C:mult}+#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_rogAno = {
                name = 'Rog-Ano',
                text = {
                    '{X:mult,C:white}X#1#{} Multi pour chaque',
                    '{C:attention}Sceau{} dans votre {C:attention}jeu{}',
                    '{C:inactive}(Actuellement : {X:mult,C:white}X#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_myt_own = {
                name = 'MrYamiTsu',
                text = {
                    'Les {C:attention}cartes jouées{} avec des',
                    '{C:attention}améliorations avancées{} ou des {C:attention}Sceaux{}',
                    "donnent {X:mult,C:white}X#1#{} Multi lorsqu'elles marquent"
                }
            },
            j_giga_factolord = {
                name = 'Seigneur factoriel',
                text = {
                    'Gagne {C:attention}X5{} la factorielle {B:1,C:white}(!){}',
                    "du nombre d'emplacements de Joker libres",
                    'en {C:chips}Jetons{}',
                    '{C:inactive}(Actuellement : {C:chips}+#1#{} {C:inactive}Jetons)'
                }
            },
            j_giga_rescuePacket = {
                name = 'Paquet de secours',
                text = {
                    'Après avoir vaincu la {C:attention}blinde Boss{},',
                    'gagne temporairement {C:attention}+#1#{} emplacement',
                    'de carte disponible dans le magasin'
                }
            },
            j_giga_linearLink = {
                name = 'Lien linéaire',
                text = {
                    'Si la main contient des {C:attention}Paires liées{},',
                    '{C:attention}rejoue{} chaque carte jouée'
                }
            },
            j_giga_liarVadko = {
                name = 'Vadko le menteur',
                text = {
                    'Les cartes {C:attention}non marquées{}',
                    'donnent {C:mult}+#1#{} Multi'
                }
            },
            j_giga_big31 = {
                name = 'Grand 31',
                text = {
                    '{C:attention}2X{} la taille de main',
                    'dans les paquets de cartes'
                }
            },
            j_giga_noCashForYou = {
                name = "Pas d'argent pour toi",
                text = {
                    '{X:mult,C:white}X#1#{} Multi pour chaque',
                    '{C:money}dollar{} de dette',
                    '{C:inactive}(Actuellement : {X:mult,C:white}X#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_likoyTonam = {
                name = 'Likoy-Tonam',
                text = {
                    'Après la {C:attention}dernière main{} de la manche,',
                    '{C:attention}améliore{} le sceau de la {C:attention}première{}',
                    'carte {C:attention}conservée{} en main'
                }
            },
            j_giga_bearmanJeff = {
                name = "Jeff l'homme-ours",
                text = {
                    "{C:green}#1# chance(s) sur #2#{} d'ajouter une",
                    '{C:attention}Surcharge{} sur une carte aléatoire',
                    'au début de la manche. Les {C:green}chances{} augmentent',
                    'pour chaque {C:attention}Consommable{} possédé'
                }
            },
            j_giga_ohnyartemmys = {
                name = 'Ohnyartemmys',
                text = {
                    "Conserve l'effet de l'{C:attention}Or{} et de l'{C:attention}Acier{}",
                    "pour la manche lorsqu'ils sont {C:attention}défaussés{}",
                    '{C:inactive}(Actuellement : {X:mult,C:white}X#1#{} {C:inactive}Multi / {C:money}#2# ${}{C:inactive})'
                }
            },
            j_giga_kebfordius = {
                name = 'Kebfordius',
                text = {
                    "Crée jusqu'à {C:attention}#1#{} cartes {C:planet}Planète{}",
                    'si la main jouée est des {C:attention}Paires liées{}'
                }
            },
            j_giga_potteryJoker = {
                name = 'Joker poterie',
                text = {
                    'Ce Joker gagne {C:mult}+#1#{} Multi pour chaque carte',
                    '{C:giga_Artefact}Artefact{} créée cette partie',
                    '{C:inactive}(Actuellement : {C:mult}+#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_fuhdekun = {
                name = 'Fuhdekun',
                text = {
                    "Lorsqu'une {C:attention}carte à jouer{} est ajoutée,",
                    "{C:green}#1# chance(s) sur #2#{} d'ajouter une",
                    '{C:attention}copie{} au jeu'
                }
            },
            j_giga_protectiveWax = {
                name = 'Cire protectrice',
                text = {
                    "Lorsqu'une carte {C:giga_Artefact}Artefact{}",
                    'est créée, elle devient {C:dark_edition}Négative{}'
                }
            },
            j_giga_roumuskusTheJoke = {
                name = 'Roumuskus le Joké',
                text = {
                    'Gagne la valeur en {C:chips}Jetons{} de la {C:attention}première{}',
                    '{C:attention}carte défaussée{} en {C:mult}Multi{}. Se réinitialise',
                    'après avoir joué une main {C:inactive}(Actuellement : {C:mult}+#1# {C:inactive}Multi)'
                }
            },
            j_giga_ajebguer = {
                name = 'Ajebguer',
                text = {
                    "Gagne {C:mult}+#1#{} Multi lorsqu'une carte",
                    'avec une {C:attention}Surcharge{} est {C:attention}défaussée{}',
                    '{C:inactive}(Actuellement : {C:mult}+#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_theCaskOfAmontillado = {
                name = "Le Baril d'Amontillado",
                text = {
                    'Gagne {X:mult,C:white}X#1#{} Multi pour chaque carte',
                    "{C:attention}Chanceuse{} qui ne {C:attention}s'active pas{}",
                    '{C:inactive}(Actuellement : {X:mult,C:white}X#2#{} {C:inactive}Multi)'
                }
            },
            j_giga_shootingStars = {
                name = 'Étoiles filantes',
                text = {
                    'Les {C:giga_Astral}Planètes astrales{} et les {C:edition}Éditions',
                    '{C:edition}brillantes{} apparaissent {C:attention}#1#X{} plus souvent'
                }
            },
            j_giga_triceratops_alt = {
                name = 'Tricératops ?',
                text = {
                    'Toutes les deux manches, crée {V:1}#1#{} et détruit',
                    'un consommable aléatoire pour gagner {X:mult,C:white}X#2#{} Multi',
                    'et {X:chips,C:white}X#3#{} Jetons (Actuellement {X:mult,C:white}X#4#{} Multi / {X:chips,C:white}X#5#{} Jetons)'
                }
            },
            j_giga_tRex_alt = {
                name = 'T-Rex ?',
                text = {
                    'Si la main marquée est un simple {C:attention}6{},',
                    'détruisez-le pour créer {V:1}#1#{}',
                    'et gagner {C:money}#2# ${}'
                }
            },
            j_giga_pteranodon_alt = {
                name = 'Ptéranodon ?',
                text = {
                    '{C:mult}+#1#{} Multi si la main jouée',
                    'ne contient aucun {C:attention}2{}'
                }
            },
            j_giga_velocyraptor_alt = {
                name = 'Vélociraptor ?',
                text = {
                    "{C:green}#1# chance(s) sur #2#{} d'améliorer le niveau",
                    'de la main jouée pour chaque carte {C:attention}Bonus{} jouée'
                }
            },
            j_giga_pinkTourmaline_alt = {
                name = 'Tourmaline rose ?',
                text = {
                    '{X:mult,C:white}X#1#{} Multi pour chaque carte',
                    '{C:dark_edition}Holographique{} conservée en main'
                }
            },
            j_giga_moonstone_alt = {
                name = 'Pierre de lune ?',
                text = {
                    '{C:mult}+#1#{} Multi pour chaque carte',
                    '{C:dark_edition}Premium{} conservée en main'
                }
            },
            j_giga_rainbowQuartz_alt = {
                name = 'Quartz arc-en-ciel ?',
                text = {
                    '{C:chips}+#1#{} Jetons pour chaque carte',
                    '{C:dark_edition}Polychrome{} conservée en main'
                }
            },
            j_giga_myt_own_alt = {
                name = 'MrYamiTsu ?',
                text = {
                    'Gagne {X:mult,C:white}X#1#{} Multi pour chaque carte',
                    '{C:attention}améliorée{} qui {C:attention}marque{}',
                    '{C:inactive}(Actuellement : {X:mult,C:white}X#2#{}{C:inactive})'
                }
            },
            j_giga_rescuePacket_alt = {
                name = 'Paquet de secours ?',
                text = {
                    'Après avoir vaincu une {C:attention}blinde{}, {C:green}#1# chance(s) sur #2#{}',
                    'de gagner temporairement {C:attention}+#3#{} emplacement de carte',
                    'disponible dans le magasin'
                }
            },
            j_giga_onTheClock_alt = {
                name = 'Contre la montre ?',
                text = {
                    'Donne des {C:chips}Jetons{} et du {C:mult}Multi{} selon',
                    'la {C:attention}date actuelle{}',
                    '{C:inactive}(Jour > Jetons / Mois > Multi)'
                }
            },
            j_giga_cashPass_alt = {
                name = 'Pass Adhérent ?',
                text = {
                    '{X:mult,C:white}X#1#{} Multi,',
                    "{C:money}#2# ${} lorsqu'une blinde est choisie"
                }
            }
        },
        Other = {
            undiscovered_Giga_Food = {
                name = 'Non découvert',
                text = {
                    'Achetez ou utilisez',
                    "cette carte lors d'une",
                    'partie sans code pour',
                    'découvrir ses effets'
                }
            },
            undiscovered_Giga_Artefact = {
                name = 'Non découvert',
                text = {
                    'Achetez ou utilisez',
                    "cette carte lors d'une",
                    'partie sans code pour',
                    'découvrir ses effets'
                }
            },
            yugioh_credit = {
                name = 'Yu-Gi-Oh !',
                text = {
                    'Cette carte provient du',
                    'jeu {C:attention}Yu-Gi-Oh !{}'
                }
            },
            aij_back_credit = {
                name = 'Crédit',
                text = {
                    'Merci à {C:attention}AIJ{} pour le',
                    'design du dos de carte'
                }
            },
            giga_pinkseal_seal = {
                name = 'Sceau rose',
                text = {
                    'Crée une carte {C:giga_Food}Nourriture{}',
                    "lorsqu'elle est jouée et marquée"
                }
            },
            giga_crimsonseal_seal = {
                name = 'Sceau pourpre',
                text = {
                    'Gagne {C:mult}+#1#{} Multi de façon',
                    "permanente tant qu'elle est",
                    'conservée en main'
                }
            },
            giga_aquaseal_seal = {
                name = 'Sceau turquoise',
                text = {
                    'Gagne {C:chips}+#1#{} Jetons de façon',
                    "permanente tant qu'elle est",
                    'conservée en main'
                }
            },
            giga_redplus_seal = {
                name = 'Sceau rouge+',
                text = {
                    '{C:attention}Rejoue{} cette carte',
                    '{C:attention}2{} fois'
                }
            },
            giga_blueplus_seal = {
                name = 'Sceau bleu+',
                text = {
                    'Crée la carte {C:planet}Planète{} de',
                    'la dernière main de poker jouée',
                    'et {C:attention}améliore{} son niveau de {C:attention}#1#{}',
                    'si conservée en main à la fin de la manche'
                }
            },
            giga_goldplus_seal = {
                name = "Sceau d'or+",
                text = {
                    "Rapporte {C:money}#1# ${} lorsqu'elle est",
                    'jouée et marquée'
                }
            },
            giga_purpleplus_seal = {
                name = 'Sceau violet+',
                text = {
                    "Crée jusqu'à {C:attention}#1#{} cartes {C:tarot}Tarot{}",
                    "lorsqu'elle est défaussée"
                }
            },
            giga_redplusplus_seal = {
                name = 'Sceau rouge++',
                text = {
                    '{C:attention}Rejoue{} cette carte',
                    '{C:attention}3{} fois'
                }
            },
            giga_blueplusplus_seal = {
                name = 'Sceau bleu++',
                text = {
                    'Crée la carte {C:planet}Planète{} de la',
                    'dernière main jouée avec une édition {C:dark_edition}Négative{}',
                    'si conservée en main à la fin de la manche'
                }
            },
            giga_goldplusplus_seal = {
                name = "Sceau d'or++",
                text = {
                    "Rapporte {C:money}#1# ${} lorsqu'elle est",
                    'jouée et marquée, augmente de {C:money}#2# ${}',
                    'à chaque manche'
                }
            },
            giga_purpleplusplus_seal = {
                name = 'Sceau violet++',
                text = {
                    'Crée {C:attention}#1#{} cartes {C:tarot}Tarot{}',
                    "avec une chance d'être {C:dark_edition}Négatives{}",
                    "lorsqu'elle est défaussée"
                }
            },
            giga_pinkplus_seal = {
                name = 'Sceau rose+',
                text = {
                    "Lorsqu'elle est {C:attention}marquée{}, crée",
                    '{C:attention}1 carte {C:giga_Food}Nourriture{}, {C:green}#1# chance(s) sur #2#{}',
                    "d'être {C:dark_edition}Négative{}. {C:attention}Réduit{} la taille",
                    'de la blinde de {C:attention}#3# %{}'
                }
            },
            giga_pinkplusplus_seal = {
                name = 'Sceau rose++',
                text = {
                    "Lorsqu'elle est {C:attention}marquée{}, crée",
                    '{C:attention}#1# cartes {C:giga_Food}Nourriture{}, {C:green}#2# chance(s) sur #3#{}',
                    "d'être {C:dark_edition}Négative{}, {C:green}#4# chance(s) sur #5#{}",
                    "d'être {C:rare}Rare{}. {C:attention}Réduit{} la taille de",
                    'la blinde de {C:attention}#6# %{}'
                }
            },
            giga_crimsonplus_seal = {
                name = 'Sceau pourpre+',
                text = {
                    "Gagne {C:mult}+#1#{} Multi en permanence tant qu'elle",
                    'est conservée en main, {X:chips,C:white}X#2#{} Jetons'
                }
            },
            giga_aquaplus_seal = {
                name = 'Sceau turquoise+',
                text = {
                    "Gagne {C:chips}+#1#{} Jetons en permanence tant qu'elle",
                    'est conservée en main, {X:mult,C:white}X#2#{} Multi'
                }
            },
            giga_crimsonplusplus_seal = {
                name = 'Sceau pourpre++',
                text = {
                    "Gagne {C:mult}+#1#{} Multi en permanence tant qu'elle est",
                    '{C:attention}conservée{} en main plus {C:mult}+#2#{} par carte {C:attention}#3#{} jouée.',
                    '{X:chips,C:white}X#4#{} Jetons plus {X:chips,C:white}X#5#{} par carte {C:attention}conservée{} en main'
                }
            },
            giga_aquaplusplus_seal = {
                name = 'Sceau turquoise++',
                text = {
                    "Gagne {C:chips}+#1#{} Jetons en permanence tant qu'elle est",
                    '{C:attention}conservée{} en main plus {C:chips}+#2#{} par Joker {C:attention}#3#{} possédé.',
                    '{X:mult,C:white}X#4#{} Multi plus {X:mult,C:white}X#5#{} par carte {C:attention}Consommable{}'
                }
            },
            giga_amberseal_seal = {
                name = 'Sceau ambre',
                text = {
                    'Crée une carte {C:giga_Artefact}Artefact{}',
                    "lorsqu'elle est jouée et non marquée"
                }
            },
            giga_amberplus_seal = {
                name = 'Sceau ambre+',
                text = {
                    'Crée une carte {C:giga_Artefact}Artefact{}, {C:green}#1# chance(s) sur #2#{}',
                    "d'être {C:dark_edition}Négative{}, et {C:green}#3# chance(s) sur #4#{} de gagner",
                    'une {C:red}défausse{} ou une {C:blue}main{} si non marquée'
                }
            },
            giga_amberplusplus_seal = {
                name = 'Sceau ambre++',
                text = {
                    'Crée {C:attention}#1#{} carte {C:giga_Artefact}Artefact{}, {C:green}#2# chance(s) sur #3#{}',
                    "d'être {C:dark_edition}Négative{}, et {C:green}#4# chance(s) sur #5#{} de gagner",
                    'une {C:red}défausse{} et une {C:blue}main{} si non marquée'
                }
            },
            giga_redOvercharge = {
                name = 'Surcharge rouge',
                text = {
                    '{X:mult,C:white}X#1#{} Multi si {C:attention}jouée{}. Augmente de',
                    '{X:mult,C:white}X#2#{} pour chaque Surcharge {C:attention}défaussée{} cette manche'
                }
            },
            giga_yellowOvercharge = {
                name = 'Surcharge jaune',
                text = {
                    'Rapporte {C:money}#1# ${} si {C:attention}jouée{}. Augmente de',
                    '{C:money}#2# ${} pour chaque {C:attention}#3#{} Surcharge(s) {C:attention}défaussée(s){} cette manche'
                }
            },
            giga_orangeOvercharge = {
                name = 'Surcharge orange',
                text = {
                    'Crée {C:attention}#1# {C:tarot}Tarot{} si {C:attention}jouée{}, {C:green}#2# chance(s) sur #3#{}',
                    "d'être {C:dark_edition}Négative{}. Augmente de {C:attention}#4#{} pour chaque",
                    '{C:attention}#5#{} Surcharge(s) {C:attention}défaussée(s){} cette manche'
                }
            },
            giga_greenOvercharge = {
                name = 'Surcharge verte',
                text = {
                    "Monte d'un niveau une {C:attention}main de poker{} aléatoire si {C:attention}jouée{}.",
                    'Augmente de {C:attention}#2#{} pour chaque {C:attention}#3#{} Surcharge(s) {C:attention}défaussée(s){}'
                }
            },
            giga_blueOvercharge = {
                name = 'Surcharge bleue',
                text = {
                    '{X:chips,C:white}X#1#{} Jetons si {C:attention}jouée{}. Augmente de',
                    '{X:chips,C:white}X#2#{} pour chaque Surcharge {C:attention}défaussée{} cette manche'
                }
            },
            giga_purpleOvercharge = {
                name = 'Surcharge violette',
                text = {
                    'Crée {C:attention}#1# {C:giga_Food}Nourriture{} si {C:attention}jouée{}, {C:green}#2# chance(s) sur #3#{}',
                    "d'être {C:dark_edition}Négative{}. Augmente de {C:attention}#4#{} pour chaque {C:attention}#5#{} Surcharge(s) défaussée(s)"
                }
            },
            giga_uncopiable_info = {
                name = 'Incopiable',
                text = {
                    'Cette carte ne peut pas',
                    'être {C:attention}copiée{}'
                }
            },
            giga_shiny_chance = {
                name = 'Génération',
                text = {
                    '{C:attention}#1# %{} de chance',
                    'de remplacer une {C:dark_edition}#2#{}'
                }
            },
            giga_astral_chance = {
                name = 'Génération',
                text = {
                    '{C:attention}#1# %{} de chance',
                    'de remplacer {C:attention}#2#{}'
                }
            },
            giga_dinosaurs_info = {
                name = 'Dinosaures',
                text = {
                    'Les Jokers Dinosaures sont',
                    "{C:attention}plus puissants{} lorsqu'ils",
                    'sont {C:attention}joués ensemble{}'
                }
            },
            giga_suit_sequence_info = {
                name = 'Ordre des couleurs',
                text = {
                    '{C:spades}Piques{} > {C:hearts}Cœurs{} >',
                    '{C:diamonds}Carreaux{} > {C:clubs}Trèfles{} >'
                }
            }
        },
        Partner = {
            pnr_giga_pabloJr = {
                name = 'Pablo Jr',
                text = {
                    '{X:mult,C:white}X#1#{} Multi'
                }
            }
        },
        Planet = {
            c_giga_astral_mercury = {
                name = 'Mercure astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_jupiter = {
                name = 'Jupiter astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_pluto = {
                name = 'Pluton astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_eris = {
                name = 'Éris astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_planetX = {
                name = 'Planète X astrale',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_saturn = {
                name = 'Saturne astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_earth = {
                name = 'Terre astrale',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_mars = {
                name = 'Mars astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_ceres = {
                name = 'Cérès astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_venus = {
                name = 'Vénus astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_neptune = {
                name = 'Neptune astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_astral_uranus = {
                name = 'Uranus astral',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois',
                    '{C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            },
            c_giga_sylvia = {
                name = 'Sylvia',
                text = {
                    '({V:1}Niv.#1#{})({V:2}Niv.#2#{})',
                    'Monte de niveau',
                    '{C:attention}#3#{},',
                    '{C:attention}#4#{}'
                }
            },
            c_giga_astral_sylvia = {
                name = 'Sylvia astrale',
                text = {
                    '({V:1}Niv.#1#{})({V:2}Niv.#2#{})',
                    'Monte de niveau {C:attention}#3#{} fois',
                    '{C:attention}#4#{},',
                    '{C:attention}#5#{}'
                }
            },
            c_giga_titania = {
                name = 'Titania',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{}',
                    '{C:mult}+#3#{} Multi et',
                    '{C:chips}+#4#{} Jetons'
                }
            },
            c_giga_astral_titania = {
                name = 'Titania astrale',
                text = {
                    '({V:1}Niv.#1#{}) Monte de niveau',
                    '{C:attention}#2#{} fois {C:attention}#3#{}',
                    '{C:mult}+#4#{} Multi et',
                    '{C:chips}+#5#{} Jetons'
                }
            }
        },
        Sleeve = {
            sleeve_giga_reverseCheckeredSleeve = {
                name = 'Manchon à damier inversé',
                text = {
                    'Commence la partie avec',
                    '{C:attention}26 {C:clubs}Trèfles{} et',
                    '{C:attention}26 {C:diamonds}Carreaux{} dans le jeu'
                }
            },
            sleeve_giga_reverseCheckeredSleeve_alt = {
                name = 'Manchon à damier inversé',
                text = {
                    'Les {C:clubs}Trèfles{} deviennent {T:m_bonus,C:attention}Bonus{} et',
                    'les {C:diamonds}Carreaux{} deviennent {T:m_mult,C:attention}Multi{}'
                }
            },
            sleeve_giga_foodieSleeve = {
                name = 'Manchon du gourmand',
                text = {
                    'Crée une carte {C:giga_Food}Nourriture{}',
                    'au début de chaque manche'
                }
            },
            sleeve_giga_tealSleeve = {
                name = 'Manchon sarcelle',
                text = {
                    'Commence avec {C:attention}7{} niveaux',
                    'répartis sur des mains aléatoires'
                }
            }
        },
        Spectral = {
            c_giga_salt = {
                name = 'Sel',
                text = {
                    'Ajoute un {V:1}Sceau rose{}',
                    'à {C:attention}#1#{} carte sélectionnée',
                    'dans votre main'
                }
            },
            c_giga_compass = {
                name = 'Boussole',
                text = {
                    'Ajoute un {V:1}Sceau pourpre{}',
                    'à {C:attention}#1#{} carte sélectionnée',
                    'dans votre main'
                }
            },
            c_giga_wand = {
                name = 'Baguette',
                text = {
                    'Ajoute un {V:1}Sceau turquoise{}',
                    'à {C:attention}#1#{} carte sélectionnée',
                    'dans votre main'
                }
            },
            c_giga_upgradeSpectral = {
                name = 'Amélioration',
                text = {
                    "{C:attention}Améliore{} jusqu'à",
                    '{C:attention}#1#{} sceaux'
                }
            },
            c_giga_astral_blackHole = {
                name = 'Trou noir astral',
                text = {
                    'Augmente chaque',
                    '{C:legendary,E:1}main de poker{}',
                    'de {C:attention}#1#{} niveaux'
                }
            },
            c_giga_firefly = {
                name = 'Luciole',
                text = {
                    'Ajoute une {C:attention}Surcharge{}',
                    'aléatoire à {C:attention}#1#{} carte',
                    'sélectionnée dans votre main'
                }
            },
            c_giga_dragon = {
                name = 'Dragon',
                text = {
                    'Transforme {C:attention}#1#{} cartes',
                    'sélectionnées en',
                    '{C:attention}Cartes giga{}'
                }
            },
            c_giga_stasis = {
                name = 'Stase',
                text = {
                    'Ajoute un {V:1}Sceau ambre{}',
                    'à {C:attention}#1#{} carte sélectionnée',
                    'dans votre main'
                }
            }
        },
        Stake = {},
        Tag = {},
        Tarot = {
            c_giga_cook = {
                name = 'Le Cuisinier',
                text = {
                    "Crée jusqu'à {C:attention}#1#{}",
                    'cartes {C:giga_Food}Nourriture{}'
                }
            },
            c_giga_upgradeTarot = {
                name = 'Amélioration',
                text = {
                    "{C:attention}Améliore{} jusqu'à",
                    '{C:attention}#1#{} cartes modifiées'
                }
            },
            c_giga_gardener = {
                name = 'Le Jardinier',
                text = {
                    'Transforme {C:attention}#1#{} cartes',
                    'sélectionnées en {C:attention}Cartes terre{}'
                }
            },
            c_giga_trowel = {
                name = 'La Truelle',
                text = {
                    'Transforme {C:attention}#1#{} cartes',
                    'sélectionnées en {C:attention}Cartes poterie{}'
                }
            }
        },
        Voucher = {
            v_giga_newMenu = {
                name = 'Nouveau menu',
                text = {
                    'Les paquets Restaurant contiennent',
                    '{C:attention}+#1#{} carte {C:giga_Food}Nourriture{} supplémentaire'
                }
            },
            v_giga_5courseMeal = {
                name = 'Repas 5 services',
                text = {
                    'Choisissez {C:attention}#1#{} carte {C:giga_Food}Nourriture{}',
                    'supplémentaire dans les paquets Restaurant'
                }
            },
            v_giga_foodStand = {
                name = 'Stand de nourriture',
                text = {
                    'Des cartes {C:giga_Food}Nourriture{}',
                    'peuvent apparaître dans le magasin'
                }
            },
            v_giga_homeDelivery = {
                name = 'Livraison à domicile',
                text = {
                    'Crée une carte {C:giga_Food}Nourriture{}',
                    'aléatoire à chaque réassort'
                }
            }
        },
        ["Content Set"] = {
            set_giga_megaLegendary = {
                name = 'Giga',
                text = {
                    'Contenu Giga'
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
            k_giga_food = 'Nourriture',
            k_giga_rare_food = 'Nourriture rare',
            b_giga_food_cards = 'Cartes Nourriture',
            k_restaurant_pack = 'Paquet Restaurant',
            b_giga_custom_menu_card = 'Désactiver le Joker personnalisé du menu',
            k_inactive = 'Inactif',
            k_active = 'Actif',
            k_giga_rd = 'Prêt',
            k_giga_notrd = 'Pas encore prêt',
            k_not_allowed_ex = 'Non !',
            k_giga_astrals_badge = 'Astral',
            k_giga_moon = 'Lune',
            k_giga_asteroid = 'Astéroïde',
            giga_overcharge_collection_label = 'Surcharges',
            k_plus_food = '+1 Nourriture',
            k_plus_rarefood = '+1 Nourriture rare',
            k_giga_artefact = 'Artefact',
            b_giga_artefact_cards = 'Cartes Artefact',
            k_plus_artefact = '+1 Artefact',
            k_giga_valueup = 'Valeur augmentée',
            k_giga_valuedown = 'Valeur diminuée'
        },
        high_scores = {},
        labels = {
            Giga_Food = 'Nourriture',
            Giga_Artefact = 'Artefact',
            giga_pinkseal_seal = 'Sceau rose',
            giga_crimsonseal_seal = 'Sceau pourpre',
            giga_aquaseal_seal = 'Sceau turquoise',
            giga_redplus_seal = 'Sceau rouge+',
            giga_blueplus_seal = 'Sceau bleu+',
            giga_goldplus_seal = "Sceau d'or+",
            giga_purpleplus_seal = 'Sceau violet+',
            giga_redplusplus_seal = 'Sceau rouge++',
            giga_blueplusplus_seal = 'Sceau bleu++',
            giga_goldplusplus_seal = "Sceau d'or++",
            giga_purpleplusplus_seal = 'Sceau violet++',
            giga_pinkplus_seal = 'Sceau rose+',
            giga_pinkplusplus_seal = 'Sceau rose++',
            giga_crimsonplus_seal = 'Sceau pourpre+',
            giga_aquaplus_seal = 'Sceau turquoise+',
            giga_crimsonplusplus_seal = 'Sceau pourpre++',
            giga_aquaplusplus_seal = 'Sceau turquoise++',
            giga_amberseal_seal = 'Sceau ambre',
            giga_amberplus_seal = 'Sceau ambre+',
            giga_amberplusplus_seal = 'Sceau ambre++',
            giga_redOvercharge = 'Surcharge rouge',
            giga_yellowOvercharge = 'Surcharge jaune',
            giga_orangeOvercharge = 'Surcharge orange',
            giga_greenOvercharge = 'Surcharge verte',
            giga_blueOvercharge = 'Surcharge bleue',
            giga_purpleOvercharge = 'Surcharge violette',
            giga_shiny_foil = 'Premium éclatant',
            giga_shiny_holo = 'Holographique éclatant',
            giga_shiny_poly = 'Polychrome éclatant',
            giga_art_credit = 'Illustration par ',
            giga_idea_credit = 'Idée par '
        },
        poker_hand_descriptions = {
            ["giga_Linked Pairs"] = {
                '2 paires de cartes avec des rangs consécutifs,',
                'peut être jouée avec 1 autre carte non marquée'
            }
        },
        poker_hands = {
            ["giga_Linked Pairs"] = 'Paires liées'
        },
        quips = {
            pnr_giga_pabloJr_1 = {
                'Hola, mon ami'
            },
            pnr_giga_pabloJr_2 = {
                'On travaille dur, mon ami'
            },
            pnr_giga_pabloJr_3 = {
                'Papá peut te donner',
                'des tacos, mon ami'
            },
            pnr_giga_pabloJr_4 = {
                'Bonne chance, mon ami'
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
