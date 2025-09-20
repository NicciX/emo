--Beacons
local beacons = {
	[128] = {
		["name"] = "Limsa Lominsa - Upper Decks",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = -78.65190124511719,
				["YPos"] = -144.39813232421875,
				["ZPos"] = 40.99999237060547,
				["radius"] = 9,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 3.75,
					["flirty"] = 0.25,
					["social"] = 2.25,
				},
			},
			["B"] = {
				["XPos"] = 0.30051910877227783,
				["YPos"] = 1.1564310789108276,
				["ZPos"] = 39.51757049560547,
				["radius"] = 25,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 2.75,
					["flirty"] = 0.25,
					["social"] = 1.25,
					["nosey"] = 2.25,
				},
			},
			["C"] = {
				["XPos"] = 16.06768798828125,
				["YPos"] = 68.8028564453125,
				["ZPos"] = 40.787353515625,
				["radius"] = 16.09223138510232,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -56.50421142578125,
				["YPos"] = -131.45648193359375,
				["ZPos"] = 44.47998046875,
				["radius"] = 8.609162352135387,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
	
	
		},
	},
	[129] = {
		["name"] = "Limsa Lominsa - Lower Decks",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = -84.031494140625,
				["YPos"] = 0.01519775390625,
				["ZPos"] = 20.7674560546875,
				["radius"] = 13,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = -179.40032958984375,
				["YPos"] = 182.970947265625,
				["ZPos"] = 4.8065185546875,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard (Fisherman's Bottom)
				["cooldown"] = 6,
			},
			["C"] = {
				["XPos"] = -213.611083984375,
				["YPos"] = 51.8043212890625,
				["ZPos"] = 16.7391357421875,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -335.16448974609375,
				["YPos"] = 56.3819580078125,
				["ZPos"] = 12.61920166015625,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
		},
	},
	[130] = {
		["name"] = "Ul'dah - Steps of Nald",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = 64.2252197265625,
				["YPos"] = -115.31243896484375,
				["ZPos"] = 4.5318603515625,
				["radius"] = 7.8168154315926435,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["B"] = {
				["XPos"] = -144.51824951171875,
				["YPos"] = -169.66510009765625,
				["ZPos"] = -1.35809326171875,
				["radius"] = 16.80250828284193,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["C"] = {
				["XPos"] = -154.83331298828125,
				["YPos"] = 73.0753173828125,
				["ZPos"] = 14.63336181640625,
				["radius"] = 9.87654321,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
	
	
	
		},
	},
	[131] = {
		["name"] = "Ul'dah - Steps of Thal",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = -19.333251953125,
				["YPos"] = 72.037841796875,
				["ZPos"] = 14.60284423828125,
				["radius"] = 4.4171723480501965,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = -0.13,
					["energized"] = 0.09,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["B"] = {
				["XPos"] = -53.84918212890625,
				["YPos"] = 12.222412109375,
				["ZPos"] = 10.696533203125,
				["radius"] = 7.14651275543159,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["C"] = {
				["XPos"] = 89.646728515625,
				["YPos"] = 58.274169921875,
				["ZPos"] = 12.92437744140625,
				["radius"] = 3.7515814115565673,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = 33.4935302734375,
				["YPos"] = 113.2066650390625,
				["ZPos"] = 13.2294921875,
				["radius"] = 3.241371822716039,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = 131.9447021484375,
				["YPos"] = -29.8009033203125,
				["ZPos"] = 4.7149658203125,
				["radius"] = 7.3467677389024235,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
		},
	},
	[132] = {
		["name"] = "New Gridania",
		["cont"] = "The Black Shroud",
		["beacon"] = {
			["A"] = {
				["XPos"] = 32.9136962890625,
				["YPos"] = 30.014404296875,
				["ZPos"] = 2.6702880859375,
				["radius"] = 17.963100789291456,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
		},
	},
	[133] = {
		["name"] = "Old Gridania",
		["cont"] = "The Black Shroud",
		["beacon"] = {
			["A"] = {
				["XPos"] = -145.1590576171875,
				["YPos"] = -11.7647705078125,
				["ZPos"] = 4.9591064453125,
				["radius"] = 9.079134300002817,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["B"] = {
				["XPos"] = -73.92999267578125,
				["YPos"] = -140.1541748046875,
				["ZPos"] = 7.98046875,
				["radius"] = 3.9966858860404377,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["C"] = {
				["XPos"] = -311.085693359375,
				["YPos"] = -177.05047607421875,
				["ZPos"] = 7.94989013671875,
				["radius"] = 8.366337043617438,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = 121.23291015625,
				["YPos"] = -229.633056640625,
				["ZPos"] = 12.649658203125,
				["radius"] = 11.640805794957938,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = 101.2740478515625,
				["YPos"] = -111.31463623046875,
				["ZPos"] = 9.01800537109375,
				["radius"] = 7.467754144575387,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
	
		},
	},
	[134] = {
		["name"] = "Middle La Noscea",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = 227.9849853515625,
				["YPos"] = -257.0382080078125,
				["ZPos"] = 115.5260009765625,
				["radius"] = 23,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.37,
					["energized"] = 0.37,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[135] = {
		["name"] = "Lower La Noscea",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = 156.114990234375,
				["YPos"] = 673.2127685546875,
				["ZPos"] = 15.5184326171875,
				["radius"] = 11.279551942926068,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
		},
	},
	[137] = {
		["name"] = "Eastern La Noscea",
		["cont"] = "La Noscea",
		["beacon"] = {
			["A"] = {
				["XPos"] = 489.158447265625,
				["YPos"] = 468.802978515625,
				["ZPos"] = 20.8284912109375,
				["radius"] = 26.726771174050402,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[140] = {
		["name"] = "Western Thanalan",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = 68.0093994140625,
				["YPos"] = -227.03900146484375,
				["ZPos"] = 48.203125,
				["radius"] = 20.172768611607594,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
		},
	},
	[141] = {
		["name"] = "Central Thanalan",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = -16.1593017578125,
				["YPos"] = -166.582763671875,
				["ZPos"] = 0.32037353515625,
				["radius"] = 14.544672139612146,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = 115.1292724609375,
				["YPos"] = -392.20269775390625,
				["ZPos"] = 31.8760986328125,
				["radius"] = 27,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 1.39,
					["energized"] = 0.77,
				},
				["routine"] = "AetherEffectC", --mutamix bubblypots
				["cooldown"] = 13,
			},
	
		},
	},
	[144] = { --The Gold Saucer
		["name"] = "The Gold Saucer",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = -64.74407958984375,
				["YPos"] = 54.3372802734375,
				["ZPos"] = 2.8839111328125,
				["radius"] = 8.952584169980646,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
	
			["B"] = {
				["XPos"] = -0.01531982421875,
				["YPos"] = -0.01531982421875,
				["ZPos"] = 3.4942626953125,
				["radius"] = 20.69601585015553,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["C"] = {
				["XPos"] = -24.76544189453125,
				["YPos"] = -85.679443359375,
				["ZPos"] = 6.1798095703125,
				["radius"] = 6.791333017613571,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -0.38153076171875,
				["YPos"] = 58.60986328125,
				["ZPos"] = 23.88031005859375,
				["radius"] = 4.467854312057309,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = 59.067626953125,
				["YPos"] = 63.0350341796875,
				["ZPos"] = 23.88031005859375,
				["radius"] = 11.451745032434342,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["F"] = {
				["XPos"] = 95.4757080078125,
				["YPos"] = -72.3125,
				["ZPos"] = -2.12103271484375,
				["radius"] = 19.3696508720215605,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.13,
					["energized"] = 0.13,
					["hot"] = 0.33,
					["cold"] = -0.66,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["J"] = {
				["XPos"] = -29.087305068969727,
				["YPos"] = -60.50366973876953,
				["ZPos"] = 3.1604483127593994,
				["radius"] = 0.0,
				["type"] = "emote",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "splash",
					["test"] = true,
					["func"] = function() 
						if emoState["happy"] > 20 and math.random(100) > 1 and Game.Player.HasEmote("splash") then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["playful"] = 0.1,
						["wet"] = 0.25,
						["cold"] = 0.15,
						["hot"] = -0.25,
						["happy"] = -0.25,
					},
					["interval"] = 0.75,
					["toast"] = "",
					["moodle"] = "splash",
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 30.0,
					["type"] = "emote",
					--["falloffRout"] = "EatFood",
				},
				["toast"] = "",
				["cooldown"] = 3.0,
			},
			["K"] = {
				["XPos"] = 114.4273681640625,
				["YPos"] = -38.86480712890625,
				["ZPos"] = 13.59576416015625,
				["radius"] = 9.041163014107717,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["RT-GS-L"] = {
				["XPos"] = -51.903446197509766,
				["YPos"] = -43.38264846801758,
				["ZPos"] = 3.731241464614868,
				["radius"] = 0.0,
				["type"] = "routine",
				["refresh"] = nil, -- if nil, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "benchwarmer",
					["test"] = true,
					["XPos"] = -51.903446197509766,
					["YPos"] = -43.38264846801758,
					["ZPos"] = 3.731241464614868,
					["func"] = function() 
						if emoState["sleepy"] > 91 and math.random(100) > 66 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -0.37,
						["tired"] = -0.37,
						["uncomfortable"] = 0.13,
					},
					["interval"] = 9.63,
					["toast"] = "",
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 30.0,
					["type"] = "routine",
					--["falloffRout"] = "EatFood",
					--["appRout"] = "benchwarmer",
					
				},
				["toast"] = "",
				["cooldown"] = 33336.9,
			},
			["BF-GS-A"] = {
				["XPos"] = -27.122278213500977,
				["YPos"] = -85.68191528320312,
				["ZPos"] = 3.730698347091675,
				["radius"] = 0.0,
				["test"] = true,
				["func"] = function() 
						if (emoState["sleepy"] > 30 or  emoState["tired"] > 25 or emoState["uncomfortable"] > 30) and not flags[4] then
							return true
						else
							return nil
						end
					end,
				["found"] = true,
				["type"] = "buff",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "comfybench",
					["test"] = true,
					["XPos"] = -27.122278213500977,
					["YPos"] = -85.68191528320312,
					["ZPos"] = 3.730698347091675,
					["func"] = function() 
						if flags[4] and math.random(100) > 23 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -3.67,
						["tired"] = -2.47,
						["uncomfortable"] = -1.37,
					},
					["interval"] = 3.63,
					["moodle"] = "comfy",
					["toast"] = "It feels good to sit down.",
					["toastWait"] = 6.12,
					--["lastToast"] = 0, -- used by handler to track time of toast -- set to 0, will show toast upon
										-- application, when omitted first toast will not display until
										-- toastWait seconds have passed.
					["toasted"] = 1, -- number of times to display toast (will display when func returns a true
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 180.0,
					["type"] = "buff",
					--["falloffRout"] = "EatFood",
					--["appRout"] = "benchwarmer",
					
				},
				["toast"] = "That bench looks like a good place to /sit ...",
				["cooldown"] = 29.0,
				--["lastToast"] = 0,
				["toasted"] = 1,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
			},
			
			
			["BF-GS-B"] = {
				["XPos"] = 100.06244659423828,
				["YPos"] = -49.3834114074707,
				["ZPos"] = -4.518758296966553,
				["radius"] = 0,
				["test"] = true,
				["func"] = function() 
						if (emoState["sleepy"] > 30 or  emoState["tired"] > 25 or emoState["uncomfortable"] > 30) and not flags[4] then
							return true
						else
							return nil
						end
					end,
				["found"] = true,
				["type"] = "buff",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "comfybench",
					["test"] = true,
					["XPos"] = -27.122278213500977,
					["YPos"] = -85.68191528320312,
					["ZPos"] = 3.730698347091675,
					["func"] = function() 
						if flags[4] and math.random(100) > 23 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -3.67,
						["tired"] = -2.47,
						["uncomfortable"] = -1.37,
					},
					["interval"] = 3.63,
					["moodle"] = "comfy",
					["toast"] = "It feels good to sit down.",
					["toastWait"] = 6.12,
					--["lastToast"] = 0, -- used by handler to track time of toast -- set to 0, will show toast upon
										-- application, when omitted first toast will not display until
										-- toastWait seconds have passed.
					["toasted"] = 1, -- number of times to display toast (will display when func returns a true
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 180.0,
					["type"] = "buff",
				},
				["toast"] = "That bench looks like a good place to /sit ...",
				["cooldown"] = 99999.0,
				["toasted"] = 1,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
			},
			["WindSpot"] = {
				["XPos"] = 67.25218200683594,
				["YPos"] = -24.836362838745117,
				["ZPos"] = -4.477734565734863,
				["radius"] = 1,
				["type"] = "marker",
				["mark"] = "b", -- waymark letter
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = nil,
			},
			["Slice"] = {
				["XPos"] = 77.19717407226562,
				["YPos"] = -69.75956726074219,
				["ZPos"] = -5.000000476837158,
				["radius"] = 13.69,
				["type"] = "interaction-marker",
				["test"] = true,
				["mark"] = "c",
				["func"] = function() 
					local t = tonumber(os.date("%M", os.time()))
					local tN = Game.Player.Target.Name
					
					if ((t > 0 and t < 2) or (t > 20 and t < 22) or (t > 40 and t < 42)) and currentGate == "The Slice Is Right" then
						dbgMsg("Beacon: SliceIsRightNPC: " .. tostring(t), 1)
						if tN then
							if tN == "Strangely Garbed Gentleman" then
								return nil
							else
								return true
							end
						else
							return true
						end
					else
						return nil
					end
				end,
				["routine"] = "SliceIsRightNPC",
				["toast"] = "",
				["cooldown"] = 3.9,
			},
			["WindBlows"] = {
				["XPos"] = 77.19717407226562,
				["YPos"] = -69.75956726074219,
				["ZPos"] = -5.000000476837158,
				["radius"] = 13.69,
				["type"] = "interaction-marker",
				["test"] = true,
				["mark"] = "c",
				["func"] = function() 
					local t = tonumber(os.date("%M", os.time()))
					local tN = Game.Player.Target.Name
					--
					if ((t > 0 and t < 2) or (t > 20 and t < 22) or (t > 40 and t < 42)) and currentGate == "Anyway the Wind Blows" then
						dbgMsg("Beacon: SliceIsRightNPC: " .. tostring(t), 1)
						if tN then
							if tN == "Supercilious Spellweaver" then
								return false
							else
								return true
							end
						else
							return true
						end
					else
						return nil
					end
				end,
				["routine"] = "WindBlowsNPC",
				["toast"] = "",
				["cooldown"] = 3.9,
			},
			["Yojimbo"] = {
				["XPos"] = 70.63477325439453,
				["YPos"] = -35.953025817871094,
				["ZPos"] = -4.498549938201904,
				["radius"] = 14.95,
				["type"] = "marker",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				--["routine"] = "AetherEffectnil", --niccissa montclaire
				["cooldown"] = 30,
			},
			["Air Force One"] = {
				["XPos"] = -55.096466064453125,
				["YPos"] = -64.2600326538086,
				["ZPos"] = 3.2673380374908447,
				["radius"] = 4.761445979096911,
				["type"] = "marker",
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = nil,
			},
			["Leap of Faith"] = {
				["XPos"] = -55.096466064453125,
				["YPos"] = -64.2600326538086,
				["ZPos"] = 3.2673380374908447,
				["radius"] = 4.761445979096911,
				["type"] = "marker",
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = nil,
			},
			["The Slice Is Right"] = {
				["XPos"] = 78.13119506835938,
				["YPos"] = -66.35376739501953,
				["ZPos"] = -5.000000476837158,
				["radius"] = 4.761445979096911,
				["type"] = "marker",
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = nil,
			},
			["Any Way the Wind Blows"] = {
				["XPos"] = -55.096466064453125,
				["YPos"] = -64.2600326538086,
				["ZPos"] = 3.2673380374908447,
				["radius"] = 4.761445979096911,
				["type"] = "marker",
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = nil,
			},
			["CliffhangerWSE"] = {
				["XPos"] = 49.600589752197266,
				["YPos"] = 45.08869934082031,
				["ZPos"] = 3.999720573425293,
				["radius"] = 4.761445979096911,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --stricken schoolgirl
				["cooldown"] = nil,
			},
			["CliffhangerRS"] = {
				["XPos"] = -14.467541694641113,
				["YPos"] = -78.65863800048828,
				["ZPos"] = 3.27254319190979,
				["radius"] = 4.761445979096911,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --stricken schoolgirl
				["cooldown"] = nil,
			},
			["afk"] = {
				["XPos"] = 106.28028106689453,
				["YPos"] = -7.945027828216553,
				["ZPos"] = 13.0014066696167,
				["radius"] = 0,
				["toast"] = "afk",
				["routine"] = "afk", --niccissa montclaire
				["cooldown"] = nil,
			},
		},
	},
	[147] = { -- Northern Thanalan
		["name"] = "Northern Thanalan",
		["cont"] = "Thanalan",
		["beacon"] = {
			["A"] = {
				["XPos"] = 20.9810791015625,
				["YPos"] = 454.0321044921875,
				["ZPos"] = 8.83489990234375,
				["radius"] = 20.217519454611303,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.27,
					["energized"] = 0.13,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = -26.59649658203125,
				["YPos"] = -30.83856201171875,
				["ZPos"] = 49.8817138671875,
				["radius"] = 21.869227995159033,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
	
		},
	},
	
	[153] = { -- South Shroud
		["name"] = "South Shroud",
		["cont"] = "The Black Shroud",
		["beacon"] = {
			["A"] = {
				["XPos"] = 178.6068115234375,
				["YPos"] = -68.192626953125,
				["ZPos"] = 10.5439453125,
				["radius"] = 13,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[154] = { -- North Shroud
		["name"] = "North Shroud",
		["cont"] = "The Black Shroud",
		["beacon"] = {
			["A"] = {
				["XPos"] = -41.58087158203125,
				["YPos"] = 233.7528076171875,
				["ZPos"] = -38.55963134765625,
				["radius"] = 29.898024419170024,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	[156] = { -- Mor Dhona
		["name"] = "Mor Dhona",
		["cont"] = "Mor Dhona",
		["beacon"] = {
			["A"] = {
				["XPos"] = 40.0242919921875,
				["YPos"] = -668.0247192382812,
				["ZPos"] = 24.00244140625,
				["radius"] = 17,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
					["focused"] = 0.35,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 17,
			},
			["B"] = {
				["XPos"] = 31.308364868164062,
				["YPos"] = -817.2153930664062,
				["ZPos"] = 50.999969482421875,
				["radius"] = 6,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 0.25,
				},
				["routine"] = "EatFood", --chloe montclaire
				["cooldown"] = 30,
			},
			["C"] = {
				["XPos"] = 154.467041015625,
				["YPos"] = -437.4609375,
				["ZPos"] = -26.29132080078125,
				["radius"] = 24.937137780029712,
				["confluence"] = true,
				["toast"] = "You sense a powerful confluence nearby.",
				["effects"] = {
					["aetheric"] = 0.61,
					["energized"] = 0.31,
				},
				--["routine"] = "AetherEffectX", --entrance to the omphalos
				["cooldown"] = 13,
			},
		},
	},
	[339] = { -- Mist
		["name"] = "Mist",
		["cont"] = "La Noscea",
		["beacon"] = {
			--[[["A"] = {
				["XPos"] = -766.1298217773438,
				["YPos"] = -565.0309448242188,
				["ZPos"] = 18.00067138671875,
				["radius"] = 9,
				["toast"] = "",
				["effects"] = {
					["happy"] = 0.25,
					["flirty"] = 0.05,
					["sleepy"] = -0.55,
				},
				--["routine"] = "Beacon339A",
				["cooldown"] = 3000,
			},]]--
			["B"] = {
				["XPos"] = -741.0849609375,
				["YPos"] = -554.8333740234375,
				["ZPos"] = 24.97900390625,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
	
			["C"] = {
				["XPos"] = -686.7017822265625,
				["YPos"] = -621.4542236328125,
				["ZPos"] = 17.8682861328125,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -604.0894165039062,
				["YPos"] = -615.930419921875,
				["ZPos"] = 41.4891357421875,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["E"] = {
				["XPos"] = -592.1263427734375,
				["YPos"] = -709.193603515625,
				["ZPos"] = 49.9427490234375,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["F"] = {
				["XPos"] = -615.136962890625,
				["YPos"] = -807.461669921875,
				["ZPos"] = 32.8221435546875,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["G"] = {
				["XPos"] = -651.1482543945312,
				["YPos"] = -851.4686889648438,
				["ZPos"] = 30.2281494140625,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["H"] = {
				["XPos"] = -743.739990234375,
				["YPos"] = -758.785400390625,
				["ZPos"] = 9.99456787109375,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["I"] = {
				["XPos"] = -716.3347778320312,
				["YPos"] = -690.6996459960938,
				["ZPos"] = 6.91229248046875,
				["radius"] = 3.14,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet Shard
				["cooldown"] = 6,
			},
			["EM-MIST-J"] = {
				["XPos"] = -840.2057495117188,
				["YPos"] = -661.6530151367188,
				["ZPos"] = -0.2998141050338745,
				["radius"] = 3.9,
				["type"] = "emote",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "splash",
					["test"] = true,
					["func"] = function() 
						if emoState["happy"] > 20 and math.random(100) > 1 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["playful"] = 0.1,
						["wet"] = 0.25,
						["cold"] = 0.15,
						["hot"] = -0.25,
						["happy"] = -0.25,
					},
					["interval"] = 7.7,
					["method"] = "math.sin(X)*7.77", -- the boosted moods will be adjusted by this function
					["refresh"] = nil,
					["stackLim"] = 1,
					["toast"] = "",
					["drAdj"] = 77,
					["stacks"] = 1,
					["moodle"] = "splash",
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 90.0,
					["type"] = "emote",
					--["falloffRout"] = "EatFood",
				},
				["toast"] = "",
				["cooldown"] = 399.0,
			},
			["afk"] = {
				["XPos"] = -762.4971923828125,
				["YPos"] = -560.7505493164062,
				["ZPos"] = 18.4997501373291,
				["radius"] = 0,
				["toast"] = "afk",
				["routine"] = "afk", --niccissa montclaire
				["cooldown"] = nil,
			},
			["WaterEntryA"] = {
				["XPos"] = -840.565185546875,
				["YPos"] = -767.8468627929688,
				["ZPos"] = -0.6000000238418579,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterEntryB"] = {
				["XPos"] = -875.079345703125,
				["YPos"] = -654.8831176757812,
				["ZPos"] = -0.6000000238418579,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterEntryC"] = {
				["XPos"] = -869.6798706054688,
				["YPos"] = -689.3848266601562,
				["ZPos"] = -0.6000000238418579,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterEntryD"] = {
				["XPos"] = -841.230224609375,
				["YPos"] = -714.4871215820312,
				["ZPos"] = -0.6000000238418579,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterEntryE"] = {
				["XPos"] = -888.7985229492188,
				["YPos"] = -764.5017700195312,
				["ZPos"] = -0.6000000238418579,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterEntryF"] = {
				["XPos"] = -848.9136352539062,
				["YPos"] = -806.596923828125,
				["ZPos"] = -0.6000000238418579,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterEntryG"] = {
				["XPos"] = -809.1873168945312,
				["YPos"] = -823.2774047851562,
				["ZPos"] = -0.6000000834465027,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterEntryH"] = {
				["XPos"] = -882.0012817382812,
				["YPos"] = -700.7289428710938,
				["ZPos"] = -0.6000000834465027,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterExitA"] = {
				["XPos"] = -776.7353515625,
				["YPos"] = -767.980712890625,
				["ZPos"] = 1.9999995231628418,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterExitB"] = {
				["XPos"] = -827.9930419921875,
				["YPos"] = -767.0414428710938,
				["ZPos"] = 1.9999735355377197,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterExitC"] = {
				["XPos"] = -751.391357421875,
				["YPos"] = -724.3236694335938,
				["ZPos"] = 2.0167112350463867,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterExitD"] = {
				["XPos"] = -759.0729370117188,
				["YPos"] = -687.3636474609375,
				["ZPos"] = 1.5310256481170654,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterExitE"] = {
				["XPos"] = -786.5489501953125,
				["YPos"] = -654.3025512695312,
				["ZPos"] = 2.47176456451416,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["WaterExitF"] = {
				["XPos"] = -799.6793212890625,
				["YPos"] = -615.1322631835938,
				["ZPos"] = 2.0026473999023438,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["routine"] = "SwimBot", --Stacy Poole
				["cooldown"] = nil,
			},
			["JogPath1"] = {
				["XPos"] = -625.174560546875,
				["YPos"] = -761.6806640625,
				["ZPos"] = 30.001253128051758,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath2"] = {
				["XPos"] = -617.6248779296875,
				["YPos"] = -805.123046875,
				["ZPos"] = 32.5444450378418,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath3"] = {
				["XPos"] = -632.7299194335938,
				["YPos"] = -824.2727661132812,
				["ZPos"] = 32.16897201538086,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath4"] = {
				["XPos"] = -658.7181396484375,
				["YPos"] = -832.158203125,
				["ZPos"] = 29.694459915161133,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath5"] = {
				["XPos"] = -696.176025390625,
				["YPos"] = -826.3714599609375,
				["ZPos"] = 21.182226181030273,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath6"] = {
				["XPos"] = -718.8018188476562,
				["YPos"] = -810.0054321289062,
				["ZPos"] = 15.23935317993164,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath7"] = {
				["XPos"] = -736.05322265625,
				["YPos"] = -769.1803588867188,
				["ZPos"] = 10.001683235168457,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath8"] = {
				["XPos"] = -736.5005493164062,
				["YPos"] = -730.321533203125,
				["ZPos"] = 6.002164840698242,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath9"] = {
				["XPos"] = -756.1453857421875,
				["YPos"] = -726.2479858398438,
				["ZPos"] = 0.21789729595184326,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath10"] = {
				["XPos"] = -778.6240234375,
				["YPos"] = -675.5814819335938,
				["ZPos"] = 0.8678914308547974,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath11"] = {
				["XPos"] = -800.1383056640625,
				["YPos"] = -625.8417358398438,
				["ZPos"] = 2.3535306453704834,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath12"] = {
				["XPos"] = -793.263671875,
				["YPos"] = -609.7301635742188,
				["ZPos"] = 2.0026473999023438,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath13"] = {
				["XPos"] = -773.4258422851562,
				["YPos"] = -606.814453125,
				["ZPos"] = 9.99252986907959,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath14"] = {
				["XPos"] = -795.952880859375,
				["YPos"] = -601.9829711914062,
				["ZPos"] = 17.9925594329834,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath15"] = {
				["XPos"] = -776.6557006835938,
				["YPos"] = -566.1259765625,
				["ZPos"] = 18.000957489013672,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath16"] = {
				["XPos"] = -745.47412109375,
				["YPos"] = -568.253662109375,
				["ZPos"] = 18.00071144104004,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath17"] = {
				["XPos"] = -706.7770385742188,
				["YPos"] = -574.565673828125,
				["ZPos"] = 16.00095558166504,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath18"] = {
				["XPos"] = -684.5365600585938,
				["YPos"] = -576.8423461914062,
				["ZPos"] = 20.000457763671875,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath19"] = {
				["XPos"] = -683.6419067382812,
				["YPos"] = -553.342529296875,
				["ZPos"] = 27.999452590942383,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath20"] = {
				["XPos"] = -651.9789428710938,
				["YPos"] = -553.547607421875,
				["ZPos"] = 37.99825668334961,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath21"] = {
				["XPos"] = -647.4441528320312,
				["YPos"] = -571.3038330078125,
				["ZPos"] = 41.99775695800781,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath22"] = {
				["XPos"] = -627.4952392578125,
				["YPos"] = -576.9552612304688,
				["ZPos"] = 43.99039840698242,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath23"] = {
				["XPos"] = -609.398681640625,
				["YPos"] = -598.1177368164062,
				["ZPos"] = 43.921531677246094,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath24"] = {
				["XPos"] = -610.8698120117188,
				["YPos"] = -625.6842041015625,
				["ZPos"] = 39.24669647216797,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath25"] = {
				["XPos"] = -621.982421875,
				["YPos"] = -650.549560546875,
				["ZPos"] = 36.77116012573242,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath26"] = {
				["XPos"] = -627.292724609375,
				["YPos"] = -687.7589111328125,
				["ZPos"] = 34.99894714355469,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath27"] = {
				["XPos"] = -627.911865234375,
				["YPos"] = -726.3111572265625,
				["ZPos"] = 29.999217987060547,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["BF-MIST-K"] = {
				["XPos"] = -676.77001953125,
				["YPos"] = -715.5,
				["ZPos"] = 14.499991416931152,
				["radius"] = 17.0,
				["test"] = true,
				["func"] = function() 
						if (emoState["sleepy"] > 30 or  emoState["tired"] > 25 or emoState["uncomfortable"] > 30) and not flags[4] then
							return true
						else
							return nil
						end
					end,
				["found"] = true,
				["type"] = "buff",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "comfybench",
					["test"] = true,
					["XPos"] = -763.09716796875,
					["YPos"] = -560.7503051757812,
					["ZPos"] = 18.4997501373291,
					["func"] = function() 
						if flags[4] and math.random(100) > 23 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -3.67,
						["tired"] = -2.47,
						["uncomfortable"] = -1.37,
					},
					["interval"] = 3.63,
					["toast"] = "It feels good to sit down.",
					["toastWait"] = 6.12,
					--["lastToast"] = 0, -- used by handler to track time of toast -- set to 0, will show toast upon
										-- application, when omitted first toast will not display until
										-- toastWait seconds have passed.
					["toasted"] = 1, -- number of times to display toast (will display when func returns a true
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 180.0,
					["type"] = "buffs",
					["scope"] = "local", -- local or global
					["moodle"] = "comfy",
					--["falloffRout"] = "EatFood",
					--["appRout"] = "benchwarmer",
					
				},
				["toast"] = "That bench looks like a good place to /sit ...",
				["cooldown"] = 29.0,
				--["lastToast"] = 0,
				["toasted"] = 1,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
			},
			["BF-MIST-L"] = {
				["XPos"] = -701.288818359375,
				["YPos"] = -599.630126953125,
				["ZPos"] = 16.49999237060547,
				["radius"] = 17.0,
				["test"] = true,
				["func"] = function() 
						if (emoState["sleepy"] > 30 or  emoState["tired"] > 25 or emoState["uncomfortable"] > 30) and not flags[4] then
							return true
						else
							return nil
						end
					end,
				["found"] = true,
				["type"] = "buff",
				["refresh"] = nil, -- if true, tells the token handler to only apply once,
				["token"] = {	   -- and not refresh the token
					["what"] = "comfybench",
					["test"] = true,
					["XPos"] = -763.09716796875,
					["YPos"] = -560.7503051757812,
					["ZPos"] = 18.4997501373291,
					["func"] = function() 
						if flags[4] and math.random(100) > 23 then
							return true
						else
							return nil
						end
					end,
					["boosts"] = {
						["sleepy"] = -3.67,
						["uncomfortable"] = -1.37,
					},
					["interval"] = 3.63,
					["toast"] = "It feels good to sit down.",
					["toastWait"] = 6.12,
					--["lastToast"] = 0, -- used by handler to track time of toast -- set to 0, will show toast upon
										-- application, when omitted first toast will not display until
										-- toastWait seconds have passed.
					["toasted"] = 1, -- number of times to display toast (will display when func returns a true
					--["radius"] = 0, --can be different than the beacon's radius
					["falloff"] = 180.0,
					["type"] = "buffs",
					["scope"] = "local", -- local or global
					["moodle"] = "comfy",
					--["falloffRout"] = "EatFood",
					--["appRout"] = "benchwarmer",
					
				},
				["toast"] = "That bench looks like a good place to /sit ...",
				["cooldown"] = 29.0,
				--["lastToast"] = 0,
				["toasted"] = 1,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
			},
	
	
	
	
	
		},
	},
	[418] = { -- Foundation
		["name"] = "Foundation",
		["cont"] = "Coerthas",
		["beacon"] = {
			["A"] = {
				["XPos"] = -63.98114013671875,
				["YPos"] = 43.99169921875,
				["ZPos"] = 11.154296875,
				["radius"] = 27.72520992435769,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = 49.4239501953125,
				["YPos"] = 66.6971435546875,
				["ZPos"] = -11.1544189453125,
				["radius"] = 14.069187323817857,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["C"] = {
				["XPos"] = 45.792236328125,
				["YPos"] = 0.99176025390625,
				["ZPos"] = 24.5516357421875,
				["radius"] = 10.115698111205642,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["D"] = {
				["XPos"] = -111.4366455078125,
				["YPos"] = -27.0543212890625,
				["ZPos"] = 16.12872314453125,
				["radius"] = 9.208619954808292,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --aethernet shard
				["cooldown"] = 6,
			},
			["FireplaceA"] = {--fireplace Forgotten Knight
				["XPos"] = 98.83374786376953,
				["YPos"] = 44.4697151184082,
				["ZPos"] = 15.137731552124023,
				["radius"] = 13,
				["toast"] = "",
				["BCO"] = true,
				["effects"] = {
					["hot"] = 0.337,
					["energized"] = 0.136,
					["uncomfortable"] = -0.036,
					["refreshed"] = 0.36,
				},
				["advert"] = "cold",
				["quirks"] = {
					["asswarmer"] = 0.90, --advert quirk and strength
				},
				["traits"] = {
					["coldblooded"] = 75,
				},
				["routine"] = "TempEmitterA",
				["cooldown"] = 7,
			},
		},
	},
	[813] = { -- Lakeland
		["name"] = "Lakeland",
		["cont"] = "Norvrandt",
		["beacon"] = {
			["A"] = {
				["XPos"] = -364.7454833984375,
				["YPos"] = -661.9771118164062,
				["ZPos"] = 103.94297790527344,
				["radius"] = 75,
				["toast"] = "",
				["effects"] = {
					["bathing"] = 15.00,
					["hot"] = 0.65,
					["cold"] = -0.95,
					["uncomfortable"] = -0.95,
					["tired"] = -0.55,
					["sleepy"] = 0.25,
					["wet"] = 0.25,
					["anxious"] = -0.25,
				},
			},
		},
	},
	[815] = { -- Amh Araeng
		["name"] = "Amh Araeng",
		["cont"] = "Norvrandt",
		["beacon"] = {
			["A"] = {
				["XPos"] = 34.53548812866211,
				["YPos"] = -602.1710815429688,
				["ZPos"] = 51.25920867919922,
				["radius"] = 15,
				["toast"] = "",
				["effects"] = {
					["curious"] = 10.35,
					["hot"] = 2.25,
					["sad"] = 0.25,
				},
			},
			["B"] = {
				["XPos"] = -1.367371916770935,
				["YPos"] = -533.4551391601562,
				["ZPos"] = 47.86063003540039,
				["radius"] = 10,
				["toast"] = "",
				["effects"] = {
					["sleepy"] = -5.35,
					["sad"] = 1.25,
				},
			},
		},
	},
	[816] = { -- Il Mheg
		["name"] = "Il Mheg",
		["cont"] = "Norvrandt",
		["beacon"] = {
			["A"] = {
				["XPos"] = -298.37493896484375,
				["YPos"] = 163.88636779785156,
				["ZPos"] = 2.2207987308502197,
				["radius"] = 90,
				["toast"] = "",
				["effects"] = {
					["refreshed"] = 10.35,
					["surprised"] = 0.25,
					["sad"] = -0.25,
				},
			},
			["B"] = {
				["XPos"] = -344.716552734375,
				["YPos"] = 512.2606201171875,
				["ZPos"] = 48.7220458984375,
				["radius"] = 19.031372010220405,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
		},
	},
	[958] = { -- Garlemald
		["name"] = "Garlemald",
		["cont"] = "Ilsabard",
		["beacon"] = {
			["A"] = {
				["XPos"] = 589.5508422851562,
				["YPos"] = 213.32196044921875,
				["ZPos"] = 38.37206268310547,
				["radius"] = 40,
				["toast"] = "",
				["effects"] = {
					["sad"] = 7.35,
					["tense"] = 3.25,
					["scared"] = 6.25,
				},
			},
			["B"] = {
				["XPos"] = -408.1025390625,
				["YPos"] = 479.972412109375,
				["ZPos"] = 24.155029296875,
				["radius"] = 14.617519952192461,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["C"] = {
				["XPos"] = 518.91357421875,
				["YPos"] = -178.36273193359375,
				["ZPos"] = -35.32470703125,
				["radius"] = 34.91898263418334,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
	
		},
	},
	[959] = { -- Mare Lamentorum
		["name"] = "Mare Lamentorum",
		["cont"] = "The Sea of Stars",
		["beacon"] = {
			["A"] = {
				["XPos"] = -384.09033203125,
				["YPos"] = 548.1334838867188,
				["ZPos"] = 169.00393676757812,
				["radius"] = 40,
				["toast"] = "",
				["effects"] = {
					["amazed"] = 7.35,
					["surprised"] = 3.25,
					["scared"] = 3.25,
				},
			},
			["B"] = {
				["XPos"] = -152.04005432128906,
				["YPos"] = -276.9374694824219,
				["ZPos"] = -49.1997184753418,
				["radius"] = 66,
				["toast"] = "",
				["effects"] = {
					["amused"] = 4.35,
					["social"] = 6.25,
					["confident"] = 3.25,
					["sad"] = -7.25,
					["happy"] = 7.5,
				},
			},
		},
	},
	[962] = { -- Old Sharlayan 
		["name"] = "Old Sharlayan",
		["cont"] = "The Northern Empty",
		["beacon"] = {
			["A"] = {
				["XPos"] = 0.07623291015625,
				["YPos"] = -0.10687255859375,
				["ZPos"] = 4.8065185546875,
				["radius"] = 13,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 13,
			},
			["B"] = {
				["XPos"] = 16.4949951171875,
				["YPos"] = 127.7332763671875,
				["ZPos"] = -16.2508544921875,
				["radius"] = 3.47,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				["routine"] = "AetherEffectB",
				["cooldown"] = 6.77,
			},
			["C"] = {
				["XPos"] = 204.791259765625,
				["YPos"] = -118.73046875,
				["ZPos"] = 21.77459716796875,
				["radius"] = 3.47,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
					["social"] = 0.15,
				},
				["routine"] = "AetherEffectB",
				["cooldown"] = 6.77,
				
			},
			["D"] = {
				["XPos"] = -291.15740966796875,
				["YPos"] = -74.14361572265625,
				["ZPos"] = 20.0045166015625,
				["radius"] = 3.47,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				["routine"] = "AetherEffectB",
				["cooldown"] = 3.47,
			},
			["E"] = {
				["XPos"] = -92.2103271484375,
				["YPos"] = 29.709228515625,
				["ZPos"] = 2.30401611328125,
				["radius"] = 3.47,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				["routine"] = "AetherEffectB",
				["cooldown"] = 6.77,
			},
			["F"] = {
				["XPos"] = 206.2255859375,
				["YPos"] = 13.77886962890625,
				["ZPos"] = 1.8463134765625,
				["radius"] = 3.47,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				["routine"] = "AetherEffectB",
				["cooldown"] = 6.77,
			},
			["G"] = {
				["XPos"] = -36.942138671875,
				["YPos"] = -156.6033935546875,
				["ZPos"] = 41.3671875,
				["radius"] = 3.47,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				["routine"] = "AetherEffectB",
				["cooldown"] = 6.77,
			},
			["Leves"] = {
				["XPos"] = 50.10653305053711,
				["YPos"] = 112.73020935058594,
				["ZPos"] = -15.646992683410645,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				--["routine"] = "AetherEffectnil", --stricken schoolgirl
				["cooldown"] = nil,
			},
			["JogPath1"] = {
				["XPos"] = 78.35990142822266,
				["YPos"] = 122.36045837402344,
				["ZPos"] = -16.246999740600586,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath2"] = {
				["XPos"] = 37.289710998535156,
				["YPos"] = 137.72000122070312,
				["ZPos"] = -16.246999740600586,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath3"] = {
				["XPos"] = 5.251493453979492,
				["YPos"] = 132.89295959472656,
				["ZPos"] = -16.246997833251953,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath4"] = {
				["XPos"] = -37.25642395019531,
				["YPos"] = 139.29022216796875,
				["ZPos"] = -16.246997833251953,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath5"] = {
				["XPos"] = -37.25642395019531,
				["YPos"] = 139.29022216796875,
				["ZPos"] = -16.246997833251953,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath6"] = {
				["XPos"] = -57.79412078857422,
				["YPos"] = 65.82161712646484,
				["ZPos"] = -9.294835090637207,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath7"] = {
				["XPos"] = -57.79412078857422,
				["YPos"] = 65.82161712646484,
				["ZPos"] = -9.294835090637207,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath8"] = {
				["XPos"] = -31.33031463623047,
				["YPos"] = 26.46314811706543,
				["ZPos"] = -4.844437122344971,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath9"] = {
				["XPos"] = -61.87937927246094,
				["YPos"] = 23.916902542114258,
				["ZPos"] = -1.40632164478302,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath10"] = {
				["XPos"] = -170.7211456298828,
				["YPos"] = 33.68532180786133,
				["ZPos"] = 6.9044294357299805,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath11"] = {
				["XPos"] = -226.67874145507812,
				["YPos"] = -11.635537147521973,
				["ZPos"] = 11.724714279174805,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath12"] = {
				["XPos"] = -211.0121307373047,
				["YPos"] = -39.202110290527344,
				["ZPos"] = 12.603632926940918,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath13"] = {
				["XPos"] = -190.8633270263672,
				["YPos"] = -80.87360382080078,
				["ZPos"] = 14.745412826538086,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath14"] = {
				["XPos"] = -164.48153686523438,
				["YPos"] = -127.71965789794922,
				["ZPos"] = 17.90117073059082,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath15"] = {
				["XPos"] = -126.5031967163086,
				["YPos"] = -148.3806610107422,
				["ZPos"] = 23.55072784423828,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath16"] = {
				["XPos"] = -126.5031967163086,--branch? 9.4, 8.4
				["YPos"] = -148.3806610107422,
				["ZPos"] = 23.55072784423828,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath17"] = {
				["XPos"] = -49.69776916503906, --branch
				["YPos"] = -145.33499145507812,
				["ZPos"] = 30.87784194946289,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath18"] = {
				["XPos"] = 0.021898068487644196,
				["YPos"] = -145.52464294433594,
				["ZPos"] = 41.37599182128906,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath19"] = {
				["XPos"] = 50.46018600463867, --branch
				["YPos"] = -145.39242553710938,
				["ZPos"] = 30.87784194946289,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath20"] = {
				["XPos"] = 50.46018600463867,--branch
				["YPos"] = -145.39242553710938,
				["ZPos"] = 30.87784194946289,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath21"] = {
				["XPos"] = 148.591796875,
				["YPos"] = -140.0069122314453,
				["ZPos"] = 18.858930587768555,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath22"] = {
				["XPos"] = 197.6991729736328,
				["YPos"] = -123.70048522949219,
				["ZPos"] = 21.845863342285156,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath23"] = {
				["XPos"] = 197.6991729736328,
				["YPos"] = -123.70048522949219,
				["ZPos"] = 21.845863342285156,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath24"] = {
				["XPos"] = 248.47972106933594,
				["YPos"] = -107.78518676757812,
				["ZPos"] = 20.234115600585938,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath25"] = {
				["XPos"] = 229.11868286132812,
				["YPos"] = 13.56991195678711,
				["ZPos"] = 1.8570687770843506,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath26"] = {
				["XPos"] = 194.73422241210938,
				["YPos"] = 16.57187271118164,
				["ZPos"] = 1.617638349533081,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath27"] = {
				["XPos"] = 135.46185302734375,
				["YPos"] = 16.44446563720703,
				["ZPos"] = 0.45163750648498535,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath28"] = {
				["XPos"] = 77.84455871582031,
				["YPos"] = 18.16759490966797,
				["ZPos"] = 1.16776442527771,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			["JogPath29"] = {
				["XPos"] = 77.45683288574219,
				["YPos"] = 64.85826873779297,
				["ZPos"] = -3.24483585357666,
				["radius"] = 1,
				["type"] = "marker",
				["found"] = true,
				["toast"] = "",
				["cooldown"] = nil,
			},
			
		},
	},
	[990] = { -- Andron
		["name"] = "Andron",
		["cont"] = "The Northern Empty",
		["beacon"] = {
			["A"] = {
				["XPos"] = 0.25707072019577026,
				["YPos"] = 5.604928016662598,
				["ZPos"] = 0,
				["radius"] = 15,
				["toast"] = "",
				["effects"] = {
					["anxious"] = -1.75,
					["social"] = -0.75,
				},
				["routine"] = "Beacon990A",
				["cooldown"] = 900,
			},
		},
	},
	[979] = { -- Empyreum
		["name"] = "Empyreum",
		["cont"] = "Coerthas",
		["beacon"] = {
			["hot-baths"] = {--hot baths
				["XPos"] = -530.839599609375,
				["YPos"] = -561.1777954101562,
				["ZPos"] = -18.067895889282227,
				["radius"] = 211,
				["toast"] = "",
				["BCO"] = true,
				["effects"] = {
					["hot"] = 0.337,
					["energized"] = 0.136,
					["uncomfortable"] = -0.036,
					["refreshed"] = 0.36,
				},
				["routine"] = "TempEmitterA",
				["cooldown"] = 7,
			},
		},
	},
	[1185] = { -- Tuliyollal
		["name"] = "Tuliyollal",
		["cont"] = "Yok Tural",
		["aetherytes"] = {"A","B","C","D","E","F","G","H"},
		["aetheryte"] = 1,
		["flags"] = {
			["A"] = {["X"] = 12.8, ["Y"] = 10.9},
			["B"] = {["X"] = 13.0, ["Y"] = 13.6},
			["C"] = {["X"] = 5.1, ["Y"] = 10.0},
			["D"] = {["X"] = 16.7, ["Y"] = 11.7},
			["E"] = {["X"] = 10.3, ["Y"] = 14.9},
			--On top of the ridge to the left, not the path downward.
			["F"] = {["X"] = 9.6, ["Y"] = 11.0},
			["G"] = {["X"] = 14.8, ["Y"] = 4.3},
			["H"] = {["X"] = 11.4, ["Y"] = 6.9},
			["I"] = {["X"] = 11.4, ["Y"] = 6.9},
		},
		["beacon"] = {
			["A"] = {
				["XPos"] = -24.093994140625,
				["YPos"] = 7.58367919921875,
				["ZPos"] = 0.7781982421875,
				["radius"] = 13,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
					["happy"] = 0.15,
				},
				["routine"] = "AetherEffectA",
				["cooldown"] = 13,
				
			},
			["B"] = {
				["XPos"] = -14.9996337890625,
				["YPos"] = 135.576416015625,
				["ZPos"] = -10.0252685546875,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 7,
			},
			["C"] = {
				["XPos"] = -413.6873779296875,
				["YPos"] = -45.9754638671875,
				["ZPos"] = 2.9754638671875,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 7,
			},
			["D"] = {
				["XPos"] = 166.2774658203125,
				["YPos"] = 38.74267578125,
				["ZPos"] = -17.99041748046875,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 7,
			},
			["E"] = {
				["XPos"] = -149.73681640625,
				["YPos"] = 198.9012451171875,
				["ZPos"] = -15.0301513671875,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 7,
			},
			["F"] = {
				["XPos"] = -187.12139892578125,
				["YPos"] = 6.08831787109375,
				["ZPos"] = 39.9327392578125,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 7,
			},
			["G"] = {
				["XPos"] = 71.793701171875,
				["YPos"] = -333.21124267578125,
				["ZPos"] = 47.0740966796875,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 7,
			},
			["H"] = {
				["XPos"] = -99.137939453125,
				["YPos"] = -222.0340576171875,
				["ZPos"] = 100.7247314453125,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 7,
			},
			["I"] = {
				["XPos"] = 71.793701171875,
				["YPos"] = -333.21124267578125,
				["ZPos"] = 47.0740966796875,
				["radius"] = 3.1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectB", --Aethernet shard
				["cooldown"] = 7,
			},
		},
		
	},
	[1186] = { -- Solution Nine
		["name"] = "Solution Nine",
		["cont"] = "Xak Tural",
		["beacon"] = {
			["A"] = {
				["XPos"] = -400.23687744140625,
				["YPos"] = 314.70452880859375,
				["ZPos"] = 31.499982833862305,
				["radius"] = 6.0,
				["toast"] = nil,
				["effects"] = {
					["flirty"] = 2.55,
					["hungry"] = 1.75,
					["playful"] = 1.55,
					["amused"] = 1.65,
				},
				["routine"] = "Beacon1186A",
				["cooldown"] = 60,
			},
			["B"] = {
				["XPos"] = -493.6727600097656,
				["YPos"] = 205.8501434326172,
				["ZPos"] = 31.499998092651367,
				["radius"] = 12,
				["toast"] = "The room is nice and cozy.",
				["effects"] = {
					["sleepy"] = -2.55,
					["energized"] = 1.75,
					["tense"] = -1.55,
					["uncomfortable"] = -1.65,
					["anxious"] = -1.55,
				},
				["msg"] = "You fall into a deep restful sleep.",
				["test"] = true,
				["func"] = function() 
					if IsSitting and lastEmote == "doze" then
						return true
					else
						return nil
					end
				end,
					
				--["routine"] = "Beacon1186B",
				["cooldown"] = 250,
			},
			["Nicci"] = {					--Nicci's S9 Apt. - Entrance
				["XPos"] = -156.17041015625,
				["YPos"] = 347.9184875488281,
				["ZPos"] = 1.6999962329864502,
				["radius"] = 3,
				["found"] = true, -- set to true to stop discovery actions
				["toast"] = "",
				--["msg"] = "You fall into a deep restful sleep.",
				--["test"] = true,
				["routine"] = "Beacon1186C",
				["cooldown"] = 600,
			},
			["Chloe"] = {					--Chloe's S9 Apt. - Entrance
				["XPos"] = -260.00146484375,
				["YPos"] = 367.80926513671875,
				["ZPos"] = 19.699996948242188,
				["radius"] = 3,
				["found"] = true, -- set to true to stop discovery actions
				["toast"] = "",
				--["msg"] = "You fall into a deep restful sleep.",
				--["test"] = true,
				--["routine"] = "Beacon1186D",
				["cooldown"] = 600,
			},
			["E"] = {
				["XPos"] = -0.01531982421875,
				["YPos"] = -0.01531982421875,
				["ZPos"] = 8.98748779296875,
				["radius"] = 23.268421620809484,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.17,
					["energized"] = 0.21,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
		},
	},
	
	[1187] = { -- Urqopacha
		["name"] = "Urqopacha",
		["cont"] = "Yok Tural",
		["confluences"] = {"AC1","AC2","AC3","AC4","AC5","AC6","AC7","AC8","AC9","AC10"},
		["curCur"] = 1,
		["flags"] = {
			["AC1"] = {["X"] = 29.5, ["Y"] = 26.7}, --( 29.5  , 26.7 )
			["AC2"] = {["X"] = 28.6, ["Y"] = 21.2},
			["AC3"] = {["X"] = 28.6, ["Y"] = 16.7},
			["AC4"] = {["X"] = 29.8, ["Y"] = 7.9},
			["AC5"] = {["X"] = 18.8, ["Y"] = 9.9},
			--On top of the ridge to the left, not the path downward.
			["AC6"] = {["X"] = 12.2, ["Y"] = 11.6},
			["AC7"] = {["X"] = 17.4, ["Y"] = 17.5},
			["AC8"] = {["X"] = 17.5, ["Y"] = 20.3},
			["AC9"] = {["X"] = 5.2, ["Y"] = 23.6},
			["AC10"] = {["X"] = 22.8, ["Y"] = 36.4},
		},
		["beacon"] = {
			["A"] = {
				["XPos"] = 332.967041015625,
				["YPos"] = -416.2203369140625,
				["ZPos"] = -160.11297607421875,
				["radius"] = 13,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 13,
			},
			["AC1"] = {
				["XPos"] = 407.2491455078125,
				["YPos"] = 261.49658203125,
				["ZPos"] = 90.50104522705078,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC2"] = {
				["XPos"] = 360.74163818359375,
				["YPos"] = -12.59311580657959,
				["ZPos"] = 61.144432067871094,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC3"] = {
				["XPos"] = 355.1184387207031,
				["YPos"] = -237.19647216796875,
				["ZPos"] = -108.49559020996094,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC4"] = {
				["XPos"] = 416.66802978515625,
				["YPos"] = -678.7735595703125,
				["ZPos"] = -140.6277313232422,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC5"] = {
				["XPos"] = -133.27101135253906,
				["YPos"] = -575.3302001953125,
				["ZPos"] = -93.90792846679688,
				["radius"] = 40,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC6"] = {
				["XPos"] = -472.6809997558594,
				["YPos"] = -493.8972473144531,
				["ZPos"] = -27.727705001831055,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC7"] = {
				["XPos"] = -204.86851501464844,
				["YPos"] = -199.9300994873047,
				["ZPos"] = -71.2145767211914,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC8"] = {
				["XPos"] = -194.1337432861328,
				["YPos"] = -56.018470764160156,
				["ZPos"] = 23.06016731262207,
				["radius"] = 5,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC9"] = {
				["XPos"] = -813.6065063476562,
				["YPos"] = 104.776123046875,
				["ZPos"] = 57.814796447753906,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC10"] = {
				["XPos"] = 91.95034790039062,
				["YPos"] = 743.1851196289062,
				["ZPos"] = 14.14731216430664,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
		},
	},
	
	[1188] = { -- Kozama'uka
		["name"] = "Kozama'uka",
		["cont"] = "Yok Tural",
		["beacon"] = {
			["A"] = {
				["XPos"] = -487.08355712890625,
				["YPos"] = -150.3893585205078,
				["ZPos"] = 0.787351131439209,
				["radius"] = 65.0,
				["toast"] = "",
				["effects"] = {
					["amazed"] = 2.75,
					["energized"] = 1.15,
					["playful"] = 0.55,
					["amused"] = 1.25,
				},
				["cooldown"] = 19,
			},
			["B"] = {
				["XPos"] = 4.659569263458252,
				["YPos"] = 462.6023864746094,
				["ZPos"] = 121.5,
				["radius"] = 55.0,
				["toast"] = "",
				["effects"] = {
					["amazed"] = 2.75,
					["energized"] = 1.15,
					["playful"] = 0.55,
					["focused"] = 1.25,
				},
				["cooldown"] = 19,
			},
			["C"] = {
				["XPos"] = -305.041748046875,
				["YPos"] = 689.506591796875,
				["ZPos"] = 113.22848510742188,
				["radius"] = 45.0,
				["toast"] = "",
				["effects"] = {
					["curious"] = 2.50,
					["sad"] = 1.15,
					["responsible"] = 1.55,
				},
				["cooldown"] = 19,
			},
			["D"] = {
				["XPos"] = -169.51251220703125,
				["YPos"] = -479.4232177734375,
				["ZPos"] = 6.57659912109375,
				["radius"] = 13,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["E"] = {
				["XPos"] = -477.5311279296875,
				["YPos"] = 311.329833984375,
				["ZPos"] = 124.04052734375,
				["radius"] = 38.63869132865199,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["F"] = {
				["XPos"] = 541.1612548828125,
				["YPos"] = 203.60107421875,
				["ZPos"] = 117.4180908203125,
				["radius"] = 39.39,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["G"] = {
				["XPos"] = 744.1976318359375,
				["YPos"] = -199.176025390625,
				["ZPos"] = 15.431514739990234,
				["radius"] = 19.00,
				["toast"] = "",
				["effects"] = {
					["hungry"] = 0.35,
					["social"] = 0.15,
				},
				["routine"] = "EatFood", --wawkesa
				["cooldown"] = 19,
			},
	
	
	
	
	
		},
	},
	
	[1189] = { -- Yak T'el
		["name"] = "Yak T'el",
		["cont"] = "Yok Tural",
		["confluences"] = {"AC1","AC3","AC2","AC4","AC8","AC7","AC5","AC6","AC9","AC10"},
		["curCur"] = 1,
		["flags"] = {
			["AC1"] = {["X"] = 10.4, ["Y"] = 18.7},
			["AC2"] = {["X"] = 19.1, ["Y"] = 10.9},
			["AC3"] = {["X"] = 17.5, ["Y"] = 6.7},
			["AC4"] = {["X"] = 29.7, ["Y"] = 10.5},
			["AC5"] = {["X"] = 33.6, ["Y"] = 26.1},
			--On top of the ridge to the left, not the path downward.
			["AC6"] = {["X"] = 36.4, ["Y"] = 35.7},
			["AC7"] = {["X"] = 25.5, ["Y"] = 24.6},
			["AC8"] = {["X"] = 22.2, ["Y"] = 21.4},
			["AC9"] = {["X"] = 19.1, ["Y"] = 33.9},
			["AC10"] = {["X"] = 7.9, ["Y"] = 26.2},
		},
		["beacon"] = {
			["A"] = {
				["XPos"] = -397.0550537109375,
				["YPos"] = -431.9371337890625,
				["ZPos"] = 23.51409912109375,
				["radius"] = 16.204640173005497,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["B"] = {
				["XPos"] = 721.4007568359375,
				["YPos"] = 526.1768798828125,
				["ZPos"] = -132.31103515625,
				["radius"] = 13,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 7.77,
					["hot"] = 0.25,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["AC1"] = {
				["XPos"] = -554.6737060546875,
				["YPos"] = -139.4314422607422,
				["ZPos"] = -4.082655429840088,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC2"] = {
				["XPos"] = -116.26094818115234,
				["YPos"] = -527.4476928710938,
				["ZPos"] = 5.971410751342773,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC3"] = {
				["XPos"] = -185.65655517578125,
				["YPos"] = -753.0174560546875,
				["ZPos"] = 22.99680519104004,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC4"] = {
				["XPos"] = 414.4532165527344,
				["YPos"] = -547.5989990234375,
				["ZPos"] = 15.32411003112793,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC5"] = {
				["XPos"] = 597.8472900390625,
				["YPos"] = 226.8759307861328,
				["ZPos"] = 15.004234313964844,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC6"] = {
				["XPos"] = 749.994140625,
				["YPos"] = 708.9240112304688,
				["ZPos"] = -175.45574951171875,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC7"] = {
				["XPos"] = 199.9032745361328,
				["YPos"] = 151.9757843017578,
				["ZPos"] = -191.8255157470703,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC8"] = {
				["XPos"] = 36.60440444946289,
				["YPos"] = -6.673469543457031,
				["ZPos"] = -158.41879272460938,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC9"] = {
				["XPos"] = -116.34539031982422,
				["YPos"] = 612.611572265625,
				["ZPos"] = -209.59690856933594,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC10"] = {
				["XPos"] = -683.73193359375,
				["YPos"] = 231.75071716308594,
				["ZPos"] = -162.23843383789062,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
		},
	},
	
	[1190] = { -- Shaaloani
		["name"] = "Shaaloani",
		["cont"] = "Xak Tural",
		["confluences"] = {"AC1","AC2","AC3","AC4","AC5","AC6","AC7","AC8","AC9","AC10"},
		["curCur"] = 1,
		["flags"] = {
			["AC1"] = {["X"] = 9.4, ["Y"] = 14.4},
			["AC2"] = {["X"] = 7.2, ["Y"] = 9.8},
			["AC3"] = {["X"] = 9.0, ["Y"] = 27.9},
			["AC4"] = {["X"] = 17.6, ["Y"] = 20.4},
			["AC5"] = {["X"] = 33.6, ["Y"] = 26.1},
			--On top of the ridge to the left, not the path downward.
			["AC6"] = {["X"] = 36.4, ["Y"] = 35.7},
			["AC7"] = {["X"] = 25.5, ["Y"] = 24.6},
			["AC8"] = {["X"] = 22.2, ["Y"] = 21.4},
			["AC9"] = {["X"] = 19.1, ["Y"] = 33.9},
			["AC10"] = {["X"] = 7.9, ["Y"] = 26.2},
		},
		["beacon"] = {
			["A"] = {
				["XPos"] = 372.1981201171875,
				["YPos"] = 427.2754821777344,
				["ZPos"] = 6.757257461547852,
				["radius"] = 8,
				["toast"] = "",
				["effects"] = {
					["happy"] = 0.55,
					["hungry"] = 0.75,
					["playful"] = 0.55,
					["amused"] = 0.65,
				},
				["routine"] = "Beacon1190A",
				["cooldown"] = 60,
			},
			["AC1"] = {
				["XPos"] = -621.2010498046875,
				["YPos"] = -348.898193359375,
				["ZPos"] = 37.278472900390625,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC2"] = {
				["XPos"] = -709.8880004882812,
				["YPos"] = -75.08415222167969,
				["ZPos"] = 33.77627182006836,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC3"] = {
				["XPos"] = -639.0242309570312,
				["YPos"] = 329.31121826171875,
				["ZPos"] = -10.056268692016602,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC4"] = {
				["XPos"] = -191.21759033203125,
				["YPos"] = -53.850074768066406,
				["ZPos"] = 36.77946472167969,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC5"] = {
				["XPos"] = -63.56078338623047,
				["YPos"] = -176.34686279296875,
				["ZPos"] = 18.588455200195312,
				["radius"] = 40,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC6"] = {
				["XPos"] = 184.4749755859375,
				["YPos"] = -60.021976470947266,
				["ZPos"] = 11.938735008239746,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC7"] = {
				["XPos"] = 381.19403076171875,
				["YPos"] = -507.75726318359375,
				["ZPos"] = -16.957077026367188,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC8"] = {
				["XPos"] = 613.8323364257812,
				["YPos"] = -429.83587646484375,
				["ZPos"] = -17.01848793029785,
				["radius"] = 5,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC9"] = {
				["XPos"] = 647.9656982421875,
				["YPos"] = 79.24278259277344,
				["ZPos"] = 18.482131958007812,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC10"] = {
				["XPos"] = 293.6936950683594,
				["YPos"] = 504.6862487792969,
				["ZPos"] = 2.3910062313079834,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -1.55,
					["bathing"] = 3.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["L"] = {
				["XPos"] = 311.3602294921875,
				["YPos"] = -567.742431640625,
				["ZPos"] = -14.1756591796875,
				["radius"] = 25.16088736112916,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
			["M"] = {
				["XPos"] = -291.70672607421875,
				["YPos"] = -114.549560546875,
				["ZPos"] = 19.0889892578125,
				["radius"] = 24.670193415241624,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 9,
			},
	
	
		},
	},
	
	[1191] = { -- Heritage Found
		["name"] = "Heritage Found",
		["cont"] = "Xak Tural",
		["confluences"] = {"AC1","AC2","AC3","AC4","AC5","AC6","AC7","AC8","AC9","AC10"},
		["curCur"] = 1,
		["flags"] = {
			["AC1"] = {["X"] = 9.4, ["Y"] = 14.4},
			["AC2"] = {["X"] = 7.2, ["Y"] = 9.8},
			["AC3"] = {["X"] = 9.0, ["Y"] = 27.9},
			["AC4"] = {["X"] = 17.6, ["Y"] = 20.4},
			["AC5"] = {["X"] = 33.6, ["Y"] = 26.1},
			--On top of the ridge to the left, not the path downward.
			["AC6"] = {["X"] = 36.4, ["Y"] = 35.7},
			["AC7"] = {["X"] = 25.5, ["Y"] = 24.6},
			["AC8"] = {["X"] = 22.2, ["Y"] = 21.4},
			["AC9"] = {["X"] = 19.1, ["Y"] = 33.9},
			["AC10"] = {["X"] = 7.9, ["Y"] = 26.2},
		},
		["beacon"] = {
			["AC1"] = {
				["XPos"] = -579.935791015625,
				["YPos"] = -464.51751708984375,
				["ZPos"] = 21.37920379638672,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC2"] = {
				["XPos"] = -281.7948303222656,
				["YPos"] = -264.115478515625,
				["ZPos"] = 60.08393859863281,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC3"] = {
				["XPos"] = -600.436279296875,
				["YPos"] = 267.6034851074219,
				["ZPos"] = 2.1964163780212402,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC4"] = {
				["XPos"] = -12.08029556274414,
				["YPos"] = 343.15301513671875,
				["ZPos"] = 71.64203643798828,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC5"] = {
				["XPos"] = -457.34521484375,
				["YPos"] = 692.8683471679688,
				["ZPos"] = -13.514322280883789,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC6"] = {
				["XPos"] = 214.6072540283203,
				["YPos"] = -663.5757446289062,
				["ZPos"] = 56.65239715576172,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC7"] = {
				["XPos"] = 703.3436889648438,
				["YPos"] = -502.6337890625,
				["ZPos"] = 140.04974365234375,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC8"] = {
				["XPos"] = 610.7098388671875,
				["YPos"] = -204.61326599121094,
				["ZPos"] = 128.39537048339844,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC9"] = {
				["XPos"] = 74.0582275390625,
				["YPos"] = -133.95973205566406,
				["ZPos"] = 93.8290023803711,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC10"] = {
				["XPos"] = 407.69970703125,
				["YPos"] = 223.55702209472656,
				["ZPos"] = 145.5255889892578,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
		},
	},
	
	[1192] = { -- Living Memory
		["name"] = "Heritage Found",
		["cont"] = "Xak Tural",
		["confluences"] = {"AC4","AC5","AC2","AC6","AC6B","AC6C","AC8","AC9","AC7","AC10","AC1","AC3"},
		["curCur"] = 1,
		["flags"] = {
			["AC1"] = {["X"] = 7.5, ["Y"] = 30.9},
			["AC2"] = {["X"] = 36.5, ["Y"] = 28.4},
			["AC3"] = {["X"] = 11.1, ["Y"] = 35.1},
			["AC4"] = {["X"] = 26.1, ["Y"] = 32.3},
			["AC5"] = {["X"] = 33.9, ["Y"] = 34.2},
			["AC6"] = {["X"] = 29.1, ["Y"] = 11.0},
			["AC6B"] = {["X"] = 31.6, ["Y"] = 8.4},
			["AC7"] = {["X"] = 10.2, ["Y"] = 11.3},
			["AC8"] = {["X"] = 27.5, ["Y"] = 10.0},
			["AC9"] = {["X"] = 24.8, ["Y"] = 15.3},
			["AC10"] = {["X"] = 11.8, ["Y"] = 20.4},
		},
		["beacon"] = {
			["AC1"] = {
				["XPos"] = -666.2203979492188,
				["YPos"] = 443.5352783203125,
				["ZPos"] = 0.05000019073486328,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC2"] = {
				["XPos"] = 739.7014770507812,
				["YPos"] = 336.39801025390625,
				["ZPos"] = 46.89213180541992,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC3"] = {
				["XPos"] = -519.1686401367188,
				["YPos"] = 672.7710571289062,
				["ZPos"] = 0.04999995231628418,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC4"] = {
				["XPos"] = 225.13031005859375,
				["YPos"] = 564.0449829101562,
				["ZPos"] = 0.000507354736328125,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC5"] = {
				["XPos"] = 616.5938720703125,
				["YPos"] = 628.2691040039062,
				["ZPos"] = 9.022848129272461,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC6"] = { -- pathfinding may fail on this one
				["XPos"] = 380.71868896484375,
				["YPos"] = -523.7406005859375,
				["ZPos"] = 101.06880950927734,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC6B"] = { -- pathfinding may fail on this one
				["XPos"] = 484.7375183105469,
				["YPos"] = -693.134765625,
				["ZPos"] = 44.31113815307617,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC6C"] = { -- pathfinding may fail on this one
				["XPos"] = 443.24664306640625,
				["YPos"] = -693.8435668945312,
				["ZPos"] = 85.28944396972656,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC7"] = {
				["XPos"] = -564.1216430664062,
				["YPos"] = -503.6033020019531,
				["ZPos"] = -6.000450134277344,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC8"] = {
				["XPos"] = 299.9405517578125,
				["YPos"] = -569.0748901367188,
				["ZPos"] = 52.330665588378906,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC9"] = {
				["XPos"] = 155.3379669189453,
				["YPos"] = -303.1348876953125,
				["ZPos"] = 28.323522567749023,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
			["AC10"] = {
				["XPos"] = -489.47100830078125,
				["YPos"] = -51.87343978881836,
				["ZPos"] = 38,
				["radius"] = 50,
				["confluence"] = true,
				["toast"] = "You sense a nearby aether confluence.",
				["effects"] = {
					["energized"] = -3.55,
					["hungry"] = 0.75,
				},
				--["routine"] = "Beacon1190A",
				["cooldown"] = 90,
			},
		},
	},
	
	[1237] = { -- Sinus Ardorum
		["name"] = "Sinus Ardorum",
		["cont"] = "Moon",
		["beacon"] = {
			["temp-emitter"] = {--hot baths
				["XPos"] = -7.10913610458374,
				["YPos"] = -8.8740234375,
				["ZPos"] = -3.337860107421875E-06,
				["radius"] = 139,
				["toast"] = "",
				["BCO"] = true,
				["effects"] = {
					["hot"] = 0.1337,
					["energized"] = 0.136,
					["uncomfortable"] = -0.036,
					["refreshed"] = 0.77,
				},
				["routine"] = "TempEmitterB",
				["cooldown"] = 7,
			},
			["base"] = {
				["XPos"] = -7.10913610458374,
				["YPos"] = -8.8740234375,
				["ZPos"] = -3.337860107421875E-06,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 50,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 6.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the moon rabbit base.",
				["effects"] = {
					["happy"] = -0.017,
					--["energized"] = 1.55,
				},
				["routine"] = "moonrabbitbase",
				["cooldown"] = 13,
			},
			["N"] = {
				["XPos"] = -0.015079972334206104,
				["YPos"] = -399.9093322753906,
				["ZPos"] = 38.54999542236328,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 12,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 3.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the North waypoint.",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = 90,
			},
			["NW"] = {
				["XPos"] = -280.4397277832031,
				["YPos"] = -280.4584045410156,
				["ZPos"] = 34.54999923706055,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 10.5,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 3.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the North-West segment of the moon rabbits' juju-zipper wheel.",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = 90,
			},
			["W"] = {
				["XPos"] = -400.0287780761719,
				["YPos"] = 0.1315702646970749,
				["ZPos"] = 36.54999923706055,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 9,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 3.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the Western point of the moon rabbits' juju-zipper wheel.",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = 90,
			},
			["SW"] = {
				["XPos"] = -280.0874938964844,
				["YPos"] = 279.9035949707031,
				["ZPos"] = 29.549999237060547,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 7.11,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 3.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the South-Western point of the moon rabbits' juju-zipper wheel.",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = 90,
			},
			["S"] = {
				["XPos"] = -0.033899787813425064,
				["YPos"] = 400.0325622558594,
				["ZPos"] = 35.54999923706055,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 6,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 3.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the Southern point of the moon rabbits' juju-zipper wheel.",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = 90,
			},
			["SE"] = {
				["XPos"] = 280.02691650390625,
				["YPos"] = 280.0683288574219,
				["ZPos"] = 25.549997329711914,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 4.5,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 3.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the South-Eastern segment of the moon rabbits' juju-zipper wheel.",
				["effects"] = {
					["aetheric"] = 0.15,
					["energized"] = 0.15,
				},
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = 90,
			},
			["E"] = {
				["XPos"] = 400.0033874511719,
				["YPos"] = -0.624165415763855,
				["ZPos"] = 40.54999923706055,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 3.14,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 3.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the Eastern point on the moon rabbits' juju-zipper wheel.",
				["effects"] = {
					["aetheric"] = 0.314,
					["energized"] = 0.314,
				},
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = 90,
			},
			["NE"] = {
				["XPos"] = 294.46124267578125,
				["YPos"] = -293.1747741699219,
				["ZPos"] = 41.04998779296875,
				["type"] = "marker",
				["test"] = true,
				["radius"] = 1.5,
				["toasted"] = 1,
				["lastToast"] = 0,
				["toastWait"] = 3.99,
				["lastCall"] = 0,
				--["confluence"] = true,
				["toast"] = "This is the North-East point on the moon rabbits' juju-zipper wheel.",
				["effects"] = {
					["aetheric"] = 0.314,
					["energized"] = 0.314,
				},
				--["routine"] = "AetherEffectnil", --sandy skittles
				["cooldown"] = 15,
			},
		},
	},
	
	[1249] = { -- Private Cottage - Mist
		["name"] = "Private Cottage - Mist",
		["cont"] = "La Noscea",
		["beacon"] = {
			["JujuBubble"] = {
				["XPos"] = -0.01922994665801525,
				["YPos"] = 3.981386184692383,
				["ZPos"] = -6.956051826477051,
				["radius"] = 1,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.35,
					["energized"] = 0.25,
				},
				["routine"] = "jujububble", --sandy skittles
				["cooldown"] = 133,
			},
		},
	},
	
	[1252] = { -- Occult Crescent - South Horn
		["name"] = "South Horn",
		["cont"] = "Occult Crescent",
		["coffers"] = {"cofferA","cofferB", "cofferC","cofferD", "cofferE","cofferF", "cofferG","cofferH",
					   "cofferI","cofferJ", "cofferK","cofferL", "cofferM","cofferN", "cofferO","cofferP",
					   "cofferQ","cofferR", "cofferS","cofferT", "cofferU"},
		["pois"] = {},
		["flags"] = {
			["cofferA"] = {["X"] = 28.5, ["Y"] = 15.7},
			["cofferB"] = {["X"] = 12.5, ["Y"] = 22.0},
			["cofferC"] = {["X"] = 18.3, ["Y"] = 18.8},
			["cofferD"] = {["X"] = 13.4, ["Y"] = 28.1},
			["cofferE"] = {["X"] = 22.5, ["Y"] = 15.6},
			--On top of the ridge to the left, not the path downward.
			["cofferF"] = {["X"] = 21.6, ["Y"] = 30.0},
			["cofferG"] = {["X"] = 37.2, ["Y"] = 23.6},
			["cofferH"] = {["X"] = 11.4, ["Y"] = 6.9},
			["cofferJ"] = {["X"] = 27.3, ["Y"] = 34.2},
			["cofferK"] = {["X"] = 38.1, ["Y"] = 35.4},
			
		},
		["beacon"] = {
			["A"] = {
				["XPos"] = 830.746826171875,
				["YPos"] = -695.979248046875,
				["ZPos"] = 72.98388671875,
				["radius"] = 9.111,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
					["playful"] = 0.35,
				},
				["routine"] = "AetherEffectA", --aetheryte
				["cooldown"] = 13,
			},
			["Eldergrowth"] = {
				["XPos"] = 306.9351806640625,
				["YPos"] = 305.6534423828125,
				["ZPos"] = 105.180419921875,
				["radius"] = 5.299255223780213,
				["toast"] = "",
				["effects"] = {
					["aetheric"] = 0.35,
					["energized"] = 0.25,
					["bored"] = -4.44,
				},
				["routine"] = "AetherEffectF", --aetheryte
				["cooldown"] = 27,
			},
			["Stonemarsh"] = {
				["XPos"] = -384.11541748046875,
				["YPos"] = 281.422119140625,
				["ZPos"] = 99.1988525390625,
				["radius"] = 6.93,
				["toast"] = "",
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
					["focused"] = -11.11,
					["anxious"] = -7.7,
				},
				["routine"] = "AetherEffectF", --aetheryte shard
				["cooldown"] = 27,
			},
			["D"] = {
				["XPos"] = -358.14453125,
				["YPos"] = -120.95831298828125,
				["ZPos"] = 101.9759521484375,
				["radius"] = 4.44,
				["toast"] = "",
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
					["bored"] = -11.11,
					["sleepy"] = -4.4,
				},
				["routine"] = "AetherEffectF", --aetheryte shard
				["cooldown"] = 27,
			},
			["WanderersHaven"] = {
				["XPos"] = -173.02203369140625,
				["YPos"] = -611.1390991210938,
				["ZPos"] = 8.19403076171875,
				["radius"] = 4.44,
				["toast"] = "",
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
					["bored"] = -11.11,
					["sleepy"] = -4.4,
				},
				["routine"] = "AetherEffectF", --aetheryte shard
				["cooldown"] = 27,
			},
			["S9"] = {
				["XPos"] = -60.827980041503906,
				["YPos"] = -458.9604797363281,
				["ZPos"] = 30.60017967224121,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "AetherEffectS", --aetheryte shard
				["cooldown"] = 44,
			},
			["S13"] = {
				["XPos"] = -563.0547485351562,
				["YPos"] = 50.48027420043945,
				["ZPos"] = 121.27791595458984,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "AetherEffectS", --aetheryte shard
				["cooldown"] = 44,
			},
			["S15"] = {
				["XPos"] = 157.63412475585938,
				["YPos"] = 566.3771362304688,
				["ZPos"] = 68.14360046386719,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "AetherEffectS", --aetheryte shard
				["cooldown"] = 44,
			},
			["AetherImbuedStone"] = {
				["XPos"] = 888.1207275390625,
				["YPos"] = -150.560791015625,
				["ZPos"] = 108.07958984375,
				["radius"] = 13,
				["toast"] = "",
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.05,
					["energized"] = 0.05,
					["bored"] = -13,
					["hungry"] = -1.1,
				},
				["routine"] = "AetherEffectX", --aetheryte shard
				["cooldown"] = 33,
			},
			["cofferA"] = {
				["XPos"] = 354.1160888671875,
				["YPos"] = -288.92962646484375,
				["ZPos"] = 95.65869140625,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferB"] = {
				["XPos"] = -444.11383056640625,
				["YPos"] = 26.230224609375,
				["ZPos"] = 90.684326171875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferC"] = {
				["XPos"] = -158.6480712890625,
				["YPos"] = -132.73828125,
				["ZPos"] = 98.6190185546875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferD"] = {
				["XPos"] = -401.66326904296875,
				["YPos"] = 332.539794921875,
				["ZPos"] = 85.0384521484375,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferE"] = {
				["XPos"] = 55.283447265625,
				["YPos"] = -289.08221435546875,
				["ZPos"] = 111.314453125,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferF"] = {
				["XPos"] = 8.98748779296875,
				["YPos"] = 426.962646484375,
				["ZPos"] = 103.1966552734375,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferG"] = {
				["XPos"] = 788.8760986328125,
				["YPos"] = 109.391845703125,
				["ZPos"] = 120.3782958984375,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferH"] = {
				["XPos"] = 277.7904052734375,
				["YPos"] = 241.9012451171875,
				["ZPos"] = 103.7764892578125,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferI"] = {
				["XPos"] = 666.5291748046875,
				["YPos"] = -480.36932373046875,
				["ZPos"] = 79.117919921875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferJ"] = {
				["XPos"] = 256.1531982421875,
				["YPos"] = 492.36279296875,
				["ZPos"] = 73.1668701171875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferK"] = {
				["XPos"] = 835.0804443359375,
				["YPos"] = 699.092041015625,
				["ZPos"] = 69.9930419921875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferL"] = {
				["XPos"] = 642.9693603515625,
				["YPos"] = 407.79736328125,
				["ZPos"] = 69.9930419921875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferM"] = {
				["XPos"] = 726.2835693359375,
				["YPos"] = -67.91790771484375,
				["ZPos"] = 108.140625,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferN"] = {
				["XPos"] = 726.2835693359375,
				["YPos"] = -67.91790771484375,
				["ZPos"] = 108.140625,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferO"] = {
				["XPos"] = -648.0048828125,
				["YPos"] = 403.9520263671875,
				["ZPos"] = 74.998046875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferP"] = {
				["XPos"] = 256.1531982421875,
				["YPos"] = 492.36279296875,
				["ZPos"] = 73.1668701171875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferQ"] = {
				["XPos"] = -140.45928955078125,
				["YPos"] = -414.2672119140625,
				["ZPos"] = 22.35443115234375,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferR"] = {
				["XPos"] = 609.613037109375,
				["YPos"] = 117.2655029296875,
				["ZPos"] = 107.988037109375,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferS"] = {
				["XPos"] = 475.73046875,
				["YPos"] = -87.08331298828125,
				["ZPos"] = 95.994384765625,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferT"] = {
				["XPos"] = -158.6480712890625,
				["YPos"] = -132.73828125,
				["ZPos"] = 98.6190185546875,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferU"] = {
				["XPos"] = 354.1160888671875,
				["YPos"] = -288.92962646484375,
				["ZPos"] = 95.65869140625,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferV"] = {
				["XPos"] = 277.53338623046875,
				["YPos"] = 242.39520263671875,
				["ZPos"] = 103.85517883300781,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
			["cofferW"] = {
				["XPos"] = 143.71267700195312,
				["YPos"] = -574.2562255859375,
				["ZPos"] = 16.32187843322754,
				["radius"] = 3,
				["test"] = true,
				["effects"] = {
					["aetheric"] = 0.44,
					["energized"] = 0.33,
					["puzzled"] = 4,
					["curious"] = 1.1,
				},
				["routine"] = "cofferhelper", --cofferhelper
				["cooldown"] = 77,
			},
		},
	},
}

function LoadBeacons()
	local map = Game.Player.MapZone
	if beacons[map] then
		return beacons[map].beacon
	end
end

return {beacons, LoadBeacons}