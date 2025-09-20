
local routines = {
	["NicciA"] = {
		[1] = {
			["do"] = "e EmoBot Starting Routine NicciA",
			["w"] = 1.000,
		},
	},
	["EatFood"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 5.000,
		},
		[2] = {
			["do"] = ".emo eat",
			["w"] = 1.000,
		},
	},
	
	["Follow"] = {
		[1] = {
			["do"] = "wait",
			["w"] = 0.350,
		},
		[2] = {
			["do"] = "follow",
			["w"] = 0.500,
		},
	},

	["honeybee"] = {
		[1] = {
			["do"] = "apple",
			["w"] = 1.234,
		},
		[2] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | FFFF00",
			["w"] = 0.333,
		},
		[3] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | CCCC00",
			["w"] = 0.333,
		},
		[4] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 888800",
			["w"] = 0.333,
		},
		[5] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 666600",
			["w"] = 0.333,
		},
		[6] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 333300",
			["w"] = 0.333,
		},
		[7] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 777700",
			["w"] = 0.333,
		},
		[8] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | 999900",
			["w"] = 0.333,
		},
		[9] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | BBBB00",
			["w"] = 0.333,
		},
		[10] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | DDDD00",
			["w"] = 0.333,
		},
		[11] = {
			["do"] = "honorific force set Honeybee | prefix | 1E0A0A | FFFF00",
			["w"] = 0.333,
		},
		[12] = {
			["do"] = "bow",
			["w"] = 6.330,
		},
		[13] = {
			["do"] = "useitem 20622",
			["w"] = 1.333,
		},
		[13] = {
			["do"] = "gratuity",
			["w"] = 1.234,
		},
		
	},
	
	["rainyday"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 1.234,
		},
		[2] = {
			["do"] = "fashion \"Raindrop Defense System\"",
			["w"] = 3.69,
		},
		[3] = {
			["do"] = "fc ∵∴∵∴∵∴∵∴",
			["w"] = 1.234,
		},
		[4] = {
			["do"] = "fc ☂☂☂☂☂☂☂☂",
			["w"] = 1.234,
		},
		[5] = {
			["do"] = "fc It's Raining Again...",
			["w"] = 1.234,
		},
	},
	
	["moonrabbitbase"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				--local map = Game.Player.Map
				if HasMoonZoom then
					return true
				end
			end,
			["do"] = "jmp",
			["jmp"] = 3,
			["w"] = 1.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			--["cond"] = ".^.^.",
			["do"] = "end",
			["w"] = 2.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function()
				--local map = Game.Player.Map
				if Game.Player.IsFemale then
					return true
				end
			end,
			["do"] = "jmp",
			["jmp"] = 6,
			["w"] = 1.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				DoToast("Sprinting not permitted in base Sir.")
			end,
			["w"] = 1.000,
		},
		[5] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "jmp",
			["jmp"] = 7,
			["w"] = 2.000,
		},
		[6] = {
			["run"] = true,
			["func"] = function() 
				DoToast("Sprinting not permitted in base Miss.")
			end,
			["w"] = 1.000,
		},
		[7] = {
			["do"] = "statusoff \"Stellar Sprint\"",
			["w"] = 1.000,
		},
	},

	["automove"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if Game.Player.Moving then
					return false
				else
					return true
				end
			end,
			["do"] = "jmp",
			["jmp"] = 3,
			["w"] = 0.01,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 0.250,
		},
		[3] = {
			["do"] = "automove",
			["w"] = 0.015,
		},
		[4] = {
			["do"] = "sheathe motion",
			["w"] = 0.015,
		},
		[5] = {
			["do"] = "gaction sprint",
			["w"] = 0.15,
		},
		[6] = {
			["run"] = true,
			["func"] = function() 
				EmoGyre("aetheric", -37)
				EmoGyre("energized", -67)
			end,
			["w"] = 0.15,
		},
		
	
	},

	["washbasin"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if tardis(true) < 1 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function() 
				GotoRelativePosition(tarvec(), -87, 0.625, Game.Player.Target.RotationDegrees)
			end,
			["w"] = 3.11,
		},
		[3] = {
			["do"] = "jmp",
			["jmp"] = 1,
			["w"] = 1.11,
		},
		[4] = {
			["do"] = "facetarget",
			["w"] = 1.11,
		},
		[5] = {
			["do"] = "pinteract",
			["w"] = 1.11,
		},
		[6] = {
			["do"] = "wringhands motion",
			["w"] = 5.11,
		},
		[7] = {
			["run"] = true,
			["func"] = function() 
				EmoGyre("grungy", -377.77)
				EmoGyre("refreshed", 111)
			end,
			["w"] = 3.11,
		},
		[8] = {
			["test"] = true,
			["func"] = function()
				if emoState.grungy > 100 and (os.time() - routineStart) < 60 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 6,
			["w"] = 1.000,
		},
		[9] = {
			["do"] = "target Washbasin",
			["w"] = 1.11,
		},
		[10] = {
			["do"] = "pinteract",
			["w"] = 1.11,
		},
		[11] = {
			["do"] = "clap motion",
			["w"] = 1.11,
		},
	},

	["shower"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if tardis(true) < 1 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function() 
				MoveToTarget()
			end,
			["w"] = 1.11,
		},
		[3] = {
			["do"] = "jmp",
			["jmp"] = 1,
			["w"] = 1.11,
		},
		[4] = {
			["do"] = "pinteract",
			["w"] = 1.11,
		},
	},
	
	["cofferhelper"] = {
		[1] = {
			["do"] = "target Treasure Coffer",
			["w"] = 0.77,
		},
		[2] = {
			["do"] = "pinteract",
			["w"] = 0.77,
		},
		
	},
	
	["funANDgames"] = {
		[1] = {
			["run"] = true,
			["func"] = function()
				emoReact("playful", "inspired by the music")
			end,
			["w"] = 12.00,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				emoReact("mischievous", "compelled by the music")
			end,
			["w"] = 15.00,
		},
		[3] = {
			["run"] = true,
			["func"] = function()
				emoReact("playful", "inspired by the music")
			end,
			["w"] = 12.00,
		},
		[4] = {
			["run"] = true,
			["func"] = function()
				emoReact("mischievous", "compelled by the music")
			end,
			["w"] = 15.00,
		},
		[5] = {
			["run"] = true,
			["func"] = function()
				emoReact("playful", "inspired by the music")
			end,
			["w"] = 12.00,
		},
		[6] = {
			["run"] = true,
			["func"] = function()
				emoReact("mischievous", "compelled by the music")
			end,
			["w"] = 12.00,
		},
	
	},
	
	["laundry"] = {
		[1] = {
			["do"] = "pinteract",
			["w"] = 1.0,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				--local d = Game.Player.Target.RotationDegrees
				--Game.Player.SetRot(d+90)
				doRotate = 5
				rotStop = 90
			end,
			["w"] = 3.77,
		},
		[3] = {
			["test"] = true,
			["func"] = function()
				if rotStop then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 2,
			["w"] = 1.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function()
				rotStop = nil
				doRotate = OGF * 13
			end,
			["w"] = 3.00,
		},
		[5] = {
			["run"] = true,
			["func"] = function()
				if not playerTraits.muggle then
					OutfitEnvironmental(0.77, -0.27 - OWF * 0.17)
				else
					EmoGyre("grungy", -500)
					OutfitEnvironmental(0.60, -0.23)
				end
			end,
			["w"] = 3.00,
		},
		[6] = {
			["run"] = true,
			["func"] = function()
				--OutfitTempFactor()
				dbgMsg("∫.Laundry.∫ grungy π " .. tostring(reduce(OGF,4)), 0)
				dbgMsg("∫.Laundry.∫ wet π " .. tostring(reduce(OWF,4)), 0)
			end,
			["w"] = 3.00,
		},
		[7] = {
			["do"] = "target Purification Module",
			["w"] = 1.11,
		},
		[8] = {
			["test"] = true,
			["func"] = function()
				doRotate = nil
				if OGF > 0.0013 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.000,
		},
		[9] = {
			["do"] = "pinteract",
			["w"] = 1.0,
		},
		[10] = {
			["run"] = true,
			["func"] = function()
				doRotate = -3
				rotStop = 90
			end,
			["w"] = 4.77,
		},
		[11] = {
			["test"] = true,
			["func"] = function()
				rotStop = nil
				doRotate = nil
				if rotStop then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 10,
			["w"] = 1.000,
		},
		[12] = {
			["do"] = "target Purification Module",
			["w"] = 1.11,
		},
		[13] = {
			["do"] = "pinteract",
			["w"] = 1.0,
		},
		[14] = {
			["run"] = true,
			["func"] = function()
				doRotate = OWF * 17
			end,
			["w"] = 3.00,
		},
		[15] = {
			["run"] = true,
			["func"] = function()
				if not playerTraits.muggle then
					OutfitEnvironmental(-1.77, -0.11)
				else
					OutfitEnvironmental(-0.95, -0.09)
				end
			end,
			["w"] = 3.00,
		},
		[16] = {
			["run"] = true,
			["func"] = function()
				dbgMsg("∫.Laundry.∫ grungy π " .. tostring(reduce(OGF,4)), 0)
				dbgMsg("∫.Laundry.∫ wet π " .. tostring(reduce(OWF,4)), 0)
			end,
			["w"] = 3.00,
		},
		[17] = {
			["run"] = true,
			["func"] = function()
				if CD[playerName].glamItemInfo.body.wet < 0.01 then
					RemoveItem("top")
				end
				EmoGyre("refreshed", OWF * 369)
			end,
			["w"] = 3.00,
		},
		[18] = {
			["run"] = true,
			["func"] = function()
				if CD[playerName].glamItemInfo.feet.wet < 0.01 then
					RemoveItem("shoes")
				end
				--RemoveItem("shoes")
			end,
			["w"] = 3.00,
		},
		[19] = {
			["run"] = true,
			["func"] = function()
				if CD[playerName].glamItemInfo.legs.wet < 0.01 then
					RemoveItem("pants")
				end
				--RemoveItem("pants")
				EmoGyre("grungy", OWF * -169)
			end,
			["w"] = 3.00,
		},
		
		[20] = {
			["run"] = true,
			["func"] = function()
				if CD[playerName].glamItemInfo.hands.wet < 0.01 then
					RemoveItem("gloves")
				end
				--RemoveItem("gloves")
			end,
			["w"] = 3.00,
		},
		[21] = {
			["test"] = true,
			["func"] = function()
				if OWF > 0.0013 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 12,
			["w"] = 1.000,
		},
		[22] = {
			["run"] = true,
			["func"] = function()
				doRotate = -2
				rotStop = 90
			end,
			["w"] = 3.77,
		},
		[23] = {
			["run"] = true,
			["func"] = function()
				OutfitLoad()
			end,
			["w"] = 3.77,
		},
		[24] = {
			["run"] = true,
			["func"] = function()
				doRotate = nil
				rotStop = nil
			end,
			["w"] = 1.00,
		},
		
	},
	
	["laundryX"] = {
		[1] = {
			["do"] = "pinteract",
			["w"] = 1.0,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				--local d = Game.Player.Target.RotationDegrees
				--Game.Player.SetRot(d+90)
				doRotate = 5
				rotStop = 90
			end,
			["w"] = 3.77,
		},
		[3] = {
			["test"] = true,
			["func"] = function()
				if rotStop then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 2,
			["w"] = 1.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function()
				rotStop = nil
				if not rotDir then
					rotDir = 1
				else
					rotDir = rotDir * -1
				end
				--dbgMsg("∫.Laundry.∫ ±doRotate π " .. tostring(dir), 0)
				doRotate = (3.3 - OGF) * 13 * rotDir
				dbgMsg("∫.Laundry.∫ ±doRotate π " .. tostring(doRotate), 0)
			end,
			["w"] = 1.00,
		},
		[5] = {
			["run"] = true,
			["func"] = function()
				if not playerTraits.muggle then
					OutfitEnvironmental(0.27, -0.17 - OWF * 0.07)
				else
					EmoGyre("grungy", -150)
					OutfitEnvironmental(0.29, -0.13)
				end
			end,
			["w"] = 1.00,
		},
		[6] = {
			["run"] = true,
			["func"] = function()
				--OutfitTempFactor()
				dbgMsg("∫.Laundry.∫ grungy π " .. tostring(reduce(OGF,4)), 0)
				dbgMsg("∫.Laundry.∫ wet π " .. tostring(reduce(OWF,4)), 0)
			end,
			["w"] = 0.50,
		},
		[7] = {
			["do"] = "target Purification Module",
			["w"] = 1.11,
		},
		[8] = {
			["test"] = true,
			["func"] = function()
				doRotate = nil
				if OGF > 0.0013 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.000,
		},
		[9] = {
			["do"] = "pinteract",
			["w"] = 1.0,
		},
		[10] = {
			["run"] = true,
			["func"] = function()
				doRotate = -3
				rotStop = 90
			end,
			["w"] = 4.77,
		},
		[11] = {
			["test"] = true,
			["func"] = function()
				rotStop = nil
				doRotate = nil
				if rotStop then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 10,
			["w"] = 1.000,
		},
		[12] = {
			["do"] = "target Purification Module",
			["w"] = 1.11,
		},
		[13] = {
			["do"] = "pinteract",
			["w"] = 1.0,
		},
		[14] = {
			["run"] = true,
			["func"] = function()
				doRotate = OWF * 17
			end,
			["w"] = 3.00,
		},
		[15] = {
			["run"] = true,
			["func"] = function()
				if not playerTraits.muggle then
					OutfitEnvironmental(-0.77, -0.11)
				else
					OutfitEnvironmental(-0.95, -0.09)
				end
			end,
			["w"] = 3.00,
		},
		[16] = {
			["run"] = true,
			["func"] = function()
				dbgMsg("∫.Laundry.∫ grungy π " .. tostring(reduce(OGF,4)), 0)
				dbgMsg("∫.Laundry.∫ wet π " .. tostring(reduce(OWF,4)), 0)
			end,
			["w"] = 3.00,
		},
		[17] = {
			["run"] = true,
			["func"] = function()
				local s = CD[playerName].outfits[currentOutfit].bodyGlam
				if CD[playerName].glamItemInfo[s].wet < 0.45 then
					CD[playerName].glamItemInfo[s].wet = 0
					RemoveItem("top")
				end
				EmoGyre("refreshed", OWF * 369)
			end,
			["w"] = 3.00,
		},
		[18] = {
			["run"] = true,
			["func"] = function()
				local s = CD[playerName].outfits[currentOutfit].feetGlam
				if CD[playerName].glamItemInfo[s].wet < 0.25 then
					CD[playerName].glamItemInfo[s].wet = 0
					RemoveItem("shoes")
				end
				--RemoveItem("shoes")
			end,
			["w"] = 3.00,
		},
		[19] = {
			["run"] = true,
			["func"] = function()
				local s = CD[playerName].outfits[currentOutfit].legsGlam
				if CD[playerName].glamItemInfo[s].wet < 0.35 then
					CD[playerName].glamItemInfo[s].wet = 0
					RemoveItem("pants")
				end
				--RemoveItem("pants")
				EmoGyre("grungy", OWF * -169)
			end,
			["w"] = 3.00,
		},
		
		[20] = {
			["run"] = true,
			["func"] = function()
				local s = CD[playerName].outfits[currentOutfit].handsGlam
				if CD[playerName].glamItemInfo[s].wet < 0.25 then
					CD[playerName].glamItemInfo[s].wet = 0
					RemoveItem("gloves")
				end
				--RemoveItem("gloves")
			end,
			["w"] = 3.00,
		},
		[21] = {
			["test"] = true,
			["func"] = function()
				if OWF > 0.0013 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 12,
			["w"] = 1.000,
		},
		[22] = {
			["run"] = true,
			["func"] = function()
				doRotate = -2
				rotStop = 90
			end,
			["w"] = 3.77,
		},
		[23] = {
			["run"] = true,
			["func"] = function()
				OutfitLoad()
			end,
			["w"] = 3.77,
		},
		[24] = {
			["run"] = true,
			["func"] = function()
				doRotate = nil
				rotStop = nil
			end,
			["w"] = 1.00,
		},
		
	},
	
	["leves"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if Game.Player.MapZone == 962 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.000,
		},
		[2] = {
			["do"] = "tp shar",
			["w"] = 13.11,
		},
		[3] = {
			["do"] = "jmp",
			["jmp"] = 1,
			["w"] = 3.11,
		},
		[4] = {
			["test"] = true,
			["func"] = function()
				if GetBeaconDistance("Leves") > 51 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 5,
			["else"] = 7,
			["w"] = 1.000,
		},
		[5] = {
			["do"] = "li Scholar's Harbor",
			["w"] = 9.11,
		},
		[6] = {
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.11,
		},
		[7] = {
			["run"] = true,
			["func"] = function() 
				MoveToBeacon("Leves")
			end,
			["w"] = 9.11,
		},
		[8] = {
			["test"] = true,
			["func"] = function()
				if Game.Player.Entity.Job.ShortName ~= "CUL" then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 9,
			["else"] = 14,
			["w"] = 1.11,
		},
		[9] = {
			["test"] = true,
			["func"] = function()
				if not FindJobOutfit("CUL") then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 10,
			["else"] = 12,
			["w"] = 1.11,
		},
		[10] = {
			["run"] = true,
			["func"] = function() 
				dbgMsg("No suitable outfit on record for Culinarian...", 0)
			end,
			["w"] = 1.11,
		},
		[11] = {
			["do"] = "end",
			["w"] = 1.77,
		},
		[12] = {
			["test"] = true,
			["func"] = function()
				if not FindJobOutfit("CUL") then
					return true
				else
					OutfitLoad(FindJobOutfit('CUL'))
				end
			end,
			["do"] = "jmp",
			["jmp"] = 10,
			["else"] = 8,
			["w"] = 1.11,
		},
		[13] = {
			["test"] = true,
			["func"] = function()
				if not FindJobOutfit("CUL") then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 10,
			["else"] = 12,
			["w"] = 1.11,
		},
		[14] = {
			["do"] = "chilledleves",
			["w"] = 1.77,
		},
		[15] = {
			["do"] = "chilledleves clear",
			["w"] = 0.77,
		},
		[16] = {
			["do"] = "chilledleves add 1647 30",
			["w"] = 1.77,
		},
		[17] = {
			["run"] = true,
			["func"] = function() 
				dbgMsg("You may proceed " .. appellation .. ".", 0)
			end,
			["w"] = 9.11,
		},
		
	},
	
	["pray"] = {
		[1] = {
			["do"] = "target <me>",
			["w"] = 2.11,
		},
		[2] = {
			["do"] = "useitem 2002400",
			["w"] = 3.3,
		},
		[3] = {
			["do"] = "target Shell",
			["w"] = 2.11,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("pray")
			end,
			["w"] = 3.000,
		},
	},
	
	["smoke-bomb"] = {
		[1] = {
			["do"] = "useitem 2002437", --acrid-smelling powder
			["w"] = 3.3,
		},
	},
	
	["ambergris"] = {
		[1] = {
			["do"] = "facetarget",
			["w"] = 1.11,
		},
		[2] = {
			["do"] = "useitem 2002405",
			["w"] = 1.11,
		},
	},
	
	["morbid-lore"] = {
		[1] = {
			["do"] = "think motion",
			["w"] = 3.11,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("It is in fashion amongst wealthy Ul'dahn merchants and nobles to bring morbol seedlings to banquets, so that the upper crust might inhale the seedkin's “boot-like” bad breath to induce vomiting, allowing them to engorge themselves for the duration of the gatherings.")
			end,
			["w"] = 1.11,
		},
	},
	
	["the-baconator"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("apple")
			end,
			["w"] = 3.600,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("A mysterious bipedal swine given away as a prize after it was discovered gorging itself in the Manderville Gold Saucer kitchens. Assuming he is not a real pig, many have tried poking, unmasking, and dispelling the portly pork's guise...but to no avail.")
			end,
			["w"] = 3.11,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("poke")
			end,
			["w"] = 7.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("allsaintscharm")
			end,
			["w"] = 3.000,
		},
	},
	
	["lecherous-purple"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("deny")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("One can only imagine the time and effort master goldsmith Godbert put into the creation of this lifelike recreation of a lecherous purple octopus.")
			end,
			["w"] = 2.11,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("disappointed")
			end,
			["w"] = 3.000,
		},
	},
	["magic-tears"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("spectacles")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("One of the most outlandish theories recently posed by scholars of the void is that ahrimans do not reproduce by typical sexual means, but rather by shedding tears which eventually grow into new creatures.")
			end,
			["w"] = 1.11,
		},
	},
	
	["onions"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("apple")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("Aw, bloody hells! Who's cuttin' onions back there!?")
			end,
			["w"] = 2.11,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("cry")
			end,
			["w"] = 3.000,
		},
	},
	
	["overstuffed-chicken"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("apple")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("It would be foolish to believe that a chocobo could achieve this size dining on greens alone, regardless of how many hundreds of bushels were devoured...in a single sitting. Chicken bones found beneath the chick's bedding suggest he may have a taste for his succulent cousins.")
			end,
			["w"] = 1.11,
		},
	},
	
	["calca"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("think")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				if math.random(1,100) > 44 then
					Game.SendChat("Upon realizing the Antitower would require several layers of defenses to keep out unwanted visitors, the spire's creator breathed life into several common dolls. Hairless at first, its maker adorned it with blonde locks, along with other aesthetically pleasing accessories.")
				else
					Game.SendChat("Adorable dolls! Terrible dolls! Yip-ho-ho! - Calcabrina")
				end	
			end,
			["w"] = 1.11,
		},
	},
	
	["brina"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("think")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				if math.random(1,100) > 44 then
					Game.SendChat("Tasked to defend the Antitower along with Calca, Brina scurried off to the safety of a treasure coffer after meeting defeat at the hands of adventurers. Impressed that anyone could uncover its hiding place, Brina decided to make itself a gift to the adventurer who found it.")
				else
					Game.SendChat("Adorable dolls! Terrible dolls! Yip-ho-ho! - Calcabrina")
				end	
			end,
			["w"] = 1.11,
		},
	},
	
	["goobbue-diet"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("apple")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("To achieve their cyclopean size, goobbues must maintain a daily diet of several times their own weight. Luckily, the beastkin are not finicky eaters, and will consume almost anything that cannot outrun them. If rumors are to be believed, this includes Lalafells.")
			end,
			["w"] = 1.11,
		},
	},
	
	["fat-cats-ahoy"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("apple")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("Born in an unmarked alley in an unnamed town, this poor creature had to hunt the mean streets just to stay alive...until learning that following retainers and feeding off the slaughter left in their wakes was a safer, easier way to a full belly.")
			end,
			["w"] = 4.11,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("pet")
			end,
			["w"] = 1.000,
		},
	},
	
	["vomit-lapper"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("sweep")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("Despite being found lapping up day-old vomit behind the Forgotten Knight, the air of nobility displayed by this pup as he rolled in the filth was proof enough of his royal bloodline, and before the night was through, an official pedigree was drawn up, changing Gestahl's life forever.")
			end,
			["w"] = 4.11,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("clap")
			end,
			["w"] = 1.000,
		},
	},
	
	["widowmaker"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("choco")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("Thanks to its voracious appetite, this young anteater has grown to a size to rival an adult Lalafell. Though appearing to otherwise be harmless, in certain parts its kind is said to prey on seasonal workers─and the men specifically─thus earning it the moniker of the Widowmaker.")
			end,
			["w"] = 4.11,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("kneel")
			end,
			["w"] = 1.000,
		},
	},
	
	["goldfinger"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("choco")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				if math.random(1,100) > 44 then
					Game.SendChat("Whether this creature is a beaver turned into gold, or gold turned into a beaver is anyone's guess. It is said to appear in the passages of Lyhe Ghiah at the very moment one's heart's desire is fulfilled. Given the location, that would generally involve some sort of treasure.")
				else
					Game.SendChat("No, anything but beavers! -  ")
				end
			end,
			["w"] = 4.11,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("gratuity")
			end,
			["w"] = 5.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("showleft")
			end,
			["w"] = 1.000,
		},
	},
	
	["giantfinger"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("blush")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				if math.random(1,100) > 44 then
					Game.SendChat("A mysterious being that appeared at Phisor Lran. Whatever may be the truth of its identity, some mysteries in the world are better left unsolved. Let it be enough that everyone has their heart's desire...")
				else
					Game.SendChat(" ")
				end
			end,
			["w"] = 4.11,
		},
		[3] = {
			["do"] = "useitem 12042",
			["w"] = 1.0,
		},
	},
	
	["young-entrepeneur"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("pen")
			end,
			["w"] = 3.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("In an attempt to secure funding for the financially strapped organization, the Crystal Braves treasurer took it upon himself to have three score thousand crafted and delivered to Rowena's House of Splendors for sale...where they have been collecting dust since...")
			end,
			["w"] = 4.11,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("deny")
			end,
			["w"] = 1.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function()
				Game.SendChat("Lies! Nothing but lies! It's more likely that Mr. Leveilleur, is yet another hapless victim of Khloe Aliapoh!")
			end,
			["w"] = 4.11,
		},
		[5] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("scheme")
			end,
			["w"] = 1.000,
		},
	},
	
	["SwimBot"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if not IsSwimming then
					return false
				else
					return true
				end
			end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 7.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				DressBest()
				DressedCheck()
				OutfitTempFactor()
				--MoveToBeacon("WaterExit")
				--GotoRelativePosition(tarvec(), -87, 0.625, Game.Player.Target.RotationDegrees)
			end,
			["w"] = 1.11,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 1.000,
		},
		[4] = {
			["test"] = true,
			["func"] = function()
				if os.time() > (swimTime or os.time()) then
					return false
				end
				if emoState.cold > 15 or (OGF == 0 and OWF > OTF) then
					return false
				end
				return true
			end,
			["do"] = "jmp",
			["jmp"] = 7,
			["w"] = 7.000,
		},
		[5] = {
			["run"] = true,
			["func"] = function()
				SwimHandler(true)
				--MoveToBeacon("WaterExit")
				--GotoRelativePosition(tarvec(), -87, 0.625, Game.Player.Target.RotationDegrees)
			end,
			["w"] = 3.11,
		},
		[6] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[7] = {
			["run"] = true,
			["func"] = function()
				SwimHandler()
				--MoveToBeacon("WaterExit")
				--GotoRelativePosition(tarvec(), -87, 0.625, Game.Player.Target.RotationDegrees)
			end,
			["w"] = 3.11,
		},
	},
	
	["phantomsurvey"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				Glean("survey")
			end,
			["w"] = 1.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function() 
				Game.SendChat("/pinteract")
			end,
			["w"] = 1.000,
		},
	},
	["cofferlocation"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				Glean("coffer")
			end,
			["w"] = 1.000,
		},
		[2] = {
			["run"] = true,
			["func"] = function() 
				Game.SendChat("/pinteract")
			end,
			["w"] = 1.000,
		},
	},
	["aetherstone"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				Glean("aetherstone")
			end,
			["w"] = 1.000,
		},
	},
	
	["underwear"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				OutfitLoad("")
			end,
			["w"] = 1.750,
		},
		[2] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("shirt")
			end,
			["w"] = 2.5,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("pants")
			end,
			["w"] = 2.5,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("gloves")
			end,
			["w"] = 1.5,
		},
		
	},
	
	["undress"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				Game.SendChat("/isort condition armoury ilv des")
				Game.SendChat("/isort execute armoury")
				Game.SendChat("/armoury")
			end,
			["w"] = 0.125,
		},
		[2] = {
			["run"] = true,
			["func"] = function() 
				Game.SendChat("/armoury")
			end,
			["w"] = 0.525,
		},
		[3] = {
			["test"] = true,
			["func"] = function()
				if playerTraits.vixen then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 5,
			["w"] = 0.525,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("hat")
			end,
			["w"] = 0.525,
		},
		[5] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("gloves")
			end,
			["w"] = 0.525,
		},
		[6] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("shoes")
			end,
			["w"] = 0.525,
		},
		[7] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("top")
			end,
			["w"] = 0.525,
		},
		[8] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("pants")
			end,
			["w"] = 0.525,
		},
		[9] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("earrings")
			end,
			["w"] = 0.525,
		},
		[10] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("necklace")
			end,
			["w"] = 0.525,
		},
		[11] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("lring")
			end,
			["w"] = 0.525,
		},
		[12] = {
			["run"] = true,
			["func"] = function() 
				RemoveItem("rring")
			end,
			["w"] = 0.525,
		},
		[13] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("examineself")
			end,
			["w"] = 0.525,
		},
	},
	
	["SliceIsRightNPC"] = {
		[1] = {
			["do"] = "target \"Strangely Garbed Gentleman\"",
			["w"] = 1.234,
		},
		[2] = {
			["do"] = "pinteract",
			["w"] = 1.234,
		},
		--Strangely Garbed Gentleman
	
	},
	["WindBlowsNPC"] = {
		[1] = {
			["do"] = "target \"Supercilious Spellweaver\"",
			["w"] = 1.234,
		},
		[2] = {
			["do"] = "pinteract",
			["w"] = 1.234,
		},
		--Supercilious Spellweaver
	
	},
	["afk"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				--local map = Game.Player.Map
				if map then
					if beacons[map] then
						if beacons[map].beacon.afk then
							return true
						end
					end
				end
			end,
			["do"] = "jmp",
			["jmp"] = 3,
			["w"] = 1.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "No AFK spot for this map",
			["do"] = "end",
			["w"] = 2.000,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				MoveToBeacon("afk")
			end,
			["w"] = 1.000,
		},
		[4] = {
			["do"] = "noop",
			["w"] = 3.33,
		},
		[5] = {
			["test"] = true,
			["func"] = function()
				return IsMoving
			end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.000,
		},
		[6] = {
			["do"] = "sit",
			["w"] = 1.234,
		},
		[7] = {
			["do"] = "afk",
			["w"] = 1.234,
		},
		[8] = {
			["run"] = true,
			["func"] = function() 
				return true
			end,
			["w"] = 1.000,
		},
	},
	
	["jujububble"] = {
		[1] = {
			["do"] = "target Purification Module",
			["w"] = 1.0,
		},
		[2] = {
			["do"] = "pinteract",
			["w"] = 1.0,
		},
		[3] = {
			["do"] = "surprised motion",
			["w"] = 7.0,
		},
		[4] = {
			["run"] = true,
			["func"] = function()
				doRotate = math.random(-9,9)
			end,
			["w"] = 30.00,
		},
		[5] = {
			["run"] = true,
			["func"] = function()
				doRotate = nil
			end,
			["w"] = 3.00,
		},
		[6] = {
			["do"] = "tomestone motion",
			["w"] = 7.0,
		},
		[7] = {
			["do"] = "songbird motion",
			["w"] = 17.0,
		},
	},
	
	["mesmerized"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if playerTraits.spriggan and tardis(true) < 5 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 3,
			["w"] = 1.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function()
				local r = math.random(1,100)
				if r > 37 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 6,
			["w"] = 1.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("charmed")
			end,
			["w"] = 1.000,
		},
		[5] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[6] = {
			["test"] = true,
			["func"] = function()
				local r = math.random(1,100)
				if r > 37 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 9,
			["w"] = 1.000,
		},
		[7] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("dazed")
			end,
			["w"] = 1.000,
		},
		[8] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[9] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("surprised")
			end,
			["w"] = 1.000,
		},
	},
	
	["gacharage"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("angry")
			end,
			["w"] = 1.000,
		},
	},
	
	["frazzle"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				Frazzle()
			end,
			["w"] = 1.000,
		},
	},
	
	["astonished"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if playerTraits.spriggan and tardis(true) < 11 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 3,
			["w"] = 1.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function()
				local r = math.random(1,100)
				if r > 37 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 6,
			["w"] = 1.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("shocked")
			end,
			["w"] = 1.000,
		},
		[5] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[6] = {
			["test"] = true,
			["func"] = function()
				local r = math.random(1,100)
				if r > 37 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 9,
			["w"] = 1.000,
		},
		[7] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("panic")
			end,
			["w"] = 1.000,
		},
		[8] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[9] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("surprised")
			end,
			["w"] = 1.000,
		},
	},
	
	["poppit"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if tardis(true) < 13 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 3,
			["w"] = 1.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function()
				local r = math.random(1,100)
				if r > 37 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 6,
			["w"] = 1.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("shocked")
			end,
			["w"] = 1.000,
		},
		[5] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[6] = {
			["test"] = true,
			["func"] = function()
				local r = math.random(1,100)
				if r > 37 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 9,
			["w"] = 1.000,
		},
		[7] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("panic")
			end,
			["w"] = 1.000,
		},
		[8] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[9] = {
			["run"] = true,
			["func"] = function() 
				DoRandom("aback")
			end,
			["w"] = 1.000,
		},
	},
	
	["babysharkgirl"] = {
		[1] = {
			["do"] = "targetpc",
			["w"] = 1.0,
		},
		[2] = {
			["test"] = true,
			["func"] = function()
				local t
				if (Game.Player.Target.IsNpc or Game.Player.Target.IsPlayer) and
					(Game.Player.Target.Name ~= _g.lastSharked) then
					t = true
				end
				return t
			end,
			["do"] = "jmp",
			["jmp"] = 7,
			["w"] = 1.000,
		},
		[3] = {
			["do"] = "targetpc",
			["w"] = 1.0,
		},
		[4] = {
			["test"] = true,
			["func"] = function()
				local t
				if (Game.Player.Target.IsNpc or Game.Player.Target.IsPlayer) and
					(Game.Player.Target.Name ~= _g.lastSharked) then
					t = true
				end
				return t
			end,
			["do"] = "jmp",
			["jmp"] = 7,
			["w"] = 1.000,
		},
		[5] = {
			["do"] = "shocked motion",
			["w"] = 1.0,
		},
		[6] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "No suitable target was found.",
			["do"] = "end",
			["w"] = 2.000,
		},
		[7] = {
			["do"] = "shocked motion",
			["w"] = 1.0,
		},
		[8] = {
			["do"] = "glamour apply BabySharkGirl | <t>",
			["w"] = 4.0,
		},
		[9] = {
			["run"] = true,
			["func"] = function()
				local s = Game.Player.Target.Name
				_g.sharked[s] = _g.sharked[s] or 0
				_g.sharked[s] = _g.sharked[s] + 1
				_g.lastSharked = s
			end,
			["w"] = 3.45,
		},
		[10] = {
			["do"] = "fc <t> has been sharked ^^^",
			["w"] = 1.11,
		},
		[11] = {
			["do"] = "target <me>",
			["w"] = 1.0,
		},
		[12] = {
			["do"] = "pdead motion",
			["w"] = 1.0,
		},
	},
	
	["redchairafk"] = {
		[1] = {
			["do"] = "wait",
			["w"] = 1.0,
		},
		[2] = {
			["do"] = "mount \"Archon Throne\"",
			["w"] = 5.0,
		},
		[3] = {
			["do"] = "wave motion",
			["w"] = 4.56,
		},
		[4] = {
			["do"] = "afk",
			["w"] = 3.45,
		},
		[5] = {
			["do"] = "lean",
			["w"] = 9.99,
		},
		[6] = {
			["do"] = "tomestone motion",
			["w"] = 11.111,
		},
		[7] = {
			["run"] = true,
			["func"] = function() 
				return true
			end,
			["do"] = "e afk",
			["w"] = 7.234,
		},
		[8] = {
			["run"] = true,
			["func"] = function()
				DoRandom("read")
			end,
			["w"] = 9.99,
		},
		[9] = {
			["run"] = true,
			["func"] = function()
				DoRandom("apple")
			end,
			["w"] = 7.77,
		},
		[10] = {
			["run"] = true,
			["func"] = function()
				SittingEffects()
			end,
			["w"] = 12.34,
		},
		[11] = {
			["test"] = true,
			["func"] = function()
					if IsAFK() then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 10,
			["w"] = 1.000,
		},
	},

	["sabotender"] = {
		[1] = {
			["do"] = "sabotender",
			["w"] = 5.750,
		},
		[2] = {
			["do"] = "clap",
			["w"] = 5.750,
		},
		[3] = {
			["do"] = "cheer",
			["w"] = 5.750,
		},
		
	},
	
	["GrabProfile"] = {
		[1] = {
			["test"] = true,
			["func"] = function() return true end,
			--["cond"] = "Update " .. Game.Player.Firstname .. "'s Profile?",
			["do"] = "confirm",
			["w"] = 3.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return confirm end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 5.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Perhaps later then",
			["do"] = "end",
			["w"] = 2.000,
		},
		[4] = {
			["do"] = "e EmoBot Please wait for the Character window to open",
			["w"] = 0.350,
		},
		[5] = {
			["do"] = "e EmoBot and insure that the Profile tab is selected",
			["w"] = 0.350,
		},
		[6] = {
			["do"] = "character",
			["w"] = 4.321,
		},
		[7] = {
			["do"] = "snd run EmoGrabProfile",
			["w"] = 9.999,
		},
		[8] = {
			["do"] = "character",
			["w"] = 1.350,
		},
	},
	
	["logout"] = {
		[1] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Log out <appellation>?",
			["do"] = "confirm",
			["w"] = 3.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return confirm end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 1.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "As you wish.",
			["do"] = "end",
			["w"] = 1.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				dbgMsg(".•.Saving Character Data.•.", 1)
			end,
			["w"] = 1.000,
		},
		[5] = {
			["run"] = true,
			["func"] = function() 
				CDUpdater()
			end,
			["w"] = 2.000,
		},
		[6] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Farewell <appellation>.",
			["do"] = "bow motion",
			["w"] = 1.000,
		},
		[7] = {
			["do"] = "logout",
			["w"] = 1.350,
		},
	},
	
	["gearUpdate"] = {
		[1] = {
			["do"] = "examineself motion",
			["w"] = 0.350,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Save this outfit?",
			["do"] = "confirm",
			["w"] = 3.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return confirm end,
			["do"] = "jmp",
			["jmp"] = 5,
			["w"] = 5.000,
		},
		[4] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Perhaps later then",
			["do"] = "end",
			["w"] = 2.000,
		},
		[5] = {
			["run"] = true,
			["func"] = function() 
				OutfitHandler("save gearupdate")
			end,
			["w"] = 1.000,
		},
		[6] = {
			["run"] = true,
			["func"] = function() 
				SetClimate()
			end,
			["w"] = 1.000,
		},
		[7] = {
			["test"] = true,
			["func"] = function()
				if currentClimate then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 9,
			["w"] = 2.000,
		},
		[8] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[9] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Set outfit for current climate?",
			["do"] = "confirm",
			["w"] = 5.000,
		},
		[10] = {
			["test"] = true,
			["func"] = function() return not confirm end,
			["do"] = "jmp",
			["jmp"] = 4,
			["w"] = 5.000,
		},
		[11] = {
			["run"] = true,
			["func"] = function()
				--local map = Game.Player.MapZone
				--local clm = zones[map].climate
				--Game.SendChat("/e map: " .. tostring(map))
				Game.SendChat("/e climate: " .. tostring(currentClimate))
				OutfitHandler("temp " .. tostring(currentClimate))
			end,
			["w"] = 1.000,
		},
	},
	
	--Aetheric Overload
	["ao"] = {
		["lock"] = true,
		[1] = {
			["run"] = true,
			["func"] = function() 
				rgsA = 5
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
		[2] = {
			["do"] = "sweat motion",
			["w"] = 3.25,
		},
		[3] = {
			["do"] = "useitem 7809",
			["w"] = 5,
		},
		[4] = {
			["do"] = "noop",
			["energeticRelease"] = 66,
			["w"] = 0.050,
		},
		[5] = {
			["run"] = true,
			["func"] = function() 
				rgsA = rgsA - 1
			end,
			["w"] = 0.000,
		},
		[6] = {
			["test"] = true,
			["func"] = function()
					if rgsA > 0 then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 2,
			["w"] = 0.000,
		},
		[7] = {
			["do"] = "gs change \"Blue Mage\"",
			["w"] = 3.50,
		},
		[8] = {
			["do"] = "bluespellbook preset 5",
			["w"] = 1.50,
		},
		[9] = {
			["do"] = "sweat motion",
			["w"] = 6.50,
		},
		[10] = {
			["run"] = true,
			["func"] = function() 
				rgsA = 3
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
		[11] = {
			["do"] = "pdead motion",
			["w"] = 0.725,
		},
		[12] = {
			["do"] = "laugh motion",
			["w"] = 0.375,
		},
		[13] = {
			["do"] = "useitem 7809",
			["w"] = 0.15,
		},
		[14] = {
			["run"] = true,
			["func"] = function() 
				rgsA = rgsA - 1
			end,
			["w"] = 0.000,
		},
		[15] = {
			["test"] = true,
			["func"] = function()
					if rgsA > 0 then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 11,
			["w"] = 0.000,
		},
		[16] = {
			["do"] = "slump motion",
			["w"] = 5.375,
		},
		[17] = {
			["do"] = "shiver motion",
			["w"] = 7.5,
			["aethericRelease"] = 66,
			["energeticRelease"] = 66,
		},
		[18] = {
			["mov"] = 12,
			["w"] = 1.000,
		},
		[19] = {
			["do"] = "blueaction \"Peculiar Light\"",
			["w"] = 2.35,
			["aethericRelease"] = 6,
		},
		[20] = {
			["do"] = "blueaction \"Chirp\"",
			["w"] = 2.35,
			["aethericRelease"] = 3,
		},
		[21] = {
			["dec"] = 1,
			["w"] = 0.000,
		},
		[22] = {
			["tst"] = 0,
			["do"] = "jmp",
			["jmp"] = 20,
			["w"] = 0.000,
		},
		[23] = {
			["do"] = "blueaction \"Chirp\"",
			["w"] = 2.35,
			["aethericRelease"] = 3,
		},
		[24] = {
			["mov"] = 6,
			["w"] = 1.000,
		},
		[25] = {
			["do"] = "blueaction \"High Voltage\"",
			["w"] = 2.35,
			["energeticRelease"] = 9,
		},
		[26] = {
			["do"] = "blueaction \"Mind Blast\"",
			["w"] = 2.35,
			["aethericRelease"] = 3,
		},
		[27] = {
			["dec"] = 1,
			["w"] = 0.000,
		},
		[28] = {
			["tst"] = 0,
			["do"] = "jmp",
			["jmp"] = 25,
			["w"] = 0.000,
		},
		[29] = {
			["test"] = true,
			["func"] = function()
					if AethericBuffer then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 34,
			["w"] = 0.000,
		},
		[30] = {
			["do"] = "blueaction \"Bad Breath\"",
			["w"] = 3.35,
			["dazedRelease"] = -169,
			
		},
		[31] = {
			["do"] = "panic motion",
			["w"] = 5.5,
		},
		[32] = {
			["do"] = "vexed motion",
			["w"] = 3.5,
		},
		[32] = {
			["do"] = "blueaction \"Self-destruct\"",
			["w"] = 2.35,
			["aethericRelease"] = 369,
			["embarrassedRelease"] = -77,
		},
		
		
		[33] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[34] = {
			["do"] = "blueaction \"Ultravibration\"",
			["w"] = 2.35,
			["aethericRelease"] = 99,
			["energeticRelease"] = 99,
		},
		[35] = {
			["do"] = "blueaction \"Nightbloom\"",
			["w"] = 2.35,
			["aethericRelease"] = 169,
		},
		
	},
	
	["asswarmer"] = {
		[1] = {
			["do"] = "shiver motion",
			["w"] = 5.25,
		},
		[2] = {
			["run"] = true,
			["func"] = function() 
				rgsA = GetClosestAetherBeacon(69)
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
		[3] = {
			["test"] = true,
			["func"] = function()
					if rgsA then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 6,
			["w"] = 0.000,
		},
		[4] = {
			["run"] = true,
			["func"] = function() 
				activeQuirk = nil
			end,
			["w"] = 13.000,
		},
		[5] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 2.000,
		},
		[6] = {
			["run"] = true,
			["func"] = function() 
				MoveToBeacon(rgsA)
			end,
			["w"] = 19.000,
		},
		[7] = {
			["do"] = "target <me>",
			["w"] = 1.25,
		},
		[8] = {
			["do"] = "snd run EmoMoveNTurn180",
			["w"] = 6.75,
		},
		[9] = {
			["do"] = ".emo tea",
			["w"] = 2.25,
		},
		[10] = {
			["do"] = "em warms her ass by the aetheryte.",
			["w"] = 3.25,
		},
		[11] = {
			["do"] = "lean",
			["w"] = 9.25,
		},
		[12] = {
			["run"] = true,
			["func"] = function() 
				
				local x = GetQuirkVar(activeQuirk, "charge")
				if x then
					x = x * 0.5
					SetQuirkVar(activeQuirk, "charge", x)
				end
				activeQuirk = nil
				--Script.Storage.quirks[playerName][k].charge = Script.Storage.quirks[playerName][k].charge * 0.5
			end,
			["w"] = 3.000,
		},
	},
	--MoveToBeacon(tag)
	
	["CenterStage"] = {
		[1] = {
			["run"] = true,
			["func"] = function()
				if Game.Player.MapZone == 144 and currentBeaconDistance < 13.3 and lastBeacon == "Yojimbo" then
					MoveToBeacon("Yojimbo")
				else
					Game.SendChat("/e cBD = " .. tostring(currentBeaconDistance))
					Game.SendChat("/e lastBeacon = " .. tostring(lastBeacon))
					Game.SendChat("/e Map = " .. tostring(Game.Player.MapZone))
					DoRandom("cheer")
				end
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 5.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
	},
	
	["ChloeStripA"] = {
		[1] = {
			["do"] = "read motion",
			["w"] = 11.11,
		},
		[2] = {
			["do"] = "apple motion",
			["w"] = 7.77,
		},
		[3] = {
			["do"] = "sweat motion",
			["w"] = 13.13,
		},
		[4] = {
			["do"] = "ac Windmill",
			["w"] = 0.11,
		},
		[5] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("hat")
			end,
			["w"] = 5.750,
		},
		[6] = {
			["do"] = "ladance motion",
			["w"] = 13.13,
		},
		[7] = {
			["do"] = "tomestone motion",
			["w"] = 13.13,
		},
		[8] = {
			["do"] = "yoldance motion",
			["w"] = 17.17,
		},
		[9] = {
			["do"] = "backflip motion",
			["w"] = 0.77,
		},
		[10] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("earring")
			end,
			["w"] = 5.750,
		},
		[11] = {
			["do"] = "sweat motion",
			["w"] = 9.17,
		},
		[12] = {
			["do"] = "think motion",
			["w"] = 7.17,
		},
		[13] = {
			["do"] = "ac Improvisation",
			["w"] = 1.11,
		},
		[14] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("necklace")
			end,
			["w"] = 1.23,
		},
		[15] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("gloves")
			end,
			["w"] = 2.34,
		},
		[16] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("dress")
			end,
			["w"] = 1.11,
		},
		[17] = {
			["run"] = true,
			["func"] = function()
				RemoveItem("bra")
			end,
			["w"] = 1.11,
		},
		[18] = {
			["do"] = "ac Improvisation",
			["w"] = 7.17,
		},
		[19] = {
			["do"] = "ladance motion",
			["w"] = 7.17,
		},
		[20] = {
			["do"] = "examineself",
			["w"] = 7.17,
		},
		[21] = {
			["do"] = "shiver motion",
			["w"] = 9.63,
		},
		[22] = {
			["do"] = "think motion",
			["w"] = 7.17,
		},
		[23] = {
			["do"] = "snap motion",
			["w"] = 1.11,
		},
		[24] = {
			["run"] = true,
			["func"] = function()
				OutfitLoad(currentOutfit)
			end,
			["w"] = 3.77,
		},
		[25] = {
			["do"] = "bow motion",
			["w"] = 4.56,
		},
		[26] = {
			["do"] = "petals motion",
			["w"] = 7.17,
		},
		
		
	},
	
	["hoot-n-holler"] = {
		[1] = {
			["run"] = true,
			["func"] = function()
				DoRandom("cheer")
			end,
			["w"] = 5.750,
		},
		[2] = {
			["run"] = true,
			["func"] = function()
				DoRandom("clap")
			end,
			["w"] = 3.750,
		},
		[3] = {
			["run"] = true,
			["func"] = function()
				DoRandom("wine")
			end,
			["w"] = 6.750,
		},
		[4] = {
			["run"] = true,
			["func"] = function()
				DoRandom("gratuity")
			end,
			["w"] = 3.750,
		},
	},
	
	["benchwarmer"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				if routineToken then
					rgsA = routineToken.XPos
				end
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
	},
	
	["circleA"] = {
		[1] = {
			["run"] = true,
			["func"] = function() 
				rgsA = GetClosestAetherBeacon(69)
				--Game.SendChat("/e rgsA = " .. tostring(rgsA))
			end,
			["w"] = 1.000,
			--["do"] = "e rgsA = "
			--["rgsA"] = true
		},
	
	},

	["spriggan"] = {
		[1] = {
			["do"] = "equip 7544",
			["w"] = 11.111,
		},
		[2] = {
			["do"] = "useitem 5901",
			["w"] = 7.777,
		},
		[3] = {
			["run"] = true,
			["func"] = function() 
				PutonItem("hat")
			end,
			["w"] = 1.000,
		},
	},
	
	["interact"] = {
		[1] = {
			["do"] = "pinteract",
			["w"] = 1.000,
		},
	},
	
	["rezcheck"] = {
		[1] = {
			["test"] = true,
			["func"] = function()
				if tardis(true) < 13 then
					return true
				else
					return false
				end
			end,
			["do"] = "jmp",
			["jmp"] = 3,
			["w"] = 0.010,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["do"] = "end",
			["w"] = 1.000,
		},
		[3] = {
			["do"] = "ac Swiftcast",
			["w"] = 0.17,
		},
		[4] = {
			["do"] = "ac 'Thin Air'",
			["w"] = 0.17,
		},
		[5] = {
			["do"] = "ac 'Raise'",
			["w"] = 0.17,
		},
	},
	
	["TempEmitterA"] = {
		[1] = {
			["tempEmitter"] = true,
			["intensity"] = 13.77,
			["humid"] = 1.337,
			["focus"] = 0.137,
			["w"] = 0.250,
		},
	},
	["TempEmitterB"] = {
		[1] = {
			["tempEmitter"] = true,
			["intensity"] = 1.69,
			["humid"] = -0.037,
			["focus"] = 0.069,
			["w"] = 0.250,
		},
	},
	
	["AetherEffectA"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 16.9,
			["w"] = 0.250,
		},
	},
	["AetherEffectB"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 3.69,
			["w"] = 0.250,
		},
	},
	["AetherEffectF"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 4.44,
			["w"] = 0.250,
		},
	},
	["AetherEffectC"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 169,
			["w"] = 0.250,
		},
	},
	["AetherEffectD"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 13,
			["w"] = 0.250,
		},
	},
	["AetherEffectE"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 231,
			["w"] = 0.250,
		},
	},
	["AetherEffectS"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 144,
			["w"] = 0.250,
		},
	},
	["AetherEffectX"] = {
		[1] = {
			["aetheric"] = true,
			["intensity"] = 133,
			["w"] = 0.250,
		},
	},
	
	["Beacon135A"] = {
		[1] = {
			["do"] = "minion \"magic bucket\"",
			["w"] = 1.000,
		},
	},
	["Beacon339A"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 3.500,
		},
		[2] = {
			["do"] = "vnavmesh moveto -774.8697509765625 18.000722885131836 -557.6283569335938",
			["w"] = 7.500,
		},
		[3] = {
			["do"] = "target summoning bell",
			["w"] = 1.500,
		},
		[4] = {
			["do"] = "vnav movetarget",
			["w"] = 5.500,
		},
		[5] = {
			["do"] = "pinteract",
			["w"] = 60.000,
		},
		[6] = {
			["do"] = "snd run EmoSendEscape",
			["w"] = 10.000,
		},
		[7] = {
			["do"] = "vnavmesh moveto -775.7931518554688 18.000722885131836 -559.1217041015625",
			["w"] = 7.500,
		},
		[8] = {
			["do"] = "apple motion",
			["w"] = 9.750,
		},
		[9] = {
			["do"] = "vnavmesh moveto -787.49951171875 18.000722885131836 -588.579345703125",
			["w"] = 7.750,
		},
		[10] = {
			["do"] = "read motion",
			["w"] = 12.750,
		},
		[11] = {
			["do"] = "vnavmesh moveto -770.4622802734375 18.00113296508789 -565.7052001953125",
			["w"] = 7.750,
		},
		[12] = {
			["do"] = "vnavmesh moveto -765.9946899414062 18.000669479370117 -564.8973999023438",
			["w"] = 9.750,
		},
		[13] = {
			["do"] = "pose motion",
			["w"] = 7.750,
		},
		[14] = {
			["do"] = "vnavmesh moveto -762.7214965820312 18.000654220581055 -561.053955078125",
			["w"] = 9.750,
		},
		[15] = {
			["do"] = "sit",
			["w"] = 7.750,
		},
		[16] = {
			["do"] = "apple",
			["w"] = 9.750,
		},
		[17] = {
			["do"] = "read",
			["w"] = 25.750,
		},
		[18] = {
			["do"] = "doze",
			["w"] = 25.750,
		},
		[19] = {
			["do"] = "vnavmesh moveto -774.072998046875 18.001317977905273 -566.3289184570312",
			["w"] = 25.750,
		},
		[20] = {
			["do"] = "vnavmesh moveto -772.0629272460938 18.00128746032715 -565.9081420898438",
			["w"] = 30.0,
		},
		[21] = {
			["do"] = "vnavmesh moveto -779.200927734375 18.000717163085938 -554.9505004882812",
			["w"] = 7.0,
		},
		[22] = {
			["do"] = "vnavmesh moveto -779.3922119140625 18.00071907043457 -555.6145629882812",
			["w"] = 5.0,
		},
		[23] = {
			["do"] = "lean",
			["w"] = 180.0,
		},
	},

	["Beacon990A"] = {
		[1] = {
			["test"] = true,
			["func"] = function() 
					if emoState["sleepy"] + emoState["tired"] < 75 then
						return true
					else
						return nil
					end
				end,
			["do"] = "jmp",
			["jmp"] = 27,
			["w"] = 1.000,
		},
		[2] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Should I get some rest?",
			["do"] = "confirm",
			["w"] = 3.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return not confirm end,
			["do"] = "jmp",
			["jmp"] = 27,
			["w"] = 5.000,
		},
		[4] = {
			["do"] = "vnavmesh moveto 4.543417453765869 -0.00021255016326904297 -0.9756238460540771",
			["w"] = 6.500,
		},
		[5] = {
			["do"] = "squats motion",
			["w"] = 1.750,
		},
		[6] = {
			["do"] = ".emo outfit remove hat",
			["w"] = 1.750,
		},
		[7] = {
			["do"] = "displayarms off",
			["w"] = 1.750,
		},
		[8] = {
			["do"] = ".emo outfit remove facewear",
			["w"] = 1.750,
		},
		[9] = {
			["do"] = ".emo outfit remove top",
			["w"] = 1.750,
		},
		[10] = {
			["do"] = ".emo outfit remove shoes",
			["w"] = 1.750,
		},
		[11] = {
			["do"] = ".emo outfit remove gloves",
			["w"] = 1.750,
		},
		[12] = {
			["do"] = ".emo outfit remove earrings",
			["w"] = 1.750,
		},
		[13] = {
			["do"] = ".emo outfit remove necklace",
			["w"] = 2.150,
		},
		[14] = {
			["do"] = "examineself motion",
			["w"] = 6.500,
		},
		[15] = {
			["do"] = "vnavmesh moveto 1.710065245628357 0.0021898746490478516 -1.8697563409805298",
			["w"] = 2.500,
		},
		[16] = {
			["do"] = "vnavmesh moveto 3.1517162322998047 -0.0002562999725341797 -4.565773963928223",
			["w"] = 2.500,
		},
		[17] = {
			["do"] = ".emo doze",
			["w"] = 2.500,
		},
		[18] = {
			["test"] = true,
			["func"] = function() return not rnd end,
			["do"] = "jmp",
			["jmp"] = 20,
			["w"] = 2.500,
		},
		[19] = {
			["do"] = ".emo rnd",
			["w"] = 3.500,
		},
		[20] = {
			["run"] = true,
			["func"] = function() 
				emoState["sleepy"] = emoState["sleepy"] - 25
				if emoState["sleepy"] < 0 then
					 emoState["sleepy"] = 0
				end
				emoState["tired"] = emoState["tired"] - 15
				if emoState["tired"] < 0 then
					 emoState["tired"] = 0
				end
				if Tracking then
					EmoCheck()
				end
				return true
			end,
			["w"] = 7.500,
		},
		[21] = {
			["test"] = true,
			["func"] = function() 
				if emoState["sleepy"] + emoState["tired"] > 15 then
					return true
				else
					return nil
				end
			end,
			["do"] = "jmp",
			["jmp"] = 20,
			["w"] = 7.500,
		},
		[22] = {
			["test"] = true,
			["func"] = function() return rnd end,
			["do"] = "jmp",
			["jmp"] = 23,
			["w"] = 2.500,
		},
		[23] = {
			["do"] = ".emo rnd",
			["w"] = 3.500,
		},
		[24] = {
			["do"] = "gaction jump",
			["w"] = 7.500,
		},
		[25] = {
			["do"] = "vnavmesh moveto 0.39806482195854187 0.003542780876159668 -4.265044212341309",
			["w"] = 4.500,
		},
		[26] = {
			["do"] = "stretch motion",
			["w"] = 7.500,
		},
		[27] = {
			["do"] = ".emo dress",
			["w"] = 5.500,
		},
		[28] = {
			["do"] = "noop",
			["w"] = 1.500,
		},
		[29] = {
			["do"] = "noop",
			["w"] = 1.500,
		},
		[30] = {
			["do"] = "noop",
			["w"] = 1.500,
		},
	},
	["Beacon1186A"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 3.500,
		},
		[2] = {
			["test"] = true,
			--["func"] = function() return Game.Player.Name == "Chloe Montclaire" end,
			["do"] = "minion \"motley egg\"",
			["w"] = 1.000,
		},
		[3] = {
			["test"] = true,
			--["func"] = function() return Game.Player.Name == "Niccissa Montclaire" end,
			["do"] = "minion \"plush cushion\"",
			["w"] = 1.000,
		},
		[4] = {
			["do"] = "vnavmesh moveto 2.7810733318328857 0 2.7053511142730713",
			["w"] = 5.25,
		},
		[5] = {
			["do"] = "vnavmesh moveto 3.2474594116210938 -0.0002733469009399414 -4.370445728302002",
			["w"] = 4.25,
		},
	},
	["Beacon1186C"] = {
		[1] = {
			["do"] = "noop",
			["w"] = 1.500,
		},
		[2] = {
			["test"] = true,
			--["func"] = function() return Game.Player.Name ~= "Niccissa Montclaire" end,
			["cond"] = "This routine requires that Niccissa Montclaire is the current player.",
			["do"] = "end",
			["w"] = 1.000,
		},
		[3] = {
			["test"] = true,
			["func"] = function() return true end,
			["cond"] = "Would you like to start the routine Ms. Montclaire?",
			["do"] = "confirm",
			["w"] = 5.000,
		},
		[4] = {
			["test"] = true,
			["func"] = function() return not confirm end,
			["cond"] = "Maybe later then. :)",
			["do"] = "end",
			["w"] = 5.000,
		},
		[5] = {
			["do"] = "vnavmesh moveto -166.77044677734375 1.6999986171722412 346.5382995605469",
			["w"] = 6.25,
		},
		[6] = {
			["do"] = "minion \"golden beaver\"",
			["w"] = 1.750,
		},
		[7] = {
			["do"] = "useitem 41500",
			["w"] = 1.750,
		},
		[8] = {
			["do"] = "equip 32794",
			["w"] = 3.500,
		},
		[9] = {
			["do"] = "vnavmesh moveto -163.19378662109375 1.5599992275238037 338.3729248046875",
			["w"] = 4.25,
		},
		[10] = {
			["do"] = "vnavmesh moveto -161.0957794189453 2.059999942779541 328.9703674316406",
			["w"] = 6.50,
		},
		[11] = {
			["do"] = "minion \"zephyrous zabuton\"",
			["w"] = 3.750,
		},
		[12] = {
			["do"] = "sit",
			["w"] = 5.000,
		},
		[13] = {
			["do"] = "read motion",
			["w"] = 10.000,
		},
		[14] = {
			["do"] = "gaction jump",
			["w"] = 6.000,
		},
		[15] = {
			["do"] = "vnavmesh moveto -161.12022399902344 1.559999942779541 332.9627685546875",
			["w"] = 3.750,
		},
		[16] = {
			["do"] = "confirm motion",
			["w"] = 4.500,
		},
		[17] = {
			["do"] = "vnavmesh moveto -161.96669006347656 1.5600001811981201 332.97808837890625",
			["w"] = 8.50,
		},
		[18] = {
			["do"] = "examineself motion",
			["w"] = 7.500,
		},
		[19] = {
			["do"] = "backflip motion",
			["w"] = 1.500,
		},
		[20] = {
			["do"] = "equip 10036",
			["w"] = 3.500,
		},
		[21] = {
			["do"] = "vnavmesh moveto -161.08160400390625 1.5500004291534424 329.9854736328125",
			["w"] = 3.50,
		},
		[22] = {
			["do"] = "sit",
			["w"] = 5.000,
		},
		[23] = {
			["do"] = "apple motion",
			["w"] = 9.000,
		},
		[24] = {
			["do"] = "read motion",
			["w"] = 15.000,
		},
		[24] = {
			["do"] = "stretch motion",
			["w"] = 12.000,
		},
		[25] = {
			["do"] = "vnavmesh moveto -161.05502319335938 1.5600001811981201 330.5506896972656",
			["w"] = 3.50,
		},
		[26] = {
			["do"] = "vnavmesh moveto -157.8198699951172 1.549999713897705 330.2568664550781",
			["w"] = 3.50,
		},
		[27] = {
			["do"] = "vnavmesh moveto -155.9412841796875 1.7000010013580322 323.0627136230469",
			["w"] = 6.50,
		},
		[28] = {
			["do"] = "squats motion",
			["w"] = 1.50,
		},
		[29] = {
			["do"] = "squats motion",
			["w"] = 0.50,
		},
		[30] = {
			["do"] = "equip 36835",
			["w"] = 1.500,
		},
		[31] = {
			["do"] = "vnavmesh moveto -163.39730834960938 1.9000022411346436 320.1742248535156",
			["w"] = 2.500,
		},
		[32] = {
			["do"] = "facewear \"Purple Cat Eye Glasses\"",
			["w"] = 2.500,
		},
		[33] = {
			["do"] = "displayarms off",
			["w"] = 2.500,
		},
		[34] = {
			["do"] = "snd run EmoRemoveGloves",
			["w"] = 2.500,
		},
		
		
	},
	
	["Beacon1190A"] = {
		[1] = {
			["do"] = "e EmoBot A nearby beacon is effecting your emotional state.",
			["w"] = 3.50
		},
		[2] = {
			["do"] = "minion \"magic broom\"",
			["w"] = 0.50
		},
		[3] = {
			["do"] = "sweep motion",
			["w"] = 12.000
		},
		[4] = {
			["do"] = "beesknees motion",
			["w"] = 15.000,
		},
	},
}

local function loadRoutine(rout)
	return routines[rout]
end

return loadRoutine