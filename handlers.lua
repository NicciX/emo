
local tokenStack = {}

function emoHandler(tbl, what, moodle, stacks, drAdj, method, falloff, firstcall, initialized)
	if filterLog["2"] then
		dbgMsg("ƒemoHandlerƒ", 2)
	end
	func_time["emoHandler"].ST = os.time()
	local tmp, adj, stp, X
	stacks = stacks or 0
	--dbgMsg("emoHandler: " .. type(tbl),1)
	dbgMsg("emoHandler: tbl length: " .. tostring(#tbl),3)
	dbgMsg("emoHandler: moodle:" .. tostring(moodle),3)
	dbgMsg("emoHandler: what:" .. tostring(what),3)
	dbgMsg("emoHandler: stacks:" .. tostring(stacks),3)
	dbgMsg("emoHandler: drAdj:" .. tostring(drAdj),3)
	for k,v in pairs(tbl) do
		
		dbgMsg("emoHandler: tbl length: k: " .. tostring(k),3)
		if emoState[k] and method then
			X = ((os.time() - initialized) / falloff) * (math.pi / 180)
			--dbgMsg("emoHandler: X: " .. tostring(X),1)
			--dbgMsg("emoHandler: method: " .. tostring(method),1)
			tmp = method
			tmp = string.gsub(tmp, "X", tostring(X))
			local func, oopsoo = load("return "..tmp)
			if func then
				funCoo = {pcall(func)}
			end
			if funCoo then
				tmp = funCoo[2]
				--dbgMsg("emoHandler: tmp: " .. tostring(tmp),1)
			else
				dbgMsg("emoHandler: invalid return value for tmp: " .. tostring(tmp),3)
				tmp = 1
			end
			--dbgMsg("emoHandler: v: " .. k .." :: " .. tostring(v),1)
			tmp = tonumber(tmp)
			--dbgMsg("emoHandler: tmp: " .. k .." :: " .. tostring(tmp),1)
			adj = math.log(drAdj,3)*stacks
			--adj = math.log(stacks*drAdj)
			dbgMsg("emoHandler: adj: " .. k .." :: " .. tostring(v * adj * tmp),3)
			EmoGyre(k, v * adj * tmp)
		elseif emoState[k] then
			drAdj = drAdj or 37
			adj = math.log(stacks*drAdj)
			dbgMsg("emoHandler: adj: " .. k .." :: " .. tostring(v*adj),3)
			EmoGyre(k, v * adj)
		else
			initPersona()
			dbgMsg("Warning: emotion not found - " .. tostring(k), 3)
		end
	end
	func_time["emoHandler"].END = os.time()
	func_track("emoHandler")
end

function JujuChurn(juju)

end


aspectAffinity = {
	[1] = { --
		["black"] = {
			["focused"] = 1,
		},
		["blue"] = {
			["scared"] = 3,
		},
		["red"] = {
			["angry"] = 1,
		},
		["yellow"] = {
			["surprised"] = 3,
		},
		["green"] = {
			["tense"] = 1,
			["uncomfortable"] = 1,
		},
		["white"] = {
			["neutral"] = 1,
		},
	},
	[2] = { --
		["black"] = {
			["apathetic"] = 2,
		},
		["blue"] = {
			["scared"] = 2,
		},
		["red"] = {
			["angry"] = 2,
		},
		["green"] = {
			["nosey"] = 3,
		},
		["white"] = {
			["neutral"] = 1,
			["responsible"] = 2,
		},
	},
	[3] = { --
		["black"] = {
			["disturbed"] = 3,
		},
		["blue"] = {
			["cold"] = 1,
		},
		["yellow"] = {
			["hungry"] = 2,
			["amazed"] = 1,
		},
		["green"] = {
			["refreshed"] = 1,
		},
		["white"] = {
			["confident"] = 3,
			["responsible"] = 3,
		},
	},
	[5] = { --
		["blue"] = {
			["sad"] = 3,
		},
		["green"] = {
			["refreshed"] = 3,
		},
		["white"] = {
			["social"] = 1,
		},
	},
	[7] = { --
		["black"] = {
			["dazed"] = 2,
		},
		["blue"] = {
			["cold"] = 2,
		},
		["red"] = {
			["flirty"] = 1,
		},
		["yellow"] = {
			["hungry"] = 1,
			["energized"] = 2,
		},
		["green"] = {
			["uncomfortable"] = 3,
			["refreshed"] = 3,
		},
		["white"] = {
			["playful"] = 1,
		},
	},
	[11] = { --
		["blue"] = {
			["sleepy"] = 1,
			["cold"] = 1,
		},
		["red"] = {
			["curious"] = 2,
		},
		["yellow"] = {
			["energized"] = 1,
		},
		["green"] = {
			["impatient"] = 1,
		},
		["white"] = {
			["happy"] = 3,
		},
	},
	[13] = { --
		["black"] = {
			["aetheric"] = 3,
		},
		["blue"] = {
			["sleepy"] = 2,
			["bored"] = 2,
		},
		["red"] = {
			["embarrassed"] = 1,
		},
		["green"] = {
			["tense"] = 2,
		},
		["white"] = {
			["neutral"] = 3,
			["happy"] = 2,
		},
	},
	[17] = { --
		["black"] = {
			["focused"] = 2,
			["apathetic"] = 3,
		},
		["blue"] = {
			["bored"] = 1,
			["scared"] = 1,
		},
		["red"] = {
			["angry"] = 3,
			["scared"] = 1,
		},
		["yellow"] = {
			["amazed"] = 2,
			["surprised"] = 2,
		},
		["green"] = {
			["tense"] = 3,
			["nosey"] = 2,
		},
		["white"] = {
			["responsible"] = 1,
		},
	},
	[19] = { --
		["black"] = {
			["apathetic"] = 1,
		},
		["red"] = {
			["flirty"] = 2,
			["amused"] = 2,
		},
		["yellow"] = {
			["hungry"] = 3,
		},
		["green"] = {
			["nosey"] = 1,
		},
		
	},
	[23] = { --
		["black"] = {
			["disturbed"] = 2,
		},
		["blue"] = {
			["sad"] = 2,
		},
		["blue"] = {
			["sad"] = 2,
		},
		["yellow"] = {
			["busy"] = 3,
		},
		["green"] = {
			["refreshed"] = 2,
		},
		["white"] = {
			["social"] = 2,
		},
	},
	[29] = { --
		["black"] = {
			["dazed"] = 3,
			["mischievous"] = 3,
		},
		["blue"] = {
			["cold"] = 3,
		},
		["red"] = {
			["curious"] = 1,
			["hot"] = 3,
		},
		["yellow"] = {
			["puzzled"] = 3,
		},
		["green"] = {
			["refreshed"] = 2,
		},
		["white"] = {
			["confident"] = 2,
		},
	},
	[31] = { --
		["black"] = {
			["dazed"] = 1,
		},
		["blue"] = {
			["sleepy"] = 2,
			["wet"] = 3,
		},
		["red"] = {
			["curious"] = 3,
		},
		["yellow"] = {
			["energized"] = 3,
		},
		["green"] = {
			["uncomfortable"] = 2,
			["impatient"] = 2,
		},
		["white"] = {
			["playful"] = 2,
		},
	},
	[37] = { --
		["black"] = {
			["focused"] = 3,
			["aetheric"] = 2,
		},
		["red"] = {
			["embarrassed"] = 2,
		},
		["yellow"] = {
			["surprised"] = 1,
		},
	},
	[41] = { --
		["black"] = {
			["aetheric"] = 1,
		},
		["blue"] = {
			["bored"] = 3,
		},
		["white"] = {
			["happy"] = 1,
		},
	},
	[43] = { --
		["black"] = {
			["amazed"] = 2,
		},
		["blue"] = {
			["bored"] = 2,
		},
		["yellow"] = {
			["amazed"] = 3,
		},
		["white"] = {
			["confident"] = 1,
			["social"] = 3,
		},
	},
	[47] = { --
		["black"] = {
			["disturbed"] = 3,
		},
		["blue"] = {
			["sad"] = 1,
		},
		["red"] = {
			["flirty"] = 3,
			["amused"] = 1,
		},
		["yellow"] = {
			["busy"] = 2,
		},
	},
	[53] = { --
		["black"] = {
			["mischievous"] = 2,
		},
		["blue"] = {
			["wet"] = 1,
		},
		["red"] = {
			["hot"] = 2,
		},
		["yellow"] = {
			["puzzled"] = 1,
		},
		["green"] = {
			["refreshed"] = 1,
		},
		["white"] = {
			["playful"] = 3,
		},
	},
	[59] = {
		["black"] = {
			["mischievous"] = 1,
		},
		["blue"] = {
			["sleepy"] = 3,
			["wet"] = 3,
		},
		["red"] = {
			["embarrassed"] = 3,
			["hot"] = 1,
		},
		["yellow"] = {
			["puzzled"] = 2,
			["busy"] = 1,
		},
	},
	


}
	
	
	--Black Moods
	
	---> 1, 2, 11, 13 <---
	
	--- Elementals: Earth - Ice ---
	 --[[1, 2, 11, 13, 31, 37]]--
	 
moods = {
	--- Elementals: Earth - Ice ---
	-- Black Moods --
	["focused"] = {"read", "tomestone", "reference", "ritualprayer", "flamedance", "examineself", "kneel", "earwiggle", "think"},
	["dazed"] = {"stagger", "vexed", "shocked", "panic", "no", "overreact", "clutchhead", "sulk", "shrug", "aback", "deny", "disappointed", "huh"},
	["mischievous"] = {"magictrick", "malevolence", "allsaintscharm", "mime", "scheme", "toast", "visage", "frighten", "mogdance", "ladance", "paintblack", "earwiggle", "pose", "sabotender", "snap"},
	["disturbed"] = {"panic", "deny", "shocked", "disappointed", "laugh", "ritualprayer", "overreact", "shush", "grovel", "no"},
	["apathetic"] = {"airquotes", "disappointed", "huh", "yes", "shrug", "elucidate", "facepalm"},
	["aetheric"] = {"deride", "clap", "snap", "flamedance", "malevolence", "mime", "throw"},
	
	--- Elementals: Ice - Water ---
	-- Blue Moods --
	["bored"] = {"doze", "huh", "magictrick", "read", "riceball", "malevolence", "sabotender", "sulk", "tomestone", "lookout"},
	["scared"] = {"shocked", "paintblue", "panic", "overreact", "upset", "pdead", "aback", "wringhands", "blush", "deny"},
	["sleepy"] = {"doze", "stretch", "lean", "sit", "pdead", "tea"},
	["sad"] = {"slump", "cry", "disappointed", "sulk"},
	["cold"] = {"shiver", "slump", "paintblue", "squats", "tea"},
	["grungy"] = {"blush", "dazed", "pdead", "frighten", "vexed", "examineself", "upset", "sweat", "sulk", "clutchhead"},
	
	--- Elementals; Earth - Fire ---
	-- Red Moods --
	["angry"] = {"furious", "deride", "vexed", "angry", "malevolence", "clutchhead", "rage", "slap", "throw", 
					"vexed", "fume", "frighten", "upset", "paintred", "box"},
	["embarrassed"] = {"blush", "deny", "huh", "overreact", "shrug", "grovel", "no"},
	["curious"] = {"lookout", "examineself", "greet", "read", "think", "reference", "photograph", "lean"},
	["hot"] = {"ladance", "sweat", "paintred", "bigfan"},
	["flirty"] = {"heart", "dote", "charmed", "blush", "shush", "ladance", "photograph", "blowkiss", "tea",
					"tdance", "songbird", "paintred", "pose", "twirl", "sabotender", "petals"},
	["amused"] = {"chuckle", "clap", "allsaintscharm", "visage", "showleft", "blowbubbles",
					"toast", "flamedance", "hum", "dance", "mime", "happy", "earwiggle", "lophop", "pose", "apple", 
					"visage", "tomestone", "sabotender", "bdance", "spectacles", "vreveal"},
	
	--- Elementals; Lightning - Fire ---
	-- Yellow Moods --
	["hungry"] = {"bread", "apple", "egg", "pizza", "cookie", "choco", "riceball", "tea", "toast"}, --Moved From Yellow
	["puzzled"] = {"think", "read", "panic", "shocked", "shrug", "mime"},
	["energized"] = {"lophop", "backflip", "cheer", "insist", "shakedrink", "blowbubbles", "twirl", "magictrick", "fist", "cheeron", "cheerjump", "sdance", "paintyellow", "squats", "pushups", "situps", "yoldance", "sabotender"},
	["busy"] = {"read", "reference", "think", "tomestone", "gcsalute"},
	["amazed"] = {"awe", "joy", "psych", "surprised", "wow", "mogdance", "blowbubbles", "showright", "photograph"},
	["surprised"] = {"aback", "shocked", "panic", "overreact", "surprised", "lookout"},
	
	
	--- Elementals; Wind - Water ---
	-- Green Moods --
	["tense"] = {"sweat", "upset", "wringhands", "bigfan", "overreact", "facepalm", "sulk", "no"},
	["uncomfortable"] = {"upset", "clutchhead", "deny", "paintblue", "paintyellow", "sit"},
	["impatient"] = {"beckon", "panic", "snap", "slump", "sweep", "insist", "elucidate", "sweat", "clutchhead", "wringhands", "disappointed"},
	["refreshed"] = {"splash", "waterfloat", "cheer", "photograph", "waterflip", "hum", "toast", "spectacles", "petals", "pose", "tea", "visage", "twirl", "psych", },
	["wet"] = {"shiver", "slump", "angry", "bigfan", "upset"},
	["nosey"] = {"lookout", "converse", "photograph", "read", "shush", "lean", "spectacles", "tea", "insist", "attend", "hum"},

	--- Elementals; Lightning - Wind ---
	-- White Moods --
	["happy"] = {"happy", "cheer", "clap", "chuckle", "dance", "twirl", "earwiggle", "hug", "songbird", "fistpump", "highfive", "joy","paintyellow"},
	["playful"] = {"magictrick", "lophop", "blowbubbles", "heart", "mime", "sdance", "twirl", "tdance", "pose", "gratuity", "hum", "sabotender", "petals", "vpose"},
	["confident"] = {"cheer", "paintblack", "photograph", "toast", "insist", "think", "lean", "visage", "heart", "scheme", "gratuity", "tea", "spectacles", "snap", "pose", "petals", "vpose"}, --Moved From Black
	["social"] = {"converse", "beesknees", "tea", "clap", "sweep", "songbird", "flamedance", "welcome", 
					"greet", "hum", "bombdance", "getfantasy", "shakedrink", "hug", "dote", "petals", "sabotender", "ohokaliy",
					"vpose", "tomestone", "photograph", "sdance", "blowbubbles", "toast", "visage", "fist", "bigfan", "reference", "paintblack", "spectacles"},
	["neutral"] = {"airquotes", "apple", "hum", "atease", "beckon", "riceball", "hum", "lean"},
	["responsible"] = {"bstance", "gcsalute","beckon", "bow", "ebow", "welcome", "soothe", "greet", "rally", "kneel", "sweep", "goodbye", "yes", "ohokaliy"}, --Moved From Black
}

Gyre = {	---	 -1-  -2- -3- -4- -5- -6-
	 ["black"] = {1,  13, 37, 41, 17, 2}, --1
	  ["blue"] = {2,  17, 41, 43, 19, 3}, --2
	   ["red"] = {1,  13, 37, 47, 23, 5}, --3
	["yellow"] = {11, 31, 59, 47, 23, 5}, --4
	 ["green"] = {7,  29, 53, 43, 19, 3}, --5
	 ["white"] = {11, 31, 59, 53, 29, 7} --6
}

GyreX = {	---	 -1-  -2- -3- -4- -5- -6-
	 ["black"] = {1,  13, 37, 41, 17, 2}, --1
	  ["blue"] = {2,  17, 41, 43, 19, 3}, --2
	   ["red"] = {1,  13, 37, 47, 23, 5}, --3
	["yellow"] = {11, 31, 59, 47, 23, 5}, --4
	 ["green"] = {7,  29, 53, 43, 19, 3}, --5
	 ["white"] = {11, 31, 59, 53, 29, 7} --6
}

GyreConduit = {	---	 -1-  -2- -3- -4- -5- -6-
	 ["black"] = 2,
	  ["blue"] = 3,
	   ["red"] = 5,
	["yellow"] = 5,
	 ["green"] = 3,
	 ["white"] = 7
}
		--	   A      =    B
gyreMethods = {
	["ccw_rot"] = { 
		[1] = {"white", 1, "green", 1},
		[2] = {"white", 2, "white", 1},
		[3] = {"white", 3, "white", 2},
		[4] = {"white", 4, "white", 3},
		[5] = {"white", 5, "white", 4},
		[6] = {"white", 6, "white", 5},
		[7] = {"green", 6, "white", 6},
		[8] = {"yellow", 6, "green", 6},
		[9] = {"red", 6, "yellow", 6},
		[10] = {"blue", 6, "red", 6},
		[11] = {"black", 6, "blue", 6},
		[12] = {"black", 5, "black", 6},
		[13] = {"black", 4, "black", 5},
		[14] = {"black", 3, "black", 4},
		[15] = {"black", 2, "black", 3},
		[16] = {"black", 1, "black", 2},
		[17] = {"blue", 1, "black", 1},
		[18] = {"red", 1, "blue", 1},
		[19] = {"yellow", 1, "red", 1},
		[20] = {"green", 1, "yellow", 1},
	},
	["cw_rot"] = { 
		[1] = {"green", 1, "white", 1},
		[2] = {"white", 1, "white", 2},
		[3] = {"white", 2, "white", 3},
		[4] = {"white", 3, "white", 4},
		[5] = {"white", 4, "white", 5},
		[6] = {"white", 5, "white", 6},
		[7] = {"white", 6, "green", 6},
		[8] = {"green", 6, "yellow", 6},
		[9] = {"yellow", 6, "red", 6},
		[10] = {"red", 6, "blue", 6},
		[11] = {"blue", 6, "black", 6},
		[12] = {"black", 6, "black", 5},
		[13] = {"black", 5, "black", 4},
		[14] = {"black", 4, "black", 3},
		[15] = {"black", 3, "black", 2},
		[16] = {"black", 2, "black", 1},
		[17] = {"black", 1, "blue", 1},
		[18] = {"blue", 1, "red", 1},
		[19] = {"red", 1, "yellow", 1},
		[20] = {"yellow", 1, "green", 1},
	},
	["N"] = {
		[1] = {"black", 1, "white", 6},
		[2] = {"blue", 1, "black", 1},
		[3] = {"red", 1, "blue", 1},
		[4] = {"yellow", 1, "red", 1},
		[5] = {"green", 1, "yellow", 1},
		[6] = {"white", 1, "green", 1},
		[7] = {"green", 2, "white", 1},
		[8] = {"yellow", 3, "green", 2},
		[9] = {"red", 4, "yellow", 3},
		[10] = {"blue", 5, "red", 4},
		[11] = {"black", 6, "blue", 5},
		[12] = {"blue", 6, "black", 6},
		[13] = {"red", 6, "blue", 6},
		[14] = {"yellow", 6, "red", 6},
		[15] = {"green", 6, "yellow", 6},
		[16] = {"white", 6, "green", 6},
	},
	["N-"] = {
		[1] = {"white", 6, "black", 1},
		[2] = {"green", 6, "white", 6},
		[3] = {"yellow", 6, "green", 6},
		[4] = {"red", 6, "yellow", 6},
		[5] = {"blue", 6, "red", 6},
		[6] = {"black", 6, "blue", 6},
		[7] = {"blue", 5, "black", 6},
		[8] = {"red", 4, "blue", 5},
		[9] = {"yellow", 3, "red", 4},
		[10] = {"green", 2, "yellow", 3},
		[11] = {"white", 1, "green", 2},
		[12] = {"green", 1, "white", 1},
		[13] = {"yellow", 1, "green", 1},
		[14] = {"red", 1, "yellow", 1},
		[15] = {"blue", 1, "red", 1},
		[16] = {"black", 1, "blue", 1},
	},
	["green-blue"] = {
		[1] = {"green", 1, "blue", 1},
		[2] = {"green", 2, "green", 1},
		[3] = {"green", 3, "green", 2},
		[4] = {"green", 4, "green", 3},
		[5] = {"green", 5, "green", 4},
		[6] = {"green", 6, "green", 5},
		[7] = {"yellow", 6, "green", 6},
		[8] = {"red", 6, "yellow", 6},
		[9] = {"blue", 6, "red", 6},
		[10] = {"blue", 5, "blue", 6},
		[11] = {"blue", 4, "blue", 5},
		[12] = {"blue", 3, "blue", 4},
		[13] = {"blue", 2, "blue", 3},
		[14] = {"blue", 1, "blue", 2},
	},
	["white-black"] = {
		[1] = {"white", 1, "black", 1},
		[2] = {"white", 2, "white", 1},
		[3] = {"white", 3, "white", 2},
		[4] = {"white", 4, "white", 3},
		[5] = {"white", 5, "white", 4},
		[6] = {"white", 6, "white", 5},
		[7] = {"green", 6, "white", 6},
		[8] = {"yellow", 6, "green", 6},
		[9] = {"red", 6, "yellow", 6},
		[10] = {"blue", 6, "red", 6},
		[11] = {"black", 6, "blue", 6},
		[12] = {"black", 5, "black", 6},
		[13] = {"black", 4, "black", 5},
		[14] = {"black", 3, "blue", 4},
		[15] = {"black", 2, "blue", 3},
		[16] = {"black", 1, "blue", 2},
	},
	["black-white"] = {
		[1] = {"black", 1, "white", 1},
		[2] = {"black", 2, "black", 1},
		[3] = {"black", 3, "black", 2},
		[4] = {"black", 4, "black", 3},
		[5] = {"black", 5, "black", 4},
		[6] = {"black", 6, "black", 5},
		[7] = {"blue", 6, "black", 6},
		[8] = {"red", 6, "blue", 6},
		[9] = {"yellow", 6, "red", 6},
		[10] = {"green", 6, "yellow", 6},
		[11] = {"white", 6, "green", 6},
		[12] = {"white", 5, "white", 6},
		[13] = {"white", 4, "white", 5},
		[14] = {"white", 3, "white", 4},
		[15] = {"white", 2, "white", 3},
		[16] = {"white", 1, "white", 2},
	},
	["blue-green"] = {
		[1] = {"blue", 1, "green", 1},
		[2] = {"blue", 2, "blue", 1},
		[3] = {"blue", 3, "blue", 2},
		[4] = {"blue", 4, "blue", 3},
		[5] = {"blue", 5, "blue", 4},
		[6] = {"blue", 6, "blue", 5},
		[7] = {"red", 6, "blue", 6},
		[8] = {"yellow", 6, "red", 6},
		[9] = {"green", 6, "yellow", 6},
		[10] = {"green", 5, "green", 6},
		[11] = {"green", 4, "green", 5},
		[12] = {"green", 3, "green", 4},
		[13] = {"green", 2, "green", 3},
		[14] = {"green", 1, "green", 2},
	},
	["yellow-red"] = {
		[1] = {"yellow", 1, "red", 1},
		[2] = {"yellow", 2, "yellow", 1},
		[3] = {"yellow", 3, "yellow", 2},
		[4] = {"yellow", 4, "yellow", 3},
		[5] = {"yellow", 5, "yellow", 4},
		[6] = {"yellow", 6, "yellow", 5},
		[7] = {"red", 6, "yellow", 6},
		[8] = {"red", 5, "red", 6},
		[9] = {"red", 4, "red", 5},
		[10] = {"red", 3, "red", 4},
		[11] = {"red", 2, "red", 3},
		[12] = {"red", 1, "red", 2},
	},
	["red-yellow"] = {
		[1] = {"red", 1, "yellow", 1},
		[2] = {"red", 2, "red", 1},
		[3] = {"red", 3, "red", 2},
		[4] = {"red", 4, "red", 3},
		[5] = {"red", 5, "red", 4},
		[6] = {"red", 6, "red", 5},
		[7] = {"yellow", 6, "red", 6},
		[8] = {"yellow", 5, "yellow", 6},
		[9] = {"yellow", 4, "yellow", 5},
		[10] = {"yellow", 3, "yellow", 4},
		[11] = {"yellow", 2, "yellow", 3},
		[12] = {"yellow", 1, "yellow", 2},
	},
	["cold-hot"] = {
		[1] = {"black", 3, "black", 4},
		[2] = {"blue", 3, "black", 3},
		[3] = {"blue", 2, "blue", 3},
		[4] = {"red", 2, "blue", 2},
		[5] = {"red", 3, "red", 2},
		[6] = {"red", 4, "yellow", 5},
		[7] = {"red", 5, "red", 4},
		[8] = {"blue", 5, "red", 5},
		[9] = {"blue", 4, "blue", 5},
		[10] = {"black", 4, "blue", 4},
		[11] = {"black", 3, "black", 4},
		[12] = {"blue", 3, "black", 3},
		[13] = {"blue", 2, "blue", 3},
		[14] = {"red", 2, "blue", 3},
		[15] = {"red", 3, "red", 2},
		[16] = {"yellow", 3, "red", 3},
		[17] = {"yellow", 2, "yellow", 3},
		[18] = {"green", 2, "yellow", 2},
		[19] = {"green", 3, "green", 2},
		[20] = {"white", 3, "green", 3},
	},
	["hot-cold"] = {
		[1] = {"white", 4, "white", 3},
		[2] = {"green", 4, "white", 4},
		[3] = {"green", 5, "green", 4},
		[4] = {"yellow", 5, "green", 4},
		[5] = {"yellow", 4, "yellow", 5},
		[6] = {"red", 4, "yellow", 5},
		[7] = {"red", 5, "red", 4},
		[8] = {"blue", 5, "red", 5},
		[9] = {"blue", 4, "blue", 5},
		[10] = {"black", 4, "blue", 4},
		[11] = {"black", 3, "black", 4},
		[12] = {"blue", 3, "black", 3},
		[13] = {"blue", 2, "blue", 3},
		[14] = {"red", 2, "blue", 3},
		[15] = {"red", 3, "red", 2},
		[16] = {"yellow", 3, "red", 3},
		[17] = {"yellow", 2, "yellow", 3},
		[18] = {"green", 2, "yellow", 2},
		[19] = {"green", 3, "green", 2},
		[20] = {"white", 3, "green", 3},
	},
}

--- ∵∴∵∴∵∴∵∴
--- ☂☂☂☂☂☂☂☂
---<Sandy> It's Raining Again!<---

aspectKeys = {"black", "blue", "red", "yellow", "green", "white"}

aspectList = {
	["black"] = {"focused", "dazed", "mischievous", "disturbed", "apathetic", "aetheric"},
	["blue"] = {"bored", "scared", "sleepy", "sad", "cold", "grungy"},
	["red"] = {"angry", "embarrassed", "curious", "hot", "flirty", "amused"},
	["yellow"] = {"hungry", "puzzled", "energized", "busy", "amazed", "surprised"},
	["green"] = {"tense", "uncomfortable", "impatient", "refreshed", "wet", "nosey"},
	["white"] = {"happy", "playful", "confident", "social", "neutral", "responsible"},
}

aspectTable = {
	["focused"] = "black",
	["dazed"] = "black",
	["mischievous"] = "black",
	["disturbed"] = "black",
	["apathetic"] = "black",
	["aetheric"] = "black",
	
	["bored"] = "blue",
	["scared"] = "blue",
	["sleepy"] = "blue",
	["sad"] = "blue",
	["cold"] = "blue",
	["grungy"] = "blue",

	["angry"] = "red",
	["embarrassed"] = "red",
	["curious"] = "red",
	["hot"] = "red",
	["flirty"] = "red",
	["amused"] = "red",
	
	["hungry"] = "yellow",
	["puzzled"] = "yellow",
	["energized"] = "yellow",
	["busy"] = "yellow",
	["amazed"] = "yellow",
	["surprised"] = "yellow",
	
	["tense"] = "green",
	["uncomfortable"] = "green",
	["impatient"] = "green",
	["refreshed"] = "green",
	["wet"] = "green",
	["nosey"] = "green",
	
	["happy"] = "white",
	["playful"] = "white",
	["confident"] = "white",
	["social"] = "white",
	["neutral"] = "white",
	["responsible"] = "white",
}

function dbgGyre(args)
	local s
	if args then
		if not validChn[args] then
			args = nil
		else
			args = args .. " "
		end
	end
	if args then
		Game.SendChat("/" .. args .. "⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻")
		Game.SendChat("/" .. args .. "        --------------") -- GYRE
		Game.SendChat("/" .. args .. "— — — — — — — — — — — — — — —")
	else
		dbgMsg("⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻-⁻", 13)
		dbgMsg("        --------------", 13) -- GYRE
		dbgMsg("— — — — — — — — — — — — — — —", 13)
	end
	
	for k,v in pairs(Gyre) do
		s=" A∫∫¥ ∴ " .. k .. " π"
		for i, j in ipairs(v) do
			s=s.." ("..tostring(j)..")"
		end
		if args then
			Game.SendChat("/" .. args .. s)
		else
			dbgMsg(s, 13)
		end
	end
	return true
end

--juju runGyreMethod("cw_rot")

function aspectPass(pm, asp, amt, emo)
	if filterLog["2"] then
		dbgMsg("ƒaspectPassƒ", 2)
	end
	func_time["aspectPass"].ST = os.time()
	local affA, aspAff, n 
	local boostA = 1
	
	if aspectAffinity[pm][aspectTable[emo]] then
		if aspectAffinity[pm][aspectTable[emo]][emo] then
			boostA = 1.377 * (4-aspectAffinity[pm][aspectTable[emo]][emo]) * 0.77
		end
	end
	
	if aspectAffinity[pm][asp] then
		aspAff = aspectAffinity[pm][asp]
		dbgMsg("updateAffinity.: idx IN -> " .. tostring(asp), 13)
		if type(aspAff) == "table" then
			for k,v in pairs(aspAff) do
				--if math.random(1, v*2) < 2.3 then
				n = amt / v * 0.61 * boostA
				if not emoState[k] then
					dbgMsg("aspectPass.: invalid emote: " .. tostring(k) .. " -> " .. tostring(n), 1)
				else
					emoState[k] = emoState[k] + n
					if emoState[k] < 0 then
						emoState[k] = 0
					end
					emoState[k] = reduce(emoState[k], 4)
					if emoState[k] < 0 then
						emoState[k] = 0
					end
					dbgMsg("aspectPass.: n: " .. k .. " -> " .. tostring(n), 13)
					dbgMsg("aspectPass.: boostA: " .. k .. " -> " .. tostring(boostA), 13)
				end
				--end
			end
		end
	end
	func_time["aspectPass"].END = os.time()
	func_track("aspectPass")
end

function updateAffinity(pmA, pmB, aspA, aspB, amt, emo)
	if filterLog["2"] then
		dbgMsg("ƒupdateAffinityƒ", 2)
	end
	func_time["updateAffinity"].ST = os.time()
		
	aspectPass(pmA, aspA, amt, emo)
	
	aspectPass(pmB, aspB, amt * -0.777, emo)
	
	emoState["aetheric"] = emoState["aetheric"] + amt * 0.369
	
	if emoState["aetheric"] < 0 then
		emoState["aetheric"] = 0
	end
	func_time["updateAffinity"].END = os.time()
	func_track("updateAffinity")
end

function runGyreMethod(mtd)
	if filterLog["2"] then
		dbgMsg("ƒrunGyreMethodƒ", 2)
	end
	func_time["runGyreMethod"].ST = os.time()
	
	if gyreMethods[mtd] then
		local tmpA = tcopy(Gyre)
			--GyreX = tableCopy(Gyre)
			--GyreX = tmpA
		--dbgMsg("runGyreMethod.: Gyre -> " .. tostring(Gyre), 1)
		--dbgMsg("runGyreMethod.: tmpA -> " .. tostring(tmpA), 1)
		dbgMsg("runGyreMethod.: method -> " .. tostring(mtd), 13)
		for k, v in pairs(gyreMethods[mtd]) do
			--dbgMsg("runGyreMethod.: k -> " .. tostring(k) .. " :: v.1 :: " .. tostring(v[1]) .. " :: v.2 :: " .. tostring(v[2]) .. " :: v.3 :: " .. tostring(v[3]) .. " :: v.4 :: " .. tostring(v[4]),1)
			Gyre[v[1]][v[2]] = tmpA[v[3]][v[4]]
		end
		--Gyre = tableCopy(GyreX)
	end
	dbgGyre()
	func_time["runGyreMethod"].END = os.time()
	func_track("runGyreMethod")
	return "Gyre method complete.."
end

function GyreCheck()
		--- Schmitt trigger for the Gyre - You're in the Hysteresis Zone now!
	if gYRo > 0 then
		gYRo = gYRo - 1
		if gYRo > 0 then
			return
		end
	end
	if playerTraits.aetheric then
		if Sys.Gyre and emoState.aetheric > 17777 then
			--~~
		elseif Sys.Gyre and emoState.aetheric > 7777 then
			dbgMsg("Your emotional energies return to a normal, although altered state...", 1)
			Sys.Gyre = nil
		elseif not Sys.Gyre and emoState.aetheric > 3777 then
			dbgMsg("Hysteric Aetheric energies have invoked the Emotional Gyre within you...", 1)
			Sys.Gyre = true
			--gYRo = 6
		elseif Sys.Gyre and emoState.aetheric < 2357 then -- prime || sum = 17
			dbgMsg("Your emotional energies return to a more normal state...", 1)
			Sys.Gyre = nil
		end
	elseif playerTraits.spriggan then
		if not Sys.Gyre and emoState.aetheric > 13777 then
			dbgMsg("Hysteric Aetheric energies have invoked the Emotional Gyre within you...", 1)
			Sys.Gyre = true
		elseif Sys.Gyre and emoState.aetheric < 7777 then -- prime || sum = 17
			dbgMsg("Your emotional energies return to a more normal state...", 1)
			Sys.Gyre = nil
		end
	elseif playerTraits.vixen then
		if not Sys.Gyre and emoState.aetheric > 7777 then
			dbgMsg("Hysteric Aetheric energies have invoked the Emotional Gyre within you...", 1)
			Sys.Gyre = true
		elseif Sys.Gyre and emoState.aetheric < 3777 then -- prime || sum = 17
			dbgMsg("Your emotional energies return to a more normal state...", 1)
			Sys.Gyre = nil
		end
	elseif playerTraits.muggle then
		Sys.Gyre = nil -- No Gyre for you muggle~~~
	else -- everyone else
		if not Sys.Gyre and emoState.aetheric > 4321 then
			dbgMsg("Hysteric Aetheric energies have invoked the Emotional Gyre within you...", 1)
			Sys.Gyre = true
		elseif Sys.Gyre and emoState.aetheric < 1234 then -- prime || sum = 17
			dbgMsg("Your emotional energies return to a more normal state...", 1)
			Sys.Gyre = nil
		end
	end
end



function ZoneTempFactor()
	--local zn = Game.Player.MapZone
	--local tmp, adj, r
	local eTime = Game.EorzeanTime.Hour
	local weather = Game.Weather.Name
	local warm = 0
	local adj
	local racial = 1
	local clmt = GetClimate()
	if clmt then
		if clmt.temp then
			if playerTraits.vixen then
				adj = reduce(math.log(validTemps[clmt.temp] + 1.39, 3.69) * 2.39, 3)
				warm = warm + adj
				dbgMsg("ZoneTempFactor (vixen) climate factor: " .. tostring(adj), 1)
			else
				warm = warm + validTemps[clmt.temp]
				dbgMsg("ZoneTempFactor climate factor: " .. tostring(validTemps[clmt.temp]), 1)
			end
		end
	end
	--warm = warm + reduce(OWF(), 3)--
	
	local nH = 1
	local nC = 1
	if eTime > 17 or eTime < 6 then
		nH = clmt.nighthot or 1
		nC = clmt.nightcold or 1
	end
	if IsSwimming then
		if playerTraits.vixen then
			warm = warm - (6.69 - validTemps[clmt.temp] * 3.69)
		elseif playerTraits.spriggan then
			warm = warm - (7.77 - validTemps[clmt.temp] * 4.44)
		else
			warm = warm - (7.11 - validTemps[clmt.temp] * 3.45)
		end
	end
	if weather_effects[weather] then
		if weather_effects[weather].neutral.temp then
			warm = warm * weather_effects[weather].neutral.temp
			dbgMsg("ZoneTempFactor weather influence: " .. tostring(weather_effects[weather].neutral.temp), 1)
		end
	end
	if playerSubRace == "Highlander" then
		racial = 0.81
	elseif playerRace == "Elezen" then
		racial = 1.17
	elseif playerSubRace == "Seeker of the Sun" then
		racial = 1.33
	end
	
	warm = reduce(warm * 0.47, 3)
	--cold = (7 - warm * nH) / 9
	cold = reduce(((6.7 * racial) - warm * nH) / (9 / nC), 3)
	return {["warm"] = warm, ["cold"] = cold, ["nH"] = nH, ["nC"] = nC}
end

function EnvironmentHandler()
	func_time["EnvironmentHandler"].ST = os.time()
	local eTime = Game.EorzeanTime.Hour
	local weather = Game.Weather.Name
	
	local adj, wa, ts
	local nH = 1
	local nC = 1
	local ice = 0
	local coldAdj = 1
	local wtI = 1
	local clmt = GetClimate()
	if not clmt then
		dbgMsg("꒱.EnvHdlr.꒱ missing map data for (" ..  tostring(Game.Player.MapZone) .. ").", 1)
		return
	end
	if not clmt.stm then
		dbgMsg("꒱.EnvHdlr.꒱ missing climate data for (" ..  tostring(Game.Player.MapZone) .. ").", 1)
		return
	end
	local humidity = 1
	local cold = 0
	local warm = seasonalAdjust * clmt.stm
	local CF = 0
	
	local gA = 0
	
	if OWF > 0 and OTF > 0 then
		--OWF(OWF, OTF) -- Feedback to normalize outfit wetness
	else
		--OWF()
	end
	--local otf, wet = table.unpack(OWF())
	DressedCheck()
	OutfitTempFactor()
	local otf, wet = OTF, OWF
	
	--wet = reduce(wet, 4)
	
	--otf = reduce(otf,4)
	
	if sysTrack.environment or sysTrack.weather or sysTrack.zone or sysTrack.EnvironmentHandler then
		dbgMsg("꒱.EnvHdlr.꒱ Base Climate Override ∫ " .. tostring(reduce(BCO, 4)), 5, {"EnvironmentHandler", "environment", "weather", "outfits"})
		dbgMsg("꒱.EnvHdlr.꒱ Base Humidity Override ∫ " .. tostring(reduce(BHO, 4)), 5, {"EnvironmentHandler", "environment", "weather", "outfits"})
		dbgMsg("꒱.EnvHdlr.꒱ seasonal factor ∫ " .. tostring(reduce(warm, 4)), 4, {"EnvironmentHandler", "environment", "weather", "outfits"})
	end
	--BCO = 0
	
	if clmt then
		if clmt.temp then
			CF = validTemps[clmt.temp]
		end
		if type(clmt.humidity) == "number" then
			humidity = clmt.humidity + BHO
		elseif clmt.humidity then
			if humidMult[clmt.humidity] then
				humidity = humidMult[clmt.humidity] + BHO
			end
		end
	end
	
	CF = CF + BCO
	--BCO = 0
	--BHO = 0
	
	if sysTrack.environment or sysTrack.weather or sysTrack.zone or sysTrack.EnvironmentHandler then
		dbgMsg("꒱.EnvHdlr.꒱ humidity ∫ " .. tostring(humidity), 3, {"EnvironmentHandler", "environment", "weather", "outfits"})
		dbgMsg("꒱.EnvHdlr.꒱ base climate factor ∫ " .. tostring(reduce(CF, 4)), 3, {"EnvironmentHandler", "environment", "weather", "outfits"})
	end
	
	if playerRace == "Miqo'te" then
		warm = reduce(warm - 0.21, 4)
		if sysTrack.environment or sysTrack.weather or sysTrack.zone or sysTrack.traits or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ (Miqo'te) climate adj π " .. tostring(warm), 5, {"EnvironmentHandler", "environment", "weather", "zone", "traits"})
		end
	elseif playerSubRace == "Highlander" then
		warm = reduce(warm + 0.27, 4)
		if sysTrack.environment or sysTrack.weather or sysTrack.zone or sysTrack.traits or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ (Highlander) climate adj π " .. tostring(warm), 5, {"EnvironmentHandler", "environment", "weather", "zone", "traits"})
		end
	end
	if playerTraits.vixen then
		CF = reduce(CF * 0.69) --reduce(math.log(validTemps[clmt.temp] + 1.39, 3.69) * 2.39, 3)
		--warm = warm + CF
		if sysTrack.environment or sysTrack.weather or sysTrack.zone or sysTrack.traits or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ (vi♥en) climate factor ∫ " .. tostring(CF), 5, {"EnvironmentHandler", "traits", "environment"})
		end
	elseif playerTraits.spriggan then -- 🦉
		CF = reduce(CF + -0.17 + Gyre.red[3] * 0.017, 4)
		--warm = warm + CF
		if sysTrack.environment or sysTrack.weather or sysTrack.zone or sysTrack.traits or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ (spri••an) climate factor ∫ " .. tostring(CF), 5, {"EnvironmentHandler", "traits", "environment"})
		end
	else
		--warm = warm + CF
		if sysTrack.environment or sysTrack.weather or sysTrack.zone or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ climate factor ∫ " .. tostring(CF), 2, {"EnvironmentHandler", "environment", "weather", "zone"})
		end
	end
	
	warm = reduce(warm + CF, 4)
	
	if sysTrack.environment or sysTrack.weather or sysTrack.zone or sysTrack.traits or sysTrack.EnvironmentHandler then
		dbgMsg("꒱.EnvHdlr.꒱ Warm + CF π " .. tostring(warm), 4, {"EnvironmentHandler", "environment", "weather", "zone"})
	end
	
	if eTime > 17 or eTime < 6 then
		nH = clmt.nighthot or 1
		nC = clmt.nightcold or 1
		if nC == 0 then
			nC = 0.1
		end
		if nH == 0 then
			nH = -0.1
		end
		warm = reduce(warm * nH, 4)
		if sysTrack.environment or sysTrack.weather or sysTrack.zones or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ Temp Adj for Nighttime ‰ " .. tostring(nH), 4, {"EnvironmentHandler", "environment", "weather", "zone"})
		end
	end
	
	if IsSwimming then
		if playerTraits.vixen then
			wa = ((0.69 + CF) * -0.39)
			--warm = warm - (6.69 - CF * 3.69)
		elseif playerTraits.spriggan then
			wa = (0.77 - CF * 1.44)
			--warm = warm - (7.77 - CF * 4.44)
		else
			wa = (0.77 - CF * 1.11)
			--warm = warm - (0.77 - CF * 1.11)
		end
		wa = reduce(wa, 4)
		
		if clmt.waterQuality then
			gA = reduce(emoState.grungy * clmt.waterQuality - emoState.grungy, 4)
			EmoGyre("grungy", gA)
		end
		--warm = reduce(warm, 4)
		if sysTrack.environment or sysTrack.weather or sysTrack.zones or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ Swimming adj grungy π " .. tostring(gA), 2, {"EnvironmentHandler", "environment", "weather", "zone"})
			dbgMsg("꒱.EnvHdlr.꒱ Adj for Swimming π " .. tostring(wa), 2, {"EnvironmentHandler", "environment", "weather", "zone"})
		end
	else
		wa = 0
		if clmt.grungy then
			EmoGyre("grungy", clmt.grungy)
		end
		--wa = (GetWet() / (sA + CF + 0.61)) * 0.037
	end
	
	if wa == 0 and humidity then
		if sysTrack.environment or sysTrack.weather or sysTrack.zones or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ Adj for humidity ‰ " .. tostring(reduce((1 - humidity) * warm, 4)), 4, {"EnvironmentHandler", "environment", "weather", "zone"})
		end
		warm = warm * humidity
	end
	
	warm = reduce(warm - wa, 4)
	
	
	
	if weather_effects[weather] then
		if weather_effects[weather].neutral.temp then
			wtI = weather_effects[weather].neutral.temp
			warm = reduce(warm * wtI, 4)
			if sysTrack.environment or sysTrack.weather or sysTrack.zones or sysTrack.EnvironmentHandler then
				dbgMsg("꒱.EnvHdlr.꒱ weather influence ‰ " .. tostring(wtI), 4, {"EnvironmentHandler", "weather", "environment", "zone"})
			end
		end
	else
		dbgMsg("꒱.EnvHdlr.꒱ weather check :: " .. tostring(weather_effects[weather]), 1)
	end
	
	if sysTrack.environment or sysTrack.weather or sysTrack.zones or sysTrack.EnvironmentHandler then
		dbgMsg("꒱.EnvHdlr.꒱ outfit wet factor ∫ " .. tostring(wet), 2, {"EnvironmentHandler", "weather", "environment", "zone"})
	end
	
	cold = reduce(((7.7 * coldAdj) - warm) / (9 / nC) + wet / 17, 3)
	if sysTrack.environment or sysTrack.weather or sysTrack.zones or sysTrack.EnvironmentHandler then
		dbgMsg("꒱.EnvHdlr.꒱ base hot ∫ " .. tostring(warm), 4, {"EnvironmentHandler", "weather", "environment", "zone"})
		dbgMsg("꒱.EnvHdlr.꒱ base cold ∫ " .. tostring(cold), 4, {"EnvironmentHandler", "environment", "weather", "zone"})
	end
		
	----
	
	if playerTraits.spriggan then
		warm = warm - 0.177
		r = math.random(1,77)
		if r >= 69 then
			adj = reduce(Gyre.black[4] * 0.01, 4)
			warm = warm * adj
			if sysTrack.environment or sysTrack.traits or sysTrack.EnvironmentHandler then
				dbgMsg("꒱.EnvHdlr.꒱ spriggan temp adjust ∫ " .. tostring(adj), 3, {"EnvironmentHandler", "traits", "environment"})
			end
			tmp = warm
			warm = cold
			cold = tmp + adj
		elseif r <= 17 + diff(emoState.hot, emoState.cold) then
			adj = reduce(Gyre.white[4] * 0.017, 4)
			if emoState.aetheric > adj * 777 then
				Relax("hot","cold",adj)
				EmoGyre("aetheric", adj * -77.7)
				if sysTrack.environment or sysTrack.traits or sysTrack.EnvironmentHandler then
					dbgMsg("꒱.EnvHdlr.꒱ spriggan temp relax ∫ " .. tostring(adj), 3, {"EnvironmentHandler", "traits", "environment"})
				end
				Moodle("-Aether", "apply", "self", "buffs", "default")
			elseif diff(emoState.hot, emoState.cold) > 17 then
				DoRandom("snap", "compelled by the temperature")
				EmoGyre("aetheric", 7.77)
			end
		end
	elseif playerTraits.vixen then
		if Game.Player.Equipped.Head.GlamName == "Tamamo Headband" then
			if sysTrack.environment or sysTrack.traits or sysTrack.EnvironmentHandler then
				dbgMsg("꒱.EnvHdlr.꒱ vixen cool from ears ∫ " .. tostring(reduce(cold + 0.69, 3)), 4, {"EnvironmentHandler", "traits", "environment"} )
			end
			cold = cold + 0.069
			--warm = warm - 0.13
		end
	elseif playerTraits.aetheric then
		cold = cold + 0.27
		warm = warm + 0.39
	else
		cold = cold + 0.21
		warm = warm - 0.19
	end
	
	warm = warm + otf
	
	cold = reduce(cold, 4)
	warm = reduce(warm * 0.97, 4)
	EmoGyre("hot", warm)
	EmoGyre("cold", cold)

	if sysTrack.environment or sysTrack.weather or sysTrack.outfits or sysTrack.EnvironmentHandler then
		dbgMsg("꒱.EnvHdlr.꒱ hot  set π " .. tostring(warm), 2, {"EnvironmentHandler", "environment", "outfits", "weather"})
		dbgMsg("꒱.EnvHdlr.꒱ cold set π " .. tostring(cold), 2, {"EnvironmentHandler", "environment", "outfits", "weather"})
		dbgMsg("꒱.EnvHdlr.꒱ outfit temp factor ∫ " .. tostring(otf), 1, {"EnvironmentHandler", "outfits", "environment", "weather"})
	end
	
	if playerTraits.vixen then
		optOtx = cold * 0.91 - emoState.hot * 0.047 + emoState.cold * 0.031 - (warm - otf)
		ts = reduce(cold * 0.69 - CF, 3)
		optOtx = optOtx + (ts - optOtx) / 3
		if sysTrack.environment or sysTrack.traits or sysTrack.outfits or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ base temp ∫ " .. tostring(ts), 3, {"EnvironmentHandler", "outfits", "environment", "traits"})
		end
	else
		optOtx = cold * 0.91 - emoState.hot * 0.047 + emoState.cold * 0.031 - (warm - otf)
		ts = reduce(cold * 0.91 - (warm - otf), 3)
		optOtx = optOtx + (ts - optOtx) / 3
		if sysTrack.environment or sysTrack.weather or sysTrack.outfits or sysTrack.EnvironmentHandler then
			dbgMsg("꒱.EnvHdlr.꒱ base temp ∫ " .. tostring(ts), 3, {"EnvironmentHandler", "outfits", "environment"})
		end
	end
	optOutfitTemp = reduce(optOtx + (optOutfitTemp - optOtx) / 6, 3)
	if sysTrack.environment or sysTrack.outfits or sysTrack.EnvironmentHandler then
		dbgMsg("꒱.EnvHdlr.꒱ optOutfitTemp ∫ " .. tostring(optOutfitTemp), 1, {"EnvironmentHandler", "outfits", "environment"})
	end
	--dbgMsg("doEnvironment  Overall Temp Shift: " .. tostring(ts), 4)
	
	if Game.Player.Equipped.Feet.ItemName == "" then
		if CD[playerName].traits["aetheric"] then
			EmoGyre("aetheric", -1.69)
		elseif CD[playerName].traits["spriggan"] then
			EmoGyre("aetheric", 0.777)
		else
			EmoGyre("aetheric", 0.139)
		end
		if emoState["aetheric"] < 0 then
			emoState["aetheric"] = 0
		end
	end

	tempComfortFactor = reduce(emoState.hot + emoState.cold, 2)
	
	if sysTrack.environment or sysTrack.outfits or sysTrack.EnvironmentHandler then
		dbgMsg("꒱.EnvHdlr.꒱ tempComfortFactor ∫ " .. tostring(tempComfortFactor), 4, {"EnvironmentHandler", "outfits", "environment"})
	end
	
	if (os.time() - lastDressCheck) > 111 - tempComfortFactor * 0.37 and not IsBusy then
		if not blockAutonomousActions and not safe and not pause then
			r = math.random(11,44)
			if playerTraits.vixen and tempComfortFactor > 69 then
				dbgMsg("Should I choose a more appropriate outfit?  " .. tostring(r), 1)
			elseif tempComfortFactor > 39 then
				dbgMsg("Should I choose a more appropriate outfit?  " .. tostring(r), 1)
			end
			if playerTraits.vixen and tempComfortFactor > r + 39 then
				DressBest()
			elseif tempComfortFactor > r + 13 then
				DressBest()
			end
			DressedCheck()
			OutfitTempFactor()
		elseif blockAutonomousActions or safe or pause then
			dbgMsg("EnvHdlr Autonomous Outfit Change blocked by security settings..", 1)
		end
	end
	func_time["EnvironmentHandler"].END = os.time()
	func_track("EnvironmentHandler")
end

function GyreLite(emo, amt)
	if filterLog["2"] then
		dbgMsg("ƒGyreLiteƒ", 2)
	end
	func_time["GyreLite"].ST = os.time()
	amt = amt or 0
	if playerTraits.moody then
		if moodAspect[emo] == domiMood then
			amt = amt + (amt * 0.37)
		end
	end
	if playerTraits.spriggan then
		if not emoState[emo] then
			dbgMsg("ƒGyreLiteƒ :: invalid emotional data :: " .. tostring(emo), 1)
			--break
		elseif emoState[emo] == math.floor(emoState[emo]) and emoState[emo] > 77 then
			
			local e = emoState[emo]
			local r
			
			if math.random(1,111) > 77 then
				doBijou("onibi")
				r = reduce(e + e * math.random() * 2.1, 4)
				--r = reduce(math.random() * 3.1 * e, 4)
				emoState[emo] = r
				dbgMsg("Gyre Powerful internal forces increase " .. emo .. " (" .. tostring(e) .. ") ‰ (" .. tostring(emoState[emo]) .. ").", 1)
				EmoGyre("refreshed", r * 0.711)
				OutfitEnvironmental(-0.477, -0.13)
			else
				doBijou("any")
				r = reduce(math.random() * e * 0.77, 4)
				emoState[emo] = r
				dbgMsg("Gyre Powerful internal forces reduce " .. emo .. " (" .. tostring(e) .. ") ‰ (" .. tostring(emoState[emo]) .. ").", 1)
				EmoGyre("grungy", math.abs(e-r) * 0.044)
			end
		end
	end
	--dbgMsg("ƒGyreLite: amt :: ƒ" .. tostring(amt), 1)
	emoState[emo] = emoState[emo] or 0
	emoState[emo] = emoState[emo] + amt
	if emoState[emo] < 0 then
		emoState[emo] = 0
	end
	emoState[emo] = reduce(emoState[emo], 4)
	if emoState[emo] < 0 then
		emoState[emo] = 0
	end
	func_time["GyreLite"].END = os.time()
	func_track("GyreLite")
end

function EmoGyre(emo, amt)
	if filterLog["2"] then
		dbgMsg("ƒEmoGyreƒ", 2)
	end
	func_time["EmoGyre"].ST = os.time()
	if not Sys.Gyre or not Sys.Emotions then
		if Sys.Emotions then
			GyreLite(emo, amt)
		end
		func_time["EmoGyre"].END = os.time()
		func_track("EmoGyre")
		return
	end
	
	--dbgMsg("EmoGyre.: [" .. emo .. "] IN -> " .. tostring(amt), 1)
	--dbgMsg("EmoGyre.: [atheric] (" .. tostring(emoState["atheric"]) .. ") expire -> " .. tostring(377), 1)
	emoState["aetheric"] = emoState["aetheric"] - 1.77 --should not drop below 3000
	if (os.time() - lastGyreEffect) > 13 then
		Moodle("-Aether", "apply", "self", "buffs", "default")
		lastGyreEffect = os.time()
	end
	
	
	--dbgMsg("EmoGyre.: [atheric] || (" .. tostring(emoState["atheric"]), 1)
	--dbgMsg("EmoGyre.: [atheric] expire -> " .. tostring(377), 1)
	
	amt = amt or 1
	amt = amt * 0.0177
	local out, outval
	local asp = aspectTable[emo]
	local sftA, sftB, sftC, sftD, sftE, sftF, aspAff
	local sn = sign(amt)
	
	if emo == "hungry" then
		dbgMsg("EmoGyre.: hungry IN -> " .. tostring(amt), 13)
		if sn == 1 then
			runGyreMethod("N")
		else
			runGyreMethod("N-")
		end
		sftA, sftB = Gyre["black"][1], Gyre["white"][6]
		sftC, sftD = math.max(sftA, sftB), math.min(sftA, sftB)
		sftE, sftF = Gyre["black"][6], emoState["hungry"]
		if sftD == sftC then
			emoState["hungry"] = emoState["hungry"] + (amt * (1 + sftB/61))
			emoState["sleepy"] = emoState["sleepy"] + (amt * (1 + sftE/53))
			emoState["energized"] = emoState["energized"] + sftE / (sftF + 13) * -amt * 0.33
		else
			emoState["energized"] = emoState["energized"] + (math.min(sftE, sftB) + -amt) * 0.13
			emoState["sleepy"] = emoState["sleepy"] + amt *  ((sftC - sftE) / 13)
			emoState["hungry"] = emoState["hungry"] + amt *  ((sftC - sftD) / sftC)
		end
	elseif emo == "aetheric" then
		-- causes the outer gyre to rotate CCW on a +amt and CW on -amt
		-- causes the inner gyre to swap diagonals regardless of amt
		-- amount of rotation is 1 regardless of the value of amt
		dbgMsg("EmoGyre.: aetheric IN -> " .. tostring(amt), 13)
		sftA = tcopy(Gyre)
		
		
		Gyre["red"][4] = sftA["yellow"][3]
		Gyre["yellow"][3] = sftA["red"][4]
		Gyre["red"][3] = sftA["yellow"][4]
		Gyre["yellow"][4] = sftA["red"][3]
		
		sftA, sftB, sftC, sftD = Gyre["red"][4], Gyre["yellow"][3], Gyre["red"][3], Gyre["yellow"][4]
		local n = (sftA + sftC) / (sftB + sftD)
		local aa = 1
		if playerTraits == "aetheric" then
			aa = 1.69 * sign(amt)
		end
		emoState["aetheric"] = emoState["aetheric"] + amt * n * aa
		dbgMsg("EmoGyre.: aetheric Gyre:Center :: -> " .. tostring(n), 13)
		
		
		if sn == 1 then
			runGyreMethod("ccw_rot")
		else
			runGyreMethod("cw_rot")
		end
	elseif emo == "energized" then
		-- causes the outer gyre to rotate CCW on a +amt and CW on -amt
		-- causes the inner gyre to swap diagonals regardless of amt
		-- amount of rotation is 1 regardless of the value of amt
		dbgMsg("EmoGyre.: aetheric IN -> " .. tostring(amt), 13)
		sftA = tcopy(Gyre)
		
		
		Gyre["yellow"][4] = sftA["red"][3]
		Gyre["red"][3] = sftA["yellow"][4]
		Gyre["yellow"][3] = sftA["red"][4]
		Gyre["red"][4] = sftA["yellow"][3]
		
		sftA, sftB, sftC, sftD = Gyre["yellow"][4], Gyre["red"][3], Gyre["yellow"][3], Gyre["red"][4]
		local n = (sftA + sftC) / (sftB + sftD)
		local aa = 1
		if playerTraits == "aetheric" then
			aa = 1.69 * sign(amt)
		end
		emoState["energized"] = emoState["energized"] + amt * n * aa
		dbgMsg("EmoGyre.: aetheric Gyre:Center :: -> " .. tostring(n), 13)
		
		
		if sn == 1 then
			runGyreMethod("cw_rot")
		else
			runGyreMethod("ccw_rot")
		end
	elseif asp == "cold" then
		if sn == 1 then
			runGyreMethod("cold-hot")
		else
			runGyreMethod("hot-cold")
		end
		sftA, sftB = Gyre["black"][3], Gyre["white"][4]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Black prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: White prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "black", "white", amt, emo)
		dbgMsg("EmoGyre.: Black: amt: -> " .. tostring(amt), 13)
	elseif asp == "hot" then
		if sn == 1 then
			runGyreMethod("hot-cold")
		else
			runGyreMethod("cold-hot")
		end
		sftA, sftB = Gyre["white"][4], Gyre["black"][3]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: White prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Black prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "white", "black", amt, emo)
		dbgMsg("EmoGyre.: White: amt: -> " .. tostring(amt), 13)
	elseif asp == "green" then
		if sn == 1 then
			runGyreMethod("green-blue")
		else
			runGyreMethod("blue-green")
		end
		sftA, sftB = Gyre["green"][1], Gyre["blue"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Green prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Blue prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "green", "blue", amt, emo)
		dbgMsg("EmoGyre.: Green: amt: -> " .. tostring(amt), 13)
	elseif asp == "blue" then
		if sn == 1 then
			runGyreMethod("blue-green")
		else			
			runGyreMethod("green-blue")
		end
		sftA, sftB = Gyre["blue"][1], Gyre["green"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Blue prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Green prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "blue", "green", amt, emo)
		dbgMsg("EmoGyre.: Blue: amt: -> " .. tostring(amt), 13)	
	elseif asp == "yellow" then
		if sn == 1 then
			runGyreMethod("yellow-red")
		else			
			runGyreMethod("red-yellow")
		end
		sftA, sftB = Gyre["yellow"][1], Gyre["red"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Yellow prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Red prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "yellow", "red", amt, emo)
		dbgMsg("EmoGyre.: Yellow: amt: -> " .. tostring(amt), 13)
	elseif asp == "red" then
		if sn == 1 then
			runGyreMethod("red-yellow")
		else			
			runGyreMethod("yellow-red")
		end
		sftA, sftB = Gyre["red"][1], Gyre["yellow"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Red prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Yellow prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "red", "yellow", amt, emo)
		dbgMsg("EmoGyre.: Red: amt: -> " .. tostring(amt), 13)
	elseif asp == "black" then
		if sn == 1 then
			runGyreMethod("black-white")
		else			
			runGyreMethod("white-black")
		end
		sftA, sftB = Gyre["black"][1], Gyre["white"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: Black prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: White prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "black", "white", amt, emo)
		dbgMsg("EmoGyre.: Black: amt: -> " .. tostring(amt), 13)
	elseif asp == "white" then
		if sn == 1 then
			runGyreMethod("white-black")
		else			
			runGyreMethod("black-white")
		end
		sftA, sftB = Gyre["white"][1], Gyre["black"][1]
		dbgMsg("EmoGyre.: " .. emo .. " IN -> " .. tostring(amt), 13)
		dbgMsg("EmoGyre.: White prime -> " .. tostring(sftA), 13)
		dbgMsg("EmoGyre.: Black prime -> " .. tostring(sftB), 13)
		updateAffinity(sftA, sftB, "white", "black", amt, emo)
		dbgMsg("EmoGyre.: White: amt: -> " .. tostring(amt), 13)
	end
	if emoState[emo] then -- paintbrushes and potentially other non emotes may get in otherwise
		if emoState[emo] < 0 then
			emoState[emo] = 0
		end
		--dbgMsg("EmoGyre.: Invalid Emote: emo: -> " .. tostring(emo), 1)
	end
	
	if playerTraits.aetheric then
		if emoState.energized > emoState.aetheric then
			local aeAdj = diff(emoState.energized, emoState.aetheric)
			if aeAdj > 169 then
				aeAdj = 169
			end
			if aeAdj > 3.7 then
				emoState.energized = emoState.energized - aeAdj
				emoState.aetheric = emoState.aetheric - aeAdj * 0.37
				if emoState.energized < 0 then
					emoState.energized = 0
				end
				if emoState.aetheric < 0 then
					emoState.aetheric = 0
				end
			end
		end
	end
	
	for k,v in pairs(GyreConduit) do
		GyreConduit[k] = Gyre[k][6]
	end
	emoState[emo] = reduce(emoState[emo], 4)
	func_time["EmoGyre"].END = os.time()
	func_track("EmoGyre")
end


function AetherHandler(charge, aspect, sender) -- deprecate aetheric/energized now handled by The Gyre
	if not Sys.Aether then
		return
	end
	if filterLog["2"] then
		dbgMsg("ƒAetherHandlerƒ", 2)
	end
	
	--return
	
	func_time["AetherHandler"].ST = os.time()
	--charge = charge * 0.001
	
	if not Sys.Gyre or not Sys.Emotions then
		if Sys.Emotions then
			GyreLite(aspect, charge)
		end
		func_time["AetherHandler"].END = os.time()
		func_track("AetherHandler")
		return
	else
		EmoGyre(aspect, charge)
	end

	
		
	func_time["AetherHandler"].END = os.time()
	func_track("AetherHandler")
	
	return
	
	
	--func_time["AetherHandler"].END = os.time()
	--func_track("AetherHandler")
end

function tokenHandler()
	if filterLog["2"] then
		dbgMsg("ƒtokenHandlerƒ", 2)
	end
	func_time["tokenHandler"].ST = os.time()
	local map = Game.Player.MapZone
	if not map then 
		func_time["tokenHandler"].END = os.time()
		func_track("tokenHandler")
		return
	end
	local tkS = tokenStack[map]
	local tk, tm, er, ret, test
	local doSt = 1
	
	tokenStack = tokenStack or {}
	
	if not tkS then
		tokenStack[map] = {}
		tkS = {}
	end
	
	while doSt < 3 do
		if tkS then
			for k,v in pairs(tkS) do
				tm = os.time()
				tk = v.token
				if not v.lastCall then
					tokenStack[map][k].lastCall = tm
					tokenStack[map][k].initialized = tm
					if tk.appRout then
						CallRoutine(tk.appRout, tk)
					end
				end
				if tm - v.lastCall > tk.interval then
					if tk.test and tk.func then
						er, ret = pcall(tk.func)
						if ret then
							dbgMsg("tokenStack: Test Check A", 3)
							test = true
						else
							test = nil
							dbgMsg("tokenStack: Test Check C", 3)
						end
					else
						test = true -- set test to nil or omit on token if test is not needed
					end
					if test then
						dbgMsg("tokenStack: tk.delayApply :: " .. tostring(tk.delayApply), 3)
						if tk.boosts then
							if tk.moodle and (tk.refresh or tk.delayApply) then
								if tk.delayApply then
									if (os.time() - v.firstCall) > tk.delayApply then
										Moodle(tk.moodle, "apply", "self", "buffs", "default")
										tokenStack[map][k].token.delayApply = nil
									end
								elseif tk.refresh then
									tk.refresh = tk.refresh - 1
									Moodle(tk.moodle, "apply", "self", "buffs", "default")
									tokenStack[map][k].firstCall = os.time()
									if tk.refresh < 1 then
										tokenStack[map][k].token.refresh = nil
									end
								else
									Moodle(tk.moodle, "apply", "self", "buffs", "default")
								end
							end
							
							dbgMsg("tokenStack: Test Passed Z.1 :: " .. tostring(tk.type), 3)
							emoHandler(tk.boosts, tk.type, tk.moodle, tk.stacks, tk.drAdj, tk.method, tk.falloff, v.firstCall, v.initialized )
						end
						if tk.type == "emote" then
							if tk.what then
								DoRandom(tk.what, "influenced by surroundings")
								--Game.SendChat("/" .. tk.what)
							end
						elseif tk.type == "routine" then
							dbgMsg("tokenHandler : Routine  :: " .. tostring(tk.what), 3)
							CallRoutine(tk.what,tk)
						elseif tk.type == "buff" then
							dbgMsg("tokenHandler : Buff  :: " .. tostring(tk.what), 1)
							if tk.moodle and (tk.refresh or tk.delayApply) then
								if tk.delayApply then
									if (os.time() - v.firstCall) > tk.delayApply then
										Moodle(tk.moodle, "apply", "self", "buffs", "default")
										tokenStack[map][k].firstCall = os.time()
										tokenStack[map][k].token.delayApply = nil
									end
								elseif tk.refresh then
									tk.refresh = tk.refresh - 1
									Moodle(tk.moodle, "apply", "self", "buffs", "default")
									tokenStack[map][k].firstCall = os.time()
									if tk.refresh < 1 then
										tokenStack[map][k].token.refresh = nil
									end
								else
									Moodle(tk.moodle, "apply", "self", "buffs", "default")
								end
							end
							if tk.toasted then
								if not tk.lastToast then
									dbgMsg("tokenHandler : delayToast  :: ", 3)
									tk.lastToast = os.time()
									tokenStack[map][k].token.lastToast = os.time()
								end
								if tk.toasted > 0 and os.time() - tk.lastToast > tk.toastWait then
									Game.Toast.Short(tk.toast)
									tokenStack[map][k].token.toasted = tk.toasted - 1
									tokenStack[map][k].token.lastToast = os.time()
								end
							end
						end
					end
					
					
					--[[if os.time() - v.firstCall > tk.falloff then
						dbgMsg("tokenHandler  :: Falloff" .. tostring(type(tk.type)), 3)
						Moodle(tk.what, "remove", "self", "buffs", "default")
						if tk.falloffRout then
							CallRoutine(tk.falloffRout)
						end
						tokenStack[map][k] = nil
					end]]--
					
					--
					tokenStack[map][k].lastCall = tm
				--
				end
				dbgMsg("tokenHandler  :: F:" .. tostring(tk.falloff), 3)
				dbgMsg("tokenHandler  :: t - fc:" .. tostring(os.time() - v.firstCall), 3)
				dbgMsg("tokenHandler  :: F - (t - fc):" .. tostring(tk.falloff - (os.time() - v.firstCall)), 3)
				if os.time() - v.firstCall > tk.falloff or v.remove then
					--if not v.initialized
					if tk.stacks then
						if tk.stacks > 1 then
							tokenStack[map][k].token.stacks = tokenStack[map][k].token.stacks - 1
							tokenStack[map][k].token.refresh = tokenStack[map][k].token.stacks
							--tokenStack[map][k].firstCall = os.time()
							--Moodle(tk.moodle, "apply", "self", "buffs", "default")
							dbgMsg("tokenHandler  :: stacks decrement -- " .. tostring(tokenStack[map][k].stacks), 3)
						else
							if tk.moodle then
								Moodle(tk.moodle, "remove", "self", "buffs", "default")
								dbgMsg("tokenHandler  :: Falloff -- " .. tostring(tk.what), 1)
								dbgMsg("tokenHandler  :: tk.moodle -- " .. tostring(tk.moodle), 1)
							end
							if tk.falloffRout then
								CallRoutine(tk.falloffRout)
							end
							
							lastBuff[k] = lastBuff[k] or {}
							lastBuff[k].count = lastBuff[k].count or 0
							lastBuff[k].count = lastBuff[k].count + 1
							lastBuff[k].tolerance = lastBuff[k].tolerance or 0
							if not v.initialized then
								v.initialized = os.time()
							end
							lastBuff[k].tolerance = lastBuff[k].tolerance + (os.time() - v.initialized)
							tokenStack[map][k] = nil
						end
					else
						dbgMsg("tokenHandler  :: Falloff -- " .. tostring(tk.what), 1)
						dbgMsg("tokenHandler  :: tk.moodle -- " .. tostring(tk.moodle), 1)
						if tk.moodle then
							dbgMsg("tokenHandler  :: Removing Moodle -- " .. tostring(tk.what), 1)
							Moodle(tk.moodle, "remove", "self", "buffs", "default")
						end
						if tk.falloffRout then
							CallRoutine(tk.falloffRout)
						end
						lastBuff[k] = lastBuff[k] or {}
						lastBuff[k].count = lastBuff[k].count or 0
						lastBuff[k].count = lastBuff[k].count + 1
						lastBuff[k].tolerance = lastBuff[k].tolerance or 0
						if not v.initialized then
								v.initialized = os.time()
						end
						lastBuff[k].tolerance = lastBuff[k].tolerance + (os.time() - v.initialized)
						tokenStack[map][k] = nil
					end
				end
				
				
				--if v.type == "emote" then
					--dbgMsg("tokenHandler  :: " .. tostring(type(k)), 1)
				--end
			end
		end
		if doSt == 1 then
			tkS = tokenStack["GEN"]
			map = "GEN"
		end
		doSt = doSt + 1
	end
	local lB = tcopy(lastBuff)
	for k,v in pairs(lB) do
		if lastBuff[k].tolerance > 7 then
			lastBuff[k].tolerance = lastBuff[k].tolerance - 0.177
			--lastBuff[k].tolerance = 0
		end
	end
	func_time["tokenHandler"].END = os.time()
	func_track("tokenHandler")
end

function UpdateStorageData() --deprecate
	if filterLog["2"] then
		dbgMsg("ƒUpdateStorageDatarƒ", 2)
	end
	local deprecate = true
	if deprecate then
		return
	end
	
	func_time["UpdateStorageData"].ST = os.time()
	local dX = 0
	playerName = Game.Player.Name
	CD[playerName] = CD[playerName] or {}
	if Script.Storage.emotions then
		if Script.Storage.emotions[playerName] then
			CD[playerName]["emotions"] = Script.Storage.emotions[playerName]
		else
			CD[playerName]["emotions"] = emoState
		end
	else
		CD[playerName]["emotions"] = emoState
	end
	if Script.Storage.all then
		CD["global"] = {}
		CD["global"]["dbg"] = Script.Storage.all["dbg"]
		CD[playerName]["updCnt"] = Script.Storage.base[playerName]["updCnt"]
		CD[playerName]["idles"] = Script.Storage.base[playerName]["idles"]
		CD[playerName]["collisions"] = Script.Storage.base[playerName]["collisions"]
		CD[playerName]["traits"] = Script.Storage.traits[playerName]
		CD[playerName]["quirks"] = Script.Storage.quirks[playerName]
		CD[playerName]["outfits"] = Script.Storage.outfits[playerName]
		CD[playerName]["currentOutfit"] = Script.Storage.currentOutfit[playerName] or {}
		CD[playerName]["profile"] = Script.Storage.profile[playerName]
		CD[playerName]["Tracking"] = Script.Storage.Tracking[playerName]
		CD[playerName]["emoGroups"] = Script.Storage.emoGroups[playerName]
		CD[playerName]["emoteTracker"] = Script.Storage.emoteTracker[playerName]
		CD[playerName]["playerGil"] = Script.Storage.playerGil[playerName]
		CD[playerName]["playerGilBuff"] = Script.Storage.playerGilBuff[playerName]
		
		--Script.Storage.profile[playerName] = Script.Storage.profile[playerName] or {}
		CD[playerName]["profile"]["race"] = Script.Storage.profile[playerName]["race"] or ""
		CD[playerName]["profile"]["subRace"] = Script.Storage.profile[playerName]["subRace"] or ""
		CD[playerName]["profile"]["guardian"] = Script.Storage.profile[playerName]["guardian"] or ""
		CD[playerName]["profile"]["city"] = Script.Storage.profile[playerName]["city"] or ""
		CD[playerName]["profile"]["rank"] = Script.Storage.profile[playerName]["rank"] or ""
		CD[playerName]["profile"]["gToken"] = Script.Storage.profile[playerName]["gToken"] or ""
		CD[playerName]["profile"]["nameday"] = Script.Storage.profile[playerName]["nameday"] or ""
		
		CD[playerName]["outfits"][currentOutfit]["job"] = Game.Player.Entity.Job.ShortName
		
		for k,v in pairs(Script.Storage.playerGil) do
			dX = dX + v
		end
		CD["global"]["totalGil"] = dX
	else
		CD["global"] = {}
		CD["global"]["dbg"] = {}
		CD[playerName]["updCnt"] = 0
		CD[playerName]["idles"] = 0
		CD[playerName]["collisions"] = 0
		CD[playerName]["traits"] = {}
		CD[playerName]["quirks"] = {}
		CD[playerName]["outfits"] = {}
		CD[playerName]["currentOutfit"] = {}
		CD[playerName]["profile"] = {}
		CD[playerName]["Tracking"] = {}
		CD[playerName]["emoGroups"] = {}
		CD[playerName]["emoteTracker"] = {}
		CD[playerName]["playerGil"] = 0
		CD[playerName]["playerGilBuff"] = 0
		
		--Script.Storage.profile[playerName] = Script.Storage.profile[playerName] or {}
		CD[playerName]["profile"]["race"] = ""
		CD[playerName]["profile"]["subRace"] = ""
		CD[playerName]["profile"]["guardian"] = ""
		CD[playerName]["profile"]["city"] = ""
		CD[playerName]["profile"]["rank"] = ""
		CD[playerName]["profile"]["gToken"] = ""
		CD[playerName]["profile"]["nameday"] = ""
		
		CD[playerName]["outfits"][currentOutfit] = {}
		CD[playerName]["outfits"][currentOutfit]["job"] = Game.Player.Entity.Job.ShortName
		
		CD["global"]["totalGil"] = 0
	end
	Script.Storage[playerName] = Script.Storage[playerName] or {}
	Script.Storage[playerName] = CD[playerName]
	CDHandler()
	func_time["tokenHandler"].END = os.time()
	func_track("tokenHandler")
end

return {emoHandler, tokenHandler, tokenStack, UpdateStorageData, AetherHandler, JujuChurn, Gyre, GyreConduit, aspectTable, EmoGyre, aspectAffinity, moods, dbgGyre, runGyreMethod, gyreMethods, updateAffinity, aspectPass, GyreLite, GyreCheck, EnvironmentHandler}