local buff = {
	["caffeinated"] = {
		["token"] = {	   -- and not refresh the token
			["what"] = "Caffeinated", -- name of the token
			["G"] = true, -- sets token to global, otherwise buff is restricted to zone in which it was applied
			["boosts"] = { -- moods the token effects
				["sleepy"] = -17.77,
				["anxious"] = 2.34,
				["energized"] = 3.25,
				["hungry"] = -1.23
			},
			["method"] = "math.sin(X)*7.77", -- the boosted moods will be adjusted by this function
			["refresh"] = nil, -- set to true when a beacon is controlling it, when nil, the buff will fall off normally
			["interval"] = 9.63, -- boosts interval
			["stackLim"] = 5, -- stack limit
			["delayApply"] = 15, -- delays the application of the assigned moodle
			["stacks"] = 1, -- current stack number
			["drAdj"] = 77, -- diminishing returns adjustment applied for stacks (adj = math.log(drAdj,3)*stacks)
			["toast"] = "", -- toast message if there is one, when shown is controlled by delayApply
			["moodle"] = "Caffeinated", -- the name of the moodle to apply
			["falloff"] = 300.0, -- seconds until buff expires
			["type"] = "buff", -- type of the token
		}
	}
}

return buff