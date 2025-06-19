return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Enhanced={
            m_giga_soil = {
				name = "Soil",
				text = {
					"{X:chips,C:white}X#1#{} Chips"
				}
			},
            m_giga_richSoil = {
                name = "Rich Soil",
                text = {
                    "{X:chips,C:white}X#1#{} Chips",
                    "{C:mult}+#2#{} Mult"
                }
            },
            m_giga_fossilSoil = {
                name = "Fossil Soil",
                text = {
                    "{X:chips,C:white}X#1#{} Chips",
                    "{X:mult,C:white}X#2#{} Mult",
                }
            }
        },
        Joker={
            j_giga_cashPass = {
                name = "Cash Pass",
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
                    'This egg feels... blue'
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
                    'Create an {C:attention}Ace{} when blind is selected',
                    '{C:mult}+#1#{} Mult for each {C:attention}Ace{} played'
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
                    'some Mexican food for you',
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
            }
        },
        Other={
            -- Credit
            hrhr_credit = {
                name = "Credit",
                text = {
                    "Original idea",
                    "by {C:green,E:2}le_dugs{}",
                }
            },
            -- Enhancement
            soil_def = {
                name = "Soil",
                text = {
                    "{X:chips,C:white}X1.1{} Chips"
                }
            },
            richSoil_def = {
                name = "Rich Soil",
                text = {
                    "{X:chips,C:white}X#1.4{} Chips",
                    "{C:mult}+7{} Mult"
                }
            },
            fossilSoil_def = {
                name = "Fossil Soil",
                text = {
                    "{X:chips,C:white}X2{} Chips",
                    "{X:mult,C:white}X1.5{} Mult"
                }
            }

        },
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Tarot={},
        Voucher={}
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_stakes={},
        challenge_names={},
        collabs={},
        dictionary={},
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