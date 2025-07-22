--zone data
local zones = {
	[128] = { -- Limsa Lominsa - Upper Decks
		["name"] = "Limsa Lominsa - Upper Decks",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal",
			["humidity"] = "med",
			["nighthot"] = 0.73, -- percentage
			["nightcold"] = 1.27,
			["stm"] = 0.35, -- Seasonal Temp Modifier
		},
		["effects"] = {
			["wet"] = 0.15,
			["tense"] = -0.25,
			["uncomfortable"] = -0.5,
			["happy"] = 0.25,
			["flirty"] = 0.5,
			["amused"] = 0.2,
			["social"] = 1.0,
			["disturbed"] = -0.1,
			["aetheric"] = 0.09,
		}
	},
	[129] = { -- Limsa Lominsa - Lower Decks
		["name"] = "Limsa Lominsa - Lower Decks",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal",
			["humidity"] = "med",
			["nighthot"] = 0.77, -- percentage
			["nightcold"] = 1.25,
			["stm"] = 0.35,
		},
		["effects"] = {
			["wet"] = 0.15,
			["uncomfortable"] = -0.5,
			["happy"] = 0.25,
			["flirty"] = 0.5,
			["amused"] = 0.2,
			["social"] = 1.25,
			["disturbed"] = -0.1,
			["aetheric"] = 0.17,
		}
	},
	[130] = { -- Ul'dah - Steps of Nald
		["name"] = "Ul'dah - Steps of Nald",
		["cont"] = "Thanalan",
		["climate"] = {
			["temp"] = "warm",
			["humidity"] = "dry",
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.29,
			["grungy"] = 0.079,
		},
		["effects"] = {
			["wet"] = -1.25,
			["confident"] = 0.25,
			["uncomfortable"] = -0.15,
			["happy"] = 0.25,
			["flirty"] = 0.75,
			["playful"] = 0.5,
			["social"] = 1.35,
			["focused"] = 0.75,
			["aetheric"] = -0.13,
		}
	},
	[131] = { -- Ul'dah - Steps of Thal
		["name"] = "Ul'dah - Steps of Thal",
		["cont"] = "Thanalan",
		["climate"] = {
			["temp"] = "warm",
			["humidity"] = "dry",
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.29,
		},
		["effects"] = {
			["wet"] = -1.25,
			["confident"] = 0.25,
			["uncomfortable"] = -0.15,
			["happy"] = 0.25,
			["flirty"] = 0.75,
			["playful"] = 0.5,
			["social"] = 1.35,
			["focused"] = 0.75,
			["aetheric"] = -0.13,
		}
	},
	[132] = { --New Gridania
		["name"] = "New Gridania",
		["cont"] = "The Black Shroud",
		["climate"] = {
			["type"] = "sylvan",
			["temp"] = "sylvan",
			["humidity"] = "med",
			["nighthot"] = 0.66, -- percentage
			["nightcold"] = 1.14,
			["stm"] = 0.28,
		},
		["effects"] = {
			["wet"] = 0.25,
			["uncomfortable"] = -0.15,
			["happy"] = 0.35,
			["curious"] = 0.35,
			["confident"] = 0.35,
			["amused"] = 0.35,
			["social"] = 0.75,
			["impatient"] = -0.25,
			["disturbed"] = -0.1,
			["aetheric"] = 1.37,
		}
	},
	[133] = { --Old Gridania
		["name"] = "Old Gridania",
		["cont"] = "The Black Shroud",
		["climate"] = {
			["type"] = "sylvan",
			["temp"] = "sylvan",
			["humidity"] = "med",
			["nighthot"] = 0.66, -- percentage
			["nightcold"] = 1.14,
			["stm"] = 0.28,
		},
		["effects"] = {
			["wet"] = 0.25,
			["uncomfortable"] = -0.15,
			["happy"] = 0.35,
			["curious"] = 0.35,
			["confident"] = 0.35,
			["amused"] = 0.35,
			["social"] = 0.75,
			["impatient"] = -0.25,
			["disturbed"] = -0.1,
			["aetheric"] = 1.37,
		}
	},
	[134] = { --Middle La Noscea
		["name"] = "Middle La Noscea",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal",
			["humidity"] = "med",
			["nighthot"] = 0.67, -- percentage
			["nightcold"] = 1.27,
			["stm"] = 0.35,
		},
		["effects"] = {
			["wet"] = -1.15,
			["confident"] = 0.25,
			["uncomfortable"] = -0.15,
			["happy"] = 0.25,
			["flirty"] = 0.75,
			["playful"] = 0.5,
			["social"] = -0.35,
			["focused"] = -0.15,
		}
	},
	[135] = { --Lower La Noscea
		["name"] = "Lower La Noscea",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal",
			["humidity"] = "med",
			["nighthot"] = 0.79, -- percentage
			["nightcold"] = 1.31,
			["stm"] = 0.37,
			["grungy"] = 0.043,
		},
		["effects"] = {
			["wet"] = 0.15,
			["tense"] = -0.25,
			["uncomfortable"] = -0.5,
			["happy"] = 0.15,
			["amused"] = 0.15,
			["playful"] = 0.2,
			["social"] = -0.35,
			["disturbed"] = -0.1,
		}
	},
	[140] = { --Western Thanalan - Horizon's Edge
		["name"] = "Western Thanalan - Horizon's Edge",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "desert",
			["temp"] = "hot",
			["humidity"] = "low",
			["nighthot"] = 0.89, -- percentage
			["nightcold"] = 1.27,
			["stm"] = 0.27,
		},
		["effects"] = {
			["wet"] = -1.15,
			["uncomfortable"] = 0.15,
			["dazed"] = 0.25,
			["disturbed"] = 0.25,
			["amused"] = -0.15,
			["curious"] = 0.15,
			["angry"] = 0.15,
			["aetheric"] = 0.27,
		},
	},
	[141] = { --Central Thanalan - Black Brush
		["name"] = "Central Thanalan - Black Brush",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "desert",
			["temp"] = "hot",
			["humidity"] = "dry",
			["nighthot"] = 0.82, -- percentage
			["nightcold"] = 1.22,
			["stm"] = 0.27,
		},
		["effects"] = {
			["wet"] = -0.95,
			["uncomfortable"] = 0.15,
			["dazed"] = 0.25,
			["disturbed"] = 0.25,
			["amused"] = -0.15,
			["curious"] = 0.15,
			["angry"] = 0.25,
			["aetheric"] = 0.37,
		},
	},
	[144] = { --The Gold Saucer
		["name"] = "The Gold Saucer",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "climate-controlled",
			["temp"] = "climate-controlled",
			["humidity"] = "low",
			["nighthot"] = 0.93, -- percentage
			["nightcold"] = 1.17,
			["stm"] = 0.13,
		},
		["effects"] = {
			["wet"] = -1.15,
			["confident"] = 0.27,
			["uncomfortable"] = -0.15,
			["happy"] = 0.17,
			["flirty"] = 0.39,
			["playful"] = 0.123,
			["social"] = -0.357,
			["focused"] = -0.169,
		}
	},
	[145] = { --Eastern Thanalan - Sagoli Desert
		["name"] = "Eastern Thanalan - Sagoli Desert",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "desert",
			["temp"] = "hot",
			["humidity"] = "very-low",
			["nighthot"] = 0.77, -- percentage
			["nightcold"] = 1.37,
			["stm"] = 0.27,
			["grungy"] = 0.179,
		},
		["effects"] = {
			["wet"] = -1.15,
			["uncomfortable"] = -0.35,
			["dazed"] = 0.25,
			["disturbed"] = 0.25,
			["amused"] = -0.15,
			["curious"] = 0.15,
			["mischievous"] = 0.15,
			["angry"] = 0.15,
			["aetheric"] = 0.67,
		},
	},
	[146] = { --Southern Thanalan - Sagoli Desert
		["name"] = "Southern Thanalan - Sagoli Desert",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "desert",
			["temp"] = "hot",
			["humidity"] = "very-low",
			["nighthot"] = 0.77, -- percentage
			["nightcold"] = 1.37,
			["stm"] = 0.27,
			["grungy"] = 0.179,
		},
		["effects"] = {
			["wet"] = -1.15,
			["uncomfortable"] = -0.35,
			["dazed"] = 0.25,
			["disturbed"] = 0.25,
			["amused"] = -0.15,
			["curious"] = 0.15,
			["mischievous"] = 0.15,
			["angry"] = 0.15,
			["aetheric"] = 0.67,
		},
	},
	[147] = { --Northern Thanalan
		["name"] = "Northern Thanalan",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "desert",
			["temp"] = "hot",
			["humidity"] = "low",
			["nighthot"] = 0.82, -- percentage
			["nightcold"] = 1.21,
			["stm"] = 0.31,
			["grungy"] = 0.179,
		},
		["effects"] = {
			["wet"] = -1.15,
			["confident"] = 0.45,
			["uncomfortable"] = -0.35,
			["happy"] = 0.45,
			["social"] = 1.95,
			["dazed"] = 0.25,
			["apathetic"] = 0.25,
			["amused"] = -0.15,
			["curious"] = 0.15,
			["mischievous"] = 0.15,
			["angry"] = 0.15,
			["tense"] = 0.35,
			["aetheric"] = 0.67,
		},
		["nighthot"] = -0.27,
		["nightcold"] = 0.37,
	},
	[148] = { --Central Shroud
		["name"] = "Central Shroud",
		["cont"] = "The Black Shroud",
		["climate"] = {
			["type"] = "sylvan",
			["temp"] = "sylvan",
			["humidity"] = "med",
			["nighthot"] = 0.71, -- percentage
			["nightcold"] = 1.13,
			["stm"] = 0.27,
			["grungy"] = 0.139,
		},
		["effects"] = {
			["uncomfortable"] = -0.25,
			["nosey"] = 0.17,
			["curious"] = 0.37,
			["impatient"] = -0.17,
			["disturbed"] = 0.35,
			["playful"] = -0.15,
			["energized"] = -0.13,
			["aetheric"] = -0.17,
		}
	},
	[153] = { --South Shroud
		["name"] = "South Shroud",
		["cont"] = "The Black Shroud",
		["climate"] = {
			["type"] = "sylvan",
			["temp"] = "sylvan",
			["humidity"] = "med",
			["nighthot"] = 0.71, -- percentage
			["nightcold"] = 1.13,
			["stm"] = 0.27,
		},
		["effects"] = {
			["wet"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.25,
			["nosey"] = 0.17,
			["curious"] = 0.17,
			["impatient"] = -0.17,
			["disturbed"] = -0.15,
			["playful"] = 0.15,
			["energized"] = -0.13,
			["aetheric"] = -0.17,
		}
	},
	[154] = { --North Shroud
		["name"] = "North Shroud",
		["cont"] = "The Black Shroud",
		["climate"] = {
			["type"] = "sylvan",
			["temp"] = "sylvan",
			["humidity"] = "normal",
			["nighthot"] = 0.71, -- percentage
			["nightcold"] = 1.22,
			["stm"] = 0.27,
		},
		["effects"] = {
			["wet"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.25,
			["nosey"] = 0.17,
			["curious"] = 0.17,
			["impatient"] = -0.17,
			["disturbed"] = -0.15,
			["playful"] = 0.15,
			["energized"] = -0.13,
			["aetheric"] = -0.17,
		}
	},
	[156] = {--Revenant's Toll
		["name"] = "Mor Dhona",
		["cont"] = "Mor Dhona",
		["climate"] = {
			["type"] = "temperate",
			["temp"] = "normal",
			["humidity"] = "low",
			["nighthot"] = 0.84, -- percentage
			["nightcold"] = 1.14,
			["stm"] = 0.39,
		},
		["effects"] = {
			["confident"] = 0.45,
			["uncomfortable"] = -0.35,
			["happy"] = 0.45,
			["social"] = 1.95,
			["dazed"] = 0.25,
			["amused"] = -0.15,
			["curious"] = 0.15,
			["mischievous"] = 0.15,
			["aetheric"] = 0.39,
		},
		["nighthot"] = -0.37,
		["nightcold"] = 0.43,
	},
	[177] = { -- Limsa Lominsa - Mizzenmast Inn
		["name"] = "Mizzenmast Inn",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors-moderate",
			["humidity"] = "med",
			["nighthot"] = 0.77, -- percentage
			["nightcold"] = 1.27,
			["stm"] = 0.11,
		},
		["effects"] = {
			["wet"] = -0.15,
			["tense"] = -1.25,
			["uncomfortable"] = -1.5,
			["happy"] = 0.25,
			["sleepy"] = -3.6,
			["amused"] = 0.2,
			["energized"] = 0.3,
			["disturbed"] = -0.1,
			["aetheric"] = -1.77,
		}
	},
	[178] = { -- Ul'dah - The Hourglass
		["name"] = "The Hourglass",
		["cont"] = "Ul'dah",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors-moderate",
			["humidity"] = "low",
			["nighthot"] = 0.90, -- percentage
			["nightcold"] = 1.07,
			["stm"] = 0.03,
		},
		["effects"] = {
			["wet"] = -0.35,
			["tense"] = -1.25,
			["uncomfortable"] = -1.5,
			["happy"] = 0.25,
			["sleepy"] = -3.6,
			["amused"] = 0.2,
			["energized"] = 0.3,
			["disturbed"] = -0.1,
			["aetheric"] = -1.77,
		}
	},
	[179] = { -- The Roost
		["name"] = "The Roost",
		["cont"] = "The Black Shroud",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors-moderate",
			["humidity"] = "med",
			["nighthot"] = 0.93, -- percentage
			["nightcold"] = 1.12,
			["stm"] = 0.11,
		},
		["effects"] = {
			["wet"] = -0.15,
			["tense"] = -1.25,
			["uncomfortable"] = -1.5,
			["happy"] = 0.25,
			["sleepy"] = -3.6,
			["amused"] = 0.2,
			["energized"] = 0.3,
			["disturbed"] = -0.1,
			["aetheric"] = -1.77,
		}
	},
	[250] = {
		["name"] = "Wolves' Den Pier",
		["cont"] = "La Noscea",
	},
	[339] = { --MIST
		["name"] = "Mist",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal",
			["humidity"] = 0.977,
			["nighthot"] = 0.81, -- percentage
			["nightcold"] = 1.17,
			["stm"] = 0.33,
			["grungy"] = 0.039,
			["waterQuality"] = 0.969, -- 1 is normal, > 1 is dirty, < 1 is clean
		},
		["effects"] = {
			--["wet"] = 0.15,
			["refreshed"] = 0.23,
			["tense"] = -0.25,
			["uncomfortable"] = -0.5,
			["happy"] = 0.25,
			["flirty"] = 0.5,
			["amused"] = 0.2,
			["social"] = 0.1,
			["disturbed"] = -0.1,
		},
	},
	[351] = { --Rising Stones - Mor Dhona
		["name"] = "Rising Stones - Mor Dhona",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors",
			["humidity"] = "low",
			["nighthot"] = 0.87, -- percentage
			["nightcold"] = 1.17,
			["stm"] = 0.23,
		},
		["effects"] = {
			["refreshed"] = 0.23,
			["sleepy"] = -2.7,
		},
	},
	[384] = { --Private Chambers - Mist
		["name"] = "Private Chambers - Mist",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors",
			["humidity"] = "low",
			["nighthot"] = 0.67, -- percentage
			["nightcold"] = 1.27,
			["stm"] = 0.13,
		},
		["effects"] = {
			["refreshed"] = 0.23,
			["sleepy"] = -2.7,
		},
	},
	[392] = {
		["name"] = "Sanctum of the Twelve",
		["cont"] = "Black Shroud",
		["effects"] = {
			["hot"] = 0.55,
			["cold"] = -3,
			["wet"] = 0.15,
			["tired"] = -0.2,
			["tense"] = -0.25,
			["uncomfortable"] = -0.5,
			["happy"] = 0.25,
			["flirty"] = 0.5,
			["amused"] = 0.2,
			["social"] = 0.1,
			["disturbed"] = -0.1,
			["aetheric"] = 7.77,
		},
	},
	[397] = {
		["name"] = "Coerthas Western Highlands",
		["cont"] = "Coerthas",
		["climate"] = {
			["type"] = "mountains",
			["temp"] = "tundra",
			["humidity"] = "normal",
			["nighthot"] = 0.67, -- percentage
			["nightcold"] = 1.33,
			["stm"] = 0.23,
		},
		["effects"] = {
			["tense"] = 0.15,
			["uncomfortable"] = 0.35,
		},
	},
	[398] = { --Dravanian Forelands - Tailfeather
		["name"] = "The Dravanian Forelands",
		["cont"] = "Dravania",
		["climate"] = {
			["type"] = "mountains",
			["temp"] = "mountains",
			["humidity"] = "low",
			["nighthot"] = 0.86, -- percentage
			["nightcold"] = 1.13,
			["stm"] = 0.11,
		},
		["effects"] = {
			["refreshed"] = 0.23,
			["sleepy"] = -2.7,
		},
	},
	[418] = {
		["name"] = "Foundation",
		["cont"] = "Coerthas",
		["climate"] = {
			["type"] = "mountains",
			["temp"] = "tundra",
			["humidity"] = "normal",
			["nighthot"] = 0.67, -- percentage
			["nightcold"] = 1.33,
			["stm"] = 0.23,
		},
		["effects"] = {
			["tense"] = 0.15,
			["uncomfortable"] = 0.35,
		},
		["nighthot"] = -3.75,
		["nightcold"] = 4.32,
	},
	[478] = { --The Sea of Clouds
		["name"] = "The Sea of Clouds",
		["cont"] = "Abalathia's Spine",
		["climate"] = {
			["type"] = "skyplains",
			["temp"] = "skyplains",
			["humidity"] = "low",
			["nighthot"] = 0.86, -- percentage
			["nightcold"] = 1.13,
			["stm"] = 0.11,
		},
		["effects"] = {
			["refreshed"] = 0.23,
			["sleepy"] = -2.7,
		},
	},
	[478] = { --Idylshire
		["name"] = "Idylshire",
		["cont"] = "Dravania",
		["climate"] = {
			["type"] = "mountains",
			["temp"] = "mountains",
			["humidity"] = "normal",
			["nighthot"] = 0.83, -- percentage
			["nightcold"] = 1.23,
			["stm"] = 0.23,
		},
		["effects"] = {
			["refreshed"] = 0.23,
			["sleepy"] = -2.7,
		},
	},
	[534] = { --Twin Adder Barracks
		["name"] = "Twin Adder Barracks",
		["cont"] = "Gridania",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors",
			["humidity"] = "low",
			["nighthot"] = 0.97, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.13,
		},
		["effects"] = {
			["wet"] = -0.15,
			["refreshed"] = 0.23,
			["amused"] = 0.2,
			["social"] = 0.3,
			["sleepy"] = -1.7,
		},
	},
	[535] = { --Flame Barracks
		["name"] = "Flame Barracks",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors",
			["humidity"] = "low",
			["nighthot"] = 0.97, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.13,
		},
		["effects"] = {
			["wet"] = -0.15,
			["refreshed"] = 0.23,
			["amused"] = 0.2,
			["social"] = 0.3,
			["sleepy"] = -1.7,
		},
	},
	[536] = { --Maelstrom Barracks
		["name"] = "Maelstrom Barracks",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal",
			["humidity"] = "med",
			["nighthot"] = 0.67, -- percentage
			["nightcold"] = 1.27,
			["stm"] = 0.13,
		},
		["effects"] = {
			["wet"] = 0.15,
			["refreshed"] = 0.23,
			["amused"] = 0.2,
			["social"] = 0.3,
			["sleepy"] = -1.7,
		},
	},
	[561] = {
		["name"] = "Palace of the Dead",
		["cont"] = "Black Shroud",
		["effects"] = {
			["hot"] = 1.15,
			["cold"] = -2.5,
			["wet"] = 0.25,
			["tired"] = -0.15,
			["tense"] = -0.25,
			["uncomfortable"] = -0.25,
			["happy"] = 0.25,
			["curious"] = 0.25,
			["confident"] = 0.15,
			["impatient"] = -0.35,
			["disturbed"] = -0.15,
			["aetheric"] = -0.55,
		},
	},
	[612] = { --The Fringes
		["name"] = "The Fringes",
		["cont"] = "Gyr Abania",
		["climate"] = {
			["type"] = "mesa",
			["temp"] = "mesa",
			["humidity"] = 0.03,
			["nighthot"] = 0.90, -- percentage
			["nightcold"] = 1.15,
			["stm"] = 0.05,
		},
		["effects"] = {
			--["wet"] = 0.15,
			["refreshed"] = 0.23,
			["uncomfortable"] = -0.5,
			["happy"] = 0.15,
			["amused"] = 0.2,
			["social"] = 0.1,
			["disturbed"] = 0.1,
		},
	},
	[613] = {
		["name"] = "Ruby Sea",
		["cont"] = "Othard",
		["climate"] = {
			["type"] = "tropical",
			["temp"] = "tropical",
			["humidity"] = 0.07,
			["nighthot"] = 0.90, -- percentage
			["nightcold"] = 1.05,
			["stm"] = 0.09,
		},
		["effects"] = {
			["tense"] = -0.25,
			["uncomfortable"] = -0.25,
			["happy"] = 0.25,
			["curious"] = 0.25,
			["confident"] = 0.15,
			["impatient"] = -0.35,
			["disturbed"] = -0.15,
			["playful"] = 0.15,
		}
	},
	[614] = { --Yanxia - Namai
		["name"] = "Yanxia",
		["cont"] = "Othard",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal-cool",
			["humidity"] = 0.11,
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.13,
			["stm"] = 0.13,
		},
		["effects"] = {
			--["wet"] = 0.15,
			["refreshed"] = 0.23,
			["tense"] = -0.25,
			["uncomfortable"] = -0.5,
			["happy"] = 0.25,
			["flirty"] = 0.5,
			["amused"] = 0.2,
			["social"] = 0.1,
			["disturbed"] = -0.1,
		},
	},
	[622] = { --Azim Step - Othard
		["name"] = "Azim Step",
		["cont"] = "Othard",
		["climate"] = {
			["type"] = "plains",
			["temp"] = "cool",
			["humidity"] = 0.05,
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.13,
			["stm"] = 0.13,
		},
		["effects"] = {
			--["wet"] = 0.15,
			["refreshed"] = 0.23,
			["tense"] = -0.25,
			["uncomfortable"] = -0.5,
			["happy"] = 0.25,
			["flirty"] = 0.5,
			["amused"] = 0.2,
			["social"] = 0.1,
			["disturbed"] = -0.1,
		},
	},
	[628] = { --Kugane
		["name"] = "Kugane",
		["cont"] = "Hingashi",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal-cool",
			["humidity"] = 0.11,
			["nighthot"] = 0.93, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.17,
		},
		["effects"] = {
			--["wet"] = 0.15,
			["refreshed"] = 0.23,
			["tense"] = -0.25,
			["uncomfortable"] = -0.5,
			["happy"] = 0.25,
			["flirty"] = 0.5,
			["amused"] = 0.2,
			["social"] = 0.1,
			["disturbed"] = -0.1,
		},
	},
	[635] = { --The Fringes
		["name"] = "Rhalgr's Reach",
		["cont"] = "Gyr Abania",
		["climate"] = {
			["type"] = "mesa",
			["temp"] = "mesa",
			["humidity"] = 0.03,
			["nighthot"] = 0.90, -- percentage
			["nightcold"] = 1.15,
			["stm"] = 0.05,
		},
		["effects"] = {
			--["wet"] = 0.15,
			["refreshed"] = 0.23,
			["uncomfortable"] = -0.5,
			["happy"] = 0.15,
			["amused"] = 0.2,
			["social"] = 0.1,
			["disturbed"] = 0.1,
		},
	},
	[813] = {
		["name"] = "Lakeland",
		["cont"] = "Norvrandt",
		["effects"] = {
			["hot"] = 0.05,
			["cold"] = -0.15,
			["wet"] = -0.35,
			["tired"] = -0.25,
			["amused"] = 0.55,
			["curious"] = 0.25,
			["confident"] = 0.10,
			["playful"] = 0.15,
			["puzzled"] = 0.25,
			["surprised"] = 0.35,
			["focused"] = 0.15,
			["dazed"] = 0.10,
		}
	},
	[815] = {
		["name"] = "Amh Araeng",
		["cont"] = "Norvrandt",
		["climate"] = {
			["type"] = "desert",
			["temp"] = "desert",
			["humidity"] = 0.001,
			["nighthot"] = 0.95, -- percentage
			["nightcold"] = 1.13,
			["stm"] = 0.09,
		},
		["effects"] = {
			["amused"] = 0.55,
			["curious"] = 0.25,
			["confident"] = 0.10,
			["playful"] = 0.15,
			["puzzled"] = 0.25,
			["surprised"] = 0.35,
			["focused"] = 0.15,
			["dazed"] = 0.10,
		}
	},
	[816] = {
		["name"] = "Il Mheg",
		["cont"] = "Norvrandt",
		["climate"] = {
			["type"] = "meadow",
			["temp"] = "meadow",
			["humidity"] = 0.07,
			["nighthot"] = 0.89, -- percentage
			["nightcold"] = 1.07,
			["stm"] = 0.13,
		},
		["effects"] = {
			["amused"] = 0.45,
			["mischievous"] = 0.85,
			["curious"] = 0.95,
			["confident"] = 0.20,
			["embarrassed"] = 0.35,
			["disturbed"] = 0.15,
			["playful"] = 0.75,
			["puzzled"] = 0.15,
			["surprised"] = 0.65,
			["focused"] = -0.15,
			["dazed"] = 0.15,
			["bored"] = -0.25,
		}
	},
	[817] = {--The Rak'tika Greatwood
		["name"] = "The Rak'tika Greatwood",
		["cont"] = "Norvrandt",
		["climate"] = {
			["type"] = "enchanted-forest",
			["temp"] = "enchanted-forest",
			["humidity"] = 0.09,
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.03,
		},
		["effects"] = {
			["amused"] = 0.45,
			["mischievous"] = 0.85,
			["curious"] = 0.95,
			["confident"] = 0.20,
			["embarrassed"] = 0.35,
			["disturbed"] = 0.15,
			["playful"] = 0.75,
			["puzzled"] = 0.15,
			["surprised"] = 0.65,
			["focused"] = -0.15,
			["dazed"] = 0.15,
			["bored"] = -0.25,
		}
	},
	[820] = { --Eulmore - Norvandt
		["name"] = "Eulmore",
		["cont"] = "Norvandt",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal-cool",
			["humidity"] = 0.11,
			["nighthot"] = 0.93, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.11,
		},
		["effects"] = {
			--["wet"] = 0.15,
			["refreshed"] = 0.23,
			["tense"] = -0.25,
			["uncomfortable"] = -0.5,
			["happy"] = 0.25,
			["flirty"] = 0.5,
			["amused"] = 0.2,
			["social"] = 0.1,
			["disturbed"] = -0.1,
		},
	},
	
	[832] = {
		["name"] = "Air Force One",
		["cont"] = "Gold Saucer",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors",
			["humidity"] = "low",
			["nighthot"] = 0.93, -- percentage
			["nightcold"] = 1.17,
			["stm"] = 0.13,
		},
		["effects"] = {
			["hot"] = -0.35,
			["cold"] = 0.27,
			["wet"] = -1.15,
			["tired"] = 0.15,
			["confident"] = 0.35,
			["energized"] = -0.95,
			["happy"] = 0.25,
			["flirty"] = -0.15,
			["playful"] = 0.65,
			["social"] = -0.35,
			["focused"] = -0.45,
			["aetheric"] = -0.75,
		}
	},
	[956] = {--Labyrinthos
		["name"] = "Labyrinthos",
		["cont"] = "The Northern Empty",
		["climate"] = {
			["type"] = "biosphere",
			["temp"] = "biosphere",
			["humidity"] = "low",
			["nighthot"] = 0.87, -- percentage
			["nightcold"] = 1.15,
			["stm"] = 0.15,
		},
		["optimal"] = 9.33,
		["effects"] = {
			["wet"] = 0.15,
			["focused"] = 0.45,
			["tense"] = -0.35,
			["nosey"] = 0.25,
			["uncomfortable"] = -0.25,
			["happy"] = 0.15,
			["curious"] = 0.35,
			["bored"] = -0.25,
			["mischievous"] = 0.15,
			["confident"] = 0.25,
		}
	},
	[957] = { --Thavnair
		["name"] = "Thavnair",
		["cont"] = "Ilsabard",
		["climate"] = {
			["type"] = "tropical",
			["temp"] = "tropical",
			["humidity"] = "high",
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.17,
			["stm"] = 0.23,
		},
		["effects"] = {
			["wet"] = 0.44,
			["uncomfortable"] = -0.25,
			["happy"] = 0.15,
			["curious"] = 0.15,
			["bored"] = -0.15,
			["playful"] = 0.15,
		}
	},
	[958] = {--Garlemald
		["name"] = "Garlemald",
		["cont"] = "Ilsabard",
		["climate"] = {
			["type"] = "tundra",
			["temp"] = "tundra",
			["humidity"] = "low",
			["nighthot"] = 0.41, -- percentage
			["nightcold"] = 1.71,
		},
		["effects"] = {
			["hot"] = -2.15,
			["cold"] = 2.25,
			["wet"] = 0.15,
			["focused"] = -0.25,
			["tense"] = 0.15,
			["nosey"] = -0.15,
			["uncomfortable"] = 0.25,
			["happy"] = -0.15,
			["curious"] = -0.35,
			["bored"] = 0.25,
			["mischievous"] = -0.15,
			["confident"] = -0.25,
			["disturbed"] = -0.25,
		}
	},
	[959] = {
		["name"] = "Mare Lamentorum",
		["cont"] = "The Sea of Stars",
		["climate"] = {
			["type"] = "space",
			["temp"] = "space",
			["humidity"] = "arid",
			["nighthot"] = 0.77, -- percentage
			["nightcold"] = 1.33,
			["stm"] = 0.0,
		},
		["effects"] = {
			["hot"] = 3.15,
			["cold"] = -3.25,
			["wet"] = -1.95,
			["focused"] = 0.25,
			["tense"] = 0.15,
			["nosey"] = 0.45,
			["uncomfortable"] = 0.15,
			["happy"] = 0.15,
			["curious"] = 0.75,
			["bored"] = -0.25,
			["mischievous"] = 0.15,
			["confident"] = 0.25,
			["disturbed"] = -0.25,
		},
		["nighthot"] = -4.25,
		["nightcold"] = 3.65,
	},
	--961 Elpis
	[962] = {--Old Sharlayan
		["name"] = "Old Sharlayan",
		["cont"] = "The Northern Empty",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "cold",
			["humidity"] = "moderate",
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.31,
		},
		["optimal"] = 9.33,
		["effects"] = {
			["wet"] = 0.15,
			["focused"] = 0.45,
			["tense"] = -0.35,
			["nosey"] = 0.25,
			["uncomfortable"] = -0.25,
			["happy"] = 0.15,
			["curious"] = 0.35,
			["bored"] = -0.25,
			["mischievous"] = 0.15,
			["confident"] = 0.25,
		}
	},
	[963] = {--Radz-at-Han
		["name"] = "Radz-at-Han",
		["cont"] = "Ilsabard",
		["climate"] = {
			["type"] = "tropical",
			["temp"] = "tropical",
			["humidity"] = "high",
			["nighthot"] = 0.93, -- percentage
			["nightcold"] = 1.07,
			["stm"] = 0.23,
		},
		["effects"] = {
			["wet"] = 0.55,
			["social"] = 0.35,
			["uncomfortable"] = 0.15,
			["amused"] = 0.15,
			["curious"] = 0.25,
			["bored"] = -0.15,
			["mischievous"] = 0.25,
		}
	},
	[979] = {--Empyreum
		["name"] = "Empyreum",
		["cont"] = "Coerthas",
		["climate"] = {
			["type"] = "tundra",
			["temp"] = "tundra",
			["humidity"] = "normal",
			["nighthot"] = 0.67, -- percentage
			["nightcold"] = 1.33,
			["stm"] = 0.13,
		},
		["effects"] = {
			["bored"] = 0.15,
			["uncomfortable"] = 0.35,
		},
		["nighthot"] = -3.75,
		["nightcold"] = 4.32,
	},
	[990] = {--Andron --Inn at Sharlayan
		["name"] = "Andron",
		["cont"] = "The Northern Empty",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "cool",
			["humidity"] = "moderate",
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.11,
		},
		["effects"] = {
			["hot"] = 0.45,
			["cold"] = -0.25,
			["wet"] = 0.15,
			["focused"] = 0.45,
			["tense"] = -0.35,
			["nosey"] = 0.25,
			["uncomfortable"] = -0.25,
			["happy"] = 0.15,
			["curious"] = 0.35,
			["bored"] = -0.25,
			["mischievous"] = 0.15,
			["confident"] = 0.25,
		}
	},
	[1055] = {
		["name"] = "????",
		["cont"] = "Unnamed Island",
		["climate"] = {
			["type"] = "island",
			["temp"] = "island",
			["humidity"] = 1.04,
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.07,
		},
		["effects"] = {
			["sleepy"] = -0.11,
			["confident"] = 0.11,
			["social"] = -1.21,
			["dazed"] = -0.11,
			["amused"] = -0.21,
			["curious"] = 0.21,
			["angry"] = 0.369,
			["tense"] = 0.369,
			["aetheric"] = 0.23,
		},
		["nighthot"] = -0.75,
		["nightcold"] = 0.65,
	},
	[1061] = {
		["name"] = "????",
		["cont"] = "The Omphalos",
		["effects"] = {
			["hot"] = -7.77,
			["cold"] = -7.77,
			["wet"] = -7.77,
			["tired"] = -7.77,
			["sleepy"] = -7.77,
			["confident"] = 0.11,
			["uncomfortable"] = -7.77,
			["happy"] = 0.11,
			["social"] = -7.77,
			["dazed"] = 0.369,
			["disturbed"] = -7.77,
			["amused"] = -7.77,
			["curious"] = 0.11,
			["amazed"] = 0.11,
			["mischievous"] = -7.77,
			["angry"] = -0.369,
			["tense"] = -0.369,
			["aetheric"] = -3.93,
		},
	},
	
	[1069] = {--1069 -- Sil'dahn Subterranae
		["name"] = "Sil'dahn Subterranae",
		["cont"] = "Thanalan",
		["climate"] = {
			["type"] = "underground",
			["temp"] = "underground",
			["humidity"] = 1.04,
			["nighthot"] = 0.97, -- percentage
			["nightcold"] = 1.03,
			["stm"] = 0.07,
		},
		["effects"] = {
			["sleepy"] = -0.11,
			["confident"] = 0.11,
			["social"] = -1.21,
			["dazed"] = -0.11,
			["amused"] = -0.21,
			["curious"] = 0.21,
			["angry"] = 0.369,
			["tense"] = 0.369,
			["aetheric"] = 0.23,
		},
	},
	
	
	[1098] = {
		["name"] = "Sylphstep",
		["cont"] = "The Black Shroud", -- Leap of Faith
		["effects"] = {
			["hot"] = 0.75,
			["cold"] = -1.5,
			["playful"] = -0.25,
			["tired"] = 0.25,
			["tense"] = 0.25,
			["uncomfortable"] = -0.25,
			["nosey"] = 0.27,
			["curious"] = 0.27,
			["impatient"] = -0.27,
			["disturbed"] = 0.15,
			["amused"] = 0.15,
			["energized"] = -0.27,
			["aetheric"] = 0.37,
		}
	},
	
	[1185] = {--Tuliyollal
		["name"] = "Tuliyollal",
		["cont"] = "Yok Tural",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "tropical",
			["humidity"] = 1.17,
			["nighthot"] = 0.81, -- percentage
			["nightcold"] = 1.21,
			["stm"] = 0.21,
		},
		["effects"] = {
			["confident"] = 0.15,
			["uncomfortable"] = -0.15,
			["happy"] = 0.15,
			["curious"] = 0.25,
			["playful"] = 0.15,
			["social"] = 0.65,
			["focused"] = 0.15,
		}
	},
	[1186] = { --Solution Nine
		["name"] = "Solution Nine",
		["cont"] = "Xak Tural",
		["climate"] = {
			["type"] = "climate-controlled",
			["temp"] = "climate-controlled",
			["humidity"] = "dry",
			["nighthot"] = 0.97, -- percentage
			["nightcold"] = 1.07,
			["stm"] = 0.07,
		},
		["effects"] = {
			["wet"] = -0.45,
			["confident"] = 0.65,
			["uncomfortable"] = -0.25,
			["happy"] = 0.45,
			["curious"] = 0.95,
			["playful"] = 0.85,
			["sleepy"] = -0.41,
			["social"] = 0.65,
			["focused"] = 0.75,
			["amused"] = 0.85,
			["aetheric"] = 0.37,
		}
	},
	[1187] = { --Urqopacha
		["name"] = "Urqopacha",
		["cont"] = "Yok Tural",
		["climate"] = {
			["type"] = "plains",
			["temp"] = "temperate",
			["humidity"] = "dry",
			["nighthot"] = 0.91, -- percentage
			["nightcold"] = 1.11,
			["stm"] = 0.17,
		},
		["effects"] = {
			["hot"] = 0.65,
			["cold"] = -0.75,
			["wet"] = -0.45,
			["tired"] = -0.15,
			["confident"] = 0.15,
			["uncomfortable"] = -0.15,
			["happy"] = 0.15,
			["curious"] = 0.25,
			["playful"] = 0.15,
			["social"] = 0.15,
			["focused"] = 0.15,
		}
	},
	[1188] = {
		["name"] = "Kozama'uka",
		["cont"] = "Yok Tural",
		["climate"] = {
			["type"] = "tropical",
			["temp"] = "tropical",
			["humidity"] = "med",
			["nighthot"] = 0.74, -- percentage
			["nightcold"] = 1.13,
			["stm"] = 0.21,
		},
		["effects"] = {
			["wet"] = 1.44,
			["confident"] = 0.25,
			["uncomfortable"] = -0.15,
			["happy"] = 0.20,
			["curious"] = 0.25,
			["mischievous"] = 0.15,
			["social"] = 0.15,
			["focused"] = 0.15,
		}
	},
	[1189] = {--Mamook
		["name"] = "The Ja Tiika Heartland",
		["cont"] = "Yak T'el",
		["climate"] = {
			["type"] = "enchanted-forest",
			["temp"] = "enchanted-forest",
			["humidity"] = "normal",
			["nighthot"] = 0.71, -- percentage
			["nightcold"] = 1.41,
			["stm"] = 0.14,
		},
		["effects"] = {
			["wet"] = 0.10,
			["bored"] = -0.15,
			["confident"] = 0.25,
			["uncomfortable"] = -0.15,
			["happy"] = 0.20,
			["curious"] = 0.65,
			["mischievous"] = 0.25,
			["social"] = 0.15,
			["focused"] = 0.45,
			["tense"] = -0.25,
			["puzzled"] = 0.25,
			["mischievous"] = 0.35,
		}
	},
	[1190] = {--Shaaloani
		["name"] = "Shaaloani",
		["cont"] = "Xak Tural",
		["climate"] = {
			["type"] = "plains",
			["temp"] = "cool",
			["humidity"] = "low",
			["nighthot"] = 0.83, -- percentage
			["nightcold"] = 1.26,
			["stm"] = 0.23,
		},
		["effects"] = {
			["wet"] = -1.75,
			["confident"] = 0.35,
			["uncomfortable"] = -0.15,
			["responsible"] = 0.25,
			["happy"] = 0.35,
			["flirty"] = 0.25,
			["playful"] = 0.35,
			["nosey"] = 0.25,
			["social"] = 0.15,
			["focused"] = 0.15,
			["angry"] = 0.15,
			["amused"] = 0.15,
			["bored"] = 0.15,
		},
		--["nighthot"] = -0.25,
		--["nightcold"] = 0.65,
	},
	[1191] = {--Heritage Found
		["name"] = "Heritage Found",
		["cont"] = "Xak Tural",
		["climate"] = {
			["type"] = "umbralplains",
			["temp"] = "umbralplains",
			["humidity"] = "verylow",
			["nighthot"] = 0.69, -- percentage
			["nightcold"] = 1.63,
			["stm"] = 0.13,
		},
		["effects"] = {
			["wet"] = -3.25,
			["confident"] = -0.15,
			["uncomfortable"] = 0.25,
			["amazed"] = 0.25,
			["happy"] = -0.15,
			["flirty"] = -0.15,
			["playful"] = 0.15,
			["nosey"] = 0.35,
			["social"] = -0.45,
			["focused"] = -0.25,
			["angry"] = 0.65,
			["amused"] = -0.15,
			["bored"] = -0.15,
		},
	},
	[1265] = {--Lower Jueno
		["name"] = "Lower Jueno",
		["cont"] = "Unknown",
		["climate"] = {
			["type"] = "sleeping-village",
			["temp"] = "sleeping-village",
			["humidity"] = "dry",
			["nighthot"] = 0.89, -- percentage
			["nightcold"] = 1.07,
			["stm"] = 0.11,
		},
		["effects"] = {
			["wet"] = -0.27,
			["sleepy"] = 0.77,
			["confident"] = -0.15,
			["uncomfortable"] = -0.25,
			["amazed"] = 0.25,
			["bored"] = -0.15,
		},
	},
	[1237] = {--Moon Rabbit Base
		["name"] = "Sinus Ardorum",
		["cont"] = "The Sea of Stars",
		["climate"] = {
			["type"] = "space",
			["temp"] = "space",
			["humidity"] = "arid",
			["nighthot"] = 0.77, -- percentage
			["nightcold"] = 1.33,
			["stm"] = 0.0,
		},
		["effects"] = {
			["wet"] = -3.95,
			["focused"] = 0.25,
			["nosey"] = 0.45,
			["uncomfortable"] = 0.15,
			["happy"] = 0.15,
			["curious"] = 0.75,
			["bored"] = -0.25,
			["mischievous"] = 0.15,
			["confident"] = 0.25,
			["aetheric"] = 1.37,
		},
	},
	[1249] = {
		["name"] = "Private Cottage - Mist",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "moderate",
			["humidity"] = "low",
			["nighthot"] = 0.9, -- percentage
			["nightcold"] = 1.1,
			["stm"] = 0.15,
		},
	},
	[1250] = {
		["name"] = "Private House - Mist",
		["cont"] = "La Noscea",
		["climate"] = {
			["type"] = "indoors",
			["temp"] = "indoors-cool",
			["humidity"] = "low",
			["nighthot"] = 0.9, -- percentage
			["nightcold"] = 1.1,
			["stm"] = 0.15,
		},
	},
	[1252] = {
		["name"] = "South Horn",
		["cont"] = "Occult Crescent",
		["climate"] = {
			["type"] = "enchanted-island",
			["temp"] = "enchanted-island",
			["humidity"] = "moderate",
			["nighthot"] = 0.66,
			["nightcold"] = 1.33,
			["stm"] = 0.25,
		},
		["effects"] = {
			["wet"] = 0.31,
			["focused"] = -0.25,
			["playful"] = 0.45,
			["curious"] = 0.75,
			["bored"] = -0.25,
			["mischievous"] = 0.15,
			["confident"] = -0.15,
			["aetheric"] = -1.37,
		},
	},
	[1269] = {
		["name"] = "Phantom Village",
		["cont"] = "Occult Crescent",
		["climate"] = {
			["type"] = "coastal",
			["temp"] = "coastal",
			["humidity"] = "moderate",
			["nighthot"] = 0.77,
			["nightcold"] = 1.11,
			["stm"] = 0.25,
		},
		["effects"] = {
			["wet"] = 0.35,
			["focused"] = 0.25,
			["nosey"] = 0.45,
			["curious"] = 0.75,
			["bored"] = -0.25,
			["mischievous"] = 0.15,
			["confident"] = 0.15,
			["aetheric"] = -1.37,
		},
		
	},
	[1278] = {
		["name"] = "Phantom Village",
		["cont"] = "Occult Crescent",
		["climate"] = {
			["type"] = "enchanted-island",
			["temp"] = "enchanted-island",
			["humidity"] = "moderate",
			["nighthot"] = 0.66,
			["nightcold"] = 1.33,
			["stm"] = 0.25,
		},
		["effects"] = {
			["wet"] = 0.31,
			["focused"] = -0.25,
			["playful"] = 0.45,
			["curious"] = 0.75,
			["bored"] = -0.25,
			["mischievous"] = 0.15,
			["confident"] = -0.15,
			["aetheric"] = -1.37,
		},
		["nighthot"] = -1.45,
		["nightcold"] = 0.95,
	},

}

local function zoneData(map)
	return zones[map]
end


return zoneData