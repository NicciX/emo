--Outfit Stuff

local glams = {
	-- general values
	-- undergarments / lingerie - 0.05 - 0.25
	-- shorts - 0.25 - 0.35
	["Aetherial Linen Tights"] = {
		["slot"] = "legs",
		["temp"] = 0.22,
	},
	["Arcanaut's Robe of Healing"] = {
		["slot"] = "body",
		["temp"] = 1.55,
		["tags"] = {
			["robe"] = true,
			["dress"] = true,
		},
	},
	["Augmented Quetzalli Visor of Aiming"] = {
		["slot"] = "head",
		["temp"] = 0.17,
		["tags"] = {
			["accessory"] = true,
			["mask"] = true,
		},
	},
	["Boulevardier's Ruffled Pantaloons"] = {
		["slot"] = "legs",
		["temp"] = 0.66,
		["tags"] = {
			["goucho"] = true,
			["pants"] = true,
		},
		["type"] = "pants",
	},
	["Bouncer's Holster Vest"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Bridesmaid's Tights"] = {
		["slot"] = "legs",
		["temp"] = 0.27,
		["tags"] = {
			["lingerie"] = true,
			["underwear"] = true,
			["panties"] = true,
			["stockings"] = true,
		},
	},
	["Bunny Chief Tights"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Cactuar Pajama Shirt"] = {
		["slot"] = "body",
		["temp"] = 0.47,
		["tags"] = {
			["bodysuit"] = true,
		},
	},
	["Calfskin Rider's Jacket"] = {
		["slot"] = "body",
		["temp"] = 1.11,
	},
	["Calfskin Rider's Shoes"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Casual Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.27,
	},
	["Claws of the Beast"] = {
		["slot"] = "hands",
		["temp"] = 0.07,
		["tags"] = {
			["nails"] = true,
			["accessory"] = true,
		},
	},
	["Company Hat"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Company Tabard"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Cotton Tights"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Craftsman's Apron"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Dalmascan Leather Shoes"] = {
		["slot"] = "feet",
		["temp"] = 0.12,
	},
	["Demonic Slops"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Demonic Thighboots"] = {
		["slot"] = "feet",
		["temp"] = 0.66,
		["tags"] = {
			["boots"] = 1,
			["thighboots"] = 2,
		},
	},
	["Dirndl's Hat"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Dirndl's Pumps"] = {
		["slot"] = "feet",
		["temp"] = 0.23,
		["tags"] = {
			["heels"] = 1,
			["dolly"] = 2,
			["pumps"] = 2,
			["mary janes"] = 1.5,
		},
	},
	["Dirndl's Wrist Torque"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Endless Summer Top"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Faire Joi"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["False Nails"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Far Eastern Lady Errant's Skirt"] = {
		["slot"] = "legs",
		["temp"] = 0.44,
	},
	["Far Eastern Maiden's Bottoms"] = {
		["slot"] = "legs",
		["temp"] = 0.51,
	},
	["Far Eastern Matriarch's Dress"] = {
		["slot"] = "body",
		["temp"] = 1.11,
	},
	["Far Eastern Matriarch's Sun Hat"] = {
		["slot"] = "head",
		["temp"] = 0.21,
		["tags"] = {
			["hat"] = true,
			["festive"] = true,
			["gaudy"] = true,
		},
	},
	["Far Eastern Schoolgirl's Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Far Eastern Schoolgirl's Hair Ribbon"] = {
		["slot"] = "head",
		["temp"] = 0.14,
		["tags"] = {
			["ribbon"] = true,
			["accessory"] = true,
		},
	},
	["Far Eastern Socialite's Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.21,
		["tags"] = {
			["heels"] = true,
			["booties"] = true,
		},
	},
	["Far Eastern Socialite's Gloves"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Fat Cat Shorts"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Felicitous Hood"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Free Spirit's Cropped Slops"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Free Spirit's Hat"] = {
		["slot"] = "head",
		["temp"] = 0.23,
	},
	["Free Spirit's Ringbands"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Frontier Pumps"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Frontier Shoes"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Gentlebean Parka"] = {
		["slot"] = "body",
		["temp"] = 0.88,
	},
	["Gentlebean Shoes"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Glade Slops"] = {
		["slot"] = "legs",
		["temp"] = 0.69,
	},
	["Hannish Wool Autumn Shirt"] = {
		["slot"] = "body",
		["temp"] = 0.99,
	},
	["Hempen Camise"] = {
		["slot"] = "body",
		["temp"] = 0.15,
	},
	["High House Breeches"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["High House Halfboots"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Hooded Fireglass Leather Vest"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Hraesvelgr Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Hypostatic Hairpin of Aiming"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Hypostatic Tunic of Aiming"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Hyuran Skirt"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Inferno Jacket"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Isle Explorer's Shirt"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Isle Farmhand's Cotton Gloves"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Isle Farmhand's Cutoffs"] = {
		["slot"] = "legs",
		["temp"] = 0.33,
	},
	["Isle Vacationer's Sandals"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Isle Vacationer's Tanga"] = {
		["slot"] = "legs",
		["temp"] = 0.033,
	},
	["Isle Vacationer's Visor"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Isle Vacationer's Wrist Torques"] = {
		["slot"] = "hands",
		["temp"] = 0.15,
		["tags"] = {
			["accessory"] = true,
		},
	},
	["Kupo Jacket"] = {
		["slot"] = "body",
		["temp"] = 0.44,
	},
	["Lady's Knickers (Black)"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
		["tags"] = {
			["underwear"] = 1,
			["booty shorts"] = 2,
			["shorts"] = 1,
			["panties"] = 1,
			["cool"] = 1,
		},
	},
	["Leonhart Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.33,
	},
	["Lix Hose"] = {
		["slot"] = "legs",
		["temp"] = 0.33,
	},
	["Loose Fit Overshirt"] = {
		["slot"] = "body",
		["temp"] = 0.49,
	},
	["Loyal Housemaid's Apron Dress"] = {
		["slot"] = "body",
		["temp"] = 1.33,
		["tags"] = {
			["warm"] = true,
			["dress"] = true,
		},
	},
	["Loyal Housemaid's Bloomers"] = {
		["slot"] = "legs",
		["temp"] = 0.33,
		["tags"] = {
			["warm"] = true,
			["panties"] = true,
			["bloomers"] = true,
		},
	},
	["Loyal Housemaid's Pumps"] = {
		["slot"] = "feet",
		["temp"] = 0.22,
		["tags"] = {
			["warm"] = 1,
			["heels"] = 1,
			["dolly"] = 2,
			["pumps"] = 2,
			["mary janes"] = 1.5,
		},
	},
	["Loyal Housemaid's Wristdresses"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Martial Artist's Pumps"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Martial Artist's Sleeveless Vest"] = {
		["slot"] = "body",
		["temp"] = 0.44,
		["tags"] = {
			["shirt"] = true,
			["corset"] = true,
			["lingerie"] = true,
			["underwear"] = true,
		},
	},
	["Martial Artist's Slops"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Mheg Deaca Bottoms"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Minmisle Top Hat"] = {
		["slot"] = "head",
		["temp"] = -0.11,
		["tags"] = {
			["hat"] = 2,
			["mini"] = 2,
			["accessory"] = 1,
			["cool"] = 2,
		},
	},
	["Model A-1 Tactical Fingerless Gloves"] = {
		["slot"] = "hands",
		["temp"] = 0.21,
		["tags"] = {
			["gloves"] = true,
		},
	},
	["Model B-2 Tactical Jacket"] = {
		["slot"] = "body",
		["temp"] = 0.77,
	},
	["Moonward Hat of Aiming"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Neon Street Blouson"] = {
		["slot"] = "body",
		["temp"] = 1.11,
	},
	["No.2 Type B Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.27,
		["tags"] = {
			["boots"] = true,
		},
	},
	["No.2 Type B Leggings"] = {
		["slot"] = "legs",
		["temp"] = 0.23,
	},
	["Noir Shoes"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Pearl Roselle Capeline"] = {
		["slot"] = "head",
		["temp"] = 0.21,
	},
	["Plain Long Skirt"] = {
		["slot"] = "legs",
		["temp"] = 0.99,
		["tags"] = {
			["skirt"] = true,
		},
	},
	["Purple Cherry Blossom Corsage"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Rainbow Brightlily Corsage"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Rebel Coat"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Recreationisle Dive Watch"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Recreationisle Shoes"] = {
		["slot"] = "feet",
		["temp"] = 0.23,
	},
	["Replica Sky Pirate's Beret of Aiming"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Salon Server's Dress Vest"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Scion Adventurer's Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.33,
	},
	["Scion Adventurer's Jacket"] = {
		["slot"] = "body",
		["temp"] = 0.79,
	},
	["Seneschal Prince's Headset"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Seneschal Prince's Jacket"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Shishu Gozen Hakama"] = {
		["slot"] = "legs",
		["temp"] = 0.63,
	},
	["Skyworker's Singlet"] = {
		["slot"] = "body",
		["temp"] = 0.11,
		["tags"] = {
			["shirt"] = true,
			["bra"] = true,
			["lingerie"] = true,
			["cool"] = true
		},
	},
	["Songbird Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Songbird Hat"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Songbird Jacket"] = {
		["slot"] = "body",
		["temp"] = 0.44,
	},
	["Southern Seas Swimsuit"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Southern Seas Tanga"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Spriggan Cap"] = {
		["slot"] = "head",
		["temp"] = 0.39,
	},
	["Spring Bottoms"] = {
		["slot"] = "legs",
		["temp"] = 0.21,
	},
	["Spring Skirt"] = {
		["slot"] = "legs",
		["temp"] = 0.88,
		["tags"] = {
			["skirt"] = true,
		},
	},
	["Star Crew Jacket"] = {
		["slot"] = "body",
		["temp"] = 1.11,
	},
	["Street Handwear"] = {
		["slot"] = "hands",
		["temp"] = 0.13,
	},
	["Street Jacket"] = {
		["slot"] = "body",
		["temp"] = 0.66,
	},
	["Striped Southern Seas Swimsuit"] = {
		["slot"] = "body",
		["temp"] = 0.25,
		["tags"] = {
			["swimwear"] = true,
		},
	},
	["Summer Indigo Shirt"] = {
		["slot"] = "body",
		["temp"] = 0.44,
	},
	["Summer Sunset Sandals"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Survival Hat"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Tamamo Headband"] = {
		["slot"] = "head",
		["temp"] = -0.069,
		["tags"] = {
			["cool"] = true,
			["vixen"] = true,
			["ears"] = true,
		},
	},
	["Taoist's Shoes"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Thavnairian Armlets"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Thavnairian Headdress"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Thavnairian Wool Autumn Shirt"] = {
		["slot"] = "body",
		["temp"] = 0.91,
		["tags"] = {
			["sweater"] = true,
			["warm"] = true,
		},
	},
	["The Emperor's New Hat"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Turali Trader's Shirt"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Unorthodox Saint's Bottoms"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Valentione Emissary's Bottoms"] = {
		["slot"] = "legs",
		["temp"] = 0.77,
	},
	["Valentione Emissary's Dress Boots"] = {
		["slot"] = "feet",
		["temp"] = 0.29,
	},
	["Valentione Rose Ribboned Gloves"] = {
		["slot"] = "hands",
		["temp"] = 0.11,
	},
	["Valentione Rose Ribboned Hat"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Valentione Rose Tights"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Valentione Skirt"] = {
		["slot"] = "legs",
		["temp"] = 0.63,
	},
	["Vanguard Bolero of Aiming"] = {
		["slot"] = "body",
		["temp"] = 0.96,
	},
	["White Sunflower Corsage"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["Winter Sweater"] = {
		["slot"] = "body",
		["temp"] = 0.81,
	},
	["Wintertide Blouson"] = {
		["slot"] = "body",
		["temp"] = 0.11,
	},
	["Wintertide Sheath Skirt"] = {
		["slot"] = "legs",
		["temp"] = 0.11,
	},
	["Wintertide Shoes"] = {
		["slot"] = "feet",
		["temp"] = 0.11,
	},
	["Woolen Cavalier's Hat"] = {
		["slot"] = "head",
		["temp"] = 0.11,
	},
	["YoRHa Type-51 Cap of Healing"] = {
		["slot"] = "head",
		["temp"] = 0.17,
	},
}

local validTemps = {
	["arctic"] = -21,
	["cold"] = -1.3, -- ☃▽
	["tundra"] = -3.0,
	["cool"] = -0.22, -- ☆▼
	["warm"] = 0.33, -- ○ 
	["normal"] = 0, -- ★    °
	["def"] = 0, -- ★ ≡
	["hot"] = 1.0, -- ●▲
	["moderate"] = 0.1,
	["tropical"] = 0.51,
	["plains"] = 0.77,
	["umbralplains"] = -2,
	["indoors"] = -0.37,
	["mountains"] = -0.71,
	["indoors-moderate"] = 0,
	["coastal"] = 0.33,
	["enchantedforest"] = -1,
	["sylvan"] = 0.11,
	["temperate"] = 0,
	--["wet"] = "wet", -- ☂ ☁
	["aetheric"] = 3,  --₆☀∮
	["space"] = -0.99,
	["hell"] = 17, -- ☀
	["naked"] = 13,
	["scorchin"] = 21,
	["island"] = 2.7,
	["enchanted-island"] = 0,
	["biosphere"] = 0.23,
}

local climates = {
	["arctic"] = "dry",
	["desert"] = "dry",
	["coastal"] = "wet",
	["tropical"] = "wet",
	["plains"] = "dry",
	["island"] = "wet",
	["temperate"] = "normal",
	["enchantedforest"] = "normal",
	["umbralplains"] = "arid",
	["tundra"] = "dry",
	["sylvan"] = "wet",
	["enchanted-island"] = "normal",
	["desert"] = "arid",
	["mountains"] = "normal",
	["biosphere"] = "low",
	["space"] = "arid",

}

-- hot = ▲
-- warm = △
local smartOutfitSelect = {
	["cool"] = {
		["warm"] = "temp",
		["hot"] = "temp",
		["normal"] = "temp",
		["sporty"] = "type",
		["casual"] = "type",
		["swimwear"] = "type",
	},
}

local outfitTempEffects = {--deprecate?
	["arctic"] = {
		["hot"] = 3.77,
		["cold"] = -5.54,
		["confident"] = -0.35,
		["uncomfortable"] = 0.35,
		["sleepy"] = 1.35,
	},
	["cold"] = {
		["hot"] = 2.34,
		["cool"] = -4.69,
		["confident"] = -0.15,
		["uncomfortable"] = 0.15,
	},
	["cool"] = {
		["hot"] = 1.77,
		["cold"] = -3.79,
		["confident"] = 0.45,
	},
	["normal"] = {
		["hot"] = 0.25,
		["cold"] = -0.39,
		["confident"] = 0.45,
	},
	["warm"] = {
		["hot"] = -2.77,
		["cold"] = 2.79,
		["confident"] = 0.45,
	},
	["hot"] = {
		["hot"] = -1.45,
		["cold"] = 2.69,
		["confident"] = 0.45,
	},
	["scorchin"] = {
		["hot"] = -1.77,
		["cold"] = 3.27,
		["embarrassed"] = 0.69,
	},

}

local validtags =  {
	["club"] = "club",
	["swim"] = "swimwear",
	["swimwear"] = "swimwear",
	["bikini"] = "swimwear",
	["beach"] = "swimwear",
	["bathing"] = "swimwear",
	["sun"] = "swimwear",
	["casual"] = "casual",
	["work"] = "work",
	["crafting"] = "crafting",
	["crafter"] = "crafting",
	["craft"] = "crafting",
	["gathering"] = "gathering",
	["gatherer"] = "gathering",
	["gather"] = "gathering",
	["combat"] = "combat",
	["battle"] = "combat",
	["armor"] = "combat",
	["uniform"] = "uniform",
	["sleep"] = "sleepwear",
	["sporty"] = "athletic",
	["athletic"] = "athletic",
	["everyday"] = "everyday",
	["lingerie"] = "lingerie",
}

local validStyles = {
	["boho"] = "boho",
	["goth"] = "goth",
	["cyberpunk"] = "cyberpunk",
	["fantasy"] = "fantasy",
}

local validSlotId = {
	["hat"] = "head", --2
	["top"] = "body", --3
	["shirt"] = "body",
	["jacket"] = "body",
	["dress"] = "body",
	["blouse"] = "body",
	["tunic"] = "body",
	["gloves"] = "hands", --4
	["hands"] = "hands", --4
	["nails"] = "hands", --4
	["pants"] = "legs", --6
	["skirt"] = "legs",
	["shorts"] = "legs",
	["stockings"] = "legs",
	["bottoms"] = "legs",
	["shoes"] = "feet",
	["boots"] = "feet",
	["bracelet"] = "wrist",
	["earring"] = "ears",
	["earrings"] = "ears",
	["necklace"] = "neck",
	["choker"] = "neck",
	["ribbon"] = "neck",
	["ringr"] = "ringr",
	["rring"] = "ringr",
	["ringl"] = "lring",
	["lring"] = "lring",
	["bra"] = "bra",
	["panties"] = "panties",
	["nails"] = "nails",
	["glasses"] = "facewear",
	["facewear"] = "facewear",
	["spriggan"] = "head",
}

local gearSlotName = {
	["0"] = "Weapon",
	["1"] = "Offhand",
	["2"] = "Head",
	["3"] = "Body", -- Top				ArmoryBody = 3202
	["4"] = "Hands", -- Gloves			ArmoryHands = 3203
	["6"] = "Legs", -- Pants			ArmoryLegs = 3205
	["7"] = "Feet", -- Shoes			ArmoryFeets = 3206
	["8"] = "Ears", -- Earring			ArmoryEar = 3207
	["9"] = "Neck", -- Necklace			ArmoryNeck = 3208
	["10"] = "Wrist", -- Bracelet		ArmoryWrist = 3209
	["11"] = "RRing", -- RingR			ArmoryRings = 3300
	["12"] = "LRing",
}

function GetClimate()
	local map = Game.Player.MapZone
	if zones[map] then
		if zones[map].climate then
			return zones[map].climate
		end
	end
	return {["type"] = "temperate", ["temp"] = "normal", ["humidity"] = "normal"}
end

function SetClimate()
	local map = Game.Player.MapZone
	if zones[map] then
		if zones[map].climate then
			if zones[map].climate.temp then
				currentClimate = zones[map].climate.temp
			end
		end
	end
end

local SNDRemoveCall = { --Leave for Reference
	["0"] = "EmoHideWeapon", -- Mainhand			ArmoryMainHand = 3500
	["1"] = "EmoRemoveOffhand", -- Offhand			ArmoryOffHand = 3200
	["2"] = "EmoRemoveHat", -- Hat				ArmoryHead = 3201
	["3"] = "EmoRemoveTop", -- Top				ArmoryBody = 3202
	["4"] = "EmoRemoveGloves", -- Gloves			ArmoryHands = 3203
	["5"] = nil, -- Was Belt		ArmoryWaist = 3204
	["6"] = "EmoRemovePants", -- Pants			ArmoryLegs = 3205
	["7"] = "EmoRemoveShoes", -- Shoes			ArmoryFeets = 3206
	["8"] = "EmoRemoveEarring", -- Earring			ArmoryEar = 3207
	["9"] = "EmoRemoveNecklace", -- Necklace			ArmoryNeck = 3208
	["10"] = "EmoRemoveBracelet", -- Bracelet		ArmoryWrist = 3209
	["11"] = "EmoRemoveRingR", -- RingR			ArmoryRings = 3300
	["12"] = "EmoRemoveRingL", -- RingL			
	["13"] = "", -- Soul Crystal	ArmorySoulCrystal = 3400
	["30"] = "EmoRemovePanties",
	["31"] = "EmoRemoveBra",
	["32"] = "EmoRemoveNails",
	["33"] = "glasses"
	--SaddleBag1 = 4000
	--SaddleBag2 = 4001
	--PremiumSaddleBag1 = 4100
	--PremiumSaddleBag2 = 4101
	--EquippedItems = 1000
	--MoveItemToContainer(itemID, srcCont, dstCont)
}

function OutfitSave(args)
	dbgMsg(".OutfitSave.", 2)
	local slotId, itemId = shiftWord(args, string.lower)
	if slotId == "complete" then
		dbgMsg("Outfit Saved: " .. slotId .. ".", 1)
		if not currentOutfit or currentOutfit == "" then
			currentOutfit = Game.Player.Entity.Job.Name
		end
		CD[playerName].outfits[currentOutfit].job = Game.Player.Entity.Job.ShortName
		CDHandler()
		--Script.SaveStorage()
		if CD[playerName].traits.glamourous then
			DoRandom("snap")
		end
		return
	end
	CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
	CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or currentOutfit
	if slotId and CD[playerName]["outfits"][currentOutfit] then
		
		if tonumber(itemId) > 0 then
			currentOutfitSet[slotId] = itemId
			CD[playerName]["outfits"][currentOutfit][slotId] = itemId
		else
			currentOutfitSet[slotId] = nil
			CD[playerName]["outfits"][currentOutfit][slotId] = nil
		end
		dbgMsg("OutfitSave: " .. slotId .. " :: " .. itemId .. ".", 2)
	end
end

function OutfitLoad(co)
	dbgMsg(".OutfitLoad.", 2)
	if not co or co == "" then
		if currentOutfit and currentOutfit ~= "" then
			co = currentOutfit
		end
	end
	
	dbgMsg("OutfitLoadCall: ~~~.", 1)
	--if not co then
		dbgMsg("OutfitLoadCall: " .. tostring(currentOutfit) .. ".", 1)
	--end
	dbgMsg("OutfitLoadCall: CD = " .. tostring(type(CD)) .. ".", 1)
	dbgMsg("OutfitLoadCall: CD[playerName] = " .. tostring(type(CD[playerName])) .. ".", 1)
	--dbgMsg("OutfitLoadCall: CD[playerName][\"outfits\"] = " .. tostring(type(CD[playerName]["outfits"])) .. ".", 1)
	
	if CD[playerName]["outfits"][co] then
		if CD[playerName]["traits"]["glamourous"] then
			DoRandom("snap")
		end
		Game.SendChat("/gs change \"" .. co .. "\"")
		dbgMsg("OutfitLoaded: " .. co .. ".", 1)
		currentOutfit = co
		for k,v in pairs(CD[playerName]["outfits"][currentOutfit]) do
			currentOutfitSet[k] = v
		end
		CD[playerName]["currentOutfit"] = currentOutfit
		CDHandler()
		return "OutfitLoaded: " .. co .. "."
	end
end

function OutfitTempFactor()
	--local eTime = Game.EorzeanTime.Hour
	--local weather = Game.Weather.Name
	--2660
	local strip = DressedCheck()
	local slot
	local sX
	local oc
	--local clmt = GetClimate()
	local warm = 0
	
	sX = strip:sub(1,1)
	if sX ~= "♠" then
		slot = CD[playerName].outfits[currentOutfit].headGlam
		if not slot then
			slot = CD[playerName].outfits[currentOutfit].headName
		end
		if slot then
			if glams[slot] then
				warm = warm + glams[slot].temp
			else
				warm = warm + 0.07
			end
		end
	end
	
	sX = strip:sub(2,2)
	if sX ~= "♠" then
		slot = CD[playerName].outfits[currentOutfit].bodyGlam
		if not slot then
			slot = CD[playerName].outfits[currentOutfit].bodyName
		end
		if slot then
			oc = slot
			if glams[slot] then
				warm = warm + glams[slot].temp
			else
				warm = warm + 0.44
			end
		end
	else
		oc = CD[playerName].outfits[currentOutfit].bodyName
	end
	--ω♡∩
	sX = strip:sub(7,7)
	if sX ~= "ω" then
		slot = CD[playerName].outfits[currentOutfit].braGlam
		if not slot then
			slot = CD[playerName].outfits[currentOutfit].braName
		end
		if slot then
			if glams[slot] and oc then
				warm = warm + glams[slot].temp
			end
		end
	end
	oc = nil
	sX = strip:sub(3,3)
	if sX ~= "♠" then
		slot = CD[playerName].outfits[currentOutfit].handsGlam
		if not slot then
			slot = CD[playerName].outfits[currentOutfit].handsName
		end
		if slot then
			oc = true
			if glams[slot] then
				warm = warm + glams[slot].temp
			end
		end
	end
	--ω♡∩
	sX = strip:sub(9,9)
	if sX ~= "∩" then
		slot = CD[playerName].outfits[currentOutfit].nailsGlam
		if not slot then
			slot = CD[playerName].outfits[currentOutfit].nailsName
		end
		if slot then
			if glams[slot] and oc then
				warm = warm + glams[slot].temp
			end
		end
	end
	oc = nil
	sX = strip:sub(4,4)
	if sX ~= "♠" then
		slot = CD[playerName].outfits[currentOutfit].legsGlam
		if not slot then
			slot = CD[playerName].outfits[currentOutfit].legsName
		end
		if slot then
			oc = true
			if glams[slot] then
				--dbgMsg("OTF Legs: :: " .. tostring(slot), 1)
				warm = warm + glams[slot].temp
			else
				warm = warm + 0.41
			end
		end
	end
	--ω♡∩
	sX = strip:sub(8,8)
	if sX ~= "♡" then
		slot = CD[playerName].outfits[currentOutfit].pantiesGlam
		if not slot then
			slot = CD[playerName].outfits[currentOutfit].pantiesName
		end
		if slot then
			if glams[slot] and oc then
				--dbgMsg("OTF ∨: :: " .. tostring(slot), 1)
				warm = warm + glams[slot].temp
			end
		end
	end
	
	sX = strip:sub(5,5)
	if sX ~= "♠" then --sX ~= "♠"
		slot = CD[playerName].outfits[currentOutfit].feetGlam
		if not slot then
			slot = CD[playerName].outfits[currentOutfit].feetName
		end
		if slot then
			if glams[slot] then
				warm = warm + glams[slot].temp
			else
				warm = warm + 0.22
			end
		end
	end
	
	return warm
end

function TakeoffRandom(list)
	dbgMsg(".OutfitLoad.", 2)
	dbgMsg("TakeoffRandom: :: ", 1)
	local r, s
	local ct = 6
	local slot
	if type(list) == "table" then
		repeat
			ct = ct - 1
			r = math.floor(math.random(1, #list))
			if list[r] then
				slot = validSlotId[list[r]]
				if slot and Game.Player.Equipped[slot:sub(1,1):upper()..slot:sub(2)].Item > 0 then
					dbgMsg("TakeoffRandom: :: " .. tostring(list[r]), 1)
					if Game.Player.Entity.Job.ShortName == "DNC" then
						Game.SendChat("/ac Windmill")
					elseif Game.Player.Entity.Job.ShortName == "WHM" then
						Game.SendChat("/ac Assize")
					end
					RemoveItem(list[r])
					s = true
				end
			end
		until (s or ct == 0)
	end
	if s then
		return true
	end
end

function RemoveItem(args)
	dbgMsg(".RemoveItem.", 2)
	local ls = Game.Player.Equipped.LoadSlots()
	slot = validSlotId[args]
	dbgMsg("RemoveItem : slot: " .. tostring(slot), 1)
	dbgMsg("RemoveItem : cOS.slot: " .. tostring(currentOutfitSet[slot]), 1)
	if slot then
		if slot == "body" and (currentOutfitSet["body"] == currentOutfitSet["bra"] or currentOutfitSet["bra"] == 0) then
			currentOutfitSet[slot] = 0
			currentOutfitSet["bra"] = 0
			Game.Player.Equipped.Body.Remove()
			--Game.SendChat("/snd run " .. SNDRemoveCall[slot])
		elseif slot == "legs" and (currentOutfitSet["legs"] == currentOutfitSet["panties"] or currentOutfitSet["panties"] == 0) then
			currentOutfitSet[slot] = 0
			currentOutfitSet["panties"] = 0
			Game.Player.Equipped.Legs.Remove()
			--Game.SendChat("/snd run " .. SNDRemoveCall[slot])
		elseif slot == "hands" and (currentOutfitSet["hands"] == currentOutfitSet["nails"] or currentOutfitSet["nails"] == 0) then
			currentOutfitSet["nails"] = 0
			currentOutfitSet[slot] = 0
			Game.Player.Equipped.Hands.Remove()
			--Game.SendChat("/snd run " .. SNDRemoveCall[slot])
		elseif slot == "body" and CD[playerName]["outfits"][currentOutfit]["bra"] > 0 then
			dbgMsg("Body -> Bra : slot: " .. tostring(CD[playerName]["outfits"][currentOutfit]["bra"]), 1)
			currentOutfitSet[slot] = CD[playerName]["outfits"][currentOutfit]["bra"]
			Game.SendChat("/equip " .. CD[playerName]["outfits"][currentOutfit]["bra"])
		elseif slot == "legs" and CD[playerName]["outfits"][currentOutfit]["panties"] > 0 then
			currentOutfitSet[slot] = CD[playerName]["outfits"][currentOutfit]["panties"]
			Game.SendChat("/equip " .. CD[playerName]["outfits"][currentOutfit]["panties"])
		elseif slot == "hands" and CD[playerName]["outfits"][currentOutfit]["nails"] > 0 then
			currentOutfitSet[slot] = CD[playerName]["outfits"][currentOutfit]["nails"]
			Game.SendChat("/equip " .. CD[playerName]["outfits"][currentOutfit]["nails"])
		elseif slot == "facewear" and CD[playerName]["outfits"][currentOutfit]["facewear"] then
			currentOutfitSet[slot] = nil
			Game.SendChat("/facewear \"" .. CD[playerName]["outfits"][currentOutfit]["facewear"] .. "\"")
		elseif slot == "facewear" then
			dbgMsg("Facewear not set... ", 0)
		elseif slot == "panties" and CD[playerName].outfits[currentOutfit].panties == currentOutfitSet.legs then
			currentOutfitSet[slot] = 0
			Game.Player.Equipped.Legs.Remove()
		elseif slot == "bra" and CD[playerName].outfits[currentOutfit].bra == currentOutfitSet.body then
			currentOutfitSet[slot] = 0
			Game.Player.Equipped.Body.Remove()
		elseif slot == "nails" and CD[playerName].outfits[currentOutfit].nails == currentOutfitSet.nails then
			currentOutfitSet[slot] = 0
			Game.Player.Equipped.Hands.Remove()
		elseif slot == "panties" and CD[playerName].outfits[currentOutfit].panties ~= currentOutfitSet.legs then
			currentOutfitSet[slot] = 0
			dbgMsg("Panties removed for " .. currentOutfit .. " O₀oLaLa.", 0)
		elseif slot == "bra" and CD[playerName].outfits[currentOutfit].bra ~= currentOutfitSet.body then
			currentOutfitSet[slot] = 0
			dbgMsg("Bra removed for " .. currentOutfit .. " (•Y•)", 0)
			--Game.Player.Equipped.Legs.Remove()
		else
			currentOutfitSet[slot] = nil
			Game.Player.Equipped[slot:sub(1,1):upper()..slot:sub(2)].Remove()
		end
	end
end

function PutonItem(slot, id)
	dbgMsg(".PutonItem.", 2)
	local ls = Game.Player.Equipped.LoadSlots()
	slot = validSlotId[slot]
	if slot and CD[playerName]["outfits"] then
		slot = tostring(slot)
		dbgMsg("Puton Args: " .. slot, 0)
		dbgMsg("Puton slot item: " .. tostring(CD[playerName]["outfits"][currentOutfit][slot]), 1)
		if tonumber(id) then
			if slot == "panties" then
				Game.SendChat("/equip " .. tostring(id))
				Script.QueueDelay(1.500)
				Script.QueueAction(OutfitHandler, "set panties")
			elseif slot == "bra" then
				Game.SendChat("/equip " .. tostring(id))
				Script.QueueDelay(1.500)
				Script.QueueAction(OutfitHandler, "set bra")
			elseif slot == "nails" then
				Game.SendChat("/equip " .. tostring(id))
				Script.QueueDelay(1.500)
				Script.QueueAction(OutfitHandler, "set nails")
			end
		elseif slot == "facewear" and not currentOutfitSet[slot] then
			currentOutfitSet[slot] = CD[playerName]["outfits"][currentOutfit]["facewear"]
			Game.SendChat("/facewear \"" .. CD[playerName]["outfits"][currentOutfit]["facewear"] .. "\"")
		elseif CD[playerName]["outfits"][currentOutfit][slot] > 0 then
			--local itemData = tostring(CD[playerName]["outfits"][currentOutfit][slot]) .. "." .. tostring(slot)
			--dbgMsg("Saving Clipboard Data [" .. itemData .. "], please wait...", 0)
			--Script.Clipboard = tostring(CD[playerName]["outfits"][currentOutfit][slot]) .. "." .. tostring(slot)
			if args == "spriggan" then
				Game.SendChat("/equip 7544")
			else
				Game.SendChat("/equip " .. CD[playerName]["outfits"][currentOutfit][slot])
			end
			--Game.SendChat("/snd run EmoEquipFromClip")
			currentOutfitSet[slot] = CD[playerName]["outfits"][currentOutfit][slot]
		
		else
			dbgMsg("Item Data Not Found For: " .. slot, 0)
		end
	end
end

function SmartOutfit(slct)
	dbgMsg(".SmartOutfit.", 2)
	if smartOutfitSelect[slct] then
		for k,v in pairs(smartOutfitSelect[slct]) do
			if v == "temp" then
				dbgMsg("OutfitHandler by Temp ", 0)
				for x,y in pairs(CD[playerName]["outfits"]) do
					if y.job == Game.Player.Entity.Job.ShortName and y.temp == k then
						OutfitHandler("load " .. x)
						dbgMsg("OutfitHandler Load... " .. x, 0)
						return
					end
				end
			elseif v == "type" then
				for x,y in pairs(CD[playerName]["outfits"]) do
					if y.job == Game.Player.Entity.Job.ShortName and y.type == k then
						OutfitHandler("load " .. x)
						return
					end
				end
			end
		end
	end
end

function FindJobOutfit(job)
	local oj
	for k, v in pairs(CD[playerName].outfits) do
		if v.job then
			if v.job == job then
				oj = k
				break
			end
		end
	end
	return oj
end

function IsUnderwear(slot)
	if validSlotId[slot] == "body" then
		if Game.Player.Equipped.Body.ItemName == "" then
			return nil
		end
		if (Game.Player.Equipped.Body.GlamName == CD[playerName].outfits[currentOutfit].braGlam) or
			(Game.Player.Equipped.Body.ItemName == CD[playerName].outfits[currentOutfit].braName) then
			return true
		end
		return false
	elseif validSlotId[slot] == "legs" then
		if Game.Player.Equipped.Legs.ItemName == "" then
			return nil
		end
		if (Game.Player.Equipped.Legs.GlamName == CD[playerName].outfits[currentOutfit].pantiesGlam) or
			(Game.Player.Equipped.Legs.ItemName == CD[playerName].outfits[currentOutfit].pantiesName) then
			return true
		end
		return false
	elseif validSlotId[slot] == "hands" then
		if Game.Player.Equipped.Hands.ItemName == "" then
			return nil
		end
		if (Game.Player.Equipped.Hands.GlamName == CD[playerName].outfits[currentOutfit].handsGlam) or
			(Game.Player.Equipped.Hands.ItemName == CD[playerName].outfits[currentOutfit].handsName) then
			return true
		end
		return false
	end
end



function DressedCheck()
	local strip = "♠♠♠♠♠-ω♥∩-♦♦♦♦♦"
	local val
	local u
	
	local ls = Game.Player.Equipped.LoadSlots()
	--if currentOutfit then
		--UpdateOutfit(currentOutfit)
	--end
	
	val = Game.Player.Equipped.Head.Item
	--dbgMsg("DressedCheck: head :: " .. tostring(val), 1)
	val = string.format("%x", val)
	val = hex_to_utf(val)
	strip = str_ins(strip,val,1,1)
	
	if IsUnderwear("top") then
		strip = str_ins(strip,"♠",2,2)
		u = Game.Player.Equipped.Body.Item
	else
		val = Game.Player.Equipped.Body.Item
		u = val
		val = string.format("%x", val)
		val = hex_to_utf(val)
		strip = str_ins(strip,val,2,2)
	end
	
	if u > 0 then
		val = CD[playerName].outfits[currentOutfit].bra
		--dbgMsg("DressedCheck: bra ω :: " .. tostring(val), 1)
		if val > 0 then
			dbgMsg("DressedCheck:       `ω´     ✓Bra      :: " .. tostring(val), 16)
			val = string.format("%x", val)
			val = hex_to_utf(val)
			strip = str_ins(strip,val,7,7)
		else
			dbgMsg("DressedCheck:       ‹ω›     ~Bra~     :: " .. tostring(val), 16)
		end
	end
	
	if IsUnderwear("pants") then
		strip = str_ins(strip,"♠",4,4)
		u = Game.Player.Equipped.Legs.Item
	else
		val = Game.Player.Equipped.Legs.Item
		u = val
		val = string.format("%x", val)
		val = hex_to_utf(val)
		strip = str_ins(strip,val,4,4)
	end
	
	if u > 0 then
		val = CD[playerName].outfits[currentOutfit].panties
		if val > 0 then
			dbgMsg("DressedCheck:       ¯▽¯    ✓Panties   :: " .. tostring(val), 16)
			val = string.format("%x", val)
			val = hex_to_utf(val)
			strip = str_ins(strip,val,8,8)
		else
			dbgMsg("DressedCheck:       ‹∨›    ~Panties~  :: " .. tostring(val), 16)
		end
	end
	
	if IsUnderwear("hands") then
		strip = str_ins(strip,"♠",3,3)
		u = Game.Player.Equipped.Hands.Item
	else
		val = Game.Player.Equipped.Hands.Item
		u = val
		val = string.format("%x", val)
		val = hex_to_utf(val)
		strip = str_ins(strip,val,3,3)
	end
	
	if u > 0 then
		val = CD[playerName].outfits[currentOutfit].nails
		if val > 0 then
			dbgMsg("DressedCheck:       _∩_     ✓Nails    :: " .. tostring(val), 16)
			val = string.format("%x", val)
			val = hex_to_utf(val)
			strip = str_ins(strip,val,9,9)
		else
			dbgMsg("DressedCheck:       .∩.     ~Nails~   :: " .. tostring(val), 16)
		end
	end
	
	val = Game.Player.Equipped.Feet.Item
	val = string.format("%x", val)
	val = hex_to_utf(val)
	--dbgMsg("DressedCheck: feet :: " .. tostring(val), 1)
	strip = str_ins(strip,val,5,5)
	
	val = Game.Player.Equipped.Ears.Item
	val = string.format("%x", val)
	val = hex_to_utf(val)
	--dbgMsg("DressedCheck: ears :: " .. tostring(val), 1)
	strip = str_ins(strip,val,11,11)
	
	val = Game.Player.Equipped.Neck.Item
	val = string.format("%x", val)
	val = hex_to_utf(val)
	--dbgMsg("DressedCheck: neck :: " .. tostring(val), 1)
	strip = str_ins(strip,val,12,12)
	
	val = Game.Player.Equipped.Wrist.Item
	val = string.format("%x", val)
	val = hex_to_utf(val)
	--dbgMsg("DressedCheck: wrist :: " .. tostring(val), 1)
	strip = str_ins(strip,val,13,13)
	
	val = Game.Player.Equipped.RRing.Item
	val = string.format("%x", val)
	val = hex_to_utf(val)
	--dbgMsg("DressedCheck: rring :: " .. tostring(val), 1)
	strip = str_ins(strip,val,14,14)
	
	val = Game.Player.Equipped.LRing.Item
	val = string.format("%x", val)
	val = hex_to_utf(val)
	--dbgMsg("DressedCheck: lring :: " .. tostring(val), 1)
	strip = str_ins(strip,val,15,15)
	
	return strip
	
	--string.format("%x", val)
end

function DressBest()
	local ztf = ZoneTempFactor
	--local otf = reduce(OutfitTempFactor() * 0.37, 3)
	local job = Game.Player.Entity.Job.ShortName
	local df = 7777
	local cd
	local slct
	dbgMsg("Dress Best: Trace A :: ", 1)
	if optOutfitTemp then
		for k, v in pairs(CD[playerName].outfits) do
			if v.job == job and v.temp then
				--dbgMsg("Dress Best: dress check :: " .. k, 1)
				if diff(optOutfitTemp, tonumber(v.temp) * 0.91) < df then
				--if 6 - math.abs(v.temp * 0.37 - optOutfitTemp) < df then
				--if diff(optOutfitTemp, tonumber(v.temp) * 0.37) < df then
					slct = k
					df = diff(optOutfitTemp,tonumber(v.temp) * 0.91)
					dbgMsg("Dress Best: dress check :: " .. k .. " :: " .. tostring(df), 1)
				end
			end
		end
		if slct then
			if slct == currentOutfit then
				if (os.time() - lastDressCheck) > 211 then
					OutfitLoad(slct)
					lastDressCheck = os.time()
					return false
				end
				dbgMsg("Dress Best: Trace A :: ", 1)
				if (os.time() - lastDressCheck) > 77 and not playerTraits.modest and emoState.hot > 69 then
					dbgMsg("Dress Best: Trace A.2 :: ", 1)
					cd = TakeoffRandom({"top", "pants"})
					if cd then
						lastDressCheck = os.time()
						return true
					else
						lastDressCheck = os.time() + 777
						return false
					end
					
				end
				dbgMsg("Dress Best: Trace B :: ", 1)
				if (os.time() - lastDressCheck) > 33 and emoState.hot > 37 then
					dbgMsg("Dress Best: Trace B.2 :: ", 1)
					if playerTraits.vixen then
						cd = TakeoffRandom({"gloves", "shoes"})
					else
						cd = TakeoffRandom({"hat", "gloves", "shoes"})
					end
					if cd then
						lastDressCheck = os.time()
						return true
					else
						lastDressCheck = os.time() - 77
						return false
					end
					lastDressCheck = os.time()
					return false
				end
				dbgMsg("Dress Best: Trace C :: ", 1)
				--lastDressCheck = os.time()
				return false
				--dbgMsg("Dress Best: " .. currentOutfit, 3)
			else
				lastDressCheck = os.time()
				OutfitLoad(slct)
				return true
			end
		end
	end
end

function UpdateOutfit(co)
	if not co then
		return
	end
	local glam
	local climate = GetClimate()
	currentOutfit = co
	dbgMsg("Update Outfit: " .. currentOutfit, 0)
	local ls = Game.Player.Equipped.LoadSlots()
	if ls then
		--CD[playerName]["outfits"][currentOutfit][slot]
		dbgMsg("Update Outfit: Load...", 0)
		CD[playerName].outfits[currentOutfit] = CD[playerName].outfits[currentOutfit] or {}
		--Weapon
		CD[playerName].outfits[currentOutfit].weapon = Game.Player.Equipped.Weapon.Item
		CD[playerName].outfits[currentOutfit].weaponName = Game.Player.Equipped.Weapon.ItemName
		CD[playerName].outfits[currentOutfit].weaponGlam = Game.Player.Equipped.Weapon.GlamName
		CD[playerName].outfits[currentOutfit].weaponDyeA = Game.Player.Equipped.Weapon.DyeA
		CD[playerName].outfits[currentOutfit].weaponDyeB = Game.Player.Equipped.Weapon.DyeB
		--Offhand
		CD[playerName].outfits[currentOutfit].offhand = Game.Player.Equipped.Offhand.Item
		CD[playerName].outfits[currentOutfit].offhandName = Game.Player.Equipped.Offhand.ItemName
		--Head
		CD[playerName].outfits[currentOutfit].head = Game.Player.Equipped.Head.Item
		CD[playerName].outfits[currentOutfit].headName = Game.Player.Equipped.Head.ItemName
		CD[playerName].outfits[currentOutfit].headDyeA = Game.Player.Equipped.Head.DyeA
		CD[playerName].outfits[currentOutfit].headDyeB = Game.Player.Equipped.Head.DyeB
		glam = Game.Player.Equipped.Head.GlamName
		CD[playerName].outfits[currentOutfit].headGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.head[glam] then
				CD[playerName].glams.head[glam] = {}
				CD[playerName].glams.head[glam]["temp"] = "normal"
			end
			CD.global.glams[glam] = CD.global.glams[glam] or {}
			CD.global.glams[glam].slot = "head"
			if climate then
				CD.global.glams[glam].climate = CD.global.glams[glam].climate or climate
			end
		end
		]]--
		
		--Body
		CD[playerName].outfits[currentOutfit].body = Game.Player.Equipped.Body.Item
		CD[playerName].outfits[currentOutfit].bodyName = Game.Player.Equipped.Body.ItemName
		--CD[playerName].outfits[currentOutfit].bodyGlam = Game.Player.Equipped.Body.GlamName
		CD[playerName].outfits[currentOutfit].bodyDyeA = Game.Player.Equipped.Body.DyeA
		CD[playerName].outfits[currentOutfit].bodyDyeB = Game.Player.Equipped.Body.DyeB
		glam = Game.Player.Equipped.Body.GlamName
		CD[playerName].outfits[currentOutfit].bodyGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.body[glam] then
				CD[playerName].glams.body[glam] = {}
				CD[playerName].glams.body[glam]["temp"] = "normal"
			end
			CD.global.glams[glam] = CD.global.glams[glam] or {}
			CD.global.glams[glam].slot = "body"
			if climate then
				CD.global.glams[glam].climate = CD.global.glams[glam].climate or climate
			end
		end
		]]--
		
		--Hands
		CD[playerName].outfits[currentOutfit].hands = Game.Player.Equipped.Hands.Item
		CD[playerName].outfits[currentOutfit].handsName = Game.Player.Equipped.Hands.ItemName
		--CD[playerName].outfits[currentOutfit].handsGlam = Game.Player.Equipped.Hands.GlamName
		CD[playerName].outfits[currentOutfit].handsDyeA = Game.Player.Equipped.Hands.DyeA
		CD[playerName].outfits[currentOutfit].handsDyeB = Game.Player.Equipped.Hands.DyeB
		glam = Game.Player.Equipped.Hands.GlamName
		CD[playerName].outfits[currentOutfit].handsGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.hands[glam] then
				CD[playerName].glams.hands[glam] = {}
				CD[playerName].glams.hands[glam]["temp"] = "normal"
			end
			CD.global.glams[glam] = CD.global.glams[glam] or {}
			CD.global.glams[glam].slot = "hands"
			if climate then
				CD.global.glams[glam].climate = CD.global.glams[glam].climate or climate
			end
		end
		]]--
		
		--Legs
		CD[playerName].outfits[currentOutfit].legs = Game.Player.Equipped.Legs.Item
		CD[playerName].outfits[currentOutfit].legsName = Game.Player.Equipped.Legs.ItemName
		--CD[playerName].outfits[currentOutfit].legsGlam = Game.Player.Equipped.Legs.GlamName
		CD[playerName].outfits[currentOutfit].legsDyeA = Game.Player.Equipped.Legs.DyeA
		CD[playerName].outfits[currentOutfit].legsDyeB = Game.Player.Equipped.Legs.DyeB
		glam = Game.Player.Equipped.Legs.GlamName
		CD[playerName].outfits[currentOutfit].legsGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.legs[glam] then
				CD[playerName].glams.legs[glam] = {}
				CD[playerName].glams.legs[glam]["temp"] = "normal"
			end
			CD.global.glams[glam] = CD.global.glams[glam] or {}
			CD.global.glams[glam].slot = "legs"
			if climate then
				CD.global.glams[glam].climate = CD.global.glams[glam].climate or climate
			end
		end
		]]--
		
		--Feet
		CD[playerName].outfits[currentOutfit].feet = Game.Player.Equipped.Feet.Item
		CD[playerName].outfits[currentOutfit].feetName = Game.Player.Equipped.Feet.ItemName
		--CD[playerName].outfits[currentOutfit].feetGlam = Game.Player.Equipped.Feet.GlamName
		CD[playerName].outfits[currentOutfit].feetDyeA = Game.Player.Equipped.Feet.DyeA
		CD[playerName].outfits[currentOutfit].feetDyeB = Game.Player.Equipped.Feet.DyeB
		glam = Game.Player.Equipped.Feet.GlamName
		CD[playerName].outfits[currentOutfit].feetGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.feet[glam] then
				CD[playerName].glams.feet[glam] = {}
				CD[playerName].glams.feet[glam]["temp"] = "normal"
			end
			CD.global.glams[glam] = CD.global.glams[glam] or {}
			CD.global.glams[glam].slot = "feet"
			if climate then
				CD.global.glams[glam].climate = CD.global.glams[glam].climate or climate
			end
		end
		]]--
		
		--Ears
		CD[playerName].outfits[currentOutfit].ears = Game.Player.Equipped.Ears.Item
		CD[playerName].outfits[currentOutfit].earsName = Game.Player.Equipped.Ears.ItemName
		--CD[playerName].outfits[currentOutfit].earsGlam = Game.Player.Equipped.Ears.GlamName
		glam = Game.Player.Equipped.Ears.GlamName
		CD[playerName].outfits[currentOutfit].earsGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.ears[glam] then
				CD[playerName].glams.ears[glam] = {}
				CD[playerName].glams.ears[glam]["temp"] = "normal"
			end
		end
		]]--
		
		--Neck
		CD[playerName].outfits[currentOutfit].neck = Game.Player.Equipped.Neck.Item
		CD[playerName].outfits[currentOutfit].neckName = Game.Player.Equipped.Neck.ItemName
		--CD[playerName].outfits[currentOutfit].neckGlam = Game.Player.Equipped.Neck.GlamName
		glam = Game.Player.Equipped.Neck.GlamName
		CD[playerName].outfits[currentOutfit].neckGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.neck[glam] then
				CD[playerName].glams.neck[glam] = {}
				CD[playerName].glams.neck[glam]["temp"] = "normal"
			end
		end
		]]--
		
		--Wrist
		CD[playerName].outfits[currentOutfit].wrist = Game.Player.Equipped.Wrist.Item
		CD[playerName].outfits[currentOutfit].wristName = Game.Player.Equipped.Wrist.ItemName
		--CD[playerName].outfits[currentOutfit].wristGlam = Game.Player.Equipped.Wrist.GlamName
		glam = Game.Player.Equipped.Wrist.GlamName
		CD[playerName].outfits[currentOutfit].wristGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.wrist[glam] then
				CD[playerName].glams.wrist[glam] = {}
				CD[playerName].glams.wrist[glam]["temp"] = "normal"
			end
		end
		]]--
		
		--RRing
		CD[playerName].outfits[currentOutfit].rring = Game.Player.Equipped.RRing.Item
		CD[playerName].outfits[currentOutfit].rringName = Game.Player.Equipped.RRing.ItemName
		--CD[playerName].outfits[currentOutfit].rringGlam = Game.Player.Equipped.RRing.GlamName
		glam = Game.Player.Equipped.RRing.GlamName
		CD[playerName].outfits[currentOutfit].rringGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.ring[glam] then
				CD[playerName].glams.ring[glam] = {}
				CD[playerName].glams.ring[glam]["temp"] = "normal"
			end
		end
		]]--
		
		--LRing
		CD[playerName].outfits[currentOutfit].lring = Game.Player.Equipped.LRing.Item
		CD[playerName].outfits[currentOutfit].lringName = Game.Player.Equipped.LRing.ItemName
		--CD[playerName].outfits[currentOutfit].lringGlam = Game.Player.Equipped.LRing.GlamName
		glam = Game.Player.Equipped.LRing.GlamName
		CD[playerName].outfits[currentOutfit].lringGlam = glam
		
		--[[
		if glam then
			if not CD[playerName].glams.ring[glam] then
				CD[playerName].glams.ring[glam] = {}
				CD[playerName].glams.ring[glam]["temp"] = "normal"
			end
		end
		]]--
		
		CD[playerName].outfits[currentOutfit].panties = CD[playerName].outfits[currentOutfit].panties or "0"
		CD[playerName].outfits[currentOutfit].bra = CD[playerName].outfits[currentOutfit].bra or "0"
		CD[playerName].outfits[currentOutfit].nails = CD[playerName].outfits[currentOutfit].nails or "0"
		--Is set by the Profiler
		--CD[playerName].outfits[currentOutfit].temp = tostring(reduce(OutfitTempFactor() * 0.31, 3))
		CD[playerName].outfits[currentOutfit].job = Game.Player.Entity.Job.ShortName
		CD[playerName].outfits[currentOutfit].wetAmt = CD[playerName].outfits[currentOutfit].wetAmt or 0
	end
	return ls
end

function OutfitHandler(args)
	dbgMsg(".OutfitHandler.", 2)
	local act, eVars = shiftWord(args)
	local var1, var2 = shiftWord(eVars)
	local s, glam
	local ls = Game.Player.Equipped.LoadSlots()
	if act == "save" and var1 then
		--[[if var1 ~= "" then
			if var1 == "gearupdate" and gearsetChange then
				currentOutfit = gearsetChange
				gearsetChange = nil
			else
				currentOutfit = var1
			end
			if var2 and var2 ~= "" then
				currentOutfit = currentOutfit .. " " .. var2
			end
			if #currentOutfit == 1 then
				
				s = Game.Player.Entity.Job.Name
				s = s:lower():gsub("^%l", string.upper)
				--if s then
					dbgMsg("Job: " .. tostring(s) .. ".", 0)
				--end
				s = string.gsub(s, "(%a)([%w_']*)", titleCase)
				currentOutfit = s .. " " .. string.upper(currentOutfit)
				dbgMsg("Retrieving outfit data for " .. tostring(s) .. ".", 0)
				dbgMsg("Saving for gearset: " .. tostring(currentOutfit) .. ".", 0)
			end
			CD[playerName]["currentOutfit"] = currentOutfit
			CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
			Game.SendChat("/snd run EmoGetOutfit")
		else
			s = Game.Player.Entity.Job.Name
			s = s:lower():gsub("^%l", string.upper)
			s = string.gsub(s, "(%a)([%w_']*)", titleCase)
			currentOutfit = s
			dbgMsg("Outfit name not specified...", 0)
			dbgMsg("Saving As: " .. s, 0)
			dbgMsg("Retrieving outfit data for " .. tostring(s) .. "...", 0)
			CD[playerName]["currentOutfit"] = currentOutfit
			CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
			Game.SendChat("/snd run EmoGetOutfit")
		end]]--
	elseif act == "list" then
		dumpInfo("outfits listonly")
	elseif act == "wear" then
		SmartOutfit(var1)
	elseif act == "remove" or act == "takeoff" or act == "off" then
		RemoveItem(var1)
	elseif act == "puton" then
		PutonItem(var1, var2)
	elseif act == "clear" or act == "delete" then
		CD[playerName]["outfits"][currentOutfit] = nil
		dbgMsg("Removing savedata for current outfit: " .. tostring(currentOutfit) .. ".", 0)
		currentOutfit = nil
	elseif act == "load" or act == "dress" or act == "getdressed" then
		if var1 ~= "" then
			currentOutfit = var1
			if var2 and var2 ~= "" then
				currentOutfit = currentOutfit .. " " .. var2
			end
			if #currentOutfit == 1 then
				s = Game.Player.Entity.Job.Name
				s = s:lower():gsub("^%l", string.upper)
				--if s then
					dbgMsg("Job: " .. tostring(s) .. ".", 0)
				--end
				s = string.gsub(s, "(%a)([%w_']*)", titleCase)
				currentOutfit = s .. " " .. string.upper(currentOutfit)
				dbgMsg("Retrieving outfit data for " .. tostring(s) .. ".", 0)
				dbgMsg("Saving for gearset: " .. tostring(currentOutfit) .. ".", 0)
			end
			CD[playerName]["currentOutfit"] = currentOutfit
			--CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
			--Game.SendChat("/snd run EmoGetOutfit")
			OutfitLoad(currentOutfit)
		elseif currentOutfit then
			dbgMsg("Outfit name not specified.", 0)
		end
	elseif act == "update" then
		UpdateOutfit()
	elseif act == "set" then
		if currentOutfit and currentOutfit ~= "" then
			var1 = string.lower(var1)
			if var1 == "panties" then
				dbgMsg("Panties set for " .. currentOutfit .. ".", 0)
				CD[playerName]["outfits"][currentOutfit]["panties"] = Game.Player.Equipped.Legs.Item
				CD[playerName].outfits[currentOutfit].pantiesName = Game.Player.Equipped.Legs.ItemName
				--CD[playerName].outfits[currentOutfit].pantiesGlam = Game.Player.Equipped.Legs.GlamName
				CD[playerName].outfits[currentOutfit].pantiesDyeA = Game.Player.Equipped.Legs.DyeA
				CD[playerName].outfits[currentOutfit].pantiesDyeB = Game.Player.Equipped.Legs.DyeB
				glam = Game.Player.Equipped.Legs.GlamName
				CD[playerName].outfits[currentOutfit].pantiesGlam = glam
				if glam then
					if not CD[playerName].glams.panties[glam] then
						CD[playerName].glams.panties[glam] = {}
						CD[playerName].glams.panties[glam]["temp"] = "cool"
					end
				end
				--Game.SendChat("/snd run EmoGetPanties")
			elseif var1 == "bra" then
				dbgMsg("Bra set for " .. currentOutfit .. ".", 0)
				CD[playerName]["outfits"][currentOutfit]["bra"] = Game.Player.Equipped.Body.Item
				CD[playerName].outfits[currentOutfit].braName = Game.Player.Equipped.Body.ItemName
				--CD[playerName].outfits[currentOutfit].braGlam = Game.Player.Equipped.Body.GlamName
				CD[playerName].outfits[currentOutfit].braDyeA = Game.Player.Equipped.Body.DyeA
				CD[playerName].outfits[currentOutfit].braDyeB = Game.Player.Equipped.Body.DyeB
				glam = Game.Player.Equipped.Body.GlamName
				CD[playerName].outfits[currentOutfit].braGlam = glam
				if glam then
					if not CD[playerName].glams.bra[glam] then
						CD[playerName].glams.bra[glam] = {}
						CD[playerName].glams.bra[glam]["temp"] = "cool"
					end
				end
				--Game.SendChat("/snd run EmoGetBra")
			elseif var1 == "nails" then
				dbgMsg("Nails set for " .. currentOutfit .. ".", 0)
				CD[playerName]["outfits"][currentOutfit]["nails"] = Game.Player.Equipped.Hands.Item
				CD[playerName].outfits[currentOutfit].nailsName = Game.Player.Equipped.Hands.ItemName
				--CD[playerName].outfits[currentOutfit].nailsGlam = Game.Player.Equipped.Hands.GlamName
				CD[playerName].outfits[currentOutfit].nailsDyeA = Game.Player.Equipped.Hands.DyeA
				CD[playerName].outfits[currentOutfit].nailsDyeB = Game.Player.Equipped.Hands.DyeB
				glam = Game.Player.Equipped.Hands.GlamName
				CD[playerName].outfits[currentOutfit].nailsGlam = glam
				if glam then
					if not CD[playerName].glams.nails[glam] then
						CD[playerName].glams.nails[glam] = {}
						CD[playerName].glams.nails[glam]["temp"] = "cool"
					end
				end
				--Game.SendChat("/snd run EmoGetNails")
			elseif var1 == "glasses" or var1 == "facewear" then
				dbgMsg("Facewear set for " .. currentOutfit .. ".", 0)
				CD[playerName]["outfits"][currentOutfit]["facewear"] = var2
				CD[playerName]["outfits"][currentOutfit]["glasses"] = var2
			elseif var1 == "underwear" then
				dbgMsg("Underwear -(panties, bra and nails)- set for " .. currentOutfit .. ".", 0)
				CD[playerName]["outfits"][currentOutfit]["panties"] = Game.Player.Equipped.Legs.Item
				CD[playerName].outfits[currentOutfit].pantiesName = Game.Player.Equipped.Legs.ItemName
				--CD[playerName].outfits[currentOutfit].pantiesGlam = Game.Player.Equipped.Legs.GlamName
				CD[playerName].outfits[currentOutfit].pantiesDyeA = Game.Player.Equipped.Legs.DyeA
				CD[playerName].outfits[currentOutfit].pantiesDyeB = Game.Player.Equipped.Legs.DyeB
				glam = Game.Player.Equipped.Legs.GlamName
				CD[playerName].outfits[currentOutfit].pantiesGlam = glam
				if glam then
					if not CD[playerName].glams.panties[glam] then
						CD[playerName].glams.panties[glam] = {}
						CD[playerName].glams.panties[glam]["temp"] = "cool"
					end
				end
				
				CD[playerName]["outfits"][currentOutfit]["bra"] = Game.Player.Equipped.Body.Item
				CD[playerName].outfits[currentOutfit].braName = Game.Player.Equipped.Body.ItemName
				--CD[playerName].outfits[currentOutfit].braGlam = Game.Player.Equipped.Body.GlamName
				CD[playerName].outfits[currentOutfit].braDyeA = Game.Player.Equipped.Body.DyeA
				CD[playerName].outfits[currentOutfit].braDyeB = Game.Player.Equipped.Body.DyeB
				glam = Game.Player.Equipped.Body.GlamName
				CD[playerName].outfits[currentOutfit].braGlam = glam
				if glam then
					if not CD[playerName].glams.bra[glam] then
						CD[playerName].glams.bra[glam] = {}
						CD[playerName].glams.bra[glam]["temp"] = "cool"
					end
				end
				
				CD[playerName]["outfits"][currentOutfit]["nails"] = Game.Player.Equipped.Hands.Item
				CD[playerName].outfits[currentOutfit].nailsName = Game.Player.Equipped.Hands.ItemName
				--CD[playerName].outfits[currentOutfit].nailsGlam = Game.Player.Equipped.Hands.GlamName
				CD[playerName].outfits[currentOutfit].nailsDyeA = Game.Player.Equipped.Hands.DyeA
				CD[playerName].outfits[currentOutfit].nailsDyeB = Game.Player.Equipped.Hands.DyeB
				glam = Game.Player.Equipped.Hands.GlamName
				CD[playerName].outfits[currentOutfit].nailsGlam = glam
				if glam then
					if not CD[playerName].glams.nails[glam] then
						CD[playerName].glams.nails[glam] = {}
						CD[playerName].glams.nails[glam]["temp"] = "cool"
						CD[playerName].glams.nails[glam]["buff"] = "confident"
					end
				end
				--Game.SendChat("/snd run EmoGetPanties")
				--Game.SendChat("/snd run EmoGetBra")
				--Game.SendChat("/snd run EmoGetNails")
			end
		end
	elseif act == "temp" then
		local slot = validSlotId[var1]
		if slot then
			 
		end
		if currentOutfit and currentOutfit ~= "" then
			var1 = string.lower(var1)
			dbgMsg("Temperature set for " .. currentOutfit .. ".", 0)
			CD[playerName]["outfits"][currentOutfit]["temp"] = validTemps[var1]
			
		end
	elseif act == "info" then
		Game.SendChat("/.emo info outfit")
	elseif act == "type" then
		if currentOutfit and currentOutfit ~= "" then
			local set = true
			var1 = string.lower(var1)
			var2 = string.lower(var2)
			if var2 == "remove" or var2 == "clear" then
				set = nil
			end
			
			dbgMsg("Type set for " .. currentOutfit .. ".", 0)
			CD[playerName]["outfits"][currentOutfit]["type"] = CD[playerName]["outfits"][currentOutfit]["type"] or {}
			if validtags[var1] then
				CD[playerName]["outfits"][currentOutfit]["type"][validtags[var1]] = set
			end
			
		end
	end
	CDHandler()
	--Script.SaveStorage()
end



return {validTemps, smartOutfitSelect, outfitTempEffects, validtags, validStyles,
		validSlotId, gearSlotName, OutfitSave, OutfitLoad, GetClimate, SetClimate,
		TakeoffRandom, RemoveItem, PutonItem, SmartOutfit, OutfitHandler, UpdateOutfit,
		glams, IsUnderwear, OutfitTempFactor, DressBest, DressedCheck, climates}