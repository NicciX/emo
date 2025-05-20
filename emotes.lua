
--Emotions logix
--Black - Strong/Creative Emotions
	-- Moods - focused, dazed, mischievous, nosey, anxious, confident, flippant, responsible, social


--Red - Strong/Passionate Emotions
	-- Moods - angry, playful, embarrassed, curious, hot, flirty, amused
	
--Yellow - Energetic Emotions
	-- Moods - happy, puzzled, energized, busy, hungry, surprised
	
--Blue - Negative Emotions
	-- Moods - scared, sleepy, sad, cold, wet, tired, concerned
	
--Green - General Emotions
	-- Moods - neutral, tense, bored, uncomfortable, impatient


-- convert from json regxp > what:  "(\w*)":	with:  ["\1"] =


local emDex = {
	"aback", "airquotes", "allsaintscharm", "angry", "apple", "atease", "attend", "attention", "backflip", 
	"bstance", "beckon", "blowkiss", "blush","bow", "bread", "cheer", "chuckle", "clap", "clutchhead",
	"comfort","poppit", "wine", "meteor", "birds", "bouquet", "riceball", "egg", "pizza", "gratuity",
	"diamonds", "floatyflames", "congratulate", "converse", "cry", "dance", "deny", "disappointed", "dote",
	"doubt", "doze", "tea", "ebow", "choco", "elucidate", "examineself", "facepalm", "fist", "fistpump",
	"flex", "petals", "fume", "furious", "deride", "goodbye", "greet", "grovel", "handover", "happy", "hug", "huh",
	"waitforit", "imperialsalute", "joy", "kneel", "laliho", "laugh", "ladance", "lookout", "magictrick",
	"me", "no", "ohokaliy", "paintblack", "paintblue", "paintyellow", "paintred", "panic", "mime", "rrespect",
	"pet", "point", "poke", "pose", "pray", "psych", "pushups", "rally", "read", "salute", "sabotender", "gcsalute",
	"shocked", "shrug", "shush", "snap", "slap", "soothe", "squats", "stagger", "stretch", "sulk", "surprised",
	"think", "thumbsup", "tomestone", "bigfan", "upset", "vexed", "victory", "vreveal", "waterflip", "splash",
	"waterfloat", "wave", "welcome", "wow", "yes", "bdance", "beesknees", "bombdance", "vpose", "awe",
	"box", "charmed", "cheerjump", "cheeron", "cheerwave", "confirm", "flamedance", "getfantasy", "hdance",
	"hum", "lean", "heart", "malevolence", "mdance", "mmambo", "mogdance", "hildy", "spectacles", "pdead",
	"scheme", "shakedrink", "shiver", "sit", "sitonground", "slump", "songbird", "sdance", "sweat", "sweep",
	"tdance", "wringhands", "lophop", "yoldance", "frighten", "earwiggle", "highfive", "situps", "water",
	"insist", "photograph", "showleft", "showright", "reference", "ritualprayer", "study", "tomescroll",
	"sundance", "brpa", "brpb", "rrpa", "rrpb", "yrpa", "yrpb", "reprimand", "spirit", "popotostep", "guard",
	"dazed", "boxstep", "gdance", "edance", "consider", "crimsonlotus", "determined", "eureka", "toast",
	"rage", "visage", "throw", "toast", "cookie", "overreact", "blowbubbles"
}

-- ["defEmo"] = true, --indicates a default emote
local emote = {
	["aback"] = {
		["slsh"] = "aback",
		["type"] = "surprised",
		["group"] = "yellow",
		["where"] = "Kasumi - The Gold Saucer - 5,000 Gil",
		["cost"] = 1,
		["weight"] = 59,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["surprised"] = -2,
			["puzzled"] = -1
		},
	},
	["airquotes"] = {
		["slsh"] = "airquotes",
		["type"] = "flippant",
		["group"] = "black",
		["cd"] = 90,
		["cost"] = 1,
		["last"] = 0,
		["weight"] = 61,
		["defEmo"] = true,
		["known"] = true,
		["effects"] = {
			["amused"] = 1,
			["social"] = 2,
			["flippant"] = 3
		}
	},
	["allsaintscharm"] = {
		["slsh"] = "allsaintscharm",
		["type"] = "mischievous",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 59,
		["where"] = "Mogstation - All Saints' Wake (2023)",
		["cd"] = 220,
		["last"] = 0,
		["effects"] = {
			["amused"] = 2,
			["social"] = 2,
			["mischievous"] = 3
		}
	},
	["angry"] = {
		["slsh"] = "angry",
		["type"] = "angry",
		["group"] = "red",
		["cost"] = 1.3,
		["weight"] = 61,
		["defEmo"] = true,
		["known"] = true,
		["cd"] = 60,
		["last"] = 0,
		["effects"] = {
			["angry"] = -2,
			["tense"] = -1,
			["uncomfortable"] = -1
		}
	},
	["apple"] = {
		["slsh"] = "apple",
		["type"] = "amused",
		["group"] = "red",
		["weight"] = 67,
		["where"] = "Market Board/Kupo of Fortune",
		["cost"] = -1,
		["weight"] = 1,
		["cd"] = 33,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -15,
			["energized"] = 6.7,
			["tired"] = -5,
			["aetheric"] = 7.7,
			["sleepy"] = -5,
			["flirty"] = 2,
			["amused"] = -3
		}
	},
	["atease"] = {
		["slsh"] = "atease",
		["type"] = "neutral",
		["group"] = "blue",
		["weight"] = 59,
		["where"] = "40,000 Company Seals",
		["channeled"] = true,
		["cost"] = 0.13,
		["cd"] = 320,
		["last"] = 0,
		["effects"] = {
			["angry"] = -0.37,
			["tense"] = -0.31,
			["uncomfortable"] = -0.21,
			["tired"] = -0.21,
			["responsible"] = 0.41,
			["social"] = 0.41
		}
	},
	["attend"] = {
		["slsh"] = "attend",
		["type"] = "neutral",
		["group"] = "blue",
		["where"] = "PvP Series 7 - Level 5",
		["channeled"] = true,
		["cost"] = 0.13,
		["cd"] = 320,
		["last"] = 0,
		["weight"] = 59,
		["effects"] = {
			["angry"] = -0.37,
			["tense"] = -0.31,
			["uncomfortable"] = -0.21,
			["tired"] = -0.21,
			["responsible"] = 0.41,
			["nosey"] = 0.41
		}
	},
	["attention"] = {
		["slsh"] = "attention",
		["type"] = "neutral",
		["group"] = "blue",
		["channeled"] = true,
		["cost"] = -0.11,
		["cd"] = 320,
		["last"] = 0,
		["weight"] = 59,
		["effects"] = {
			["angry"] = -1,
			["tense"] = -1,
			["uncomfortable"] = -1,
			["tired"] = -1,
			["responsible"] = 1
		}
	},
	["awe"] = {
		["slsh"] = "awe",
		["type"] = "amazed",
		["group"] = "yelow",
		["cost"] = 0.69,
		["cd"] = 120,
		["last"] = 0,
		["weight"] = 59,
		["known"] = true,
		["defEmo"] = true,
		["effects"] = {
			["amazed"] = -2,
			["social"] = 1,
			["flippant"] = -2
		}
	},
	["backflip"] = {
		["slsh"] = "backflip",
		["type"] = "energized",
		["group"] = "yellow",
		["where"] = "Mogstation",
		["cost"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["weight"] = 59,
		["effects"] = {
			["energized"] = -1,
			["tired"] = 2,
			["bored"] = -2,
			["hungry"] = 1
		}
	},
	["bdance"] = {
		["slsh"] = "bdance",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 0.13,
		["cd"] = 120,
		["channeled"] = true,
		["where"] = "Help Me, Lord of the Dance",
		["last"] = 0,
		["weight"] = 59,
		["effects"] = {
			["flirty"] = 0.125,
			["amused"] = -0.25,
			["bored"] = -0.75,
			["social"] = -0.25,
			["flippant"] = 0.125,
		}
	},
	["beckon"] = {
		["slsh"] = "beckon",
		["type"] = "impatient",
		["group"] = "green",
		["defEmo"] = true,
		["cd"] = 120,
		["last"] = 0,
		["cost"] = 0.69,
		["weight"] = 59,
		["known"] = true,
		["effects"] = {
			["sad"] = -1,
			["neutral"] = -2,
			["amused"] = -1,
			["social"] = -2,
			["flippant"] = 2,
			["energized"] = -1
		}
	},
	["beesknees"] = {
		["slsh"] = "beesknees",
		["type"] = "social",
		["group"] = "white",
		["channeled"] = true,
		["cd"] = 169,
		["last"] = 0,
		["cost"] = 0.23,
		["weight"] = 59,
		["where"] = "Gold Saucer",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["amused"] = 1,
			["flirty"] = 1,
			["social"] = -0.75,
			["hungry"] = 0.05
		}
	},
	["bigfan"] = {
		["slsh"] = "bigfan",
		["type"] = "hot",
		["group"] = "red",
		["cd"] = 120,
		["last"] = 0,
		["cost"] = 1.11,
		["weight"] = 59,
		--["channeled"] = true,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -1.25,
			["tense"] = -0.75,
			["uncomfortable"] = -0.25,
			["energized"] = -0.75,
			["playful"] = 1,
			["social"] = 0.75,
			["flirty"] = -0.35,
			["hot"] = -2.65,
			["cold"] = 3.95,
			["wet"] = -1.75
		}
	},
	["blowbubbles"] = {
		["slsh"] = "blowbubbles",
		["type"] = "playful",
		["group"] = "white",
		["cd"] = 120,
		["last"] = 0,
		["cost"] = 3.69,
		["weight"] = 59,
		["where"] = "Mogstation $7",
		["effects"] = {
			["anxious"] = -7,
			["impatient"] = -7,
			["mischievous"] = 2,
			["angry"] = -11,
			["flirty"] = 3.69,
		}
	},
	["blowkiss"] = {
		["slsh"] = "blowkiss",
		["type"] = "flirty",
		["group"] = "red",
		["cd"] = 120,
		["last"] = 0,
		["cost"] = 1.69,
		["weight"] = 59,
		["known"] = true,
		["defEmo"] = true,
		["effects"] = {
			["anxious"] = 1,
			["impatient"] = -1,
			["mischievous"] = 2,
			["angry"] = -2,
			["energized"] = -1,
			["playful"] = 1,
			["social"] = -1,
			["confident"] = -1,
			["flirty"] = -1,
			["focused"] = 1
		}
	},
	["blush"] = {
		["slsh"] = "blush",
		["type"] = "embarrassed",
		["group"] = "red",
		["cd"] = 69,
		["last"] = 0,
		["cost"] = 0.69,
		["weight"] = 59,
		["known"] = true,
		["defEmo"] = true
	},
	["bombdance"] = {
		["slsh"] = "bombdance",
		["type"] = "playful",
		["group"] = "white",
		["cd"] = 169,
		["last"] = 0,
		["cost"] = 0.19,
		["weight"] = 59,
		["channeled"] = true,
		["where"] = "Mogstation - Moonfire Faire (2014)",
		["effects"] = {
			["playful"] = -0.25,
			["happy"] = -0.25,
		}
	},
	["bouquet"] = {
		["slsh"] = "bouquet",
		["type"] = "flirty",
		["group"] = "red",
		["where"] = "Valentione's Day (2025)",
		["cd"] = 369,
		["cost"] = 1.69,
		["weight"] = 23,
		["last"] = 0,
		["effects"] = {
			["anxious"] = 1,
			["impatient"] = -1,
			["mischievous"] = 2,
			["angry"] = -2,
			["energized"] = -1,
			["playful"] = 1,
			["social"] = -2,
			["embarrassed"] = 1,
			["confident"] = -1,
			["flirty"] = -3,
			["focused"] = 1
		}
	},
	["bow"] = {
		["slsh"] = "bow",
		["type"] = "responsible",
		["defEmo"] = true,
		["group"] = "white",
		["cd"] = 90,
		["cost"] = 0.9,
		["last"] = 0,
		["weight"] = 59,
		["where"] = "MSQ",
		["effects"] = {
			["anxious"] = -1,
			["impatient"] = -2,
			["mischievous"] = 0.35,
			["angry"] = -2,
			["embarrassed"] = -2,
			["playful"] = 1,
			["social"] = 3,
			["confident"] = -2,
			["responsible"] = -3,
			["focused"] = 1
		},
	},
	["box"] = {
		["slsh"] = "box",
		["type"] = "angry",
		["group"] = "red",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 33,
		["last"] = 0,
		["weight"] = 59,
		["where"] = "Gold Saucer",
		["effects"] = {
			["angry"] = -1.25,
			["tense"] = -1.25,
			["uncomfortable"] = -0.25,
			["energized"] = -0.15,
			["amused"] = 0.75,
			["social"] = -0.75,
			["hungry"] = 0.15
		}
	},
	["bread"] = {
		["slsh"] = "bread",
		["type"] = "hungry",
		["group"] = "yellow",
		["cost"] = -0.25,
		["weight"] = 1,
		["cd"] = 33,
		["last"] = 0,
		["weight"] = 59,
		["effects"] = {
			["hungry"] = -7.11,
		}
	},
	["bstance"] = {
		["slsh"] = "bstance",
		["type"] = "responsible",
		["group"] = "white",
		["cd"] = 77,
		["last"] = 0,
		["weight"] = 59,
		["effects"] = {
			["responsible"] = -1.11,
		}
	},
	["charmed"] = {
		["slsh"] = "charmed",
		["type"] = "flirty",
		["group"] = "red",
		["cd"] = 120,
		["last"] = 0,
		["cost"] = 0.33,
		["weight"] = 59,
		["channeled"] = true,
		["where"] = "Madhura - Castellum Velodyna (The Fringes) - 5 Ananta Dreamstaves (Rank 5)",
		["effects"] = {
			["flirty"] = -9,
			["playful"] = 1,
			["mischievous"] = 1,
			["neutral"] = -1
		}
	},
	["cheer"] = {
		["slsh"] = "cheer",
		["type"] = "happy",
		["group"] = "white",
		["cd"] = 77,
		["last"] = 0,
		["cost"] = 1.33,
		["weight"] = 59,
		["defEmo"] = true,
		["effects"] = {
			["amused"] = -2,
			["social"] = 2,
			["happy"] = -2
		}
	},
	["cheerjump"] = {
		["slsh"] = "cheerjump",
		["type"] = "happy",
		["group"] = "white",
		["cd"] = 180,
		["last"] = 0,
		["cost"] = 3.11,
		["weight"] = 59,
		["channeled"] = true,
		["where"] = "Mogstation - Little Ladies' Day (2018)",
		["effects"] = {
			["amused"] = 0.15,
			["social"] = -0.65,
			["happy"] = -0.25,
			["confident"] = -0.25
		}
	},
	["cheeron"] = {
		["slsh"] = "cheeron",
		["type"] = "happy",
		["group"] = "white",
		["cd"] = 180,
		["last"] = 0,
		["cost"] = 0.11,
		["weight"] = 59,
		["channeled"] = true,
		["where"] = "Mogstation - Little Ladies' Day (2018)",
		["effects"] = {
			["amused"] = 0.15,
			["social"] = -0.65,
			["happy"] = -0.25,
			["confident"] = -0.25
		}
	},
	["cheerwave"] = {
		["slsh"] = "cheerwave",
		["type"] = "happy",
		["group"] = "white",
		["cd"] = 180,
		["last"] = 0,
		["cost"] = 0.11,
		["weight"] = 59,
		["channeled"] = true,
		["where"] = "Mogstation - Little Ladies' Day (2018)",
		["effects"] = {
			["amused"] = 0.15,
			["social"] = -0.65,
			["happy"] = -0.25,
			["confident"] = -0.25
		}
	},
	["choco"] = {
		["slsh"] = "choco",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = -2.34,
		["weight"] = 61,
		["cd"] = 234,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -7,
			["tired"] = -4,
			["uncomfortable"] = -4,
			["sleepy"] = -2,
			["happy"] = 4,
			["flirty"] = 2,
			["amused"] = -4
		}
	},
	["chuckle"] = {
		["slsh"] = "chuckle",
		["type"] = "amused",
		["group"] = red,
		["defEmo"] = true,
		["last"] = 0,
		["cd"] = 67,
		["weight"] = 61,
		["cost"] = 1,
		["effects"] = {
			["amused"] = -3,
			["social"] = -1,
			["neutral"] = 1,
			["happy"] = -2
		}
	},
	["clap"] = {
		["slsh"] = "clap",
		["type"] = "amused",
		["group"] = "red",
		["defEmo"] = true,
		["last"] = 0,
		["cd"] = 67,
		["weight"] = 61,
		["cost"] = 1,
		["effects"] = {
			["sad"] = -3,
			["anxious"] = -1,
			["social"] = -1,
			["confident"] = 1,
			["amused"] = -3,
			["playful"] = 1,
			["mischievous"] = 1,
			["neutral"] = -1,
			["energized"] = -1,
			["aetheric"] = -1
		}
	},
	["clutchhead"] = {
		["slsh"] = "clutchhead",
		["type"] = "uncomfortable",
		["group"] = "green",
		["last"] = 0,
		["cd"] = 67,
		["weight"] = 61,
		["cost"] = 1,
		["defEmo"] = true,
		["effects"] = {
			["angry"] = -1,
			["tense"] = -2,
			["uncomfortable"] = -1,
			["energized"] = -2.5,
			["aetheric"] = -1.5
		}
	},
	["comfort"] = {
		["slsh"] = "comfort",
		["type"] = "responsible",
		["group"] = "white",
		["last"] = 0,
		["cd"] = 67,
		["weight"] = 61,
		["cost"] = 1,
		["defEmo"] = true,
		["effects"] = {
			["responsible"] = -1,
			["aetheric"] = -1.5
		}
	},
	["confirm"] = {
		["slsh"] = "confirm",
		["type"] = "responsible",
		["group"] = "white",
		["last"] = 0,
		["cd"] = 67,
		["weight"] = 61,
		["cost"] = 1,
		["where"] = "The Lost Canals Of Uznair / Market Board",
		["effects"] = {
			["responsible"] = -1,
			["aetheric"] = -1.5
		}
	},
	["congratulate"] = {
		["slsh"] = "congratulate",
		["type"] = "happy",
		["group"] = "white",
		["defEmo"] = true,
		["last"] = 0,
		["cd"] = 67,
		["weight"] = 61,
		["cost"] = 1,
		["effects"] = {
			["responsible"] = -1,
			["aetheric"] = -1.5
		}
	},
	["consider"] = {
		["slsh"] = "consider",
		["type"] = "focused",
		["group"] = "black",
		["defEmo"] = true,
		["last"] = 0,
		["cd"] = 59,
		["weight"] = 61,
		["cost"] = 1,
		["where"] = "Mogstation - The Make It Rain Campaign (2020)",
		["effects"] = {
			["focused"] = -1,
			["nosey"] = -1.5
		}
	},
	["converse"] = {
		["slsh"] = "converse",
		["type"] = "social",
		["group"] = "white",
		["defEmo"] = true,
		["last"] = 0,
		["cd"] = 59,
		["weight"] = 61,
		["cost"] = 1,
		["effects"] = {
			["social"] = -0.333,
			["confident"] = 0.67,
			["flirty"] = -0.43,
			["playful"] = 0.21,
			["mischievous"] = -0.34,
			["neutral"] = -0.5,
			["nosey"] = -3.33
		}
	},
	["cookie"] = {
		["slsh"] = "cookie",
		["type"] = "hungry",
		["group"] = "yellow",
		["cost"] = -2.34,
		["weight"] = 61,
		["cd"] = 234,
		["last"] = 0,
		["where"] = "Mogstation / All Saints' Wake (Oct 2022)",
		["effects"] = {
			["hungry"] = -7,
			["tired"] = -2,
			["uncomfortable"] = -3,
			["social"] = 2
		}
	},
	["crimsonlotus"] = {
		["slsh"] = "crimsonlotus",
		["type"] = "energised",
		["group"] = "yellow",
		["last"] = 0,
		["cd"] = 59,
		["weight"] = 61,
		["cost"] = 1,
		["where"] = "Mogstation - The Make It Rain Campaign (2020)",
		["effects"] = {
			["energized"] = -2,
			["tired"] = 2,
			["bored"] = -2,
		}
	},
	["cry"] = {
		["slsh"] = "cry",
		["type"] = "sad",
		["group"] = "blue",
		["weight"] = 53,
		["cd"] = 123,
		["last"] = 0,
		["cost"] = 2.34,
		["defEmo"] = true,
		["effects"] = {
			["anxious"] = -1,
			["social"] = -1,
			["tense"] = -2
		}
	},
	["dance"] = {
		["slsh"] = "dance",
		["type"] = "playful",
		["group"] = "white",
		["weight"] = 47,
		["cd"] = 166,
		["last"] = 0,
		["cost"] = 1.37,
		["defEmo"] = true,
		["effects"] = {
			["amused"] = -2,
			["social"] = 1,
			["hungry"] = 1,
			["tense"] = -1
		}
	},
	["dazed"] = {
		["slsh"] = "dazed",
		["type"] = "dazed",
		["group"] = "black",
		["cost"] = 6,
		["channeled"] = true,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["sad"] = -1,
			["anxious"] = -1,
			["energized"] = 2,
			["focused"] = -1,
			["tense"] = -2,
			["flirty"] = -2,
			["playful"] = -1,
			["tired"] = -3,
			["sleepy"] = -5.5
		}
	},
	["deny"] = {
		["slsh"] = "deny",
		["type"] = "uncomfortable",
		["group"] = "green",
		["defEmo"] = true,
		["weight"] = 61,
		["cost"] = 2,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["dazed"] = -1,
			["uncomfortable"] = -2.5,
			["anxious"] = -2.5,
			["embarrassed"] = -2,
			["flippant"] = 1,
		}
	},
	["deride"] = {
		["slsh"] = "deride",
		["type"] = "angry",
		["group"] = "red",
		["cost"] = -1,
		["weight"] = 61,
		["cd"] = 33,
		["last"] = 0,
		["effects"] = {
			["angry"] = -3,
			["tense"] = -2,
			["uncomfortable"] = -3,
			["mischievous"] = 1
		},
		["where"] = "Mogstation"
	},
	["disappointed"] = {
		["slsh"] = "disappointed",
		["type"] = "sad",
		["group"] = "blue",
		["weight"] = 61,
		["cd"] = 121,
		["last"] = 0,
		["cost"] = 1.11,
		["defEmo"] = true,
		["effects"] = {
			["anxious"] = -2,
			["social"] = -2,
			["confident"] = 1,
			["tense"] = -1,
			["dazed"] = -1,
			["impatient"] = -2
		}
	},
	["dote"] = {
		["slsh"] = "dote",
		["type"] = "social",
		["group"] = "yellow",
		["weight"] = 61,
		["cost"] = 2,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["sad"] = -3,
			["anxious"] = -1,
			["social"] = -3,
			["confident"] = 2,
			["flirty"] = -18,
			["playful"] = 3,
			["mischievous"] = 3,
			["neutral"] = -1
		},
		["where"] = "Online Store - Mogstation"
	},
	["doubt"] = {
		["slsh"] = "doubt",
		["type"] = "angry",
		["group"] = "red",
		["weight"] = 61,
		["cost"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["angry"] = -3,
			["tense"] = -2,
			["uncomfortable"] = -3,
			["mischievous"] = 1
		},
	},
	["doze"] = {
		["slsh"] = "doze",
		["type"] = "sleepy",
		["defEmo"] = true,
		["group"] = "black",
		["cost"] = 0.11,
		["weight"] = 33,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["sad"] = -1,
			["anxious"] = -1,
			["energized"] = 2,
			["focused"] = -1,
			["tense"] = -2,
			["flirty"] = -2,
			["playful"] = -1,
			["tired"] = -3,
			["sleepy"] = -5.5
		}
	},
	["earwiggle"] = {
		["slsh"] = "earwiggle",
		["type"] = "focused",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 47,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["anxious"] = -5,
			["impatient"] = -5,
			["uncomfortable"] = -5,
			["angry"] = -5,
			["energized"] = -1,
			["playful"] = -2,
			["flirty"] = 2,
			["focused"] = -2
		},
		["where"] = "lopporits"
	},
	["ebow"] = {
		["slsh"] = "ebow",
		["type"] = "responsible",
		["group"] = "white",
		["where"] = "MSQ",
		["cost"] = 1,
		["weight"] = 37,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["social"] = -1,
			["responsible"] = -3,
			["confident"] = 1,
		},
	},
	["egg"] = {
		["slsh"] = "egg",
		["type"] = "hungry",
		["group"] = "yellow",
		["cost"] = 1,
		["weight"] = 61,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -10,
			["energized"] = 7,
			["tired"] = -2,
			["uncomfortable"] = -3,
			["sleepy"] = -4,
			["happy"] = 2,
			["focused"] = 2
		}
	},
	["elucidate"] = {
		["slsh"] = "elucidate",
		["type"] = "flippant",
		["group"] = "black",
		["where"] = "15,000 Wolf Marks",
		["cost"] = 1,
		["weight"] = 59,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["flippant"] = -3,
			["impatient"] = -3,
			["confident"] = 3,
			["social"] = 2
		}
	},
	["examineself"] = {
		["slsh"] = "examineself",
		["type"] = "curious",
		["group"] = "red",
		["weight"] = 61,
		["cost"] = 1.66,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["amused"] = 1,
			["social"] = 1,
			["neutral"] = -2,
			["curious"] = -2,
			["playful"] = 1,
			["focused"] = -1
		},
		["where"] = "Default Emote"
	},
	["facepalm"] = {
		["slsh"] = "facepalm",
		["type"] = "tense",
		["group"] = "green",
		["weight"] = 61,
		["cost"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["angry"] = -1,
			["tense"] = -2,
			["uncomfortable"] = 1,
			["social"] = 1,
			["flippant"] = -1
		},
		["defEmo"] = true
	},
	["fist"] = {
		["slsh"] = "fist",
		["type"] = "social",
		["group"] = "white",
		["weight"] = 61,
		["cost"] = 2,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["social"] = -1,
		},
	},
	["fistpump"] = {
		["slsh"] = "fistpump",
		["type"] = "social",
		["group"] = "white",
		["weight"] = 61,
		["cost"] = 2,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["amused"] = -2,
			["social"] = -1,
			["neutral"] = -2,
			["happy"] = 1
		},
		["where"] = "Moisture-warped Lockbox - Eureka Hydatos :: Market Board"
	},
	["flamedance"] = {
		["slsh"] = "flamedance",
		["type"] = "amused",
		["group"] = "red",
		["weight"] = 61,
		["cost"] = 2,
		["cd"] = 120,
		["last"] = 0,
		["channeled"] = true,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -0.35,
			["tired"] = -0.25,
			["aetheric"] = -0.25,
			["energized"] = 0.15,
			["focused"] = -0.75,
			["social"] = -0.35,
			["flirty"] = 0.25,
			["playful"] = -0.25,
			["confident"] = 0.25,
			["amused"] = -0.25
		}
	},
	["flex"] = {
		["slsh"] = "flex",
		["type"] = "amused",
		["group"] = "red",
		["weight"] = 61,
		["cost"] = 2,
		["cd"] = 120,
		["last"] = 0,
	},
	["frighten"] = {
		["slsh"] = "frighten",
		["type"] = "mischievous",
		["group"] = "black",
		["weight"] = 61,
		["cost"] = 2,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["angry"] = -3,
			["tense"] = -5,
			["uncomfortable"] = -4
		},
		["where"] = "Mogstation"
	},
	["fume"] = {
		["slsh"] = "fume",
		["type"] = "angry",
		["group"] = "red",
		["cost"] = -1,
		["weight"] = 61,
		["cd"] = 33,
		["last"] = 0,
		["effects"] = {
			["angry"] = -3,
			["tense"] = -2,
			["uncomfortable"] = -1,
			["social"] = -1,
			["flippant"] = 1
		},
		["defEmo"] = true,
		["last"] = 0,
	},
	["furious"] = {
		["slsh"] = "furious",
		["type"] = "amused",
		["cost"] = -1,
		["weight"] = 51,
		["cd"] = 33,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["angry"] = -4,
			["tense"] = -2,
			["uncomfortable"] = -2,
			["social"] = -2,
			["dazed"] = -2
		},
	},
	["gcsalute"] = {
		["slsh"] = "gcsalute",
		["type"] = "responsible",
		["group"] = "white",
		["cd"] = 120,
		["weight"] = 61,
		["cost"] = 1,
		["defEmo"] = true,
		["last"] = 0,
		["effects"] = {
			["angry"] = -1,
			["tense"] = -1,
			["uncomfortable"] = -1,
			["tired"] = -1,
			["responsible"] = 1
		}
	},
	["getfantasy"] = {
		["slsh"] = "getfantasy",
		["type"] = "social",
		["group"] = "white",
		["cost"] = 4.4,
		["weight"] = 51,
		["cd"] = 120,
		["last"] = 0,
		["where"] = "Mogstation",
		["channeled"] = true,
		["effects"] = {
			["social"] = -2,
			["impatient"] = -2,
			["angry"] = -2,
			["playful"] = -1,
			["flirty"] = -1
		},
	},
	["goodbye"] = {
		["slsh"] = "goodbye",
		["type"] = "responsible",
		["group"] = "white",
		["cost"] = 1.4,
		["weight"] = 55,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true
	},
	["gratuity"] = {
		["slsh"] = "gratuity",
		["type"] = "confident",
		["group"] = "black",
		["cd"] = 220,
		["last"] = 0,
		["cost"] = 2.3,
		["weight"] = 49,
		["effects"] = {
			["confident"] = -3,
			["social"] = 1,
			["mischievous"] = -1,
			["playful"] = -2,
			["amused"] = 2
		}
	},
	["greet"] = {
		["slsh"] = "greet",
		["type"] = "responsible",
		["group"] = "white",
		["cd"] = 90,
		["cost"] = 0.9,
		["last"] = 0,
		["weight"] = 59,
		["where"] = "MSQ - Tidings from the East",
		["effects"] = {
			["anxious"] = -1,
			["embarrassed"] = 1,
			["playful"] = 1,
			["social"] = 3,
		},
	},
	["grovel"] = {
		["slsh"] = "grovel",
		["type"] = "embarrased",
		["group"] = "red",
		["last"] = 0,
		["cd"] = 69,
		["weight"] = 47,
		["cost"] = 1.6,
		["defEmo"] = true,
		["effects"] = {
			["embarrased"] = -3,
			["anxious"] = -1.5
		}
	},
	["handover"] = {
		["slsh"] = "handover",
		["type"] = "amused",
		["group"] = "white",
		["last"] = 0,
		["cd"] = 69,
		["weight"] = 47,
		["cost"] = 1,
		["defEmo"] = true,
		["effects"] = {
			["responsible"] = -1,
			["aetheric"] = -1.5
		}
	},
	["happy"] = {
		["slsh"] = "happy",
		["type"] = "happy",
		["group"] = "white",
		["cost"] = 3.1,
		["weight"] = 49,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["happy"] = -2,
			["energized"] = 1,
			["amused"] = -3
		}
	},
	["hdance"] = {
		["slsh"] = "hdance",
		["type"] = "amused",
		["group"] = "red",
		["channeled"] = true,
		["cd"] = 169,
		["last"] = 0,
		["cost"] = 0.23,
		["weight"] = 59,
		["where"] = "Quest - Saw That One Coming (Gridania)",
		["effects"] = {
			["responsible"] = -1,
			["aetheric"] = -1.5,
			["social"] = -1.5,
			["playful"] = 1.3
		}
	},
	["heart"] = {
		["slsh"] = "heart",
		["type"] = "flirty",
		["group"] = "red",
		["channeled"] = true,
		["cd"] = 169,
		["last"] = 0,
		["cost"] = 0.69,
		["weight"] = 39,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["amused"] = 1,
			["social"] = -0.35,
			["playful"] = -0.45,
			["confident"] = -0.45
		}
	},
	["highfive"] = {
		["slsh"] = "highfive",
		["type"] = "social",
		["group"] = "red",
		["cd"] = 131,
		["last"] = 0,
		["cost"] = 1.11,
		["weight"] = 59,
		["where"] = "1,800 Skybuilders' Scrips",
		["effects"] = {
			["amused"] = -1,
			["social"] = -2,
			["neutral"] = -1,
			["happy"] = 1
		}
	},
	["hildy"] = {
		["slsh"] = "hildy",
		["type"] = "amused",
		["group"] = "red",
		["cd"] = 169,
		["last"] = 0,
		["cost"] = 1.69,
		["weight"] = 47,
		["where"] = "Her Last Vow - Manderville Quests",
	},
	["hug"] = {
		["slsh"] = "hug",
		["type"] = "social",
		["group"] = "white",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 51,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["happy"] = 2,
			["sad"] = -3,
			["neutral"] = -5,
			["bored"] = -1,
			["impatient"] = -5
		}
	},
	["huh"] = {
		["slsh"] = "huh",
		["type"] = "dazed",
		["group"] = "black",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 41,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["dazed"] = -2.5,
			["flippant"] = -1,
			["bored"] = -1,
			["embarrassed"] = -1,
			["social"] = 1
		}
	},
	["hum"] = {
		["slsh"] = "hum",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 0.77,
		["weight"] = 41,
		["cd"] = 177,
		["last"] = 0,
		["channeled"] = true,
		["where"] = "Stormblood - The Fire-bird Down Below",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["amused"] = -0.35,
			["social"] = -0.45,
			["hungry"] = 0.05,
			["nosey"] = -0.25
		}
	},
	["imperialsalute"] = {
		["slsh"] = "imperialsalute",
		["type"] = "responsible",
		["group"] = "white",
		["cost"] = 1,
		["weight"] = 61,
		["cd"] = 120,
		["last"] = 0,
		["where"] = "MSQ - Acting the Part",
	},
	["joy"] = {
		["slsh"] = "joy",
		["type"] = "happy",
		["group"] = "yellow",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 61,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -0.5,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -5,
			["social"] = -3,
			["happy"] = -3,
			["sad"] = -2,
			["neutral"] = -1,
			["bored"] = -2,
			["impatient"] = -1,
			["amused"] = 1
		}
	},
	["kneel"] = {
		["slsh"] = "kneel",
		["type"] = "responsible",
		["group"] = "white",
		["cost"] = 1.37,
		["weight"] = 61,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true
	},
	["ladance"] = {
		["slsh"] = "ladance",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 66,
		["cd"] = 166,
		["last"] = 0,
		["effects"] = {
			["bored"] = -1,
			["curious"] = -2,
			["hot"] = -2.5,
			["surprised"] = -0.5,
			["social"] = -0.5,
			["cold"] = 0.77
		}
	},
	["laliho"] = {
		["slsh"] = "laliho",
		["type"] = "amused",
		["group"] = "red",
		["cd"] = 90,
		["cost"] = 0.9,
		["last"] = 0,
		["weight"] = 59,
	},
	["laugh"] = {
		["slsh"] = "laugh",
		["type"] = "amused",
		["group"] = "red",
		["defEmo"] = true,
		["last"] = 0,
		["cd"] = 69,
		["cost"] = 1.69,
		["weight"] = 61,
		["effects"] = {
			["happy"] = -2,
			["amused"] = -3
		},
	},
	["lean"] = {
		["slsh"] = "lean",
		["type"] = "neutral",
		["group"] = "white",
		["last"] = 0,
		["cd"] = 120,
		["cost"] = 0.31,
		["weight"] = 51,
		["channeled"] = true,
		["where"] = "Winsome Wallflower",
		["effects"] = {
			["sleepy"] = -0.67,
			["energized"] = 0.77,
			["social"] = -0.15,
		}
	},
	["lookout"] = {
		["slsh"] = "lookout",
		["type"] = "curious",
		["group"] = "red",
		["defEmo"] = true,
		["cost"] = 4.4,
		["weight"] = 44,
		["cd"] = 144,
		["last"] = 0,
		["effects"] = {
			["bored"] = -1,
			["tense"] = -1,
			["curious"] = -2,
			["nosey"] = -2.5,
			["concerned"] = -1.5,
			["surprised"] = -0.5,
			["social"] = -0.5
		}
	},
	["lophop"] = {
		["slsh"] = "lophop",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 6,
		["weight"] = 51,
		["cd"] = 120,
		["last"] = 0,
		["channeled"] = true,
		["effects"] = {
			["social"] = -2,
			["impatient"] = -2,
			["angry"] = -2,
			["playful"] = -1,
			["flirty"] = -1
		},
		["where"] = "A Dream Worth Chasing - Quest appears when you've reached Bloodsworn with all 3 EW societies."
	},
	["magictrick"] = {
		["slsh"] = "magictrick",
		["type"] = "mischievous",
		["group"] = "black",
		["cost"] = 4.32,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["where"] = "Online Store - Mogstation",
		["effects"] = {
			["mischievous"] = -3.5,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -5,
			["social"] = -3,
			["amused"] = 1,
			["sad"] = -2,
			["flirty"] = 2,
			["focused"] = -3,
			["bored"] = -2,
			["impatient"] = -1,
			["flippant"] = -3
		},
	},
	["malevolence"] = {
		["slsh"] = "malevolence",
		["type"] = "angry",
		["group"] = "red",
		["channeled"] = true,
		["cd"] = 234,
		["last"] = 0,
		["cost"] = 0.11,
		["where"] = "Market",
		["effects"] = {
			["angry"] = -0.41,
			["tense"] = -0.7,
			["mischievous"] = -0.23,
			["aetheric"] = 0.37,
			["amused"] = 0.17,
			["social"] = -0.17,
			["confident"] = -0.21,
		}
	},
	["mdance"] = {
		["slsh"] = "mdance",
		["type"] = "mischievous",
		["group"] = "black",
		["cost"] = 1.23,
		["weight"] = 41,
		["cd"] = 166,
		["last"] = 0,
		["channeled"] = true,
		["where"] = "The Hammer - Manderville Quests",
		["effects"] = {
			["playful"] = -2,
			["social"] = 2,
			["angry"] = -2,
			["flirty"] = -1
		},
	},
	["me"] = {
		["slsh"] = "me",
		["type"] = "amused",
		["group"] = "red",
		["defEmo"] = true,
		["cost"] = 1.6,
		["weight"] = 57,
		["cd"] = 166,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -1.5,
			["energized"] = -0.5,
			["tired"] = -1,
			["social"] = -3,
			["amused"] = 1,
			["sad"] = -2,
			["flippant"] = -3
		}
	},
	["mime"] = {
		["slsh"] = "mime",
		["type"] = "mischievous",
		["group"] = "black",
		["cost"] = 3.7,
		["weight"] = 57,
		["cd"] = 177,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -3.5,
			["amused"] = 1,
			["sad"] = -2,
			["flirty"] = 2,
			["aetheric"] = -7.77,
			["bored"] = -2,
			["flippant"] = -3
		},
		["where"] = "Online Store - Mogstation"
	},
	["mmambo"] = {
		["slsh"] = "mmambo",
		["type"] = "mischievous",
		["group"] = "black",
		["cost"] = 1.23,
		["weight"] = 41,
		["cd"] = 166,
		["last"] = 0,
		["channeled"] = true,
		["where"] = "Don't Do the Dewprism - Manderville Quests",
		["effects"] = {
			["playful"] = -2,
			["social"] = 2,
			["angry"] = -2,
			["flirty"] = -1
		},
	},
	["mogdance"] = {
		["slsh"] = "mogdance",
		["type"] = "amazed",
		["group"] = "yellow",
		["channeled"] = true,
		["cost"] = 1,
		["weight"] = 66,
		["cd"] = 120,
		["last"] = 0,
		["where"] = "Moogle Society Quests - Piecing Together the Past",
		["effects"] = {
			["energized"] = 0.25,
			["tired"] = -0.35,
			["sleepy"] = -0.45,
			["uncomfortable"] = -0.25,
			["social"] = -0.25,
			["sad"] = -0.2,
			["neutral"] = -0.5,
			["bored"] = -0.25,
			["impatient"] = -0.15,
			["amazed"] = -0.65,
			["amused"] = -0.25,
			["focused"] = -0.15
		}
	},
	["no"] = {
		["slsh"] = "no",
		["type"] = "anxious",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 51,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["dazed"] = -2.5,
			["embarrassed"] = -0.5,
			["flippant"] = 2
		}
	},
	["ohokaliy"] = {
		["slsh"] = "ohokaliy",
		["type"] = "social",
		["group"] = "white",
		["cost"] = 1,
		["weight"] = 31,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["responsible"] = -2.5,
		}
	},
	["overreact"] = {
		["slsh"] = "overreact",
		["type"] = "anxious",
		["group"] = "black",
		["cost"] = 4.3,
		["weight"] = 43,
		["cd"] = 120,
		["last"] = 0,
		["where"] = "Make it Rain 2025",
		["effects"] = {
			["dazed"] = -3.7,
			["scared"] = -3.3,
			["embarrassed"] = -4.1,
			["surprised"] = -2.3,
			["tense"] = -1.7,
		}
	},
	["paintblack"] = {
		["slsh"] = "pantblack",
		["type"] = "black",
		["group"] = "paintbrush",
		["cost"] = 7,
		["weight"] = 37,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -5
		}
	},
	["paintblue"] = {
		["slsh"] = "paintblue",
		["type"] = "blue",
		["group"] = "paintbrush",
		["cost"] = 7,
		["weight"] = 33,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -5
		}
	},
	["paintred"] = {
		["slsh"] = "paintred",
		["type"] = "red",
		["group"] = "paintbrush",
		["cost"] = 7,
		["weight"] = 39,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -5
		}
	},
	["paintyellow"] = {
		["slsh"] = "paintyellow",
		["type"] = "yellow",
		["group"] = "paintbrush",
		["cost"] = 1,
		["weight"] = 41,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -5
		}
	},
	["panic"] = {
		["slsh"] = "panic",
		["type"] = "dazed",
		["group"] = "black",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 49,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -1.5,
			["energized"] = 2.5,
			["tired"] = -2,
			["social"] = -3,
			["focused"] = -5,
			["impatient"] = 2,
			["flippant"] = -3
		}
	},
	["pdead"] = {
		["slsh"] = "pdead",
		["type"] = "sleepy",
		["group"] = "blue",
		["channeled"] = true,
		["cd"] = 120,
		["weight"] = 51,
		["last"] = 0,
		["cost"] = 1.37,
		["effects"] = {
			["hungry"] = 0.23,
			["energized"] = 2.77,
			["tired"] = -1.65,
			["uncomfortable"] = -0.75,
			["tense"] = -3,
		}
	},
	["pet"] = {
		["slsh"] = "pet",
		["type"] = "amused",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
	},
	["petals"] = {
		["slsh"] = "petals",
		["type"] = "playful",
		["group"] = "red",
		["cd"] = 120,
		["last"] = 0,
		["cost"] = 3.69,
		["weight"] = 59,
		["effects"] = {
			["playful"] = -1,
			["social"] = -1,
			["uncomfortable"] = -1,
			["anxious"] = -1,
			["confident"] = 1,
			["flirty"] = 1
		},
		["where"] = "Mogstation"
	},
	["photograph"] = {
		["slsh"] = "photograph",
		["type"] = "nosey",
		["group"] = "black",
		["cost"] = 1.66,
		["weight"] = 45,
		["cd"] = 157,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["sad"] = -1,
			["anxious"] = 0.25,
			["social"] = -3,
			["confident"] = -2,
			["amused"] = 1,
			["playful"] = 1,
			["mischievous"] = 1,
			["neutral"] = -1,
			["nosey"] = -3,
			["aetheric"] = 0.5,
			["amazed"] = -1.5,
			["curious"] = -1.5,
			["flirty"] = -1.5,
			["bathing"] = -1.5,
			["bored"] = -1.5,
			["energized"] = 1.5
		}
	},
	["pizza"] = {
		["slsh"] = "pizza",
		["type"] = "hungry",
		["group"] = "yellow",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -10,
			["energized"] = 7,
			["tired"] = -2,
			["uncomfortable"] = -3,
			["sleepy"] = -4,
			["happy"] = 2,
			["mischievous"] = 2,
			["playful"] = 2
		}
	},
	["point"] = {
		["slsh"] = "point",
		["type"] = "amused",
		["defEmo"] = true
	},
	["poke"] = {
		["slsh"] = "poke",
		["type"] = "amused",
		["defEmo"] = true
	},
	["pose"] = {
		["slsh"] = "pose",
		["type"] = "flirty",
		["group"] = "red",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -1.5,
			["energized"] = 0.5,
			["tired"] = 0.25,
			["uncomfortable"] = -0.25,
			["social"] = 2,
			["amused"] = -1,
			["focused"] = -2,
			["flirty"] = -2,
			["happy"] = 1,
			["flippant"] = -2,
			["dazed"] = 1
		}
	},
	["pray"] = {
		["slsh"] = "pray",
		["type"] = "amused",
		["defEmo"] = true
	},
	["psych"] = {
		["slsh"] = "psych",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 49,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["mischievous"] = -1.5,
			["energized"] = 0.5,
			["tired"] = 0.25,
			["uncomfortable"] = -0.25,
			["social"] = -1,
			["amused"] = -1,
			["amazed"] = -2,
			["flirty"] = -1,
			["happy"] = 1,
			["flippant"] = -2,
			["dazed"] = -3
		}
	},
	["pushups"] = {
		["slsh"] = "pushups",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["cost"] = 3.6,
		["weight"] = 47,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1.5,
			["hot"] = 2,
			["tired"] = -1,
			["uncomfortable"] = 0.75,
			["social"] = -1,
			["confident"] = 1
		}
	},
	["rage"] = {
		["slsh"] = "rage",
		["type"] = "angry",
		["group"] = "red",
		["cd"] = 60,
		["last"] = 0,
		["cost"] = 3.6,
		["weight"] = 47,
		["channeled"] = true,
		["where"] = "Moon Rabbit Gachas",
		["effects"] = {
			["dazed"] = 1,
			["tense"] = -1,
			["uncomfortable"] = -1,
			["happy"] = -1
		},
	},
	["rally"] = {
		["slsh"] = "rally",
		["type"] = "responsible",
		["group"] = "white",
		["cd"] = 144,
		["cost"] = 1.9,
		["last"] = 0,
		["weight"] = 51,
		["defEmo"] = true
	},
	["read"] = {
		["slsh"] = "read",
		["type"] = "focused",
		["group"] = "black",
		["defEmo"] = true,
		["cost"] = 1.9,
		["weight"] = 59,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["tired"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["social"] = -1
		}
	},
	["reference"] = {
		["slsh"] = "reference",
		["type"] = "concerned",
		["group"] = "blue",
		["cost"] = 1,
		["weight"] = 57,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["curious"] = -1.23,
			["concerned"] = -1.11,
			["focused"] = -1,
			["anxious"] = -1,
			["responsible"] = 1,
		}
	},
	["riceball"] = {
		["slsh"] = "riceball",
		["type"] = "neutral",
		["group"] = "green",
		["cost"] = 1,
		["weight"] = 61,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = -10,
			["energized"] = 5,
			["tired"] = -4,
			["uncomfortable"] = -5,
			["sleepy"] = -5,
			["neutral"] = -3,
			["responsible"] = 2,
			["bored"] = -1
		}
	},
	["ritualprayer"] = {
		["slsh"] = "ritualprayer",
		["type"] = "focused",
		["group"] = "black",
		["cd"] = 234,
		["weight"] = 37,
		["last"] = 0,
		["cost"] = 0.37,
		["channeled"] = true,
		["where"] = "Shikitahe - Tamamizu (The Ruby Sea) - 3 Kojin Sango (Rank 8)",
		["effects"] = {
			["focused"] = -0.377,
			["tense"] = -0.13,
			["mischievous"] = -0.33,
			["responsible"] = 0.37,
			["social"] = -0.17,
		}
	},
	["sabotender"] = {
		["slsh"] = "sabotender",
		["type"] = "playful",
		["group"] = "red",
		["cost"] = 1.1,
		["weight"] = 44,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = 1.3,
			["tired"] = -1,
			["hot"] = 1,
			["social"] = -2,
			["sad"] = -2,
			["bored"] = -2,
			["amused"] = 1,
		}
	},
	["sad"] = {
		["slsh"] = "sad",
		["type"] = "sad",
		["group"] = "blue",
		["last"] = 0,
		["cd"] = 67,
		["weight"] = 51,
		["cost"] = 1,
		["defEmo"] = true,
		["effects"] = {
			["sad"] = -3,
			["tense"] = -1,
			["tense"] = -1,
			["nosey"] = 1.5,
			["aetheric"] = -1.5
		}
	},
	["salute"] = {
		["slsh"] = "salute",
		["type"] = "amused",
		["defEmo"] = true
	},
	["scheme"] = {
		["slsh"] = "scheme",
		["type"] = "mischievous",
		["group"] = "black",
		["channeled"] = true,
		["where"] = "Marketboard",
		["effects"] = {
			["angry"] = 0.15,
			["tense"] = -0.13,
			["mischievous"] = -0.33,
			["energized"] = 0.37,
			["amused"] = 0.17,
			["social"] = -0.17,
			["flirty"] = -0.15,
			["confident"] = -0.13
		}
	},
	["sdance"] = {
		["slsh"] = "sdance",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["cd"] = 169,
		["last"] = 0,
		["cost"] = 0.23,
		["weight"] = 59,
		["where"] = "Gold Saucer",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["amused"] = 0.15,
			["social"] = -0.75,
			["playful"] = -0.25
		}
	},
	["shakedrink"] = {
		["slsh"] = "shakedrink",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["cd"] = 120,
		["weight"] = 41,
		["last"] = 0,
		["cost"] = 1.37,
		["where"] = "Gold Saucer - 50,000 MGP",
		["effects"] = {
			["anxious"] = -3,
			["tense"] = -2,
			["uncomfortable"] = -1,
			["angry"] = -1,
			["playful"] = -1,
			["flirty"] = 1,
			["amused"] = -2
		}
	},
	["shiver"] = {
		["slsh"] = "shiver",
		["type"] = "cold",
		["group"] = "blue",
		["cost"] = 19,
		["weight"] = 31,
		["cd"] = 67,
		["last"] = 0,
		["effects"] = {
			["amused"] = -1,
			["social"] = -2,
			["energized"] = -1.11,
			["happy"] = -0.79,
			["cold"] = -1.41,
			["hot"] = 1.11
		},
		["where"] = "MB?"
	},
	["shocked"] = {
		["slsh"] = "shocked",
		["type"] = "surprised",
		["defEmo"] = true,
		["group"] = "yellow",
		["cost"] = 1,
		["weight"] = 61,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["energized"] = -2,
			["tired"] = -1,
			["uncomfortable"] = -0.75,
			["social"] = 1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["curious"] = 1,
			["nosey"] = 1
		}
	},
	["showleft"] = {
		["slsh"] = "showleft",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 49,
		["cd"] = 120,
		["last"] = 0,
		["channeled"] = true,
		["effects"] = {
			["mischievous"] = 0.25,
			["responsible"] = 0.27,
			["amused"] = -0.25,
			["uncomfortable"] = 0.15,
			["social"] = -0.5,
			["amazed"] = 0.77,
			["flirty"] = 0.15,
			["happy"] = 0.55,
			["flippant"] = -0.25,
			["dazed"] = -0.15
		}
	},
	["showright"] = {
		["slsh"] = "showright",
		["type"] = "amazed",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 49,
		["cd"] = 120,
		["last"] = 0,
		["channeled"] = true,
		["effects"] = {
			["playful"] = 0.25,
			["responsible"] = 0.27,
			["amazed"] = -0.25,
			["uncomfortable"] = 0.15,
			["social"] = -0.5,
			["amused"] = 0.77,
			["flirty"] = 0.15,
			["happy"] = 0.55,
			["energized"] = 0.17
		}
	},
	["shrug"] = {
		["slsh"] = "shrug",
		["type"] = "flippant",
		["group"] = "black",
		["defEmo"] = true,
		["last"] = 0,
		["cost"] = 0.77,
		["cd"] = 60,
		["effects"] = {
			["flippant"] = -1.369,
			["dazed"] = -1.11,
			["puzzled"] = -1,
			["bored"] = 1,
			["nosey"] = 1,
			["angry"] = 1
		}
	},
	["shush"] = {
		["slsh"] = "shush",
		["type"] = "anxious",
		["group"] = "black",
		["last"] = 0,
		["cost"] = 1.3,
		["cd"] = 71,
		["defEmo"] = true,
		["effects"] = {
			["focused"] = -1.369,
			["apathetic"] = -1.11,
			["social"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["nosey"] = 1,
			["angry"] = -1
		}
	},
	["sit"] = {
		["slsh"] = "sit",
		["type"] = "uncomfortable",
		["group"] = "blue",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1,
			["energized"] = 1,
			["tired"] = -2,
			["uncomfortable"] = -5,
			["social"] = 1,
			["happy"] = 1,
			["sleepy"] = 1,
			["neutral"] = -1,
			["tense"] = -1,
			["impatient"] = -2
		}
	},
	["situps"] = {
		["slsh"] = "situps",
		["type"] = "energized",
		["group"] = "yellow",
		["cost"] = 3.1,
		["weight"] = 37,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1.25,
			["energized"] = -4.5,
			["hot"] = 2,
			["tired"] = -2,
			["uncomfortable"] = 0.65,
			["social"] = -3,
			["sad"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["flirty"] = 1,
			["confident"] = 1
		}
	},
	["slap"] = {
		["slsh"] = "slap",
		["type"] = "angry",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 49,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["angry"] = -2,
			["tense"] = -1,
			["uncomfortable"] = -1,
			["social"] = 1
		},
	},
	["slump"] = {
		["slsh"] = "slump",
		["type"] = "amused",
		["group"] = "red",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["mischievous"] = -1.5,
			["cold"] = -1,
			["energized"] = -0.5,
			["tired"] = -0.15,
			["uncomfortable"] = -0.5,
			["social"] = -1,
			["amused"] = -1,
			["focused"] = -1,
			["flirty"] = -2,
			["happy"] = 0.25,
			["flippant"] = -1,
			["sad"] = -0.5
		}
	},
	["snap"] = {
		["slsh"] = "snap",
		["type"] = "aetheric",
		["group"] = "white",
		["cost"] = 11,
		["weight"] = 47,
		["cd"] = 17,
		["last"] = 0,
		["effects"] = {
			["confident"] = -0.7,
			["energized"] = -1.7,
			["mischievous"] = -1.7,
			["tired"] = -1,
			["sleepy"] = -1.7,
			["social"] = -1.7,
			["hungry"] = 17
		},
		["trait-effects"] = {
			["spriggan"] = {
				["aetheric"] = -7.77,
			},
		},
	},
	["songbird"] = {
		["slsh"] = "songbird",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 0.37,
		["weight"] = 57,
		["cd"] = 169,
		["last"] = 0,
		["channeled"] = true,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -0.25,
			["tense"] = -0.25,
			["uncomfortable"] = -0.15,
			["energized"] = -0.15,
			["aetheric"] = -1.69,
			["social"] = -0.75,
			["flirty"] = 0.25
		}
	},
	["soothe"] = {
		["slsh"] = "soothe",
		["type"] = "amused",
		["defEmo"] = true
	},
	["spectacles"] = {
		["slsh"] = "spectacles",
		["type"] = "red",
		["effects"] = {
			["amused"] = -1,
			["social"] = -2,
			["confident"] = -5,
			["happy"] = -2,
			["cold"] = 1
		}
	},
	["splash"] = {
		["slsh"] = "splash",
		["type"] = "bathing",
		["group"] = "green",
		["effects"] = {
			["anxious"] = -1,
			["tense"] = -2,
			["uncomfortable"] = -3,
			["angry"] = -3,
			["bathing"] = -3,
			["playful"] = -2,
			["flirty"] = 2,
			["confident"] = 1
		},
		["where"] = "Mogstation"
	},
	["spriggan"] = {
		["slsh"] = "useitem 36117",
		["type"] = "focused",
		["group"] = "black",
		["defEmo"] = true,
		["effects"] = {
			["energized"] = 3.69,
			["focused"] = 3.69,
			["aetheric"] = -1.11,
			["social"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["curious"] = 1,
			["playful"] = 1
		}
	},
	["squats"] = {
		["slsh"] = "squats",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["cost"] = 3,
		["weight"] = 57,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 1.5,
			["energized"] = -5,
			["tired"] = -1,
			["hot"] = 2,
			["uncomfortable"] = 0.75,
			["social"] = -3,
			["sad"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["amused"] = 1,
			["focused"] = 1
		}
	},
	["stagger"] = {
		["slsh"] = "stagger",
		["type"] = "amused",
		["defEmo"] = true
	},
	["stretch"] = {
		["slsh"] = "stretch",
		["type"] = "sleepy",
		["group"] = "blue",
		["defEmo"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 0.1,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -2,
			["sleepy"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["social"] = -1
		}
	},
	["study"] = {
		["slsh"] = "study",
		["type"] = "focused",
		["group"] = "black",
		["defEmo"] = true,
		["channeled"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 0.1,
			["energized"] = 1,
			["tired"] = -1,
			["uncomfortable"] = -2,
			["sleepy"] = -1,
			["neutral"] = -1,
			["bored"] = -1,
			["impatient"] = -1,
			["social"] = -1
		}
	},
	["sulk"] = {
		["slsh"] = "sulk",
		["type"] = "sad",
		["group"] = "blue",
		["cd"] = 120,
		["last"] = 0,
		["cost"] = 3.11,
		["weight"] = 59,
		["defEmo"] = true,
		["known"] = true,
		["effects"] = {
			["tense"] = -1.37,
			["dazed"] = -2.37,
			["uncomfortable"] = -0.15,
			["bored"] = -0.5,
		}
	},
	["sundance"] = {
		["slsh"] = "sundance",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 0.19,
			["energized"] = -0.39,
			["hot"] = 0.37,
			["tired"] = -0.11,
			["uncomfortable"] = -0.11,
			["social"] = -0.37,
			["sad"] = -0.37,
			["neutral"] = -0.11,
			["bored"] = -0.37,
			["impatient"] = -0.11,
			["flirty"] = 0.19,
			["confident"] = 0.19
		}
	},
	["surprised"] = {
		["slsh"] = "surprised",
		["type"] = "surprised",
		["group"] = "yellow",
		["defEmo"] = true,
		["last"] = 0,
		["cd"] = 59,
		["weight"] = 61,
		["cost"] = 1,
		["effects"] = {
			["surprised"] = -1.333,
			["playful"] = 0.21,
			["mischievous"] = 0.34,
		}
	},
	["sweat"] = {
		["slsh"] = "sweat",
		["type"] = "hot",
		["group"] = "red",
		["cost"] = 2.3,
		["weight"] = 57,
		["cd"] = 139,
		["last"] = 0,
		["channeled"] = true,
		["where"] = "Heaven on High",
		["effects"] = {
			["energized"] = -0.35,
			["amused"] = -1,
			["social"] = -0.75,
			["flirty"] = -0.35,
			["cold"] = 0.95,
			["wet"] = 0.35
		}
	},
	["sweep"] = {
		["slsh"] = "sweep",
		["type"] = "social",
		["group"] = "white",
		["cost"] = 0.13,
		["weight"] = 49,
		["cd"] = 139,
		["last"] = 0,
		["channeled"] = true,
		["where"] = "Marketboard or 1,800 Skybuilders' Scrips",
		["effects"] = {
			["playful"] = 0.17,
			["responsible"] = 0.37,
			["amazed"] = -0.25,
			["uncomfortable"] = 0.15,
			["social"] = -0.5,
			["flirty"] = 0.15,
			["energized"] = -0.17
		}
	},
	["tdance"] = {
		["slsh"] = "tdance",
		["type"] = "amused"
	},
	["tea"] = {
		["slsh"] = "tea",
		["type"] = "social",
		["group"] = "white",
		["cost"] = 3.6,
		["weight"] = 61,
		["cd"] = 169,
		["buff"] = "caffeinated",
		["last"] = 0,
		["where"] = "Mogstation",
		["effects"] = {
			["sleepy"] = -6.39,
			["tired"] = -3.69,
			["energized"] = 32.1,
			["social"] = -0.95,
			["flirty"] = -1.25,
			["hot"] = 0.45,
			["cold"] = -0.45
		}
	},
	["think"] = {
		["slsh"] = "think",
		["type"] = "focused",
		["defEmo"] = true,
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 59,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["focused"] = -2,
			["confident"] = -2,
			["curious"] = -1,
			["busy"] = -1,
			["puzzled"] = -1,
			["social"] = 1
		},
	},
	["thumbsup"] = {
		["slsh"] = "thumbsup",
		["type"] = "amused",
		["defEmo"] = true
	},
	["toast"] = {
		["slsh"] = "toast",
		["type"] = "social",
		["group"] = "white",
		["cost"] = 4.4,
		["weight"] = 44,
		["cd"] = 144,
		["last"] = 0,
		["where"] = "Mogstation",
		["channeled"] = true,
		["effects"] = {
			["mischievous"] = -2,
			["impatient"] = -2,
			["angry"] = -2,
			["playful"] = -1,
			["neutral"] = 1.4
		},
	},
	["tomescroll"] = {
		["slsh"] = "tomescroll",
		["type"] = "amused",
		["group"] = "red",
		["channeled"] = true,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = 0.45,
			["tense"] = 0.45,
			["uncomfortable"] = 0.45,
			["energized"] = 0.35,
			["amused"] = 2,
			["social"] = -2.75,
			["flirty"] = -1.25,
			["aetheric"] = 0.95,
			["busy"] = -1.75,
			["focused"] = -2.75
		}
	},
	["tomestone"] = {
		["slsh"] = "tomestone",
		["type"] = "amused",
		["group"] = "red",
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = 0.45,
			["tense"] = 0.45,
			["uncomfortable"] = 0.45,
			["energized"] = 0.35,
			["amused"] = 2,
			["social"] = -2.75,
			["flirty"] = -1.25,
			["aetheric"] = 0.95,
			["busy"] = -1.75,
			["focused"] = -2.75
		}
	},
	["throw"] = {
		["slsh"] = "throw",
		["type"] = "angry",
		["group"] = "red",
		["cd"] = 60,
		["last"] = 0,
		["effects"] = {
			["angry"] = -2,
			["tense"] = -1,
			["uncomfortable"] = -1
		}
	},
	["upset"] = {
		["slsh"] = "upset",
		["type"] = "amused",
		["effects"] = {
			["angry"] = -1,
			["tense"] = -1,
			["uncomfortable"] = -1
		},
		["defEmo"] = true
	},
	["vexed"] = {
		["slsh"] = "vexed",
		["type"] = "angry",
		["group"] = "red",
		["last"] = 0,
		["cd"] = 169,
		["where"] = "Mogstation",
		["effects"] = {
			["angry"] = -3,
		},
		["where"] = "Mogstation"
	},
	["victory"] = {
		["slsh"] = "victory",
		["type"] = "amused",
		["type"] = "responsible",
		["group"] = "white",
		["cd"] = 177,
		["cost"] = 1.9,
		["last"] = 0,
		["weight"] = 47,
		["defEmo"] = true,
		["effects"] = {
			["confident"] = 2,
			["embarrassed"] = -1,
			["playful"] = 1,
			["social"] = 3,
		},
	},
	["visage"] = {
		["slsh"] = "visage",
		["type"] = "amused",
		["group"] = "red",
		["cost"] = 0.37,
		["last"] = 0,
		["cd"] = 137,
		["where"] = "Cosmic Exploration Gacha",
		["effects"] = {
			["social"] = -2.75,
			["flirty"] = -1.25,
			["focused"] = -2.75
		}
	},
	["vpose"] = {
		["slsh"] = "vpose",
		["type"] = "confident",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["anxious"] = -3,
			["tense"] = -3,
			["uncomfortable"] = -2,
			["angry"] = -1,
			["energized"] = 1,
			["playful"] = -2,
			["flirty"] = 2,
			["confident"] = -2
		}
	},
	["vreveal"] = {
		["slsh"] = "vreveal",
		["type"] = "amused"
	},
	["waitforit"] = {
		["slsh"] = "waitforit",
		["type"] = "amused"
	},
	["water"] = {
		["slsh"] = "water",
		["type"] = "playful",
		["group"] = "red",
		["cost"] = 1,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["anxious"] = -3,
			["tense"] = -3,
			["uncomfortable"] = -2,
			["angry"] = -1,
			["energized"] = 1,
			["playful"] = -2,
			["flirty"] = 2,
			["confident"] = 1
		}
	},
	["waterflip"] = {
		["slsh"] = "waterflip",
		["type"] = "diving",
		["group"] = "green",
		["effects"] = {
			["anxious"] = -1,
			["tense"] = -2,
			["uncomfortable"] = -3,
			["diving"] = -3,
			["bathing"] = -3,
			["playful"] = -2,
			["flirty"] = 2,
			["confident"] = 1
		}
	},
	["waterfloat"] = {
		["slsh"] = "waterfloat",
		["type"] = "bathing",
		["group"] = "green",
		["defEmo"] = true,
		["effects"] = {
			["anxious"] = -3,
			["tense"] = -4,
			["uncomfortable"] = -5,
			["angry"] = -5,
			["bathing"] = -4,
			["sleepy"] = -2,
			["energized"] = -0.94,
			["aetheric"] = -1.3,
			["confident"] = 1
		}
	},
	["wave"] = {
		["slsh"] = "wave",
		["type"] = "responsible",
		["group"] = "white",
		["cd"] = 90,
		["cost"] = 0.9,
		["last"] = 0,
		["weight"] = 59,
		["defEmo"] = true,
		["effects"] = {
			["anxious"] = -1,
			["embarrassed"] = 1,
			["playful"] = 1,
			["social"] = 3,
		},
	},
	["welcome"] = {
		["slsh"] = "welcome",
		["type"] = "responsible",
		["group"] = "white",
		["cd"] = 90,
		["cost"] = 0.9,
		["last"] = 0,
		["weight"] = 59,
		["defEmo"] = true,
		["effects"] = {
			["anxious"] = -1,
			["embarrassed"] = 1,
			["playful"] = 1,
			["social"] = 3,
		},
		["defEmo"] = true
	},
	["wine"] = {
		["slsh"] = "wine",
		["type"] = "amused"
	},
	["wow"] = {
		["slsh"] = "wow",
		["type"] = "amazed",
		["group"] = "yellow",
		["cost"] = 0.777,
		["weight"] = 47,
		["last"] = 0,
		["cd"] = 111,
		["where"] = "Trisassant - Old Sharlayan - 9 Sil'dihn Potsherds",
		["effects"] = {
			["mischievous"] = -1.5,
			["responsible"] = -1.5,
			["tired"] = -0.25,
			["uncomfortable"] = -0.25,
			["social"] = -1,
			["amused"] = -1,
			["amazed"] = -2,
			["flirty"] = 1,
			["happy"] = 1,
			["flippant"] = -2,
			["dazed"] = -1
		}
	},
	["wringhands"] = {
		["slsh"] = "wringhands",
		["type"] = "tense",
		["group"] = "green",
		["cost"] = 3.6,
		["weight"] = 1,
		["cd"] = 120,
		["last"] = 0,
		["effects"] = {
			["tense"] = -2,
			["bathing"] = -1,
			["uncomfortable"] = -2,
			["flirty"] = -1,
			["scared"] = -1,
			["anxious"] = 2
		}
	},
	["yes"] = {
		["slsh"] = "yes",
		["type"] = "flippant",
		["group"] = "black",
		["cost"] = 1,
		["weight"] = 51,
		["cd"] = 120,
		["last"] = 0,
		["defEmo"] = true,
		["effects"] = {
			["playful"] = 0.25,
			["responsible"] = -0.27,
			["social"] = 0.25,
			["amused"] = 0.17,
			["flirty"] = 0.15,
			["flippant"] = -0.37
		}
	},
	["yoldance"] = {
		["slsh"] = "yoldance",
		["type"] = "energized",
		["group"] = "yellow",
		["channeled"] = true,
		["cost"] = 1.77,
		["weight"] = 51,
		["cd"] = 169,
		["last"] = 0,
		["effects"] = {
			["hungry"] = 0.19,
			["social"] = -0.37,
			["sad"] = -0.37,
			["bored"] = -0.37,
			["impatient"] = -0.11,
			["confident"] = 0.19
		}
	}
}

return {emote, emDex}
