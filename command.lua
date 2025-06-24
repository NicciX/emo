-- Emobot
--- by Nicci M.

emoVer = "0.7.43" --current version

blockNegativeEffects = true --was changed from enableNegativeEffects 0.7.13
blockAutonomousActions = nil --was changed from enableAutonomousActions 0.7.13
chatHooking = true -- set to nil to turn off chat matching
--safe = true --  set to true to disable potentially unsafe functions
--mode = "dev"
mode = "release"

Sys = {}
Sys.Weather = true
Sys.Outfits = true
Sys.Buffs = true
Sys.Gyre = nil
Sys.Aether = true
Sys.Beacons = true
Sys.Emotes = true
Sys.Emotions = true
Sys.Routines = true
Sys.Moodles = true
Sys.Chat = true
Sys.SND = nil
Sys.Nav = true
Sys.Juju = true

CD = nil -- Character Data
pause = true
maintain = nil -- set to true to enable autonomous food and elixir use
gYRo = 0 -- set to -1 to disable Gyre Override
--

chatStack = {}
stackIdx = 0

local lock = {}
SQD = 234 -- Script Queue Delay
loaded = false
dbg = 0
updCnt = 0
currentUpdateCall = "Loading"
action = "idle"
actDo = 0
actCnt = 0
doEmo = "clap"
local emoTime = 250
local variation = 50
local emoCnt = 0
local LAT = true
rnd = true
general = true --used by traits

--EmoBot = "EmoBot"
EmoBot = "EB "

Aether = 0
lastGyreEffect = 0

--tokenStack["GEN"] = {}

tempComfortFactor = 0
rndWait = 0
lastUpdate = 0
local method = "default"

DBG = 1
-----------------------------------------
--[[
	-1 = Debugging off
	0 = Limited Info
	1 = General Info - default setting
	2 = Function Call tracking
	3 = Extended Info
	4 = Environmental - Zone Effects
	5 = Environmental - Weather
	6 = Environmental - Secondary
	7 = Traits
	8 = Environmental - Outfits
	9 = Matchsticks
	13 = Gyre
	16 = Outfit info
--]]
-----------------------------------------

ftMonth = "1"
ftDay = "1"
domiEmo = "neutral"
domiMood = "blue"
lastEmote = "cheer"
emotionsRange = 0
emotionsTotal = 1
rgsA = 0
rgsB = 0
lastGil = 0
currentGil = 0
DisT = 0
local Lp
local moodles = {}
local Tracking = {}
local jitterTracking = true
local lastTrackVal = {}
lastBeaconMap = "0"
lastBeacon = "0"
lastBeaconTime = 0
currentRoutineWait = 1
lastBeaconDistance = 9999
lastChat = ""
currentGate = "dunno"
lastGateCheck = 0
lastChatUpdate = 0
lastGossip = 0
gossipCD = 367 -- Chloe's Prime
lastTransaction = 0
speed = nil
lastCombatCheck = 0
lastNapCheck = 0
lastDressCheck = 0
optOutfitTemp = 0

--time related vars
tZone = 5*3600 -- Timezone adjust -- CST
rndTime = os.time()
loadTime = os.time()
lastPorted = 0
profilerTime = 0
dbgLastCall = 0
throttle = 0.777
lastFlagCall = os.time()
lastDistUpdate = 0
lastSpd = 0
salesTotal = 0

lastEntreeTime = 0
lastMealTime = 0
lastEntree = ""
lastMeal = ""

idles = 0
collisions = 0
castingX = 0
idleTime = 0

phrash = nil
phrashDex = 0
phrashTime = os.time()
phrashDelay = 1

dbg_log = ""
func_log = {}

emote_log = ""
var_log = ""
totalFuncTime = 0

gilBuff = 0.5
wellfed = nil

--control constants
EFreq = 67
startedDuty = 0
endedDuty = 0
routineIdx = 0
currentRoutine = nil
routineToken = nil
lastChatMsg = ""
moodyTime = os.time()
sprigganClaps = 0 -- 7 claps triggers the Gyre

lastProg = "..."
lastBijou = 0
lastSale = "^,^"
gossipCD = 369
largestPrime = 1
windfallTime = os.time()
--lastGyreEffect = 0

--[[if Game.Player.Entity.IsFemale then
	appellation = "Miss " .. Game.Player.Lastname
else
	appellation = "Mr. " .. Game.Player.Lastname
end]]--

-- Player Data
playerName = "unknown" --Game.Player.Name
playerRace = "unknown"
playerSubRace = "unknown"
gender = "unknown"
nickName = "" --Game.Player.Entity.Firstname
IsMoving = Game.Player.Moving
currentOutfit = ""
currentOutfitSet = {}

AFK = false


--		vvv Required Libs vvv 	---

zones, placeMaps = table.unpack(require "zones")
emote, emTab = table.unpack(require "emotes")
routines = require "routines"
beacons = require "beacons"
beaconTypes = require "btypes"
traits, AddTrait, RemoveTrait, ListTraits, TraitCheck = table.unpack(require "traits")
quirk, SetQuirkVar, GetQuirkVar, PopQuirk, QuirkHandler, QuirkSet, Compulsions = table.unpack(require "quirks")
targetActions = require "targets"
strings, matchsticks, matchMadness, phrasher = table.unpack(require "strings")
yaaar = require "pirate"


--quirks, buff, ApplyBuff, SetQuirkVar, GetQuirkVar, PopQuirk, QuirkHandler, QuirkSet, Compulsions

emoHandler, tokenHandler, tokenStack, UpdateStorageData, AetherHandler, JujuChurn,
Gyre, GyreConduit, aspectTable, EmoGyre, aspectAffinity, moods, dbgGyre, runGyreMethod, 
gyreMethods, updateAffinity, aspectPass, GyreLite, GyreCheck = table.unpack(require "handlers")

--emoHandler, tokenHandler, tokenStack, UpdateStorageData, AetherHandler, JujuChurn, 
--Gyre, aspectTable, EmoGyre, GyreConduit, aspectAffinity, moods, dbgGyre, runGyreMethod, gyreMethods,
--updateAffinity, aspectPass = table.unpack(require "handlers")

validTemps, smartOutfitSelect, outfitTempEffects, validTypes, validStyles,
validSlotId, gearSlotName, OutfitSave, OutfitLoad, GetClimate, SetClimate,
TakeoffRandom, RemoveItem, PutonItem, SmartOutfit, OutfitHandler, UpdateOutfit,
glams, IsUnderwear, OutfitTempFactor, DressBest, DressedCheck, climates = table.unpack(require "outfitter")

buff = require "buffs"

ChatHandler, Blimey, StringsHandler, Chatty, ChattyChop, JujuHoodoo, FlameCheck, MatchStick, Windfall,
TimeGate, doPhrash, ProgHandler, emoReact, Crystal, doBijou, bijous, Expense, cookTheBooks, validEarnings,
Census, startTour, NextCurrent = table.unpack(require "chatter")

func_time, dumpInfo, SetDBG, dbgMsg, trim_log, func_track, efficiency, filterLog, profiler = table.unpack(require "profiler")



--

---		^^^Required Libs ^^^ 	---


---		vvv Data Tables/JSON vvv 	---
---									---
									
validSysChan = {
	["2105"] = "Prog",
	[2105] = "Prog",
	["2110"] = "Prog",
	[2110] = "Prog",
	["2112"] = "Prog",
	[2112] = "Prog",
	["2114"] = "Items",
	["2115"] = "Prog",
	["2142"] = "Profit",
	["2122"] = "Dice",
	["2219"] = "Ready Teleport",
	["2238"] = "MGP",
	[2238] = "MGP",
	["2242"] = "Prog",
	["2091"] = "Use Teleport",
	["2092"] = "You use",
	["71"] = "RetainerSale",
	["RetainerSale"] = "RetainerSale",
	["NPCDialogue"] = "NPCDialogue",
	["NPCDialogueAnnouncements"] = "NPCDialogueAnnouncements",
	["retainersale"] = "RetainerSale",
	["65"] = "Loot",
	["62"] = "gil",
	["Debug"] = "Debug",
	["debug"] = "Debug",
	["SystemMessage"] = "SystemMessage",
	["systemmessage"] = "SystemMessage",

}

listenChn = {
	["62"] = "LootMessage",
	["64"] = "CharacterProgress",
	["65"] = "Loot",
	["66"] = "Crafting",
	["67"] = "Gathering",
	["69"] = "FCAnnouncement",
	["70"] = "FCLogin",
	["71"] = "RetainerSale",
	["72"] = "PartyFinderState",
	["76"] = "OrchestrationMessage",
	["2091"] = "ActionUsedOnYou",
	["NPCDialogue"] = "NPCDialogue",
	[2105] = "Prog",
	[2112] = "Prog",
	[2142] = "Profit",
	["2105"] = "Prog",
	["2110"] = "Prog",
	["2112"] = "Prog",
	["2114"] = "Items",
	["2115"] = "Prog",
	["2112"] = "Dice",
	["2238"] = "MGP",
	["2092"] = "You use",
	[2238] = "MGP",
	["2142"] = "Profit",
	["2242"] = "Profit",
	[2218] = "FailedActionUsedOnYou",
	[2219] = "ActionReadiedByYou",
	[2222] = "BeneficialEffectOnYou",
	[2224] = "BeneficialEffectOnYouEnded",
	[2729] = "DamageDealtByYou",
	[2735] = "DetrimentalEffectsInflictedByYou",
	["2874"] = "EnemyDefeatedByYou",
	["NPCDialogueAnnouncements"] = "NPCDialogueAnnouncements",
	[8235] = "ActionUsedByOtherPlayer",
	[8750] = "BeneficialEffectOnOtherPlayer",
	[8751] = "DetrimentalEffectOnOtherPlayer",
	[8752] = "BeneficialEffectOnOtherPlayerEnded",
	[8774] = "FreeCompanyMemberLoginNotifications",
	[10283] = "ActionReadiedByEngagedEnemy",
	[10409] = "DamageYouAreDealt",
	[10410] = "FailedAttacksOnYou",
	[10929] = "DetrimentalEffectOnEnemyEnded",
	["FreeCompany"] = "FreeCompany",
	["TellOutgoing"] = "TellOutgoing",
	["StandardEmote"] = "StandardEmote",
	["standardemote"] = "StandardEmote",
	["Say"] = "Say",
	["Yell"] = "Yell",
	["Shout"] = "Shout",
	["Party"] = "Party",
	["ls2"] = true,
	["l2"] = true,
	["Ls2"] = true,
	["Alliance"] = "Alliance",
	["RetainerSale"] = "RetainerSale",
	["retainersale"] = "RetainerSale",
	["SystemMessage"] = "SystemMessage",
	["Debug"] = "Debug",
	["debug"] = "Debug",
	["systemmessage"] = "SystemMessage",
}

validChn = { -- valid channels that EmoBot is allowed to send chat too
	["fc"] = "/fc ",
	["freecompany"] = "/fc ",
	["party"] = "/p ",
	["telloutgoing"] = true,
	["tell"] = true,
	["2105"] = true, -- info channel
	["2242"] = true,
	["p"] = "/p ",
	["Ls1"] = true,
	["Ls2"] = true,
	["ls2"] = true,
	["l2"] = "/l2 ",
	["3"] = true,
	["4"] = true
}

currentConduit = {
	 ["black"] = 2,
	  ["blue"] = 3,
	   ["red"] = 5,
	["yellow"] = 5,
	 ["green"] = 3,
	 ["white"] = 7
}

playerTraits = {
	["neutral"] = true,
}

emotesPlayer = {}

sittin_motes = {
	[1] = "doze",
	[2] = "wow",
	[3] = "snap",
	[4] = "read",
	[5] = "apple",
	[6] = "bread",
	[7] = "choco",
	[8] = "tea",
	[9] = "tomestone",
	[10] = "egg",
	[11] = "pizza",
	[12] = "elucidate",
	[13] = "clap",
	[14] = "me",
	[15] = "photograph",
	[15] = "poke",
	[16] = "pray",
	[17] = "slap",
	[18] = "shrug",
	[19] = "soothe",
	[20] = "thumbsup",
	[21] = "vexed",
	[22] = "yes",
	[23] = "think",
	[24] = "stretch",
	[25] = "examineself",
	[26] = "shush",
	[27] = "insist",
	[28] = "goodbye",
	[29] = "fist",
	[30] = "congratulate",
	[31] = "clutchhead",
}

gewgaw = {
	["black"] = "♠",
	["blue"] = "♦",
	["red"] = "♥",
	["yellow"] = "",
	["green"] = "♣",
	["white"] = "♀"
}

emoState = {
	["focused"] = 0,
	["dazed"] = 0,
	["mischievous"] = 0,
	["disturbed"] = 0,
	["apathetic"] = 0,
	["aetheric"] = 0,
	
	["bored"] = 0,
	["scared"] = 0,
	["sleepy"] = 0,
	["sad"] = 0,
	["cold"] = 0,
	["grungy"] = 0,
	
	--["wet"] = 0,

	["angry"] = 0,
	["embarrassed"] = 0,
	["curious"] = 0,
	["hot"] = 0,
	["flirty"] = 0,
	["amused"] = 0,
	
	["hungry"] = 0,
	["puzzled"] = 0,
	["energized"] = 0,
	["busy"] = 0,
	["amazed"] = 0,
	["surprised"] = 0,
	
	["tense"] = 0,
	["uncomfortable"] = 0,
	["impatient"] = 0,
	["refreshed"] = 0,
	["wet"] = 0,
	["nosey"] = 0,
	
	["happy"] = 0,
	["playful"] = 0,
	["confident"] = 0,
	["social"] = 0,
	["neutral"] = 0,
	["responsible"] = 0,
}

local moodleGuid = {
	["domiMood"] = {
		["red"] = "d02cd9b4-2b74-407f-bf8d-1e18ae546e89",
		["black"] = "2a2c406c-1f36-4c47-8101-d2fcff845c41",
		["green"] = "bcf2089d-9f2f-4de3-a471-ceae852f79ef",
		["blue"] = "a17510bb-ce98-4655-91f2-597b5f4d8f28",
		["yellow"] = "9fa06ea2-6d6e-411e-aae3-65faecae7855",
		["white"] = "f53583fc-f7c9-4f81-86b4-ddc9813923c2",
	},
	["quirks"] = {
		["asswarmer"] = "933358c8-ceb8-4f0b-8287-e739e850bab5",
	},
	["tokens"] = {
		["splash"] = "a15a2112-936f-4ebe-a4a2-8e65eaf64ce5",
		["comfybench"] = "4b71709d-26bd-42ce-817d-e62a804b8955",
	},
	["buffs"] = {
		["Aether+"] = "5e57c1de-d4ea-4d31-886f-2bf105cfd668",
		["Aether++"] = "7f7e01d3-7591-46eb-bbcb-ca20fe3cbcf1",
		["-Aether"] = "d33405b6-992f-45bc-a132-88c719f7d52f",
		["comfy"] = "ebcfd8f9-ba40-47c0-9a4b-ca13209421ef",
		["Overcharged++"] = "9f49b5d6-11a6-41f4-ba14-ed1fd124d96e",
		["SprigganJuju"] = "fc9651c6-4d88-48a6-8068-3c7030accc3c",
		["FemmeFatale"] = "acb67bea-6f6b-4030-9f74-babeeaa909f3",
		["zzz"] = "bcf94eab-01f6-4cc5-80e4-202f9aced262",
		["+AetherSpriggan+"] = "7811c0fb-728b-47b7-bbae-97e0f160aa77",
		["-AetherSpriggan-"] = "de34d7f5-364e-4a5a-af46-d81514189997",
		["GoldStar"] = "aa17f061-09c5-4863-ac33-21f806fa9738",
		["SilverStar"] = "e41c7515-be23-4bae-8001-f79d548ad6f2",
		["BronzeStar"] = "a2d86434-6dac-467a-9f25-94f583be392f",
		["BusyBee"] = "868c4ca6-a223-4557-ac9f-ce218d792d48",
		["Shameful"] = "5ad55700-87cc-4278-9f2e-f93398526061",
		["Caffeinated"] = "3b962bd3-701d-4141-8819-f866ff2e1573",
		["XAetherSprigganX"] = "4e33b04d-d70f-4261-9cf5-64d094d95e0f",
		["Aetheric Dissipation"] = "6a86b326-1998-4582-8b8f-4e570563f8a1",
	}
}

AetheryteType = {
	["aetheryte"] = {
		["type"] = "A",
		["radius"] = 36,
		["cooldown"] = 9,
	},
	["aethernet ahard"] = {
		["type"] = "B",
		["radius"] = 4.5,
		["cooldown"] = 15,
	},
	["aethernet shard"] = {
		["type"] = "B",
		["radius"] = 4.5,
		["cooldown"] = 15,
	},
}

flags = {
	-- Tests for GetCharacterCondition(n, true)
-- n (bit) -- Status - ~~~~
	[1] = true, -- 1 (0) -- NormalConditions
	[2] = false, -- 3 (1) -- Emoting
	[3] = false, -- 9 (2)  -- CarryingObject
	[4] = false, -- 11 (3)  -- InThatPosition - sitting or dozing
	[5] = false, -- 27 (4)  -- Casting
	[6] = false, -- 36 (5)  -- InDeulingArea
	[7] = false, -- 45 (6)  -- BetweenAreas - can be used to determine if porting
	[8] = false, -- 46 (7)  -- Stealthed
	[9] = false, -- 48 (8)  -- Jumping
	[10] = false, -- 49 (9)  -- AutoRunActive
	[11] = false, -- 50 (10)  -- OccupiedSummoningBell
	[12] = false, -- 51 (11)  -- BetweenAreas51
	[13] = false, -- 52 (12)  -- SystemError
	[14] = false, -- 53 (13)  -- LoggingOut
	[15] = false, -- 54 (14)  -- ConditionLocation
	[16] = false, -- 65 (15)  -- Carrying Item
	[17] = false, -- 68 (16)  -- Transformed
	[18] = false, -- 70 (17)  -- BeingMoved
	[19] = false, -- 77 (18)  -- InFlight
	[20] = false, -- 90 (19)  -- RolePlaying
	[21] = false, -- 92 (20)  -- ReadyingVisitOtherWorld
	[22] = false, -- 93 (21)  -- WaitingToVisitOtherWorld
	[23] = false, -- 94 (22)  -- UsingParasol
	[24] = false, -- 97 (23)  -- Disguised
	[25] = false, -- 100 (24)  -- EditingPortrait
}

HasStatus = { --deprecate?
	[1] = false, -- Well Fed
	[2] = false, -- Sprint
	[3] = false, -- Pelotan
	[4] = false, -- Medicated

}

local loggingFilter = { --deprecate?
	["general"] = 0,
	["emotes"] = 1,
	["functions"] = 2,
	["emotions"] = 3,
	["traces"] = 4,
	["trace"] = 4,
	["weather"] = 5,
	["zoneeffects"] = 6,
	["zone"] = 6,
	["zone effects"] = 6,
	["aether"] = 7,
	["churn"] = 7,
	["aether churn"] = 7,
	["outfits"] = 8,
	["chat"] = 9,
	["gyre"] = 13,
	

}

local effects = {
	["crafting"] = function() return IsCrafting end,
}

entrees = {
	["Boiled Egg"] = {
		["itemId"] = 4650,
	},
	["Calamari Ripieni"] = {
		["itemId"] = 37282,
		["allowHQ"] = true,
	},
	["Cinnamon Cream Coffee"] = {
		["itemId"] = 44179,
		["allowHQ"] = true,
	},
	["Sweet Muffin"] = {
		["itemId"] = 44085,
		["allowHQ"] = true,
	},
	["Tsai tou Vounou"] = {
		["itemId"] = 36060,
	},
	["Tender Shortcake"] = {
		["itemId"] = 44089,
		["allowHQ"] = true,
	},
	["Wild Banana Blend"] = {
		["itemId"] = 44102,
	},
}

meals = {
	["Mate Cookie"] = {
		["itemId"] = 46003,
		["allowHQ"] = true,
		["dps"] = 44, -- weight value
		--["buff"] = "cookie",
	},
	["Pineapple Orange Jelly"] = {
		["itemId"] = 44182,
		["allowHQ"] = true,
		["caster"] = 44,
		["healer"] = 33,
		--["buff"] = "cookie",
	},
	["Creamy Alpaca Pasta"] = {
		["itemId"] = 44087,
		["allowHQ"] = true,
		["caster"] = 33,
		["healer"] = 27,
		--["buff"] = "cookie",
	},
	["Moqueca"] = {
		["itemId"] = 44178,
		["allowHQ"] = true,
		["dps"] = 31,
		["melee"] = 31,
	},
	["Rroneek Steak"] = {
		["itemId"] = 44091,
		["allowHQ"] = true,
		["crafter"] = 67,
	},
	["Stuffed Peppers"] = {
		["itemId"] = 44103,
		["allowHQ"] = true,
		["gatherer"] = 44,
	},
	["Nasi Goreng"] = {
		["itemId"] = 44078,
		["allowHQ"] = true,
		["gatherer"] = 33,
	},
	["Calamari Ripieni"] = {
		["itemId"] = 37282,
		["allowHQ"] = true,
		["crafter"] = 22,
	},
	["Sweet Muffin"] = {
		["itemId"] = 44085,
		["allowHQ"] = true,
		["caster"] = 33,
	},
	["Tsai tou Vounou"] = {
		["itemId"] = 36060,
		["allowHQ"] = true,
		["crafter"] = 11,
	},
	["Tender Shortcake"] = {
		["itemId"] = 44089,
		["allowHQ"] = true,
		["healer"] = 33,
	},
}

elixirs = {
	["Superior Spiritbond Potion"] = {
		["itemId"] = 37282,
		["allowHQ"] = true,
	},
	["Cunning Craftsman's Tisane"] = {
		["itemId"] = 44169,
		["allowHQ"] = true,
	},
}

local weather_effects = {
	["Clouds"] = {
		["neutral"] = {
			["effects"] = {
				["happy"] = -0.25,
				["sad"] = -0.55,
				["confident"] = -0.75,
				["energized"] = -0.75,
				["sleepy"] = 0.25,
				["bored"] = 0.25,
				["wet"] = 0.17,
			},
			["temp"] = 0.81,
		},
		["drybones"] = {
			["effects"] = {
				["happy"] = -1,
				["sad"] = 1,
				["confident"] = -1,
				["energized"] = -1,
				["sleepy"] = 1,
			},
		},
	},
	["Rain"] = {
		["neutral"] = {
			["effects"] = {
				["happy"] = -3,
				["sad"] = -2,
				["confident"] = -5,
				["focused"] = -1,
				["cold"] = 0.47,
				["hot"] = -0.33,
				["energized"] = -2,
				["sleepy"] = 2,
				["bored"] = 2,
				["wet"] = 4.11,
				["aetheric"] = -7.37,
				["grungy"] = -1.33,
				["refreshed"] = 6.39,
			},
			["temp"] = 0.66,
		},
	},
	["Clear Skies"] = {
		["neutral"] = {
			["effects"] = {
				["happy"] = 2,
				["sad"] = -3,
				["focused"] = 1,
				["cold"] = -0.67,
				["energized"] = 1,
				["sleepy"] = -0.2,
				["bored"] = -1,
				["scared"] = -1,
				["wet"] = -1.39,
			},
			["temp"] = 1.0,
		},
		
	},
	["Fair Skies"] = {
		["neutral"] = {
			["effects"] = {
				["happy"] = 1,
				["sad"] = -2,
				["cold"] = -0.37,
				["focused"] = 1,
				["confident"] = 1,
				["energized"] = 1,
				["sleepy"] = -0.2,
				["bored"] = -1,
				["scared"] = -1,
				["wet"] = -1.39,
			},
			["temp"] = 1.0,
		},
		
	},
	["Fog"] = {
		["neutral"] = {
			["effects"] = {
				["disturbed"] = 0.75,
				["sad"] = 0.25,
				["focused"] = -1,
				["confident"] = -2,
				["energized"] = -1,
				["sleepy"] = 1,
				["curious"] = 0.75,
				["scared"] = 0.75,
				["cold"] = 0.44,
				["wet"] = 2.34,
				["aetheric"] = 0.19,
			},
			["temp"] = 0.71,
		},
	},
	["Wind"] = {
		["neutral"] = {
			["effects"] = {
				["focused"] = -1,
				["confident"] = -3,
				["energized"] = 1,
				["uncomfortable"] = 1,
				["curious"] = 1,
				["scared"] = 1,
				["cold"] = 0.37,
				["wet"] = -0.44,
				["aetheric"] = 0.45,
			},
			["temp"] = 0.79,
		},
		
	},
	["Gales"] = {
		["neutral"] = {
			["effects"] = {
				["disturbed"] = 2,
				["focused"] = -1,
				["confident"] = -3,
				["energized"] = -1,
				["uncomfortable"] = 1,
				["refreshed"] = 3,
				["scared"] = 1,
				["cold"] = 1,
				["wet"] = -1.33,
				["aetheric"] = 0.75,
			},
			["temp"] = 0.69,
		},
	},
	["Dust Storms"] = {
		["neutral"] = {
			["effects"] = {
				["disturbed"] = 2,
				["focused"] = -1,
				["confident"] = -4,
				["energized"] = -1,
				["grungy"] = 3.9,
				["curious"] = 1,
				["scared"] = 1,
				["hot"] = 2,
				["wet"] = -3.9,
				["aetheric"] = -0.33,
			},
			["temp"] = 1.11,
		},
		
	},
	["Heat Waves"] = {
		["neutral"] = {
			["effects"] = {
				["hot"] = 7.5,
				["focused"] = -2,
				["sleepy"] = 1,
				["energized"] = -2,
				["refreshed"] = -3,
				["uncomfortable"] = 2,
				["wet"] = 1,
				["concerned"] = 1,
			},
			["temp"] = 1.77,
		},
		
	},
	["Blizzards"] = {
		["neutral"] = {
			["effects"] = {
				["cold"] = 1.69,
				["focused"] = -1,
				["sleepy"] = 1,
				["energized"] = -3,
				["uncomfortable"] = 3,
				["wet"] = 1,
				["concerned"] = 1,
				["disturbed"] = 2,
				["happy"] = -1,
				["hot"] = -1.69,
			},
			["temp"] = 0.51,
		},
	},
	["Snow"] = {
		["neutral"] = {
			["effects"] = {
				["cold"] = 1.66,
				["focused"] = -1,
				["sleepy"] = -0.2,
				["energized"] = -1,
				["refreshed"] = 2.6,
				["wet"] = 0.39,
				["happy"] = 1,
				["confident"] = 1,
				["sad"] = -1,
				["hot"] = -0.79,
			},
				["temp"] = 0.41,
		},
	},
	["Gloom"] = {
		["neutral"] = {
			["effects"] = {
				["dazed"] = 1,
				["focused"] = -1,
				["sleepy"] = 2,
				["energized"] = -1,
				["refreshed"] = -1,
				["angry"] = 1,
				["concerned"] = 1,
				["disturbed"] = 2,
				["social"] = -1,
				["aetheric"] = 0.17,
			},
			["temp"] = 0.37,
		},
	},
	["Moon Dust"] = {
		["neutral"] = {
			["effects"] = {
				["dazed"] = 1,
				["focused"] = -1,
				["sleepy"] = 2,
				["energized"] = -1,
				["angry"] = 2,
				["grungy"] = 3,
				["social"] = -1,
				["aetheric"] = 0.17,
			},
			["temp"] = 0.31,
		},
	},
	["Tension"] = {
		["neutral"] = {
			["effects"] = {
				["dazed"] = 1,
				["focused"] = -1,
				["sleepy"] = 2,
				["energized"] = 1,
				["angry"] = 1,
				["disturbed"] = 2,
				["social"] = -1,
				["aetheric"] = 0.23,
			},
		},
		["temp"] = 1.3,
	},
	["Thunder"] = {
		["neutral"] = {
			["effects"] = {
				["dazed"] = 1,
				["focused"] = -1,
				["scared"] = 2,
				["energized"] = 0.25,
				["scared"] = 1,
				["wet"] = 2.1,
				["disturbed"] = 2.5,
				["social"] = -1,
				["aetheric"] = 0.51,
			},
		},
		["temp"] = 0.77,
	},
	["Umbral Static"] = {
		["neutral"] = {
			["effects"] = {
				["curious"] = 1,
				["flirty"] = 2,
				["scared"] = 2,
				["energized"] = 1.65,
				["tense"] = 1.5,
				["angry"] = 2,
				["aetheric"] = 1.39,
			},
			["temp"] = 1.39,
		},
	},
	["Umbral Wind"] = {
		["neutral"] = {
			["effects"] = {
				["curious"] = 1,
				["playful"] = 1,
				["scared"] = 1.5,
				["energized"] = 0.95,
				["tense"] = 1,
				["disturbed"] = 3.5,
				["angry"] = 2,
				["aetheric"] = 1.69,
			},
			["temp"] = 1.77,
		},
	},
	["Astromagnetic Storms"] = {
		["neutral"] = {
			["effects"] = {
				["curious"] = 1.6,
				["sad"] = 1,
				["scared"] = 1.5,
				["energized"] = 2.95,
				["tense"] = 2,
				["disturbed"] = 3.5,
				["angry"] = 2,
				["hungry"] = -2,
				["aetheric"] = 2.31,
			},
			["temp"] = 2.11,
		},
	},
}
	
local special = {
	["jumpingjacks"] = "lophop 650 150 175",
	["ddhead"] = "deride 1250 125 50",
	["flustered"] = "angry 750 450 50",
	["zapped"] = "pdead 150 25 150",
	["feelinit"] = "pdead 600 90 50",
	["mmm"] = "stretch 300 25 75",
	["ahoy"] = "surprised 425 25 50",
	["whoopin"] = "slap 350 45 75",
	["nonos"] = "no 250 25 75", --Chloe no
	["nope"] = "no 1200 100 60", --Nicci no
	["chicken"] = "surprised 545 45 50",
	["sneeze"] = "fume 450 40 60", --Sandy
	["freakout"] = "panic 275 25 85", --Sandy
	["hairball"] = "angry 375 35 75", --Sandy
}

local EmotionGroup = {
	["black"] = {
		["value"] = 0,
		["brush"] = "paintblack",
		["effects"] = {
			["angry"] = -15,
			["flirty"] = 5,
			["cold"] = 5,
			["puzzled"] = 5,
			["focused"] = -15,
			["sleepy"] = -15,
			["dazed"] = -15,
			["mischievous"] = -15,
			["nosey"] = -15,
			["neutral"] = -10,
		},
	},
	["red"] = {
		["value"] = 0,
		["brush"] = "paintred",
		["effects"] = {
			["confident"] = -15,
			["playful"] = -15,
			["embarrassed"] = -15,
			["curious"] = -15,
			["hot"] = -15,
			["flirty"] = -15,
			["flippant"] = -15,
			["amused"] = -15,
			["sad"] = 5,
			["hungry"] = 5,
			["focused"] = 5,
			["neutral"] = -10,
		},
	},
	["blue"] = {
		["value"] = 0,
		["brush"] = "paintblue",
		["effects"] = {
			["scared"] = -15,
			["sad"] = -15,
			["cold"] = -15,
			["wet"] = -15,
			["tired"] = -20,
			["bored"] = -20,
			["tense"] = -15,
			["uncomfortable"] = -20,
			["responsible"] = -15,
			["dazed"] = 5,
			["embarrassed"] = 5,
			["happy"] = 5,
			["neutral"] = -10,
		},
	},
	["yellow"] = {
		["value"] = 0,
		["brush"] = "paintyellow",
		["effects"] = {
			["happy"] = -15,
			["puzzled"] = -15,
			["energized"] = -15,
			["busy"] = -15,
			["impatient"] = -15,
			["hungry"] = -15,
			["social"] = -15,
			["sleepy"] = 5,
			["bored"] = 5,
			["hot"] = 5,
			["neutral"] = -10,
		},
	},
	["green"] = {
		["value"] = 50,
		["brush"] = "neutral",
		["effects"] = {
			["neutral"] = -25,
		},		
	},
}

moodAspect = {
	--Elemental Aspects; Earth; The Base = 1, 2, 3, 5, 7, 11, 13, 77
	--					 Wind = 3, 6, 9, 15, 39, 63, 67, 88
	--					 Lightning = 11, 6, 37, 19
	--					 Ice = 17, 21, 29, 31, 41, 51, 91, 92
	--					 Water = 7, 17, 23, 66
	--					 Fire = 6, 27, 33
	--Elementals; earth, ice
	--Black Moods
	--focused = lightning, fire, 
	["focused"] = "black",
	["dazed"] = "black",
	["mischievous"] = "black",
	["disturbed"] = "black",
	["apathetic"] = "black",
	["aetheric"] = "black",

	-- Elementals; water, ice
	--Blue Moods
	["bored"] = "blue",
	["scared"] = "blue",
	["sleepy"] = "blue",
	["sad"] = "blue",
	["cold"] = "blue",
	["grungy"] = "blue",
	
	--Elementals; earth, fire
	--Red Moods
	["angry"] = "red",
	["embarrassed"] = "red",
	["curious"] = "red",
	["hot"] = "red",
	["flirty"] = "red",
	["amused"] = "red",
	
	--Elementals; lightning, fire
	--Yellow Moods
	["hungry"] = "yellow",
	["puzzled"] = "yellow",
	["energized"] = "yellow",
	["busy"] = "yellow",
	["amazed"] = "yellow",
	["surprised"] = "yellow",
	
	--Elementals; wind, water
	["tense"] = "green",
	["uncomfortable"] = "green",
	["impatient"] = "green",
	["refreshed"] = "green",
	["wet"] = "green",
	["nosey"] = "green",
	
	--Elementals; lightning, wind
	--White Moods
	["happy"] = "white",
	["playful"] = "white",
	["confident"] = "white",
	["social"] = "white",
	["neutral"] = "white",
	["responsible"] = "white",
}

local mT = {
	"focused",
	"dazed",
	"mischievous",
	"disturbed",
	"flippant",
	"aetheric",
	"bored",
	"scared",
	"sleepy",
	"sad",
	"cold",
	"wet",
	"angry",
	"embarrassed",
	"curious",
	"hot",
	"flirty",
	"amused",
	"hungry",
	"puzzled",
	"energized",
	"busy",
	"amazed",
	"surprised",
	"tense",
	"uncomfortable",
	"impatient",
	"refreshed",
	"diving",
	"nosey",
	"happy",
	"playful",
	"confident",
	"social",
	"neutral",
	"responsible"
}

local defaultEmotes = { --deprecate
	"welcome", "goodbye", "wave", "kneel", "salute", "chuckle", "laugh", "joy", "happy", "box",
	"rally", "soothe", "blush", "comfort", "psych", "pray", "blowkiss", "dance", "yes", "thumbsup",
	"clap", "congratulate", "cheer", "no", "deny", "cry", "furious", "fume", "panic", "upset", "disappointed",
	"sulk", "angry", "huh", "shocked", "shrug", "stagger", "surprised", "doubt", "grovel", "pose", "beckon",
	"think", "examineself", "doze", "point", "poke", "stretch", "lookout", "airquotes", "converse", "waterfloat",
	"photograph"
}

local decayRate = {
		["focused"] = 0.35,
		["dazed"] = 0.35,
		["mischievous"] = 0.35,
		["disturbed"] = 0.37,
		["apathetic"] = 0.31,
		["aetheric"] = -0.37,
	
		["bored"] = 0.75,
		["scared"] = 0.35,
		["sleepy"] = 3.7,
		["sad"] = 0.15,
		["cold"] = 0.35,
		["grungy"] = -0.39,
	
		["angry"] = 0.35,
		["embarrassed"] = 0.325,
		["curious"] = 0.15,
		["hot"] = 0.35,
		["flirty"] = 0.35,
		["amused"] = 0.25,
	
		["hungry"] = -0.023,
		["puzzled"] = 0.35,
		["energized"] = 0.65,
		["busy"] = 1,
		["amazed"] = 0.35,
		["surprised"] = 0.35,
	
		["tense"] = 1,
		["uncomfortable"] = 0.5,
		["impatient"] = 0.25,
		["refreshed"] = 0.75,
		["wet"] = 2.77,
		["nosey"] = 0.35,
		
		["happy"] = -3.21,
		["playful"] = 0.35,
		["confident"] = 1.75,
		["social"] = 0.25,
		["neutral"] = -0.05,
		["responsible"] = 0.77,
}

--									--
--		^^^ Data Tables/JSON ^^^ 	--
--									--



---		vvv General Functions vvv 	---
---									---
function titleCase( first, rest )
   return first:upper()..rest:lower()
end

function initPersona()
	CD[playerName]["emotions"] = emoState
	--Script.Storage.emotions[playerName] = emoState
	CD[playerName]["emoGroups"] = {
		["black"] = 0,
		["red"] = 0,
		["blue"] = 0,
		["yellow"] = 0,
		["green"] = 0,
	}
	CD[playerName]["emotionsSet"] = true
	Script.Storage[playerName] = CD[playerName]
	--Script.Storage.base[playerName]["emotionsSet"]
	Script.SaveStorage()
end

function shiftWord(text, wordTransformer)
	if type(text) ~= "string" then text = tostring(text) end
	local word, rest = text:match("([%w-]+)(.*)")
	word = (word or ""):match("^%s*(.-)%s*$")
	rest = (rest or ""):match("^%s*(.-)%s*$")
	if type(wordTransformer) == "function" then word = wordTransformer(word) end
	return word, rest
end

function check_status(stat)
	if filterLog["2"] then
		dbgMsg("ƒcheck_statusƒ", 2)
	end
	func_time["check_status"].ST = os.time()
	
	local func, oopsoo = load("return "..stat)
	local er, ret = pcall(func)
	if ret then
		return ret
	end
	func_time["check_status"].END = os.time()
	func_track("check_status")
	return ret
end

function CheckBusy()
	if IsCrafting then
		return "Crafting"
	elseif InCombat then
		return "In Combat"
	elseif IsFlying and IsMoving then
		return "Traveling (Flying)"
	elseif IsMounted and IsMoving then
		return "Traveling (Mount)"
	elseif IsMoving then
		return "Traveling (On Foot)"
	elseif IsFishing then
		return "Fishing"
	elseif IsGathering then
		return "Gathering"
	elseif IsPerforming then
		return "Performing"
	elseif IsCasting then
		return "Casting"
	elseif IsInCutscene then
		return "In Cutscene"
	elseif IsTrading then
		return "Trading"
	elseif IsEmoting then
		return "Emoting"
	elseif AtBell then
		return "AtBell"
	end
end

function send(msg)
	if not safe then
		Game.SendChat(msg)
	else
		dbgMsg("ƒsendƒ :: this function blocked by safe mode.", 2)
	end
end

function IsPrime(n)
	if n/2 == math.floor(n/2) then
		return false
	elseif n/3 == math.floor(n/3) then
		return false
	elseif n/5 == math.floor(n/5) then
		return false
	end
	local fc = factors(n)
	if #fc == 1 then
		return true
	end
	return false
end

function pairsByKeys (t, f)
	local a = {}
	for n in pairs(t) do
		table.insert(a, n)
	end
	table.sort(a, f)
	local i = 0
	local iter = function ()
		i = i + 1
		if a[i] == nil then
			return nil
		else 
			return a[i], t[a[i]]
		end
	end
	return iter
end

function keysIn(tbl)
	local cnt = 0
	for k,v in pairs(tbl) do
		cnt = cnt + 1
	end
	return cnt
end

function table_order(tbl)
	local a = tcopy(tbl)
	local t = {}
	for n, l in pairsByKeys(a) do
		t[n] = l
    end
	return t
end

function table_to_string(tbl, del)
	if not del then
		del = ","
	end
	local str = ""
	local c = 1
	for k,v in pairs(tbl) do
		if type(v) == "table" then
			str = str .. tostring(k) .. tostring(del)
		else
			str = str .. tostring(v)
		end
		if c < #tbl then
			str = str .. tostring(del)
		end
		c = c + 1
	end
	return str
end

function boolToNumber(n)
	if n == true then
		return 1
	else
		return 0
	end
end

function factors(n)
	local i = 2
	local fcts = {}
	--dbgMsg("ƒfactorsƒ :: n : " .. tostring(n), 1)
	while (i <= n) do
		if n % i == 0 then
			fcts[#fcts+1] = i
			n = (n / i)
		else
			i = i + 1
		end
	end
	if n > 1 then
		fcts[#fcts+1] = i
	end
	return fcts
end

function hex_to_utf(hex)
	--hex = tonumber(hex)
	if not hex then
		hex = "2660"
	end
	if tonumber(hex) then
		if tonumber(hex) < 1 then
			hex = "2660"
		end
	end
	local utf = "return '\\u{hex}'"
	local fs = string.gsub(utf, "hex", hex)
	local utf = "♠"
	local f, fail = load(fs)
	--dbgMsg("hex_to_utf fs: " .. tostring(fs), 1)
	--dbgMsg("hex_to_utf fail: " .. tostring(fail), 1)
	if f then
		local s, rv = pcall(f)
		if rv then
			utf = rv
		end
	end
	return utf
end

function str_ins(str,txt,st,nd)
	st = st or 1
	nd = nd or st
    return str:sub(1, st - 1) .. txt .. str:sub(nd + 1)
end

function totalX(x)
	local c = 0
	for k, v in pairs(_G) do
		if type(v) == x or x == "all" then
			c = c + 1
		end
	end
	return tostring(c)
end

function sign(x)
	if not x then
		return 0
	end
	if x > 0 then
		return 1
	elseif x < 0 then
		return -1
	else
		return x
	end
end

function diff(a,b)
	return math.abs(a-b)
end

function int(x)
	return math.floor(x)
end

function gilXhour(opt)
	local gdif,ivl,ph
	if opt then
		gdif = CD.global.gil - CD.global.initialGil
		ivl = (os.time() - CD.global.startday) / 3600
	else
		gdif = currentGil - initialGil
		ivl = (os.time() - startday) / 3600
	end
	ph = math.floor(gdif / ivl)
	if not opt then
		if currentGil and initialGil and startday then
		--return tostring(reduce((currentGil - initialGil) * (math.floor(os.time() - startday) / 3600), 2)) .. ' per/hr'
			return tostring(ph) .. " per/hr :: Hours: " .. reduce(ivl,2) .. ""
		else
			return "Sorry, " .. appellation .. ", I'm unable to locate that information."
		end
	else
		return tostring(ph) .. " G: per/hr :: Hours: " .. reduce(ivl,2) .. ""
	end
end

function fractionize(n, acc)
	-- Returns a fraction that approximates a given decimal
	-- decimal : a decimal to be converted to a fraction
	-- acc     : approximation accuracy, defaults to 1e-4
	-- returns : two integer values, the numerator and the denominator of the fraction
	acc = acc or 0.001
	local num, denum
	local s = sign(n)
	n = math.abs(n)

	if n == int(n) then --Handles integers
	num = n * s
	denum = 1
	return tostring(num) .. "/" .. tostring(denum)
	end

	if n < 1E-3 then
	num = s
	denum = 999
	elseif n > 1E+3 then
	num = 999 * s
	denum = 1
	end

	local z = n
	local predenum = 0
	local sc
	denum = 1

	repeat
	z = 1 / (z - int(z))
	sc = denum
	denum = denum * int(z) + predenum
	predenum = sc
	num = int(n * denum)
	until ((math.abs(n - (num / denum)) < acc) or (z == int(z)))

	num = s * num
	
	return tostring(num) .. "/" .. tostring(denum)
	
end

function reduce(x, p) -- reduces x to p decimal places
	if not x then
		return 0
	end
	if not p then
		p = 2
	end
	return math.floor(x*10^p)/10^p
end

function Convert(a, b, pct)
	local amt = (emoState[a]-emoState[b]) * pct * 0.01
	emoState[a] = emoState[a] - amt
	emoState[b] = emoState[b] + amt*1.69
end

function Pinch(a,b,pct)
	local dif
	if a > b then
		dif = (a - b) * pct * 0.01
		a=a-dif
		b=b+dif
	else
		dif = (b - a) * pct * 0.01
		a=a+dif
		b=b-dif
	end
end

function Leech(a,b,pct,op) -- b leeches from a -- pass negative value to op to reduce b instead of increase
	local x = emoState[a] * pct
	op = op or 1
	
	if emoState[a] - x > 27 then
		emoState[a] = emoState[a] - x
		emoState[b] = emoState[b] + x * op
	end
	if emoState[a] < 0 then
		emoState[a] = 0
	end
	if emoState[b] < 0 then
		emoState[b] = 0
	end
end

function Relax(a,b,pct)
	dbgMsg(".Relax.", 2)
	local dif
	pct = pct * 0.01
	if emoState[a] > emoState[b] then
		dif = emoState[a] - emoState[b]
		emoState[a] = emoState[a] - dif * pct
		emoState[b] = emoState[b] - dif * (pct * 0.67)
	elseif emoState[b] > emoState[a] then
		dif = emoState[b] - emoState[a]
		emoState[a] = emoState[a] - dif * (pct * 0.67)
		emoState[b] = emoState[b] - dif * pct
	end
	if emoState[a] < 0 then
		emoState[a] = 0
	end
	if emoState[b] < 0 then
		emoState[b] = 0
	end
end

function Reduction(a,b,pct)
	dbgMsg(".Reduction.", 2)
	local dif
	if emoState[a] > 0 and emoState[b] > 0 then
		dif = emoState[a] - emoState[b]
		if emoState[a] > emoState[b] then -- 60 15
			emoState[a] = emoState[a] - dif * pct / 3.3
			emoState[b] = emoState[b] - dif * pct / 7.7
		elseif emoState[b] > emoState[a] then
			dif = emoState[b] - emoState[a]
			emoState[b] = emoState[b] - dif * pct / 3.3
			emoState[a] = emoState[a] - dif * pct / 7.7
		end
	end
	if emoState[a] < 0 then
		emoState[a] = 0
	end
	if emoState[b] < 0 then
		emoState[b] = 0
	end
end

function Dissolve(a,b,pct)
	dbgMsg(".Dissolve.", 2)
	--local dif
	if emoState[a] > 0 and emoState[b] > 0 then
		--dif = emoState[a] - emoState[b]
		if emoState[a] > emoState[b] then
			emoState[a] = emoState[a] - emoState[b] * pct * 1.11
			emoState[b] = emoState[b] - emoState[b] * pct * 0.77
		elseif emoState[b] > emoState[a] then
			emoState[b] = emoState[b] - emoState[a] * pct * 1.11
			emoState[a] = emoState[a] - emoState[a] * pct * 0.77
		end
	end
	if emoState[a] < 0 then
		emoState[a] = 0
	end
	if emoState[b] < 0 then
		emoState[b] = 0
	end	
end

function ReduceRandom(amt, aspect)
	if emoState[aspect] < 7 then
		return
	end
	
	local r = math.random(1, 36)
	local remo = mT[r]
	if emoState[remo] < 7 then
		return
	end
	EmoGyre(remo, -amt/3)
	EmoGyre(aspect, -amt*7)
	if (os.time() - lastBijou) > 7 then
		EmoGyre(remo, -amt/3)
		useDomi(aspectTable[remo])
		lastBijou = os.time()
	end
	--dbgMsg("ƒReduceRandomƒ " .. tostring(remo) .. " :: " .. tostring(amt), 1)
end

function BoostRandom(amt, aspect)
	if emoState[aspect] < 7 then
		return
	end
	local r = math.random(1, 36)
	local remo = mT[r]
	EmoGyre(remo, amt*7)
	EmoGyre(aspect, -amt*3)
	if (os.time() - lastBijou) > 4.4 then
		EmoGyre(remo, amt*11)
		useDomi(aspectTable[remo])
		lastBijou = os.time()
	end	
	--dbgMsg("ƒBoostRandomƒ " .. tostring(remo) .. " :: " .. tostring(amt), 1)
end


-- encoding
function b64_enc(data)
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

-- decoding
function b64_dec(data)
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

function capit(str)
	return str:lower():gsub("^%l", string.upper)
end

function tcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[tcopy(orig_key)] = tcopy(orig_value)
        end
        setmetatable(copy, tcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function SetAfk(bool)
	AFK = bool
end

function IsAFK()
	if AFK == true then
		return true
	end
end

function tardis(opt)
	if not Game.Player.Target.Name then
		return "No Target"
	end
	local x1,y1,z1 = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
	local x2,y2,z2 = Game.Player.Target.PosX, Game.Player.Target.PosY, Game.Player.Target.PosZ
	local dis
	if opt then
		dis = reduce(distTarget(x1,y1,z1,x2,y2,z2),4)
	else
		dis = "Distance to <" .. tostring(Game.Player.Target.Name).. "> is.. " .. tostring(reduce(distTarget(x1,y1,z1,x2,y2,z2),4)) .. " yalms."
	end
	return dis
end

function formatTime(tm, opt)
	local t = tonumber(tm)
	if opt then
		tm = os.date(opt, t)
	elseif tm == 0 then
		t = os.time() - tZone
		--tm = math.floor(t - math.floor(t)*100)/100
		tm = t - math.floor(t)
		tm = math.floor(tm * 1000)
		tm = "" .. os.date("%H:%M:%S", t) .. " ¦ " .. tostring(tm) .. ""
	elseif t > 3 then
		tm = os.date("%H:%M:%S", t)
	elseif t < 0.0013 then
		tm = tostring(math.floor(tm*100000000) / 100) .. "μS"
	else
		tm = tostring(math.floor(tm*100000) / 100) .. "mS"
	end
	return tm
end

--									--
--		^^^ General Functions ^^^ 	--
--									--

---	v								v	---
---	v		vvv Environment vvv 	v	---
---	v								v	---

function SeasonalAdjust(m,d,stm,ofs)
	ofs = ofs or -1
	stm = stm or 1
	d = d or 1
	local adj = ((tonumber(m) + ofs) * 30 + d) / 2
	--dbgMsg("SeasonalAdjust adj: " .. tostring(reduce(adj, 4)), 4)
	return reduce((math.sin(adj*0.017453) - 0.5) * stm, 3)
end

function ZoneTempFactor()
	dbgMsg(".ZoneTempFactor.", 2)
	func_time["ZoneTempFactor"].ST = os.time()
	--local zn = Game.Player.MapZone
	--local tmp, adj, r
	local eTime = Game.EorzeanTime.Hour
	local weather = Game.Weather.Name
	
	local adj
	local coldAdj = 1
	local wtI = 1
	local clmt = GetClimate()
	local sA = SeasonalAdjust(ftMonth, ftDay, clmt.stm)
	local warm = sA
	local CF = 0
	dbgMsg("ZoneTempFactor seasonal factor: " .. tostring(reduce(warm, 4)), 4)
	if clmt then
		if clmt.temp then
			CF = validTemps[clmt.temp]
			if playerRace == "Miqo'te" then
				warm = reduce(warm - 0.21, 4)
				dbgMsg("ZoneTempFactor (Miqo'te) climate adj: " .. tostring(warm), 4)
			elseif playerSubRace == "Highlander" then
				warm = reduce(warm + 0.27, 4)
				dbgMsg("ZoneTempFactor (Highlander) climate adj: " .. tostring(warm), 4)
			end
			if playerTraits.vixen then
				CF = reduce(CF * 0.69) --reduce(math.log(validTemps[clmt.temp] + 1.39, 3.69) * 2.39, 3)
				warm = warm + CF
				dbgMsg("ZoneTempFactor (vixen) climate factor: " .. tostring(CF), 4)
			elseif playerTraits.spriggan then
				warm = warm + CF * 0.77
			else
				warm = warm + CF
				dbgMsg("ZoneTempFactor climate factor: " .. tostring(CF), 4)
			end
		end
	end
	--warm = warm + reduce(OutfitTempFactor(), 3)--
	
	local nH = 1
	local nC = 1
	local ice = 0
	if eTime > 17 or eTime < 6 then
		nH = clmt.nighthot or 1
		nC = clmt.nightcold or 1
		if nC == 0 then
			nC = 0.1
		end
		if nH == 0 then
			nH = -0.1
		end
	end
	if IsSwimming then
		if playerTraits.vixen then
			warm = warm - (6.69 - CF * 3.69)
		elseif playerTraits.spriggan then
			warm = warm - (7.77 - CF * 4.44)
		else
			warm = warm - (0.77 - CF * 1.11)
		end
	end
	if weather_effects[weather] then
		if weather_effects[weather].neutral.temp then
			wtI = weather_effects[weather].neutral.temp
			warm = warm * wtI
			dbgMsg("ZoneTempFactor weather influence: " .. tostring(weather_effects[weather].neutral.temp), 4)
		end
	end
	
	--[[
	if playerSubRace == "Highlander" then
		racial = 0.81
	elseif playerRace == "Elezen" then
		racial = 1.17
	elseif playerSubRace == "Seeker of the Sun" then
		racial = 1.33
	end
	]]--
	
	local wa = 0.11
	if sA + CF > 0.7 then
		--dbgMsg("ZoneTempFactor warm: " .. tostring(warm), 4)
		wa = (CD[playerName].outfits[currentOutfit].wetAmt / (sA + CF + 0.61)) * 0.037 
		--wa = (emoState.wet / (sA + CF + 0.61)) * 0.037 
		--dbgMsg("ZoneTempFactor wA: " .. tostring(wa), 4)
	elseif sA + CF < 0.0 then
		wa = CD[playerName].outfits[currentOutfit].wetAmt * -0.077
		--wa = emoState.wet * -0.077
	else
		wa = CD[playerName].outfits[currentOutfit].wetAmt * -0.037
		--wa = emoState.wet * -0.037
	end
	--[[
	if wa > 177.7 then
		wa = 177.7
	elseif wa < -77.7 then
		wa = -77.7
	end
	]]--
	
		
		
	--if warm > 0 then
		--EmoGyre("wet", warm * -1.11)
	--end
	--dbgMsg("ZoneTempFactor wa X1 " .. tostring(wa), 1)
	--wa = wa * 0.13
	--dbgMsg("ZoneTempFactor wa X2 " .. tostring(wa), 1)
	if wa >= 0 then
		warm = reduce((warm + wa), 3)
	else
		ice = wa
		warm = reduce((warm + wa) * 0.37, 3)
	end
	--cold = (7 - warm * nH) / 9
	cold = reduce(((7.7 * coldAdj + ice) - warm * nH) / (9 / nC), 3)
	func_time["ZoneTempFactor"].END = os.time()
	func_track("ZoneTempFactor")
	return {["warm"] = warm, ["cold"] = cold, ["nH"] = nH, ["nC"] = nC, ["wA"] = wa, ["sF"] = sA, ["CF"] = CF}
end

function doEnvironment()
	dbgMsg(".doEnvironment.", 2)
	func_time["doEnvironment"].ST = os.time()
	if not Sys.Weather then
		func_time["doEnvironment"].END = os.time()
		func_track("doEnvironment")
		return
	end
	--local emos = Script.Storage.emotions[playerName]
	local zn = Game.Player.MapZone
	local tmp, adj, r
	local eTime = Game.EorzeanTime.Hour
	local weather = Game.Weather.Name
	--Weather
	dbgMsg("Weather Check", 5)
	if weather_effects then
		if weather_effects[weather] then
			for k,v in pairs(weather_effects[weather]) do
				dbgMsg("doEnvironment : traits :: " .. tostring(k), 5)
				dbgMsg("doEnvironment : PD.traits :: " .. tostring(CD[playerName].traits[k]), 5)
				if type(v) == "table" and CD[playerName].traits[k] then
					if v.effects then
						dbgMsg("doEnvironment : v.effects :: " .. tostring(v), 5)
						for x, y in pairs(v.effects) do
							dbgMsg("doEnvironment : x,y (pairs) :: " .. tostring(x) .. " | " .. tostring(y), 5)
							if x == "aetheric" or x == "energetic" then
								EmoGyre(x, y)
							elseif x == "wet" and y > 1.3 then
								if Game.Player.UsingParasol then
									dbgMsg("Weather Effects :: wet emotion reduced by parasol :: (" ..tostring(y * 0.37).. ").", 4)
									EmoGyre(x, y * 0.37)
								else
									EmoGyre(x, y)
								end
							elseif x == "wet" and y <= 1.3 then
								tmp = reduce(0.37 * math.sin(math.rad(updCnt + eTime)), 5)
								y = y + tmp
								EmoGyre(x, y)
								dbgMsg("doEnvironment : humidity :: wet: " .. tostring(tmp) .. ".", 5)
							else
								dbgMsg("doEnvironment : trace :: a: " .. tostring(emoState[x]), 5)
								dbgMsg("doEnvironment : trace :: y: " .. tostring(y), 5)
								EmoGyre(x, y)
								dbgMsg("doEnvironment : trace :: A", 5)
							end
							dbgMsg("doEnvironment : trace :: B", 5)
							dbgMsg("[" .. x .. "] increased by " .. tostring(tmp) .. " (" .. emoState[x] .. ") from ♦" .. k .. "♦ trait and ♠" .. weather .. "♠.", 5)
						end
					end
				end
			end
		end
	end
	
	dbgMsg("Weather Effects", 4)
	--Zone effects
	if zones[zn] then
		if zones[zn]["effects"] then
			for k,v in pairs(zones[zn]["effects"]) do
				dbgMsg("[" .. k .. "].", 6)
				tmp = v
				if not emoState[k] then
					dbgMsg("Weather Effects :: [" .. tostring(k) .. "] is not a valid emotion, removing from emotion table..", 1)
					emoState[k] = nil
				else
					EmoGyre(k, tmp)
					dbgMsg("[" .. k .. "] increased by " .. tostring(tmp) .. " (" .. emoState[k] .. ") from zone effects.", 6)
				end
			end
		end
	end
	
	local enable = true
	dbgMsg("Outfit Effects", 16)
	--Outfit Effects
	dbgMsg("doEnvironment : currentOutfit :: " .. tostring(currentOutfit), 16)
	if currentOutfit and Sys.Outfits and enable then
		CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
		CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}

		if DBG == 16 then
			dbgMsg("doEnvironment : Outfit Set : Hat :: " .. tostring(CD[playerName].outfits[currentOutfit].headGlam), 8)
			dbgMsg("doEnvironment : Outfit Set : Top :: " .. tostring(CD[playerName].outfits[currentOutfit].bodyGlam), 8)
			if CD[playerName].outfits[currentOutfit].braGlam then
				dbgMsg("doEnvironment : Outfit Set : Bra :: " .. tostring(CD[playerName].outfits[currentOutfit].braGlam), 8)
			elseif CD[playerName].outfits[currentOutfit].braName then
				dbgMsg("doEnvironment : Outfit Set : Bra :: " .. tostring(CD[playerName].outfits[currentOutfit].braName), 8)
			else
				dbgMsg("doEnvironment : Outfit Set : Bra ::        (•Y•)", 16)
			end
			dbgMsg("doEnvironment : Outfit Set : Gloves :: " .. tostring(CD[playerName].outfits[currentOutfit].handsGlam), 8)
			dbgMsg("doEnvironment : Outfit Set : Bottoms :: " .. tostring(CD[playerName].outfits[currentOutfit].legsGlam), 8)
			if CD[playerName].outfits[currentOutfit].pantiesGlam then
				dbgMsg("doEnvironment : Outfit Set : Panties :: " .. tostring(CD[playerName].outfits[currentOutfit].pantiesGlam), 8)
			elseif CD[playerName].outfits[currentOutfit].pantiesName then
				dbgMsg("doEnvironment : Outfit Set : Panties :: " .. tostring(CD[playerName].outfits[currentOutfit].pantiesName), 8)
			else
				dbgMsg("doEnvironment : Outfit Set : Panties ::     (^♥^)", 16)
			end
			dbgMsg("doEnvironment : Outfit Set : shoes :: " .. tostring(CD[playerName].outfits[currentOutfit].feetGlam), 8)
		
			if IsUnderwear("top") == true then
				dbgMsg("doEnvironment :          `ω´", 16)
			elseif IsUnderwear("top") == false then
				if CD[playerName].outfits[currentOutfit].braGlam then
					dbgMsg("doEnvironment :         \\v/          `ω´", 16)
				else
					dbgMsg("doEnvironment :         \\v/          (•Y•)", 16)
				end
				
			elseif IsUnderwear("top") == nil then -- naked!
				dbgMsg("doEnvironment :         (•Y•)", 16) -- flounce for flancy - Sandy Skittles
			end
			
			if IsUnderwear("pants") == true then
				dbgMsg("doEnvironment :         ¯▽¯", 16)
			elseif IsUnderwear("pants") == false then
				if CD[playerName].outfits[currentOutfit].pantiesGlam then
					dbgMsg("doEnvironment :        ̆♡̆         ¯▽¯", 16)
				else
					dbgMsg("doEnvironment :        ̆♡̆         (^♥^)", 16)
				end
				--dbgMsg("doEnvironment :        ̆♡̆    ", 8)
			elseif IsUnderwear("pants") == nil then -- naked!
				dbgMsg("doEnvironment :        (^♥^)", 8)
			end
		end

		local ztf = ZoneTempFactor()
		--local heat
		local warm = ztf.warm
		local cold = ztf.cold
		local nH = ztf.nH
		local nC = ztf.nC
		local wA = ztf.wA
		local sF = ztf.sF
		local CF = ztf.CF
		local ts
		local otf = reduce(OutfitTempFactor(), 3)

		--heat = warm
		warm = warm + otf
		
		if playerTraits.spriggan then
			warm = warm - 0.177
			r = math.random(1,88)
			if r >= 77 then
				adj = reduce(Gyre.black[4] * 0.01, 4)
				warm = warm * adj
				dbgMsg("doEnvironment spriggan temp adjust: " .. tostring(adj), 4)
				tmp = warm
				warm = cold
				cold = tmp + adj
			elseif r <= 7 + diff(emoState.hot, emoState.cold) then
				adj = reduce(Gyre.white[4] * 0.017, 4)
				if emoState.aetheric > adj * 777 then
					Relax("hot","cold",adj)
					EmoGyre("aetheric", adj * 777)
					dbgMsg("doEnvironment spriggan temp relax: " .. tostring(adj), 4)
					Moodle("-Aether", "apply", "self", "buffs", "default")
				else
					DoRandom("snap", "as compelled by the temperature")
				end
			end
		elseif playerTraits.vixen then
			if Game.Player.Equipped.Head.GlamName == "Tamamo Headband" then
				dbgMsg("doEnvironment vixen cool from ears: " .. tostring(reduce(cold + 1.69, 3)), 4)
				cold = cold + 0.69
				--warm = warm - 0.39
			end
		elseif playerTraits.aetheric then
			cold = cold + 0.27
			warm = warm - 0.09
		end
		
		if wA > 0 then
			EmoGyre("wet", wA * -0.177)
		end
		
		dbgMsg("doEnvironment  wet adjustment: " .. tostring(reduce(wA,3)), 4)
		
		cold = reduce(cold, 4)
		warm = reduce(warm * nH * 1.27, 4)
		EmoGyre("hot", warm)
		EmoGyre("cold", cold)

		dbgMsg("doEnvironment  hot set: " .. tostring(warm), 4)
		dbgMsg("doEnvironment cold set: " .. tostring(cold), 4)
		dbgMsg("doEnvironment outfit temp factor :: " .. tostring(otf), 4)
		
		if playerTraits.vixen then
			optOtx = cold * 0.91 - emoState.hot * 0.047 + emoState.cold * 0.031 - (warm - otf)
			ts = reduce(cold * 0.69 - CF, 3)
			optOtx = optOtx + (ts - optOtx) / 3
			dbgMsg("doEnvironment  base temp: " .. tostring(ts), 4)
		else
			optOtx = cold * 0.91 - emoState.hot * 0.047 + emoState.cold * 0.031 - (warm - otf)
			ts = reduce(cold * 0.91 - (warm - otf), 3)
			optOtx = optOtx + (ts - optOtx) / 3
			dbgMsg("doEnvironment  base temp: " .. tostring(ts), 4)
		end
		optOutfitTemp = reduce(optOtx + (optOutfitTemp - optOtx) / 6, 3)
		
		dbgMsg("doEnvironment  optOutfitTemp: " .. tostring(optOutfitTemp), 1)
		
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
	
		tempComfortFactor = math.floor(emoState.hot + emoState.cold)
		
		if (os.time() - lastDressCheck) > 111 - tempComfortFactor * 0.37 and not IsBusy then
			if not blockAutonomousActions and not safe and not pause then
				r = math.random(11,44)
				if playerTraits.vixen and tempComfortFactor > 69 then
					dbgMsg("doEnvironment Should I choose a more appropriate outfit?  " .. tostring(r), 1)
				elseif tempComfortFactor > 39 then
					dbgMsg("doEnvironment Should I choose a more appropriate outfit?  " .. tostring(r), 1)
				end
				if playerTraits.vixen and tempComfortFactor > r + 39 then
					DressBest()
				elseif tempComfortFactor > r + 13 then
					DressBest()
				end
			elseif blockAutonomousActions or safe or pause then
				dbgMsg("doEnvironment Autonomous Outfit Change blocked by security settings..", 1)
			end
		end
	end
	
	dbgMsg("End Environment Checks", 2)

	func_time["doEnvironment"].END = os.time()
	func_track("doEnvironment")
end

function decayPass()
	dbgMsg("._decayPass_.", 2)
	func_time["decayPass"].ST = os.time()
	dbgMsg(".|decayPass|. -- ~~ :: ", 3)
	local AB = 0
	if AethericBuffer then
		AB = 1
	end
	local aetheric = 0
	--if playerTraits.aetheric then
		--aetheric = 1
	--end
	local aetheric = 0
	if playerTraits.aetheric then
		aetheric = 1
	end
	
	local adj = -1.37 + (aetheric * (0.396 * AB)) - ((aetheric - 1) * 0.27)
	--dbgMsg(".|decayPass|. --- Meds :: " .. tostring(AethericBuffer), 1)
	--dbgMsg(".|decayPass|. --- Wellfed :: " .. tostring(wellfed), 1)
	--dbgMsg(".|decayPass|. --- Is Aetheric :: " .. tostring(aetheric), 1)
	
	--dbgMsg(".|decayPass|. --- adj :: " .. tostring(adj), 1)
	local tE = 0
	local x, y, jitter
	for k,v in pairs(decayRate) do
		--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*-3.7), 1)
		if k == "aetheric" or k == "energized" then
			--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*-5.1), 1)
			if playerTraits.aetheric and k == "aetheric" then
				--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*2.7), 1)
				x = 3.7+(emoState.aetheric * 0.0377)
				--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*x), 1)
				EmoGyre(k, v*adj*x)
			elseif playerTraits.aetheric and k == "energized" then
				--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*1.7), 1)
				EmoGyre(k, v*adj*0.71)
				--AetherHandler(v*adj*7, k, "decayPass")
			elseif playerTraits.spriggan and k == "aetheric" then
				--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*1.7), 1)
				EmoGyre(k, v*adj*1.37)
				EmoGyre("sleepy", v*adj*-0.37)
				--AetherHandler(v*adj*7, k, "decayPass")
			elseif playerTraits.spriggan and k == "energized" then
				--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*1.7), 1)
				EmoGyre(k, v*adj*1.11)
				--AetherHandler(v*adj*7, k, "decayPass")
			elseif playerTraits.vixen and k == "aetheric" then
				--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*1.7), 1)
				EmoGyre(k, v*adj*1.69)
				--AetherHandler(v*adj*7, k, "decayPass")
			elseif playerTraits.vixen and k == "energized" then
				--dbgMsg(".|decayPass|. :: " .. k .. " :: " .. tostring(v*adj*1.7), 1)
				EmoGyre(k, v*adj*0.61)
				--AetherHandler(v*adj*7, k, "decayPass")
			else
				EmoGyre(k, v*adj*1.1)
				--AetherHandler(v*adj, k, "decayPass")
			end
		else
			if v and emoState[k] then
				tE = math.floor((emoState[k] - (v * 0.31))*10000)/10000
			end
			--tE = math.floor((emoState[k] - v)*10000)/10000
			if tE < 0 then
				tE = 0
			end
			emoState[k] = tE
		end
	end
	
	--Outfit Dampness
	jitter = (math.random() - 0.5) * 0.0017
	x = 0.977 - (0.04 - (jitter + (OutfitTempFactor() + emoState.hot * 0.17) * 0.0177)) * 0.37
	--x = 1
	y = CD[playerName].outfits[currentOutfit].wetAmt or 0
	if emoState.wet > 2.7 then
		y = reduce(y + emoState.wet * 0.027, 3)
		if y > 77 then
			y = 77
		end
	else
		if x > 1 then
			y = reduce(y * (x * 0.977 + emoState.wet * 0.027), 3)
		else
			y = reduce(y * (x + emoState.wet * 0.027), 3)
		end
	end
	
	if CD[playerName].outfits[currentOutfit].lastWorn then
		if (os.time() - CD[playerName].outfits[currentOutfit].lastWorn) > 420 then
			dbgMsg(".|decayPass|. :: outfit <lastworn> wet amt :: " .. tostring(y), 1)
			y = y * (1 - (os.time() - CD[playerName].outfits[currentOutfit].lastWorn) / 7777)
			dbgMsg(".|decayPass|. :: outfit <update> wet amt :: " .. tostring(y), 1)
		end
	end
	
	if y < 0 then
		y = 0
	end
	CD[playerName].outfits[currentOutfit].wetAmt = y
	
	CD[playerName].outfits[currentOutfit].lastWorn = os.time()
	--CD[playerName].outfits[currentOutfit].wetAmt = CD[playerName].outfits[currentOutfit].wetAmt or 0
	--if CD[playerName].outfits[currentOutfit].wetAmt then
		--CD[playerName].outfits[currentOutfit].wetAmt = reduce(CD[playerName].outfits[currentOutfit].wetAmt * (x + 0.017), 4)
		--CD[playerName].outfits[currentOutfit].wetAmt = CD[playerName].outfits[currentOutfit].wetAmt - (1-x)
		--if CD[playerName].outfits[currentOutfit].wetAmt < 0 then
			--CD[playerName].outfits[currentOutfit].wetAmt = 0
		--end
		dbgMsg(".|decayPass|. :: outfit wet amt :: " .. tostring(reduce(y,2)), 1)
	--end
	dbgMsg(".|decayPass|. :: overall drying rate :: " .. tostring(reduce((1 - x) * 100, 2))  .. "%", 1)
	
	if x > 1 then
		emoState.wet = reduce(emoState.wet * x * 0.911, 4)
	else
		emoState.wet = reduce(emoState.wet * x, 4)
	end
	
	if emoState.wet > 77 then
		emoState.wet = 71
	end
	if emoState.cold > 111 then
		emoState.cold = 99
		emoReact("cold")
	end
	if emoState.hot > 111 then
		emoState.hot = 99
		emoReact("hot")
	end

	dbgMsg("gilBuff Test: " .. gilBuff .. ".", 10)
	gilBuff = gilBuff * 0.987 -- 1 - 0.987 = 13
	gilBuff = math.floor(gilBuff * 10000)/10000
	--dbgMsg("gilBuff: " .. gilBuff .. ".", 1)
	CD[playerName].playerGilBuff = tostring(gilBuff)
	func_time["decayPass"].END = os.time()
	func_track("decayPass")
end

--	^								^	--
--	^		^^^ Environment ^^^ 	^	--
--	^								^	--

---	v								v	---
---	v		vvv Routines vvv		v	---
---	v								v	---

function delayedAction(txt)
	Game.SendChat("/" .. txt)
end

function DoToast(toast)
 Game.Toast.Short(toast)
end

function tagFormat(txt)
	txt = string.gsub(txt, "<appellation>", tostring(appellation))
	txt = string.gsub(txt, "<nickname>", tostring(nickName))
	return txt
end

function RoutineUpdate()
	dbgMsg(".RoutineUpdate.", 2)
	func_time["RoutineUpdate"].ST = os.time()
	routineIdx = routineIdx + 1
	dbgMsg("routineIdx : " .. tostring(routineIdx), 2)
	--dbgMsg("Routine Aetheric : " .. tostring(routines[currentRoutine][routineIdx].aetheric), 1)
	local rout = routines[currentRoutine]
	if not rout then
		dbgMsg(tostring(currentRoutine) .. " is not a valid routine name.", 1)
		action = "idle"
		currentRoutine = nil
		routineIdx = 0
		Script.QueueDelay(25)
		Script.QueueAction(Update)
		func_time["RoutineUpdate"].END = os.time()
		func_track("RoutineUpdate")
		return
	end
	rout = rout[routineIdx]
	dbgMsg("rout Type : " .. type(rout), 2)
	if not rout then
		dbgMsg("Routine Finished! : " .. tostring(currentRoutine), 1)
		action = "idle"
		currentRoutine = nil
		routineIdx = 0
	else
		local rout = routines[currentRoutine][routineIdx]
		if rout.test then
			local er, ret = pcall(rout.func)
			--dbgMsg("Confirm : " .. tostring(confirm), 3)
			if ret then
				--dbgMsg("Routine Conditional : " .. tostring(routines[currentRoutine][routineIdx]["do"]), 3)
				if rout["do"] == "end" then
					if rout.cond then
						Game.Toast.Long(tostring(tagFormat(rout.cond)))
					end
					action = "idle"
					currentRoutine = nil
					routineIdx = 0
				elseif rout["do"] == "confirm" then
					Game.Toast.Long(tostring(tagFormat(rout.cond)))
					confirm = "waiting"
				elseif rout["do"] == "jmp" then
					--Game.Toast.Long(tostring(routines[currentRoutine][routineIdx].cond))
					routineIdx = rout["jmp"] - 1
				else
					Game.SendChat("/" .. rout["do"])
				end
			elseif rout["else"] then
				routineIdx = rout["else"] - 1
			end
		elseif rout.run then
			if rout.func then
				local funCoo = {pcall(rout.func)}
				dbgMsg("Func Ret : " .. tostring(funCoo[1]), 1)
			end
			if rout["do"] then
				if rout["do"] == "jmp" or rout["do"] == "nop" then
					--nop
				else
					Game.SendChat("/" .. rout["do"])
				end
			end
		elseif rout.mov then
			rgsA = rout.mov
		elseif rout.dec then
			rgsA = rgsA - 1
		elseif rout.tst then
			if rgsA > rout.tst then
				if rout["jmp"] then
					routineIdx = rout["jmp"] - 1
				end
			end
		elseif rout.aetheric then
			if currentBeaconDistance then
				local cBD = currentBeaconDistance
				if cBD / currentBeaconRadius < 0.16 then
					cBD = currentBeaconRadius * 0.16
				end
				local ad = 1
				local int
				if rout.intensity then
					ad = rout.intensity
				end
				if AethericBuffer then
					ad = ad * 0.69
				end
				
				emotionsRange = emotionsRange or 0
				--if emotionsRange > 0 then
					--ad = ad + 0.5 * (emoState["aetheric"] / emotionsRange)
					--dbgMsg("emotionsRange: " .. tostring(ad), 3)
				--end
				--CD[playerName].traits.aetheric
				if CD[playerName].traits.aetheric then
					int = (67 * ad) / (2.7 * math.pi * cBD^2.1)
					--emoState["aetheric"] = emoState["aetheric"] + int
					EmoGyre("aetheric", int)
					Moodle("Aether++", "apply", "self", "buffs", "exclusive")
					--AetherHandler(int, "aetheric", "RoutineUpdate")
					--dbgMsg("Aetheryte Effect: " .. tostring(int), 3)
				elseif playerTraits.muggle then
					int = (1.69 * ad) / cBD^1.77
					EmoGyre("aetheric", int)
					dbgMsg("Aetheryte Effect: (muggle) " .. tostring(int), 1)
				else
					int = (6.69 * ad) / cBD^3
					EmoGyre("aetheric", int)
					Moodle("Aether++", "apply", "self", "buffs", "exclusive")
					--AetherHandler(int, "aetheric", "RoutineUpdate")
					--dbgMsg("Aetheryte Effect: " .. tostring(int), 3)
				end
				emoState["hot"] = emoState["hot"] + int/3.1
				emoState["cold"] = emoState["cold"] - int/3.1
				if emoState["cold"] < 0 then
					emoState["cold"] = 0
				end
			end
		else
			Game.SendChat("/" .. rout["do"])
		end
		
		--Script.QueueDelay(routines[currentRoutine][routineIdx]["w"])
		currentRoutineWait = rout["w"]
		--dbgMsg("Routine Delay : " .. tostring(routines[currentRoutine][routineIdx]["w"]), 3)
		lastUpdate = os.time()
		Update()
		func_time["RoutineUpdate"].END = os.time()
		func_track("RoutineUpdate")
		return
	end
	Script.QueueDelay(25)
	Script.QueueAction(Update)
	func_time["RoutineUpdate"].END = os.time()
	func_track("RoutineUpdate")
end

function CallRoutine(tag, token)
	dbgMsg(".CallRoutine.", 2)
	--func_time["CallRoutine"].ST = os.time()
	if tag and tag ~= "" then
		if tag == "stop" and currentRoutine and action == "routine" then
			action = "idle"
			dbgMsg("Stopping Current Routine : " .. tostring(currentRoutine), 0)
			Update()
		elseif routines[tag] then
			dbgMsg("Starting Routine : " .. tostring(tag), 0)
			currentRoutine = tag
			routineToken = token
			routineIdx = 0
			currentRoutineWait = 1
			action = "routine"
			Update()
		end
	end
	--func_time["CallRoutine"].END = os.time()
	--func_track("CallRoutine")		

end

--	^								^	--
--	^		^^^ Routines ^^^ 		^	--
--	^								^	--

---	v								v	---
---	v		vvv Beacons vvv		 	v	---
---	v								v	---

function distTarget(px,py,pz,tx,ty,tz)
	dbgMsg(".distTarget.", 2)
	--func_time["distTarget"].ST = os.time()
	disX = math.abs(tx - px)
	disY = math.abs(ty - py)
	disZ = math.abs(tz - pz)
	disC = math.sqrt(disX^2 + disY^2 + disZ^2)
	--func_time["distTarget"].END = os.time()
	--func_track("distTarget")
	return disC
end

function PlaceFlag(txt,chn)
	local x,y = string.match(txt, "(%d+%.%d*)  , (%d+%.%d*)")
	dbgMsg("PlaceFlag :: x: " .. tostring(x), 1)
	dbgMsg("PlaceFlag :: y: " .. tostring(y), 1)
	--dbgMsg("FlagMe :: y: " .. tostring(y), 1)
	Script.Clipboard = "[\"X\"] = " .. tostring(x) .. ", [\"Y\"] = " .. tostring(y)
	Game.SendChat("/coord " .. tostring(x) .. " " .. tostring(y))
	dbgMsg("Flag Coords saved to the Clipboard", 1)
end

function FlagMe(txt)
	local fl = "<pos>"
	Game.SendChat(" " .. fl)
	local x = string.match(fl,"(%a+)")
	dbgMsg("FlagMe :: pos: " .. tostring(fl), 1)
	dbgMsg("FlagMe :: x: " .. tostring(x), 1)
	dbgMsg("FlagMe :: y: " .. tostring(y), 1)
end

function Flagit(txt)
	local map = Game.Player.MapZone
	local x,y
	if beacons[map] then
		if beacons[map].flags then
			if beacons[map].flags[txt] then
				x = beacons[map].flags[txt].X
				y = beacons[map].flags[txt].Y
			end
		end
	end
	dbgMsg("flagIt: X:" .. tostring(x) .. " :: Y:" .. tostring(y), 1)
	if x then
		Game.SendChat("/coord " .. tostring(x) .. " " .. tostring(y))
	else
		if IsMounted then
			Game.SendChat("/vnav flyflag")
		else
			Game.SendChat("/vnav moveflag")
		end
		--Game.SendChat("/vnav flyflag")
		--Game.SendChat("/vnav " .. tostring(x) .. " " .. tostring(y))
	end
end

function GetBeaconDistance(bacon)
	dbgMsg(".GetBeaconDistance.", 2)
	--func_time["GetBeaconDistance"].ST = os.time()
	local map = Game.Player.MapZone
	
	if beacons[map] then
		local bC = beacons[map]["beacon"][bacon]
		if bC then
			local x1,y1,z1 = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
			local x2,y2,z2 = bC["XPos"], bC["YPos"], bC["ZPos"]
			local dis = distTarget(x1,y1,z1,x2,y2,z2)
			dis = reduce(dis, 4)
			dbgMsg("Distance to Beacon  " ..bacon .. " : " .. tostring(dis) .. ".", 0)
			return dis
		elseif bacon == "target" then
			local x1,y1,z1 = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
			local x2,y2,z2 = Game.Player.Target.PosX, Game.Player.Target.PosY, Game.Player.Target.PosZ
			local dis = distTarget(x1,y1,z1,x2,y2,z2)
			dis = reduce(dis, 4)
			dbgMsg("Distance to Beacon  " ..bacon .. " : " .. tostring(dis) .. ".", 0)
			return dis
		end
	end
	--func_time["GetBeaconDistance"].END = os.time()
	--func_track("GetBeaconDistance")
end

function BeaconTypeHandler(map, beaconId, typ, token, cBD, bx, by, bz)
	dbgMsg(".BeaconTypeHandler.", 2)
	local bType,rm,q
	dbgMsg("Beacon Type Check - typ  :: " .. tostring(typ), 3)
	dbgMsg("Beacon Type Check - type(beaconTypes)  :: " .. tostring(type(beaconTypes)), 3)
	
	if not bx then
		dbgMsg("Beacon Type Handler :: bx = nil  :: ", 1)
	end
	
	
	if beaconTypes[typ] then -- redone for v0.5.17
		--dbgMsg(".Applied Token for.. " .. tostring(map) .. " :: " .. tostring(beaconId), 1)
		--if typ == "emote" then
		if token then
			dbgMsg("Beacon Type Handler :: token  :: " .. tostring(token), 3)
			if token.G then -- if token.gStack then
				tokenStack["GEN"] = tokenStack["GEN"] or {}
				tokenStack["GEN"][beaconId] = tokenStack["GEN"][beaconId] or {}
				if tokenStack["GEN"][beaconId].lastCall and beacons["GEN"][beaconId].refresh then
					dbgMsg(".Refreshed Token for.. " .. tostring("GEN") .. " :: " .. tostring(beaconId), 3)
					tokenStack["GEN"][beaconId].lastCall = os.time()
					tokenStack["GEN"][beaconId].typ = typ
					--tokenStack["GEN"][beaconId].typ = typ
					tokenStack["GEN"][beaconId].coords = {
						["x"] = bx,
						["y"] = by,
						["z"] = bz,
					}
					tokenStack["GEN"][beaconId].cbd = cBD
				end
				if not tokenStack["GEN"][beaconId].token then
					dbgMsg(".Applied Token for.. " .. tostring("GEN") .. " :: " .. tostring(beaconId), 1)
					tokenStack["GEN"][beaconId].firstCall = os.time()
					tokenStack["GEN"][beaconId].initialized = os.time()
					--tokenStack["GEN"][beaconId].lastCall = os.time()
					tokenStack["GEN"][beaconId].token = token
					Moodle(token.what, "apply", "self", "tokens", "default")
				end
			else
				dbgMsg("Beacon Type Handler :: lastCall  :: ", 3)
				tokenStack[map] = tokenStack[map] or {}
				tokenStack[map][beaconId] = tokenStack[map][beaconId] or {}
				dbgMsg("Beacon Type Handler :: lastCall 2  :: ", 3)
				if not tokenStack[map][beaconId].initialized then
					tokenStack[map][beaconId].initialized = os.time()
				end
				--if token[map][beaconId].lastCall then
				if tokenStack[map][beaconId].lastCall then
					--beacons[map][beaconId].refresh
					dbgMsg(".Refreshed Token for.. " .. tostring(map) .. " :: " .. tostring(beaconId), 3)
					tokenStack[map][beaconId].lastCall = os.time()
					tokenStack[map][beaconId].typ = typ
					--tokenStack[map][beaconId].typ = typ
					
					tokenStack[map][beaconId].coords = {}
					tokenStack[map][beaconId].coords.x = bx
					tokenStack[map][beaconId].coords.y = by
					tokenStack[map][beaconId].coords.z = bz
					
					tokenStack[map][beaconId].cbd = cBD
				end
				dbgMsg("Beacon Type Handler :: lastCall 3  :: ", 3)
				if not tokenStack[map][beaconId].token then
					dbgMsg(".Applied Token for.. " .. tostring(map) .. " :: " .. tostring(beaconId), 1)
					tokenStack[map][beaconId].firstCall = os.time()
					dbgMsg("Beacon Type Handler - firstCall  :: " .. tostring(tokenStack[map][beaconId].firstCall), 3)
					tokenStack[map][beaconId].lastCall = os.time()
					tokenStack[map][beaconId].token = token
					Moodle(token.what, "apply", "self", "tokens", "default")
				end
			end
		end
	end
	return
end

function BeaconCheck()
	if filterLog["2"] then
		dbgMsg("ƒBeaconCheckƒ", 2)
	end
	--dbgMsg(":BeaconCheck: func_time Check ::" .. type(func_time["BeaconCheck"]), 1)
	--dbgMsg(":BeaconCheck: func_time Check ::" .. tostring(func_time["BeaconCheck"].ST), 1)
	func_time.BeaconCheck.ST = os.time()
	
	--dbgMsg(":BeaconCheck: func_time Check ::" .. tostring(func_time["BeaconCheck"].ST), 1)
	local map = Game.Player.MapZone
	local x,y,z,s,test
	local er, ret
	local tm = os.time()
	local bacon = beacons[map]
	x,y,z,s = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ, 0.35
	--dbgMsg("Beacons pre Bacon!", 1)
	if bacon then
		--dbgMsg("Beacons and Bacon!", 1)
		for k,v in pairs(bacon.beacon) do
			if v.radius then
				--dbgMsg("Beacon CheckA", 1)
				lastBeaconDistance = distTarget(x,y,z,v.XPos,v.YPos,v.ZPos)
				--dbgMsg("lastBeaconDistance: " .. lastBeaconDistance .. ".", 1)
				--dbgMsg("Beacon CheckA", 4)
				if lastBeaconDistance < s then
				  if not v.found then
						if v.mark then
							if type(v.mark) == "string" then
								Game.SendChat("/waymark " .. v.mark .. " <me> ")
								wmarkSet = os.time()
							end
						else
							Game.SendChat("/waymark a <me> ")
							wmarkSet = os.time()
						end
						UseItem(8215)
						--Game.SendChat("/useitem 8215")
						beacons[map].beacon[k].found = true
						Game.Toast.TaskComplete("Congratulations! You located the beacon!")
				   end
				end
				--dbgMsg("BeaconCheck : Track A  :: ", 1)
				if lastBeaconDistance < v.radius then
					dbgMsg("Beacon CheckB", 4)
					currentBeaconDistance = lastBeaconDistance
					currentBeaconRadius = v.radius
					--if v.type then
					dbgMsg("BeaconCheck : Track A  :: ", 3)	
					--end
					test = nil
					if v.test then
						--dbgMsg("BeaconCheck : begin test...  :: ", 3)
						er, ret = pcall(v.func)
						if ret then
							--dbgMsg("BeaconCheck: Trace: ret :: " .. tostring(ret), 4)
							if er then
								--dbgMsg("BeaconCheck: Trace: er :: " .. tostring(er), 4)
							end
							test = true
							--if v.msg and not BeaconMsg then
								--BeaconMsg = true
								--Game.Toast.Short(v.msg)
							--end
						else
							--dbgMsg("Test Check C", 3)
						end
					else
						--dbgMsg("Test Check B", 3)
						test = true
					end
					
					if test and v.type then
						dbgMsg("Beacon Type CheckX", 3)
						if map and k and v.type and type(v.token) == "table" and currentBeaconDistance then
							dbgMsg("Beacon Type CheckY", 3)
							--dbgMsg("Beacon Type Check: map >" .. tostring(map), 4)
							--dbgMsg("Beacon Type Check: k >" .. tostring(k), 4)
							--dbgMsg("Beacon Type Check: v.type >" .. tostring(v.type), 4)
							--dbgMsg("Beacon Type Check: v.token >" .. tostring(v.token), 4)
							--dbgMsg("Beacon Type Check: currentBeaconDistance >" .. tostring(currentBeaconDistance), 3)
							
							BeaconTypeHandler(map, k, v.type, v.token, currentBeaconDistance, v.XPos, v.YPos, v.ZPos)
							dbgMsg("Beacon Type CheckZ", 3)
						elseif beaconTypes[v.type] then
							--do nothing
						else
							dbgMsg("Beacon Check: Invalid Data :: " .. k, 1)
						end
					end
					dbgMsg("BeaconCheck : Track B  :: ", 3)
					if test and v.effects then
						for a,b in pairs(v.effects) do
							if a == "aetheric" then
								
								AetherHandler(b, "aetheric", "BeaconCheck")
							else
								emoState[a] = math.floor((emoState[a] + b)*10000)/10000
							end
							if emoState[a] < 0 then
								emoState[a] = 0
							end
							dbgMsg("Beacon Boost :: " .. a .. " - " .. tostring(emoState[a]) .. ".", 3)
						end
					end
					
					if not v.lastCall then
						beacons[map]["beacon"][k].lastCall = tm
						--v.lastCall = tm
					end
					dbgMsg("BeaconCheck : call check A  :: ", 3)
					if not v.cooldown then
						v.cooldown = 13
					end
					if v.cooldown and v.lastCall then
						if tm - v.lastCall > v.cooldown then
						--if os.time() - v.cooldown > lastBeaconTime
						--if lastBeacon ~= k or lastBeaconMap ~= map then
							BeaconMsg = nil
							lastBeacon = k
							lastBeaconMap = map
							lastBeaconTime = tm
							lastBeaconCD = v.cooldown
							beacons[map]["beacon"][k].lastCall = tm
							--dbgMsg("BeaconCheck : call check B  :: ", 3)
							if v.toasted and (test or v.type == "marker") then
								--dbgMsg("BeaconCheck : toast check  :: ", 3)
								if not v.lastToast then
									dbgMsg("BeaconCheck : delayToast  :: ", 1)
									--v.lastToast = tm
									beacons[map]["beacon"][k].lastToast = tm
								end
								if v.toasted > 0 and tm - v.lastToast > v.toastWait then
									dbgMsg("BeaconCheck : Toast  :: " .. v.toast, 1)
									Game.Toast.Short(v.toast)
									beacons[map]["beacon"][k].toasted = v.toasted - 1
									beacons[map]["beacon"][k].lastToast = tm
								end
							end
							if v.routine and (tm - lastPorted) > 23 and not currentRoutine and test then
								dbgMsg("Starting Beacon Routine : " .. tostring(v.routine), 4)
								currentRoutine = v.routine
								routineIdx = 0
								currentRoutineWait = 1
								action = "routine"
								--dbgMsg("action : " .. tostring(action), 2)
								Update()
							end
						end
					end
				end
			end
		end
	end
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["BeaconCheck"].END = os.time()
	func_track("BeaconCheck")
end

function getMap()
	return Game.Player.MapZone
end

function GetClosestAetherBeacon(range)
	dbgMsg(".GetClosestAetherBeacon.", 2)
	if not Game.Player.Entity then
		dbgMsg("GetClosestAetherBeacon: Player not found.", 1)
		return
	end
	local x,y,z,map = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ, Game.Player.MapZone
	local s  = range
	if not s then
		s = 999
	end
	local dis, hit
	if beacons[map] then
		for k,v in pairs(beacons[map]["beacon"]) do
			if v.radius and v.routine then
				if string.find(v.routine ,"AetherEffect") then
					dis = distTarget(x,y,z,v.XPos,v.YPos,v.ZPos)
					if dis < s then
						s = dis
						hit = k
					end
				end
			end
		end
	end
	closestAetheryte = hit
	return hit
end

function Purchased(txt, chn)
	if not validChn[string.lower(chn)] then
		chn = "/e "
	else
		chn = validChn[string.lower(chn)]
	end
	local lim = 0
	for k,v in pairs(CD[playerName].purchases) do
		--dbgMsg(":Purchases: "..tostring(k),1)
		if string.find(k, txt) then
			
			if lim < 7 then
				--dbgMsg(":Purchases: "..tostring(k),1)
				Game.SendChat(chn.."Purchased: "..k.." :: ("..tostring(v.total)..") for "..tostring(v.cost).."")
				lim = lim + 1
			end
		end
	end
end

function Purchases(what, chn)  --deprecate?
	 Purchased(what, chn)
end

function Glean(tag)
	local map = Game.Player.MapZone
	local x,y,z = "0", "0", "0"
	local tbK
	local tName = Game.Player.Target.Name
	local tx,ty,tz = Game.Player.Target.PosX, Game.Player.Target.PosY, Game.Player.Target.PosZ
	if tx then
		x = tostring(reduce(tx,2))
		y = tostring(reduce(ty,2))
		z = tostring(reduce(tz,2))
	end
	tbK = tName .. "-" .. tostring(map) .. "-X" .. x .. "-Y" .. y .. "-Z" .. z
	CD[playerName]["gleans"][tag] = CD[playerName]["gleans"][tag] or {}
	CD[playerName]["gleans"][tag][tbK] = {}
	CD[playerName]["gleans"][tag][tbK].Map = tostring(map)
	CD[playerName]["gleans"][tag][tbK].X = tostring(tx)
	CD[playerName]["gleans"][tag][tbK].Y = tostring(ty)
	CD[playerName]["gleans"][tag][tbK].Z = tostring(tz)
	
end

function MoveToTarget()
	local x,y,z = Game.Player.Target.PosX, Game.Player.Target.PosY, Game.Player.Target.PosZ
	Game.SendChat("/vnavmesh moveto " .. tostring(x) .. " " .. tostring(z) .. " " .. tostring(y))
end

function MoveToBeacon(tag)
	dbgMsg(".MoveToBeacon.", 2)
	--func_time["MoveToBeacon"].ST = os.time()
	local map = Game.Player.MapZone
	local x,y,z
	if #tag < 2 then
		tag = string.upper(tag)
	end
	
	if beacons[map]["beacon"][tag] then
		x,y,z = beacons[map]["beacon"][tag].XPos, beacons[map]["beacon"][tag].YPos, beacons[map]["beacon"][tag].ZPos
		dbgMsg("MoveToBeacon :: " .. tostring(tag) .. " :: " .. tostring(x) .. " " .. tostring(z) .. " " .. tostring(y) .. " .", 0)
		if not IsFlying then
			Game.SendChat("/vnavmesh moveto " .. tostring(x) .. " " .. tostring(z) .. " " .. tostring(y))
		else
			Game.SendChat("/vnavmesh flyto " .. tostring(x) .. " " .. tostring(z) .. " " .. tostring(y))
		end
	end
	--func_time["MoveToBeacon"].END = os.time()
	--func_track("MoveToBeacon")
end

--	^								^	--
--	^		^^^ Beacons ^^^ 		^	--
--	^								^	--


---	v								v	---
---	v		vvv Moods vvv 			v	---
---	v								v	---

function MoodUpdate()
	dbgMsg(".MoodUpdate.", 2)
	func_time["MoodUpdate"].ST = os.time()
	--local emos = Script.Storage.emotions[playerName]
	if not CD[playerName].emotions["angry"] then
		initPersona()
	end
	--local trts = CD[playerName].traits
	local tmp, val, method
	--local effs = effects
	
	dbgMsg("Mood Update", 31)
	--lastFunctionCall = "Mood Update()"
	if not traits["ambitious"] then
		dbgMsg("Traits Table Not Found!", 1)
	end
	dbgMsg("Mood Update .:. traits : " .. type(traits), 31)
	for k,v in pairs(traits) do
		--dbgMsg("keyA: " .. k .. " | val: " .. tostring(val), 1)
		method = "default"
		if CD[playerName].traits[k] then
			if traits[k].method then
				method = traits[k].method
			end
			for x,y in pairs(traits[k].effects) do
				val = check_status(x)
				--tmp, val = pcall(effs[x])
				if val then
					val = tonumber(val) or 1
					--dbgMsg("keyB: " .. k .. " | val: " .. tostring(val), 3)
					for a,b in pairs(traits[k].effects[x]) do
						if emoState[a] then
							tmp = tonumber(b) * val
							if method == "normalized" then
								tmp = math.abs(tmp)
							end
							if tmp ~= 0 then
								EmoGyre(a, tmp)
							end
							--if a == "aetheric" or a == "energized" then
								--AetherHandler(tmp, a, "MoodUpdate")
							--else
								--emoState[a] = math.abs(emoState[a] + tmp) 	-- the storage thingy chokes on negatives for some reason, 
								--if emoState[a] < 0 then
									--emoState[a] = 0
								--end
							--end
							-- so need to make sure it's +++, gives a little jitter too
							--dbgMsg("" .. a .. " increased by " .. tostring(tmp) .. " " .. k .. " " .. x .. ".", 5)
						else
							initPersona()
							dbgMsg("Warning: emotion not found - " .. tostring(a), 2)
						end
					end
				end
			end
		end
	end
	
	aetherlock = nil -- 
	
	
	--if emoState["aetheric"] > 1233 and CD[playerName].traits.aetheric then
		--if math.random(3321) < emoState.aetheric then
			--CallRoutine("ao")
		--end
	if emoState.aetheric > 1777 and emoState.aetheric < 3333 and CD[playerName].traits.aetheric then
		if Overcharged then
			if os.time() - Overcharged > 7 then
				Moodle("Overcharged++", "apply", "self", "buffs", "default")
			end
		else
			Moodle("Overcharged++", "apply", "self", "buffs", "default")
		end
		Overcharged = os.time()
	elseif emoState.aetheric > 17777 and playerTraits.spriggan then
		emoState.aetheric = math.random(1,17777)
		
		Moodle("XAetherSprigganX", "apply", "self", "buffs", "default")
		local r
		local es = tcopy(emoState)
		for k,v in pairs(es) do
			if k ~= "aetheric" then
				r = math.random(1,477)
				emoState[k] = emoState[k] + r
				emoState.aetheric = emoState.aetheric - r
			end
		end
		if emoState.aetheric < 0 then -- just in case
			emoState.aetheric = 7777
		end
	elseif emoState.aetheric > 7777 and playerTraits.spriggan and not SprigganJuju then
		Moodle("SprigganJuju", "apply", "self", "buffs", "default")
		SprigganJuju = os.time()
		--DoRandom("spriggan")
	elseif emoState.aetheric > 555 and CD[playerName].traits.muggle then
		--
	elseif emoState.aetheric < 13 then
		aetherlock = true -- (Negative Effect) - Casting Blocked
	elseif Overcharged then
		if os.time() - Overcharged > 3600 then
			Overcharged = nil
		end
	elseif SprigganJuju then
		if os.time() - SprigganJuju > 4627 then -- Sandy's # is 19, 4 + 6 + 2 + 7 = 19, 77 minutes and 7 seconds = 4627 seconds
			SprigganJuju = nil
		end
	end
	--if emos then
		--Script.Storage.emotions[playerName] = emos
		--Script.SaveStorage()
	--end
	
	 
	
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["MoodUpdate"].END = os.time()
	func_track("MoodUpdate")
end

function Moodle(tag, what, trgt, group, method)
	if not Sys.Moodles then
		return
	end
	func_time["Moodle"].ST = os.time()
	if not trgt then
		trgt = "self"
	end
	if not what then
		what = "apply"
	end
	if not method then
		method = "default"
	end
	dbgMsg("Moodle: Test.", 3)
	dbgMsg("Moodle: Test: group: " .. tostring(group), 3)
	dbgMsg("Moodle: Test: tag: " .. tostring(tag), 3)
	dbgMsg("Moodle: Test: what: " .. tostring(what), 3)
	local mooT
	if moodleGuid[group][tag] then
		local moodle = "/moodle " .. what .. " " .. trgt .. " \"" .. moodleGuid[group][tag] .. "\""
	else
		--dbgMsg("Moodle: Test.", 1)
		--dbgMsg("Moodle: Test: group: " .. tostring(group), 1)
		--dbgMsg("Moodle: Test: tag: " .. tostring(tag), 1)
		--dbgMsg("Moodle: Test: what: " .. tostring(what), 1)
	end
	if group and method then
		if method == "exclusive" then
			for k,v in pairs(moodleGuid[group]) do
				if k ~= tag then
					if moodles[v] then
						mooT = "/moodle " .. "remove"	 .. " " .. trgt .. " moodle \"" .. v .. "\""
						moodles[v] = nil
						Game.SendChat(mooT)
					end
				else
					moodles[v] = os.time()
					--mooT = "/moodle " .. "apply"	 .. " " .. trgt .. " moodle \"" .. v .. "\""
				end
				--Game.SendChat(mooT)
				--dbgMsg("Moodle: " .. mooT, 1)
			end
			Game.SendChat("/moodle " .. "apply"	 .. " " .. trgt .. " moodle \"" .. moodleGuid[group][tag] .. "\"")
			--moodle = "/moot " .. what .. " " .. trgt .. " \"" .. moodleGuid[tag] .. "\""
		elseif method == "default" then
			if what == "remove" then
				if moodleGuid[group][tag] then
					moodles[moodleGuid[group][tag]] = nil
				end
			elseif what == "apply" then
				dbgMsg("Moodle - Applied: " .. tostring(tag), 3)
				if moodleGuid[group][tag] then
					moodles[moodleGuid[group][tag]] = os.time()
				end
			end
			if what and trgt and moodleGuid[group][tag] then
				Game.SendChat("/moodle " .. what .. " " .. trgt .. " moodle \"" .. moodleGuid[group][tag] .. "\"")
			end
		end
	end
	func_time["Moodle"].END = os.time()
	func_track("Moodle")
	--Game.SendChat(moodle)
end

function MoodyDo(moody, too)
	if os.time() - moodyTime < 139 then
		return
	end
	local str = "Moody-"..capit(moody)
	if too then
		if tonumber(too) > 0 then
			if too > 2 then
				too = 2
			end
			str = str.."+"..tostring(too)
		elseif tonumber(too) < 0 then
			if too < -2 then
				too = -2
			end
			str = str..tostring(too)
		end
	end
	dbgMsg("Glamour - Applied: " .. tostring(str), 1)
	Game.SendChat("/glamour apply "..str.." | <me>")
	moodyTime = os.time()
	return str
end

function MoodiTude() --deprecate?
	--Femme Fatale
	if emoState.flirty > 69 then
		if FemmeFatale then
			if os.time() - FemmeFatale > 183 then
				Moodle("FemmeFatale", "apply", "self", "buffs", "default")
				FemmeFatale = os.time()
			end
		else
			Moodle("FemmeFatale", "apply", "self", "buffs", "default")
			--CD[playerName].traits.femmefatale = true
			FemmeFatale = os.time()
		end
	elseif emoState.flirty < 39 then
		Moodle("FemmeFatale", "remove", "self", "buffs", "default")
		FemmeFatale = nil
	end
	--Sleepy
	if emoState.sleepy > 51 then
		if IsSleepy then
			if os.time() - IsSleepy > 111 then
				Moodle("zzz", "apply", "self", "buffs", "default")
				IsSleepy = os.time()
			end
		else
			Moodle("zzz", "apply", "self", "buffs", "default")
			IsSleepy = os.time()
		end
	elseif emoState.sleepy < 17 then
		IsSleepy = nil
	end
end

function useDomi(elem)
	if elem == "yellow" then
		if CD[playerName].traits.vixen then
			UseItem(7810) -- Hatching Tide
		else
			UseItem(7809) -- sunshine
		end
	elseif elem == "red" then
		UseItem(15614) -- meteor shower
	elseif elem == "black" then
		UseItem(40392) -- onibi
	elseif elem == "blue" then
		UseItem(15614) -- deceiver's diamonds
	elseif elem == "green" then
		if CD[playerName].traits.vixen then
			UseItem(22411) -- hatching tide

		else
			UseItem(5900) -- emerald star
		end
	elseif elem == "white" then
		UseItem(8215) -- meteor survivor
	end
end

function MoodFromEmote(emt)
	dbgMsg(".MoodFromEmote.", 2)
	func_time["MoodFromEmote"].ST = os.time()
	if not emote[emt] then
		dbgMsg("Missing data for " .. emt .. " in emote table.", 2)
		return
	end
	
	if emote[emt].effects then
		for k,v in pairs(emote[emt]["effects"]) do
			dbgMsg("♀emote effects♀ :: [" .. k .. "] •†" .. tostring(v) .. "†•", 3)
			EmoGyre(k, v)
		end
	end
	
	local emType = emote[emt].type
	local emCost = emote[emt].cost or 1
	emCost = emCost * (emotionsTotal / emotionsRange) * 0.67
	EmoGyre(emType, emCost * -1.3)
	EmoGyre("energized", emCost * -1.7)
	EmoGyre("social", emCost * -1.3)

	if CD[playerName].traits.aetheric then
		emoState["energized"] = emoState["energized"] - emCost * 3.69
	else
		emoState["energized"] = emoState["energized"] - emCost
	end
	if emoState["energized"] < 0 then
		emoState["energized"] = 0
	end
	
	if emote[emt].buff then
		ApplyBuff(emote[emt].buff)
	end
		
	--::groups::
	dbgMsg("::groups::", 2)
	--update EmotionGroup
	local group = emote[emt]["group"]
	
	if group then
		if group == "paintbrush" then
			local ky = emote[emt]["type"]
			if domiMood == ky then
				if EmotionGroup[ky] then
					dbgMsg("Slap That Brush! " .. string.upper(ky), 1)
					for k,v in pairs(EmotionGroup[ky]["effects"]) do
						if not emoState[k] then
							emoState[k] = 0
						end
						emoState[k] = math.abs(emoState[k] + v)
						dbgMsg("[" .. k .. "] increased by " .. tostring(v) .. " (" .. emoState[k] .. ").", 3)
					end
					useDomi(domiMood)
				end
			end
		else
			CD[playerName].emoGroups = CD[playerName].emoGroups or {}
			CD[playerName].emoGroups[group] = CD[playerName].emoGroups[group] or 0
			CD[playerName].emoGroups[group] = CD[playerName].emoGroups[group] + 1
			local x = 0
			local y
			for k,v in pairs(CD[playerName].emoGroups) do
				x = x + v
			end
			x = math.floor(x / 5)
			for k,v in pairs(CD[playerName].emoGroups) do
				if v > x * 1.25 then
					x = v
					y = k
				end
			end
			if y then
				--domiMood = y
				--Moodle(domiMood, "apply", "self", "domiMood", "exclusive")
			end
		end
	end

	CD[playerName]["emoteTracker"] = CD[playerName]["emoteTracker"] or {}
	if not CD[playerName]["emoteTracker"][emt] then
		CD[playerName]["emoteTracker"][emt] = 1
	else
		CD[playerName]["emoteTracker"][emt] = CD[playerName]["emoteTracker"][emt] + 1
	end
	
	idleTime = idleTime - emCost
	if idleTime < 0 then
		idleTime = 0
	end

	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["MoodFromEmote"].END = os.time()
	func_track("MoodFromEmote")
end

function RemoveBuff(bf)
	if (bf == "all" or bf == "") and tokenStack.GEN then
		for k,v in pairs(tokenStack.GEN) do
			tokenStack.GEN[k].remove = true
			dbgMsg(".Token for.. " .. tostring("GEN") .. " :: " .. k .. " is scheduled for removal.", 1)
		end
	elseif #bf > 1 and tokenStack.GEN then
		if tokenStack.GEN[bf] then
			tokenStack.GEN[bf].remove = true
			dbgMsg(".Token for.. " .. tostring("GEN") .. " :: " .. tostring(bf) .. " is scheduled for removal.", 1)
		end
	end
end

function ApplyBuff(bf)
	--bf = string.lower(bf)
	--dbgMsg("ApplyBuff: " .. tostring(bf), 1)
	if buff[bf] then
		local token = tcopy(buff[bf].token)
		tokenStack.GEN = tokenStack.GEN or {}
		tokenStack.GEN[bf] = tokenStack.GEN[bf] or {}
		--if not tokenStack.GEN[bf] then
			--tokenStack.GEN[bf] = tokenStack.GEN[bf] or {}
		
		if tokenStack.GEN[bf].firstCall and tokenStack.GEN[bf].initialized then
			tokenStack.GEN[bf].lastCall = os.time()
			dbgMsg("ApplyBuff: Increase Stack: " .. tostring(tokenStack.GEN[bf].token.stacks + 1), 1)
			dbgMsg("ApplyBuff: Delay Apply? " .. tostring(token.delayApply), 1)
			if tokenStack.GEN[bf].token.stacks and tokenStack.GEN[bf].token.stackLim then
				if tokenStack.GEN[bf].token.stacks < tokenStack.GEN[bf].token.stackLim then
					tokenStack.GEN[bf].token.stacks = tokenStack.GEN[bf].token.stacks + 1
					tokenStack.GEN[bf].firstCall = os.time()
					if not token.delayApply then
						dbgMsg(":Applied Token: for.. " .. tostring("GEN") .. " :: " .. tostring(bf), 1)
						Moodle(token.moodle, "apply", "self", "buffs", "default")
					else
						tokenStack.GEN[bf].token.delayApply = token.delayApply
					end
				end
			end
		else
			tokenStack.GEN[bf].firstCall = os.time()
			if not tokenStack.GEN[bf].token then
				tokenStack.GEN[bf].token = token
			end
			if not token.delayApply then
				dbgMsg("○Applied Token |for| " .. tostring(token.moodle), 1)
				Moodle(token.moodle, "apply", "self", "buffs", "default")
			else
				dbgMsg(".Scheduling Token for.. " .. tostring("GEN") .. " :: " .. tostring(bf) .. "...", 1)
			end
		end
		--end
	end
end

function EmoRange() 
	func_time["EmoRange"].ST = os.time()
	local val = 0
	local tot = 0.1
	local dmA = 0
	local dmB = 0
	local domTot = {
		["black"] = 0,
		["red"] = 0,
		["blue"] = 0,
		["green"] = 0,
		["yellow"] = 0,
		["white"] = 0
	}
	
	local emT = tcopy(emoState)
	for k,v in pairs(emT) do
		if v > 777777 then
			dbgMsg("EmoRange: " .. tostring(k) .. " is out of range :: [" .. tostring(v) .. "], setting to 777,777.", 1)
			emoState[k] = 777777
			v = 777777
		elseif v < 0 then
			dbgMsg("EmoRange: " .. tostring(k) .. " is less than 0 and out of range :: [" .. tostring(v) .. "], setting to 0.", 1)
			emoState[k] = 0
			v = 0
		end
		tot = tot + v
		if v > val then
			val = v
			--tot = tot + val
			if not moodAspect or not domTot then
				dbgMsg("EmoRange: Something went wrong here: " .. tostring(moodAspect) .. " :: " .. tostring(domTot), 1)
			elseif emoState[k] and v then
				if moodAspect[k] then
					domTot[moodAspect[k]] = domTot[moodAspect[k]] or {}
					domTot[moodAspect[k]] = domTot[moodAspect[k]] + v
				end
			end
		end
	end
	
	for k,v in pairs(domTot) do
		if v > dmA then
			dmA = v
			dmB = k
		end
	end
	if dmB ~= domiMood and dmA > domTot[domiMood] * 1.11 then
		domiMood = dmB
		dbgMsg("EmoRange: " .. domiMood, 1)
		Moodle(domiMood, "apply", "self", "domiMood", "exclusive")
	end
	if playerTraits.moody then
		local x = math.floor(emotionsRange * 13 / emotionsTotal - 3.7)
		MoodyDo(domiMood, x) 
	end
	emotionsRange = val
	emotionsTotal = tot
	func_time["EmoRange"].END = os.time()
	func_track("EmoRange")
	return val
end

function EmotionSet(args)
	dbgMsg(".EmotionSet.", 2)
	local tag, val = shiftWord(args, string.lower)
	if not val then
		val = 0
	elseif val == "" then
		val = 0
	--elseif tonumber(val) < 0 then
		--val = nil
	else
		val = tonumber(val)
	end
	--val = tonumber(val)
	if tag =="all" then
		local emos = {}
		for k, v in pairs(emoState) do
			emos[k] = val
		end
		emoState = emos
		dbgMsg(" All your emotions have been set to " .. tostring(val) .. ".")
	elseif emoState[tag] then
		emoState[tag] = val
		CD[playerName]["emotions"] = CD[playerName]["emotions"] or {}
		CD[playerName]["emotions"][tag] = val --Script.Storage.emotions[playerName][tag] = val
		dbgMsg("Your emotions value for " .. tag .. " has been set to " .. tostring(val) .. ".")
	end

	Script.SaveStorage()
	--Script.Storage.emotions[playerName] = emotionsTypes["A"]
end

function EmotionGet(args)
	dbgMsg(".EmotionGet.", 2)
	local tag = shiftWord(args, string.lower)
		local val = emoState[tag]
		if not val then
			val = 0
		end
		dbgMsg("your emotions value for [" .. tag .. "] is " .. tostring(val) .. ".")
end

function EmoCheck()
	dbgMsg(".EmoCheck.", 2)
	func_time["EmoCheck"].ST = os.time()
	local js,x,y
	local tot = 0
	--jitterTracking
	if Tracking then
		if trackHighest then
			for k,v in pairs(emoState) do
				if v > tot then
					v = tot
					y = k
				end
			end
			if y then
				local tmp = 0
				local tmpb = math.floor((emoState[y] - lastTrackVal[y])*10000)/10000
				if emoState[y] > 0 then
					tmp = math.floor((emoState[y] - lastTrackVal[y]) / emoState[y] * 10000)/10
				end
				lastTrackVal[y] = emoState[y]
				if jitterTracking then
					x = 30 + math.floor(tmp * 2)
					if x < #y + 1 then
						x = #y + 1
					elseif x > 60 then
						x = 60
					end
					js = string.rep(".", 30) .. "" .. string.rep(".", 30)
					--js = k .. " (" .. tostring(math.floor(emoState[k]*100)/100) .. ") " .. string.rep(".", 60)
					js = string.sub(js, 1, 30) .. "" .. string.sub(js, 40)
					js = string.sub(js, 1, x - 1) .. "|" .. string.sub(js, x + 1)
					dbgMsg("" .. y .. js .. " (" .. tostring(math.floor(emoState[y]*100)/100) .. ") ", 0)						
				else
					dbgMsg("" .. y .. " :: " .. tostring(lastTrackVal[y]) .. " {" .. tostring(tmpb) .. "}.", 0)
				end
			end
		else
			if LAT and #Tracking > 0 then
				dbgMsg("‡••••••••••••†  †••••••••••••‡", 0)
			end
			--dbgMsg("‡•••••••••••••••••†Tracking†•••••••••••••••••‡", 0)
			for k,v in pairs(Tracking) do
				if not emoState[k] then
					dbgMsg("\"" .. tostring(k) .. "\" is not a valid emotion.")
					Tracking[k] = nil
				else
					--local emoS = Script.Storage.emotions[playerName]
					if not lastTrackVal[k] then
						lastTrackVal[k] = 0
					end
					
					if emoState[k] ~= lastTrackVal[k] or LAT then --track all if ShowALL
							local tmp = 0
							local tmpb = math.floor((emoState[k] - lastTrackVal[k])*10000)/10000
						if emoState[k] > 0 then
							tmp = math.floor((emoState[k] - lastTrackVal[k]) / emoState[k] * 10000)/10
						end
						lastTrackVal[k] = emoState[k]
						if jitterTracking then
							
							x = 30 + math.floor(tmp * 2)
							if x < #k + 1 then
								x = #k + 1
							elseif x > 60 then
								x = 60
							end
							js = string.rep(".", 30) .. "" .. string.rep(".", 30)
							--js = k .. " (" .. tostring(math.floor(emoState[k]*100)/100) .. ") " .. string.rep(".", 60)
							js = string.sub(js, 1, 30) .. "" .. string.sub(js, 40)
							js = string.sub(js, 1, x - 1) .. "|" .. string.sub(js, x + 1)
							dbgMsg("" .. k .. js .. " (" .. tostring(math.floor(emoState[k]*100)/100) .. ") ", 0)						
						else
							dbgMsg("" .. k .. " :: " .. tostring(lastTrackVal[k]) .. " {" .. tostring(tmpb) .. "}.", 0)
						end
					end
				end
			end
		end
	end
	func_time["EmoCheck"].END = os.time()
	func_track("EmoCheck")
end

function TrackEmotion(args)
	dbgMsg(".TrackEmotion.", 2)
	if args == "none" or args == "clear" then
		if Tracking then
			dbgMsg("No longer tracking any emotions", 0)
			local t = Tracking
			for k,v in pairs(t) do
				Tracking[k] = nil
			end
			Tracking = {}
			CD[playerName].Tracking = Tracking
		else
			dbgMsg("No emotions are currently being tracked", 0)
		end
	elseif args == "jitter" then
		jitterTracking = not jitterTracking
	elseif args == "highest" or args == "high" then
		trackHighest = not trackHighest
		if trackHighest then
			dbgMsg("Now tracking by highest emotionional value", 0)
		else
			dbgMsg("No longer tracking by highest emotionional value", 0)
		end
	else
		if DBG < 0 then
			dbgMsg("Debugging level must be set higher than -1 to display tracking info", 0)
		elseif string.find(args, ",") then
			args = string.gsub(args, " ", "")
			args = ChattyChop(args)
			Tracking = {}
			for i,v in ipairs(args) do
				if emoState[v] then
					Tracking[v] = true
					dbgMsg("Now tracking " .. tostring(v) ..".", 0)
				end
			end
			CD[playerName].Tracking = Tracking
		else
			if emoState[args] then
				Tracking = Tracking or {}
				if Tracking[args] then
					Tracking[args] = nil
					dbgMsg("No longer tracking " .. tostring(args) ..".", 0)
				else
					Tracking[args] = true
					dbgMsg("Now tracking " .. tostring(args) ..".", 0)
				end
				CD[playerName].Tracking = Tracking
				
			else
				dbgMsg(" '" .. args .. "' is not a valid emotion .", 0)
			end
		end
	end
end

--	^								^	--
--	^		^^^ Moods ^^^ 			^	--
--	^								^	--

---	v								v	---
---	v	vvv Emotes and Actions vvv	v	---
---	v								v	---



--void DoRandom([string emote [, string source]])

--The main emote handler for EmoBot. All emote calls should be done via this function unless
--a valid reason exists to do otherwise.

function DoRandom(ovr, src)
	dbgMsg(".DoRandom.", 2)
	func_time["DoRandom"].ST = os.time()
	dbgMsg("DoRandom(): args :: " .. tostring(ovr) .. ".", 3)
	--Game.SendChat("/e rndTime: " .. tostring(rndTime))
	if rndTime and not ovr then
		if rndTime + rndWait > os.time() then
			Script.QueueDelay(SQD)
			Script.QueueAction(Update)
			func_time["DoRandom"].END = os.time()
			func_track("DoRandom")
			return
		end
	elseif ovr then
		if rndTime + 4.11 > os.time() then
			Script.QueueDelay(SQD)
			Script.QueueAction(Update)
			func_time["DoRandom"].END = os.time()
			func_track("DoRandom")
			return
		end
	end
	
	rndTime = os.time()
	rndWait = 0

	if (not rnd and safe) or pause then
		dbgMsg("DoRandom :: Random emote blocked by security settings (rnd : " .. tostring(rnd) .. " | and | safe : " .. tostring(safe) .. " | or | pause : " .. tostring(pause) .. ").", 1)
		func_time["DoRandom"].END = os.time()
		func_track("DoRandom")
		return
	end

	local e = emoState.energized
	local a = 0
	local asp = "sad"
	if playerTraits.aetheric then
		a = emoState.aetheric / 37
		if a > 37 then
			a = 37
		end
	else
		a = emoState.energized / 31
		if a > 31 then
			a = 31
		end
	end

	local enA, enB = Gyre["red"][3], Gyre["yellow"][4]

	rndWait = EFreq - a + (enA + enB/2) * emotionsRange/(emotionsTotal + e^1.37)
	
	if rndWait < 7.77 or rndWait > 7777 then
		rndWait = 77
	end
	
	if type(ovr) == "string" then
		dbgMsg("Direct call to DoRandom().", 3)
		doEmo = ovr
		if confirm == "waiting" and ovr == "yes" then
			confirm = true
		elseif confirm == "waiting" and ovr == "no" then
			confirm = nil
		end
	else
		if IsSitting and lastEmote == "doze" and emoState.sleepy > 33 then
			doEmo = nil
			rndWait = 45
			dbgMsg("Busy - †Sleeping† - Do Not Disturb().", 1)
		elseif lastEmote == "pdead" and emoState.sleepy > 17 and IsEmoting then
			doEmo = nil
			rndWait = 90
			dbgMsg("Busy - †Sleeping† - Do Not Disturb().", 1)
		elseif IsBusy and IsCrafting then
			doEmo = nil
			rndWait = 90
			dbgMsg("Busy - †Crafting† - Do Not Disturb().", 1)
		elseif IsBusy and IsGathering then
			doEmo = nil
			rndWait = 90
			dbgMsg("Busy - †Gathering† - Do Not Disturb().", 1)
		elseif IsBusy and AtBell then
			doEmo = nil
			rndWait = 90
			dbgMsg("Busy - †AtBell† - Do Not Disturb().", 1)
		elseif IsBusy and not IsEmoting then
			doEmo = nil
			rndWait = 60
			dbgMsg("Busy - †Goofing Off† - Do Not Disturb().", 1)
		else
			doEmo = getWeightedEmote()
			if doEmo then
				local typ = emote[doEmo].type
				dbgMsg("DoRandom: asp = " .. tostring(typ) .. " (" .. tostring(emoState[typ]) .. ")", 1)
			else
				--
			end
		end
		--dbgMsg("Scheduled call to DoRandom().", 3)
	end
		
	if doEmo then
		if not emote[doEmo] then
			dbgMsg("emote [" .. doEmo .. "] not found in emote table.", 2)
		elseif not emotesPlayer[doEmo] then
			dbgMsg("you do not have: " .. doEmo .. ".", 1)
			emotesPlayer[doEmo] = false
			CD[playerName]["emotes"][doEmo] = false
			Game.SendChat("/sad motion")
		else
			if not ovr then
				dbgMsg("" .. tostring(doEmo) .. " chosen for random emote.", 1)
			elseif ovr == doEmo and not src then
				dbgMsg("Performing " .. tostring(doEmo) .. " as commanded.", 1)
				CD[playerName].favorites[doEmo] = CD[playerName].favorites[doEmo] or 0
				CD[playerName].favorites[doEmo] = CD[playerName].favorites[doEmo] + 1
			elseif ovr == doEmo and src then
				dbgMsg("Performing " .. tostring(doEmo) .. "" .. " as " .. tostring(src) .. ".",1)
			end
			if doEmo == "snap" and playerTraits.spriggan then
				sprigganSnaps = sprigganSnaps + 1
				dbgMsg("♠sprigganSnaps♠ π " .. tostring(sprigganSnaps), 1)
				if sprigganSnaps / 7 == math.floor(sprigganSnaps / 7) and gYRo > -1 then
					Sys.Gyre = true
					gYRo = 3
					doBijou("onibi")
				end
			elseif doEmo == "clap" and playerTraits.vixen then
				vixenClaps = vixenClaps + 1
				dbgMsg("♥∨ixenClaps♥ ♀ " .. tostring(vixenClaps), 1)
				if vixenClaps / 9 == math.floor(vixenClaps / 9) and gYRo > -1 then
					Sys.Gyre = true
					gYRo = 6
					doBijou("diamonds")
				end
			end
			Game.SendChat("/" .. doEmo .. " motion")
			if playerTraits.moody then
				if moodyTime then
					moodyTime = moodyTime - 169
				end
				dbgMsg("Moody:: " .. tostring(math.floor(emote[doEmo].cost + 1)), 1)
				MoodyDo(emote[doEmo].group, math.floor(emote[doEmo].cost + 1))
			end
			emote[doEmo].last = os.time()
			MoodFromEmote(doEmo)
		end
	else
		dbgMsg("no emote was scheduled for this pass.", 1)
	end
	lastEmote = doEmo or "sad"

	rndTime = os.time()
	if lastEmote then
		if emote[lastEmote] then
			emote[lastEmote].last = rndTime
		else
			dbgMsg("☃DoRandom☃ :: lastEmote = " .. tostring(lastEmote), 1)
		end
	else
		dbgMsg("☃DoRandom☃ :: lastEmote = " .. tostring(lastEmote), 1)
	end
	--dbgMsg("DoRandom :: rndWait :: .. " .. tostring(rndWait) .. ".", 1)
	dbgMsg("DoRandom :: next emote pass in .. " .. tostring(formatTime(rndWait)) .. ".", 1)
	
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["DoRandom"].END = os.time()
	func_track("DoRandom")
end

function getWeightedEmote()
	dbgMsg(".getWeightedEmote.", 2)
	func_time["getWeightedEmote"].ST = os.time()
	--dbgMsg("getWeightedEmote(): domiEmo :: " .. tostring(domiEmo) .. ".", 3)
	local emoChance = 0 -- = EmoRange() * 1.75
	local md, em, adj
	
	if not Sys.Gyre or not Sys.Emotions then
		if Sys.Emotions then
			local r
			local x = 0
			local has
			local wc
			local cd
			local n = math.random(1, emotionsTotal) * 1.37
			
			domiMood = domiMood or "white"

			if n > emotionsRange then
				md = aspectList[domiMood]
			else
				r = math.random(1,6)
				md = aspectList[aspectKeys[r]]
			end
			repeat
				wc = true
				r = math.random(1, #md)
				em = moods[md[r]]
				r = math.random(1, #em)
				em = em[r]
				if not em then
					dbgMsg("GWE: em :: " .. tostring(em), 1)
				end
				dbgMsg("GWE: ✓em :: " .. tostring(em), 1)
				if emote[em].test then
					wc = emote[em].test
					if not wc then
						dbgMsg("GWE: " .. tostring(em) " is restricted to ‡" .. emote[em].restrict .. "‡.", 1)
					end
				end
				if not emote[em].type then
					dbgMsg("GWE: missing 'type' param for :: " .. tostring(em), 1)
					wc = nil
				elseif not emoState[emote[em].type] then
					dbgMsg("GWE: invalid type: ‡" .. tostring(emote[em].type) .. "‡ for †" .. tostring(em) .. "†.", 1)
					wc = nil
				end
				if not emote[em]["last"] then
					dbgMsg("GWE: missing 'last' param for :: " .. tostring(em), 1)
					emote[em].last = 0
				end
				if not emote[em].cd then
					dbgMsg("GWE: missing 'cd' param for :: " .. tostring(em) .. ", setting to 60.", 1)
					emote[em].cd = 60
				end
				if not emote[em].cost then
					dbgMsg("GWE: missing 'cost' param for :: " .. tostring(em) .. ", setting to 3.", 1)
					emote[em].cost = 3
				end
				--dbgMsg("GWE: emote.cost : " .. tostring(emote[em].cost), 1)
				--dbgMsg("GWE: emoState : " .. tostring(emoState[emote[em].type]), 1)
				--dbgMsg("GWE: emote : " .. tostring(em), 1)
					if wc then
						cd = emote[em].cd - (os.time() - emote[em].last)
						adj = emote[em]["cost"] * (emotionsTotal / emotionsRange) * 0.67
						if not emotesPlayer[em] then
							dbgMsg("GWE: you haven't learned :: †" .. em .. "† yet.", 1)
							wc = nil
						elseif emote[em].group == "paintbrush" then
							dbgMsg("GWE: Special Group: paintbrush :: †" .. em .. "†.", 1)
							wc = true
						elseif emoState[emote[em].type] < adj then
							dbgMsg("GWE: emoState :: ‡" .. em .. "‡ (" .. tostring(emoState[emote[em].type]) .. ") :: lower than cost (" .. tostring(adj) .. ") " .. tostring(emote[em].type), 1)
							wc = nil
						elseif cd > 0 then
							dbgMsg("GWE: †" .. em .. "† :: is on cooldown.", 1)
							wc = nil
						elseif emote[em].weight then
							r = math.random(67)
							if r > emote[em].weight then
								dbgMsg("GWE: weight check :: ‡" .. em .. "‡  (" .. tostring(emote[em].weight) .. ") <- " .. tostring(r), 1)
								wc = nil
							else
								dbgMsg("GWE: weight check :: ‡" .. em .. "‡  (" .. tostring(emote[em].weight) .. ") -> " .. tostring(r), 1)
							end
						else
							dbgMsg("GWE: missing 'weight' param for :: " .. tostring(em), 1)
						end
					end
				
				has = wc
				
				dbgMsg("GWE: pass check :: †" .. em .. "†   (" .. tostring(wc) .. ")", 1)
				x = x + 1
				if x == 4 and not has then
					em = nil
					has = "sad"
				end
			until has
			--dbgMsg("GWE: em :: " .. tostring(em), 1)
		end
		func_time["getWeightedEmote"].END = os.time()
		func_track("getWeightedEmote")
		dbgMsg("GWE: selected :: " .. tostring(em), 1)
		return em
	end
	
	for k,v in pairs(GyreConduit) do
		currentConduit[k] = v
		emoChance = emoChance + v
	end
	
	local slct, roll, pm, n
	dbgMsg("GWE: emoChance :: " .. tostring(emoChance), 3)
	for k, v in pairs(currentConduit) do
		roll = math.random(1, emoChance)
		if k == domiEmo then
			if roll * 0.77 < v and not slct then
				slct = k
				pm = v
			end
		else
			if roll < v and not slct then
				slct = k
				pm = v
			end
		end
	end
	
	if slct then
		dbgMsg("GWE: aspect :: " .. tostring(slct), 3)
		n = pm - math.floor((pm-1)/6)*6
		md = aspectList[slct][n]
		dbgMsg("GWE: md :: " .. tostring(md), 3)
		md = moods[md]
		n = pm - math.floor((pm-1)/#md)*#md
		dbgMsg("GWE: emote :: " .. tostring(md[n]), 3)
		
		func_time["getWeightedEmote"].END = os.time()
		func_track("getWeightedEmote")
		return md[n]
	end
	
	dbgMsg("No emote was scheduled for this pass.", 1)
	func_time["getWeightedEmote"].END = os.time()
	func_track("getWeightedEmote")
end

function UseItem(itemId, hq)
	dbgMsg(".UseItem.", 2)
	func_time["UseItem"].ST = os.time()
	if hq then
		itemId = itemId + 1000000
	end
	if not safe or not pause then
		Game.SendChat("/useitem " .. tostring(itemId))
	end
	func_time["UseItem"].END = os.time()
	func_track("UseItem")
	return true
end

function GetGiggly(args)
	if filterLog["2"] then
		dbgMsg("ƒGetGigglyƒ", 2)
	end
	func_time["GetGiggly"].ST = os.time()
	--lophop 650 150 45
	local emote, tmp = shiftWord(args, string.lower)
	if emote then
		doEmo = emote
		emoTime, tmp = shiftWord(tmp, string.lower)
		if tmp then
			variation, tmp = shiftWord(tmp, string.lower)
			if tmp then
				emoCnt, tmp = shiftWord(tmp, string.lower)			
			end
		end
		
		variation = tonumber(variation) or 0
		emoTime = tonumber(emoTime) or 0
		emoCnt = tonumber(emoCnt) or 0
		action = "gigglegas"
		--Game.SendChat("/e variation: " .. tostring(variation))
		--Game.SendChat("/e emoTime: " .. tostring(emoTime))
		--Game.SendChat("/e emoCnt: " .. tostring(emoCnt))
		
		
		return
	end
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
	func_time["GetGiggly"].END = os.time()
	func_track("GetGiggly")
end

function doComplex(tag) --deprecate?
	routine = {}
end

function GiggleGas()
	if filterLog["2"] then
		dbgMsg("ƒGiggleGasƒ", 2)
	end
	--func_time["GiggleGas"].ST = os.time()
	local wait = 250
	if not variation then 
		variation = 0
	end
	if variation == 0 then
		variation = 50
	end
	local method = "default"
	--if method == "sine" then
		--variation = 0
	--end
	if emoTime > 0 then
		wait = emoTime
	end
	local tmp
	--tmp = math.floor((variation * (math.random() - 0.5))*1000)/1000
	if method == "default" then	
		tmp = math.floor(math.random(0,variation))
	elseif method == "sine" then
		tmp = math.sin(actCnt*15*0.017453) * variation
	end
	wait = wait + tmp
	
	if actDo == 0 then
		if method == "sine" then
			actDo = emoCnt
		elseif emoCnt > 0 then
			--Game.SendChat("/e actDo >0: " .. tostring(emoCnt))
			actDo = math.floor(1 * emoCnt)
			--actDo = math.floor(math.random() * emoCnt)
		elseif method == "triangle" then
			actDo = emoCnt
		else
			actDo = math.floor(math.random() * 69)
		end
		
		actCnt = 0
		Game.SendChat("/e actDo: " .. tostring(actDo))
	end
	if actDo == 0 then
		action = "idle"
		actDo = 0
		actCnt = 0
		doEmo = nil
		Game.SendChat("/furious motion")
		Script.QueueDelay(wait)
		Script.QueueAction(Update)
		--func_time["GiggleGas"].END = os.time()
		--func_track("GiggleGas")		
		return
	end
	actCnt = actCnt + 1
	if actCnt < 0 then
		if actCnt >= -2 then
			dbgMsg("/e emo routine completed.")
			action = "idle"
			actDo = 0
			actCnt = 0
			doEmo = nil
			rnd = nil
		end
	elseif actCnt > actDo then
		dbgMsg("/e emo routine completed.")
		action = "idle"
		actDo = 0
		actCnt = 0
		doEmo = nil
	else
		Game.SendChat("/" .. doEmo .. " motion")
	end
	Script.QueueDelay(wait)
	Script.QueueAction(Update)
	--func_time["GiggleGas"].END = os.time()
	--func_track("GiggleGas")
end

function doSpecial(tag)
	dbgMsg(".doSpecial.", 2)
	if special[tag] then
		GetGiggly(special[tag])
	end
	Script.QueueDelay(SQD)
	Script.QueueAction(Update)
end

function TestEmote(tag)
	if filterLog["2"] then
		dbgMsg("ƒTestEmoteƒ", 2)
	end
	if IsBusy then
		dbgMsg("You are currently occupied [" .. tostring(CheckBusy) .. "].", 1)
		return
	end
	local tst = Game.Player.HasEmote(tag)
	if tst then
		dbgMsg("You have and can use [" .. tostring(tag) .. "].", 1)
	end
	CheckEmoteAccess(tag)
	if not emote[tag] then
		dbgMsg("" .. tag .. " not found in the emote table.", 1)
		return
	end
	if emote[tag]["defEmo"] then
		dbgMsg("" .. tag .. " is a default emote.")
	elseif emote[tag]["where"] then
		dbgMsg("" .. tag .. " is from  " ..  emote[tag]["where"] .. ".")
	end
	DoRandom(tag)
end

function CheckEmoteAccess(tag)
	if filterLog["2"] then
		dbgMsg("ƒCheckEmoteAccessƒ", 2)
	end
	if Game.Player.HasEmote(tag) or emote[tag].defEmo then
		dbgMsg("You have access to " .. tag .. ".")
		Game.SendChat("/" .. tag .. " motion")
	else
		dbgMsg("You do not have access to " .. tag .. ".")
	end
end

--	^								^	--
--	^	^^^ Emotes and Actions ^^^ 	^	--
--	^								^	--

---	v								v	---
---	v		vvv Utilities vvv		v	---
---	v								v	---

function ClipClip(typ)
	dbgMsg(".ClipClip.", 2)
	if not typ or typ == "" then
		typ = "B"
	else
		typ = string.upper(typ)
	end
	if not Game.Player.Target.Name then
		dbgMsg("Valid target not found for aetheryte data", 1)
		return
	end
	local targ = string.lower(Game.Player.Target.Name)
	if not targ then
		dbgMsg("Valid target not found for aetheryte data", 1)
		return
	end
	if not AetheryteType[targ] then
		AetheryteType[targ] = {
			[targ] = {
				["type"] = "A",
				["radius"] = 36,
				["cooldown"] = 9,
			},
		}
		
	end
	
	local px,py,pz = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
	local tx,ty,tz = Game.Player.Target.PosX, Game.Player.Target.PosY, Game.Player.Target.PosZ
	local dist = distTarget(px,py,pz,tx,ty,tz)
	local X = [[
["XPos"] = XCOORD,
				["YPos"] = YCOORD,
				["ZPos"] = ZCOORD,]]
	X = string.gsub(X, "XCOORD", tostring(tx))
	X = string.gsub(X, "YCOORD", tostring(ty))
	X = string.gsub(X, "ZCOORD", tostring(tz))
	
	X = string.gsub(X, "RADIUS", tostring(dist))
	
	X = string.gsub(X, "CD", tostring(AetheryteType[targ]["cooldown"]))
	X = string.gsub(X, "TYPE", "AetherEffect" .. tostring(AetheryteType[targ]["type"]))
	X = string.gsub(X, "TCOMMENT", targ)
	
	Script.Clipboard = X
	dbgMsg("Aetheryte Data saved to the Clipboard", 1)
end

function aetherCheck()
	dbgMsg(".aetherCheck.", 2)
	if aetherlock then
		Game.SendChat("/gaction jump")
	end
end

function SaveLog()
	dbgMsg(".SaveLog.", 2)
	--local datestring = os.date("%m-%d-%Y_%X", os.time())
	--local datestring = "123"
	--local filename = "C:\WoLua\emo\dbg-log_" .. datestring .. ".txt"
	--local file = io.open("test.txt", "w")
	--file:write(dbg_log)
	--file:close()
	--local f = type(io)
	dbgMsg("Debug log saved.", 0)
	Script.Clipboard = dbg_log
	Game.SendChat("/snd run EmoSaveLog")
	
	--dbgMsg("Debug log saved: " .. filename, 2)
end

function Backup(what)
	--if what == "outfits" or what == "outfit" then
		if type(Script.Storage) == "table" then
			dbgMsg(".•.Saving Character Data.•.", 1)
			if CD[playerName] then
				local tCD = CD[playerName]
				CD[playerName].emotions = CD[playerName].emotions or {}
				for k,v in pairs(tCD.emotions) do
					CD[playerName].emotions[k] = math.floor(v*10000) / 10000
					if v < 0 then
						CD[playerName].emotions[k] = 0
					end
				end
				
				Script.Storage.version = emoVer
				CD[playerName].traits = CD[playerName].traits or {}
				CD["global"]["dbg"] = DBG or 0
				
				Script.Storage[playerName] = CD[playerName]
				Script.Storage["global"] = CD["global"]
				
				
				if type(CD[playerName].emotions) == "table" and type(CD[playerName].outfits) == "table" and type(CD[playerName].profile) == "table" then
					--Script.Storage.all.valid = true
					Script.Storage.global = Script.Storage.global or {}
					Script.Storage.global.valid = true
					Script.Storage[playerName] = CD[playerName] or {}
					Script.SaveStorage()
					Script.Clipboard = json.serialize(Script.Storage)
					--Game.SendChat("/snd run EmoBackupData")
				  return
				end
			end
		else
			dbgMsg("Invalid Character Data", 0)
		--Script.Storage.currentOutfit[playerName] = currentOutfit
			--Script.Storage.outfits[playerName][currentOutfit] = Script.Storage.outfits[playerName][currentOutfit] or {}
		end	
	--end
end

function Restore()
	local tmp = json.parse(Script.Clipboard)
	if type(tmp) == "table" then
		CD[playerName] = tmp[playerName]
		CD["global"] = tmp["global"]
		dbgMsg("CD Type: " .. type(CD), 1)
		Script.Storage[playerName] = CD[playerName]
		Script.Storage["global"] = CD["global"]
		dbgMsg("Successfully loaded Clipboard Data: ", 1)
	else
		dbgMsg("Invalid Clipboard Data: ", 1)
	end
end

function ProfileSet(field, val)
	if field == "race" then
		local f = {}
		local cnt = 1
		for w in string.gmatch(val, "(.-)/") do
			f[cnt] = w
			cnt = cnt + 1
		end
		playerRace, playerSubRace, genderToken = f[1], f[2], string.sub(val, #val)
		CD[playerName].profile = CD[playerName].profile or {}
		CD[playerName].profile["race"] = playerRace
		CD[playerName].profile["subRace"] = playerSubRace
		CD[playerName].profile["gToken"] = genderToken
		dbgMsg("playerRace: " .. tostring(playerRace), 1)
		dbgMsg("playerSubRace: " .. tostring(playerSubRace), 1)
		dbgMsg("genderToken: " .. tostring(string.sub(val, #val)), 1)
		--"Miqo'te / Keeper of the Moon / ♀"
	elseif field == "guardian" then
		playerGuardian = val
		CD[playerName].profile["guardian"] = playerGuardian
		dbgMsg("playerGuardian: " .. tostring(playerGuardian), 1)
	elseif field == "nameday" then
		playerNameday = val
		CD[playerName].profile["nameday"] = playerNameday
		dbgMsg("playerNameday: " .. tostring(playerNameday), 1)
	elseif field == "city" then
		playerCity = val
		CD[playerName].profile["city"] = playerCity
		dbgMsg("playerCity: " .. tostring(playerCity), 1)
	elseif field == "rank" then
		playerRank = val
		CD[playerName].profile["rank"] = playerRank
		dbgMsg("playerRank: " .. tostring(playerRank), 1)
	elseif field == "complete" then
		dbgMsg("✓Profile Saved!✓", 1)
		Script.Storage[playerName] = CD[playerName]
		Script.Storage.global = CD.global
		Script.SaveStorage()
	elseif field == "error" then
		profileError = true
		dbgMsg("Profile Error", 1)
		dbgMsg("Please insure that the Character window is open", 1)
		dbgMsg("and the Profile tab selected.", 1)
	end
end

function TargetHandler()
	local tag = Game.Player.Target.Name
	local top

	if not tag or Game.Player.InCombat then
		return
	end

	if targetActions[tag] then
		--dbgMsg("Target Is Valid :: ", 1)
		if targetActions[tag].cooldown then
			if (os.time() - targetActions[tag].last) > targetActions[tag].cooldown then
				targetActions[tag].last = os.time()
				CallRoutine(targetActions[tag].routine)
			end
			return "TargetHandler :: Start Routine: " .. targetActions[tag].routine
		end
	end
	
	--Name Contains
	for k,v in pairs(targetActions) do
		if string.find(tag, k) then
			top = k
		end
		if top then
			dbgMsg("TargetHandler :: Break Check", 1)
			break
		end
	end
	
	if top then
		tag = top
		if (os.time() - targetActions[tag].last) > targetActions[tag].cooldown then
			targetActions[tag].last = os.time()
			CallRoutine(targetActions[tag].routine)
		end
		return "TargetHandler :: Start Routine: " .. targetActions[tag].routine
	end
	
	tag = Game.Player.Target.Race
	
	if targetActions[tag] then
		if targetActions[tag].cooldown then
			if (os.time() - targetActions[tag].last) > targetActions[tag].cooldown then
				targetActions[tag].last = os.time()
				CallRoutine(targetActions[tag].routine)
			end
			return "TargetHandler :: Start Routine: " .. targetActions[tag].routine
		end 
	end
	
	local tag = Game.Player.Target.Tribe
	
	if targetActions[tag] then
		if targetActions[tag].cooldown then
			if (os.time() - targetActions[tag].last) > targetActions[tag].cooldown then
				targetActions[tag].last = os.time()
				CallRoutine(targetActions[tag].routine)
			end
			return "TargetHandler :: Start Routine: " .. targetActions[tag].routine
		end 
	end
	
	local tag = "Alive" 
	if not Game.Player.Target.Alive then -- Dead
		tag = "Dead"
	end
	
	if targetActions[tag] then
		if targetActions[tag].cooldown then
			if (os.time() - targetActions[tag].last) > targetActions[tag].cooldown then
				targetActions[tag].last = os.time()
				CallRoutine(targetActions[tag].routine)
			end
			return "TargetHandler :: Start Routine: " .. targetActions[tag].routine
		end 
	end
	
end

--	^								^	--
--	^		^^^ Utilities ^^^ 		^	--
--	^								^	--

function Dump(what, chn)
	dbgMsg(".Dump.", 2)
	if what == "mood" or what == "emotions" then
		local s
		for k, v in pairs(emoState) do
			s = string.rep(":", math.floor(v/10))
			if #s > 51 then
				s = ""
			end
			if not chn then
				dbgMsg("" .. k .. " ::" .. s .. " " .. v .. ".", 0)
			elseif validChn[chn] then
				Game.SendChat("/" .. chn .. " " .. k .. " ::" .. s .. " " .. v .. ".")
			end
		end
	elseif what == "gyre" then
		local s = ""
		for k,v in pairs(Gyre) do
			s = "[\"" .. k .. "\"] > "
			for i, n in ipairs(v) do
				s = s .. "(" .. tostring(string.char(64+n)) .. ") "
			end
			dbgMsg(s, 0)
		end
	elseif what == "tokenstack" then
		dbgMsg("tokenStack dumped to clipboard", 0)
		Script.Clipboard = json.serialize(tokenStack[Game.Player.MapZone])
	elseif type(what) == "table" then
		if not chn then
			for k, v in pairs(what) do
				dbgMsg("key: " .. tostring(k).. " :: val: " .. tostring(v) .. ".", 0)
			end
		elseif validChn[chn] then
			for k, v in pairs(what) do
				Game.SendChat("/" .. chn .. " key: " .. tostring(k).. " :: val: " .. tostring(v) .. ".")
			end
		end
	end
end

---	v								v	---
---	v		vvv CORE vvv			v	---
---	v								v	---

function doLoad()
	if filterLog["2"] then
		dbgMsg("ƒdoLoadƒ", 2)
	end
	func_time["doLoad"].ST = os.time()
	loaded = false
	update = true
	action = "loading"
	lastPoke = os.time()

	---										---
	--- 			globals					---
	---										---		

	playerName = Game.Player.Name
	if not playerName then
		dbgMsg("ƒdoLoadƒ :: player unavailable? ::", 1)
		IsPorting = true
		return
	end
	nickName = Game.Player.Entity.Firstname
	
	CD = CD or {}
	CD[playerName] = Script.Storage[playerName] or {}
	CD.global = Script.Storage.global or {}
	CD.global.Census = CD.global.Census or {}

	CD.g = Script.Storage.g or {}
	_g = CD.g
	Script.Storage.version = emoVer
	
	--if not Script.Storage.version or not CD[playerName] or not Script.Storage[playerName] then
		--UpdateStorageData()
		--dbgMsg("doLoad: UpdateStorageData", 4)
	--end
	
	ftMonth = formatTime(os.time(), "%m")
	ftDay = formatTime(os.time(), "%d")
	
	if not CD.global.dbg then
		CD.global.dbg = 1
	end
	
	DBG = tonumber(CD.global.dbg)
	
	if type(DBG) ~= "number" then
		DBG = 1
		CD.global.dbg = 1
	end
	
	CD.global.glams = CD.global.glams or {}
	
	
	CD.global.persist = CD.global.persist or {}
	
	CD.global.lastChatUpdate = CD.global.lastChatUpdate or os.time()
	lastChatUpdate = CD.global.lastChatUpdate

	---										---
	--- 	init character data and stats	---
	---										---	
	
	CD[playerName] = CD[playerName] or {}
	
	CD[playerName].nickName = CD[playerName].nickName or ""
	if CD[playerName].nickName == "" then
		CD[playerName].nickName = nickName
	end
	nickName = CD[playerName].nickName
	currentGil = Game.Player.GetGil()
	CD[playerName]["playerGil"] = currentGil
	
	if not CD[playerName].startday then
		CD[playerName].startday = os.time()
		CD[playerName].initialGil = currentGil
	end
	startday = CD[playerName].startday
	initialGil = CD[playerName].initialGil

	CD[playerName].traits = CD[playerName].traits or {}
	
	if not CD[playerName].traits.neutral then
		CD[playerName].traits.neutral = true
	end
	playerTraits = CD[playerName].traits
	
	CD[playerName].Gyre = CD[playerName].Gyre or {}
	if not CD[playerName].Gyre.black then
		CD[playerName].Gyre = tcopy(Gyre)
	end
	Gyre = tcopy(CD[playerName].Gyre)
	
	if playerTraits.spriggan then
		CD[playerName].sprigganSnaps = CD[playerName].sprigganSnaps or 0
	end
	if playerTraits.vixen then
		CD[playerName].vixenClaps = CD[playerName].vixenClaps or 0
	end
	sprigganSnaps = CD[playerName].sprigganSnaps or 0
	vixenClaps = CD[playerName].vixenClaps or 0
	
	CD[playerName]["churn"] = CD[playerName]["churn"] or "0"
	
	CD[playerName]["lastBuff"] = CD[playerName]["lastBuff"] or {}
	lastBuff = CD[playerName]["lastBuff"]
	
	Aether = tonumber(CD[playerName]["churn"])
	CD[playerName]["updCnt"] = CD[playerName]["updCnt"] or 0
	CD[playerName]["idles"] = CD[playerName]["idles"] or 0
	CD[playerName]["collisions"] = CD[playerName]["collisions"] or 0
	--CD[playerName]["largestPrime"] = CD[playerName]["largestPrime"] or 1
	--CD[playerName]["traits"] = CD[playerName]["traits"] or {}
	CD[playerName]["quirks"] = CD[playerName]["quirks"] or {}
	CD[playerName]["prog"] = CD[playerName]["prog"] or {}
	CD[playerName]["salesTotal"] = CD[playerName]["salesTotal"] or 0
	CD[playerName]["lastTransaction"] = CD[playerName]["lastTransaction"] or ""
	CD[playerName]["idleTime"] = CD[playerName]["idleTime"] or 0
	idleTime = CD[playerName]["idleTime"]
	playerProg = CD[playerName]["prog"]
	lastTransaction = tonumber(CD[playerName].lastTransaction)
	salesTotal = CD[playerName]["salesTotal"]
	
	maintain = CD[playerName].maintain
	
	CD[playerName].favoriteEntree = CD[playerName].favoriteEntree or ""
	favoriteEntree = CD[playerName].favoriteEntree
	CD[playerName].favoriteMeal = CD[playerName].favoriteMeal or ""
	favoriteMeal = CD[playerName].favoriteMeal
	
	playerProg.GoldStar = playerProg.GoldStar or 0
	playerProg.SilverStar = playerProg.SilverStar or 0
	playerProg.BronzeStar = playerProg.BronzeStar or 0
	playerProg.Points = playerProg.Points or 0
	playerProg.Score = playerProg.Score or 0
	
	CD[playerName]["gleans"] = CD[playerName]["gleans"] or {}
	CD[playerName]["favorites"] = CD[playerName]["favorites"] or {}
	CD[playerName]["diet"] = CD[playerName]["diet"] or {}
	
	CD[playerName]["profile"] = CD[playerName]["profile"] or {}
	CD[playerName]["Tracking"] = CD[playerName]["Tracking"] or nil
	CD[playerName]["emoGroups"] = CD[playerName]["emoGroups"] or {}
	CD[playerName]["emoteTracker"] = CD[playerName]["emoteTracker"] or {}
	CD[playerName]["purchases"] = CD[playerName]["purchases"] or {}
	CD[playerName]["earnings"] = CD[playerName]["earnings"] or {}
	
	CD[playerName]["profile"]["race"] = Game.Player.Entity.Race
	CD[playerName]["profile"]["subRace"] = Game.Player.Entity.Tribe
	CD[playerName]["profile"]["bustSize"] = Game.Player.Entity.BustSize
	CD[playerName]["profile"]["height"] = Game.Player.Entity.Height
	CD[playerName]["profile"]["guardian"] = CD[playerName]["profile"]["guardian"] or ""
	CD[playerName]["profile"]["city"] = CD[playerName]["profile"]["city"] or ""
	CD[playerName]["profile"]["rank"] = CD[playerName]["profile"]["rank"] or ""
	CD[playerName]["profile"]["gToken"] = CD[playerName]["profile"]["gToken"] or ""
	CD[playerName]["profile"]["nameday"] = CD[playerName]["profile"]["nameday"] or ""
	CD[playerName]["appellation"] = CD[playerName]["appellation"] or ""
	
	playerRace = CD[playerName]["profile"]["race"]
	playerSubRace = CD[playerName]["profile"]["subRace"]
	playerGuardian = CD[playerName]["profile"]["guardian"]
	playerCity = CD[playerName]["profile"]["city"]
	playerRank = CD[playerName]["profile"]["rank"]
	genderToken = CD[playerName]["profile"]["gToken"]
	playerNameday = CD[playerName]["profile"]["nameday"]
	appellation = CD[playerName]["appellation"]
	
	if Game.Player.IsFemale then
		playerGender = "Female"
		gender = "Female"
		if #appellation < 1 then
			appellation = "Miss " .. Game.Player.Entity.Lastname
			CD[playerName]["appellation"] = appellation
		end
	else
		playerGender = "Male"
		gender = "Male"
		if #appellation < 1 then
			appellation = "Master " .. Game.Player.Entity.Lastname
			CD[playerName]["appellation"] = appellation
		end
	end

	---										---
	--- 		emotes and emotions			---
	---										---	

	CD[playerName]["emotions"] = CD[playerName]["emotions"] or {}
	CD[playerName]["emotes"] = CD[playerName]["emotes"] or {}
	emotesPlayer = {}
	
	for k,v in pairs(emote) do
		if v.defEmo then
			emotesPlayer[k] = true
		elseif Game.Player.HasEmote(v.slsh) then
			emotesPlayer[k] = true
		else
			emotesPlayer[k] = false
		end
	end
	
	CD[playerName]["emotes"] = emotesPlayer
	CD[playerName]["emotionsSet"] = CD[playerName]["emotionsSet"] or nil
	
	if not CD[playerName]["emotionsSet"] or not CD[playerName]["emoGroups"]["black"] or not CD[playerName]["emotions"] then
		dbgMsg("Loaded this far: initPersona", 0)
		initPersona()
	end
	
	for k,v in pairs(moods) do
		emoState[k] = CD[playerName].emotions[k] or 0
	end
	
	CD[playerName].emotions = emoState
	
	---										---
	--- 			outfits					---
	---										---
	CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
	CD[playerName]["currentOutfit"] = CD[playerName]["currentOutfit"] or ""
	
	currentOutfit = CD[playerName]["currentOutfit"]
	
	if not currentOutfit then
		currentOutfit = Game.Player.Entity.Job.Name
	end
	
	if currentOutfit then
		CD[playerName]["outfits"][currentOutfit] = CD[playerName]["outfits"][currentOutfit] or {}
		CD[playerName]["outfits"][currentOutfit]["job"] = CD[playerName]["outfits"][currentOutfit]["job"] or Game.Player.Entity.Job.ShortName
	end
	
	--CD.global.glams = nil
	CD[playerName].glams = CD[playerName].glams or {}
	CD[playerName].glams.head = CD[playerName].glams.head or {}
	CD[playerName].glams.body = CD[playerName].glams.body or {}
	CD[playerName].glams.hands = CD[playerName].glams.hands or {}
	CD[playerName].glams.legs = CD[playerName].glams.legs or {}
	CD[playerName].glams.feet = CD[playerName].glams.feet or {}
	CD[playerName].glams.ears = CD[playerName].glams.ears or {}
	CD[playerName].glams.neck = CD[playerName].glams.neck or {}
	CD[playerName].glams.wrist = CD[playerName].glams.wrist or {}
	CD[playerName].glams.ring = CD[playerName].glams.ring or {}
	CD[playerName].glams.panties = CD[playerName].glams.panties or {}
	CD[playerName].glams.bra = CD[playerName].glams.bra or {}
	CD[playerName].glams.nails = CD[playerName].glams.nails or {}
	currentOutfit = CD[playerName]["currentOutfit"]
	for k,v in pairs(CD[playerName]["outfits"][currentOutfit]) do
		currentOutfitSet[k] = v
	end
	
	---										---
	--- 	---<< gil stuff >> ---			---
	---										---
	
	CD[playerName]["playerGilBuff"] = CD[playerName]["playerGilBuff"] or ""
	lastGil = CD[playerName]["playerGil"]
	startingGil = lastGil
	currentGil = lastGil
	 
	CD["global"]["gil"] = CD["global"]["gil"] or 0
	local tmp = 0
	for k,v in pairs(Script.Storage) do
		if v.playerGil then
			tmp = tmp + v.playerGil
		end
	end
	
	CD.global.gil = tmp
	gilBuff = tonumber(CD[playerName]["playerGilBuff"]) or 0.11
	if not CD.global.initialGil then
		CD.global.startday = os.time()
		CD.global.initialGil = CD.global.gil
	end
	
	---										---
	--- 			misc					---
	---										---

	if type(CD[playerName]["Tracking"]) == "string" then
		CD[playerName]["Tracking"] = {}
	end
	Tracking = CD[playerName]["Tracking"]
	CD[playerName]["matchness"] = nil --clear from CD table, will deprecate @ver0.7.29
	

	--DBG = tonumber(CD["global"]["dbg"])
	CD[playerName].distanceTraveled = CD[playerName].distanceTraveled or 0
	DisT = CD[playerName].distanceTraveled
	CD[playerName].combatTime = CD[playerName].combatTime or 0
	combatTime = CD[playerName].combatTime
	CD[playerName].onTheFloor = CD[playerName].onTheFloor or 0
	onTheFloor = CD[playerName].onTheFloor
	floorinIt = onTheFloor
	napTime = floorinIt
	--dbgMsg("Loaded this far: DBG: " .. tostring(DBG), 0)
	
	updCnt = CD[playerName]["updCnt"]
	idles = CD[playerName]["idles"]
	collisions = CD[playerName]["collisions"]
	--largestPrime = CD[playerName]["largestPrime"] --deprecate
	
	---										---
	--- 			finalize				---
	---										---
	
	if CD[playerName]["lastSave"] then
		local lastLog = math.floor(os.time() - CD[playerName]["lastSave"])
		local slpAdj = lastLog * -0.137
		if lastLog > 345 then
			--Sys.Gyre = true
			EmoGyre("sleepy", slpAdj)
			--Sys.Gyre = nil
		end
	end
	
	Script.Storage.global.valid = true

	Script.QueueDelay(1000)
	loadTime = os.time()
	Game.PrintMessage("EmoBot is loaded and ready to jack!")

	if not safe then
		--Game.SendChat("/.chathandler toggle")
	end
	WoluaXVersion = string.match(Game.Player.WoluaXVersion, "(%d+%.%d+%.%d+%.%d+)")
	action = "loaded"
	pause = CD.global.pause
	loaded = true
	Script.QueueAction(Update)
	func_time["doLoad"].END = os.time()
	func_track("doLoad")
end

function Update()
	local ti = os.time()
	local p
	if lock["Update"] then -- lock
		if ti - lock["Update"] > 33 then
			lock["Update"] = nil
			dbgMsg("ƒUpdateƒ - UNLOCKED", 1)
		else
			return
		end
	elseif filterLog["2"] then
		dbgMsg("ƒUpdateƒ", 2)
	end -- lock
	func_time["Update"].ST = os.time()
	
	if not CD[playerName] and action ~= "loading" and not IsPorting then
		dbgMsg("ƒUpdateƒ :: doLoad() call", 1)
		doLoad()
		func_time["Update"].END = os.time()
		func_track("Update")
		action = "loading"
		return
	end
	if action == "loading" then
		playerName = Game.Player.Name
		func_time["Update"].END = os.time()
		func_track("Update")
		return
	end
	local ctA, ctB, ctC, ctD, ctE, ctF, ctG, ctH, ctI, ctM
	
	if phrash and not safe then
		doPhrash()
	end
	
	UpdatePos()
	
	--[[
	if (math.floor(ti) > lastChatUpdate and Game.Chat.Stamp > lastChatUpdate) and listenChn[Game.Chat.Chn] then
		stackIdx = #chatStack + 1
		chatStack[stackIdx] = {}
		chatStack[stackIdx].stamp = Game.Chat.Stamp
		chatStack[stackIdx].msg = Game.Chat.Msg
		chatStack[stackIdx].chn = Game.Chat.Chn
		chatStack[stackIdx].sender = Game.Chat.Sender
		lastChatUpdate = Game.Chat.Stamp
		--dbgMsg("ƒUpdate :: stackIdx :: " .. tostring(stackIdx), 1)
		--dbgMsg("ƒUpdate :: stackMsg :: " .. tostring(chatStack[stackIdx].msg), 1)
		--ChatHandler()
	end
	]]--
	if stackIdx > 0 then
		ChatHandler()
	end
	
	if not Game.Player.Name then
		Script.QueueDelay(SQD)
		Script.QueueAction(Update)
		--catch reloading?
		return
	end
	
	if wmarkSet then
		if (os.time() - wmarkSet) > 7 then
			Game.SendChat("/waymark clear")
			wmarkSet = nil
		end
	end

	if doRotate then
		local rot = math.floor(Game.Player.RotationDegrees * 10) / 10
		rot = rot + doRotate
		if rot > 360 then
			rot = rot - 360
		end
		Game.Player.SetRot(rot)
		if playerTraits.aetheric then
			if doRotate < 0 then
				ReduceRandom(doRotate * -1.17, "aetheric")
				--EmoGyre("aetheric", doRotate * 0.037)
				--EmoGyre("dazed", doRotate * -0.011)
			else
				BoostRandom(doRotate * 1.37, "energized")
				--EmoGyre("energized", doRotate * -0.017)
				--EmoGyre("energized", doRotate * -0.017)
			end
		elseif playerTraits.spriggan then
			if doRotate < 0 then
				EmoGyre("aetheric", doRotate * -0.13)
				
				EmoGyre("mischievous", doRotate * -0.13)
			else
				EmoGyre("energized", doRotate * 0.13)
			end
		end
	end
	
	if AFK ~= Game.Player.IsAfk then
		AFK = Game.Player.IsAfk
		if AFK == true then
			dbgMsg("AFK detected.. Activating Away Mode.", 1)
		else
			dbgMsg("Player Away Status Updated.. Activating Action Mode.", 1)
		end
	end
	
	if action == "loaded" then
		--Game.SendChat("/snd run EmoStatsCheck")
		--StartStatsTracker()
		action = "idle"
	elseif action == "routine" then
		--dbgMsg("Last Update: " .. tostring(lastUpdate), 2)
		--dbgMsg("os.time() - lastUpdate: " .. tostring(os.time() - lastUpdate), 2)
		--currentRoutineWait
		if os.time() - lastUpdate < currentRoutineWait or confirm == "waiting" then
			--dbgMsg("time - lastupdate = " .. tostring(os.time() - lastUpdate), 2)
			--dbgMsg("routine wait = " .. tostring(routines[currentRoutine][routineIdx]["w"]), 2)
			Script.QueueDelay(25)
			Script.QueueAction(Update)
			if os.time() - lastUpdate > 60 then
				confirm = nil
			end
			func_time["Update"].END = os.time()
			func_track("Update")
			
			return
		end
		
		dbgMsg("RoutineUpdate()", 4)
		RoutineUpdate()
		lastUpdate = os.time()
		--Script.QueueDelay(150)
		--RoutineUpdate()
		func_time["Update"].END = os.time()
		func_track("Update")
		return
	elseif (action == "sleep") or (AFK == true) then
		if action ~= "sleep" then
			Script.QueueDelay(SQD)
			Script.QueueAction(Update)
		end
		func_time["Update"].END = os.time()
		func_track("Update")
		return
	elseif action == "gigglegas" then
		GiggleGas()
		--func_time["Update"].END = os.time()
		--func_track("Update")
		return
	end
	
	if IsPorting then
		if ti - IsPorting > 29 then
			IsPorting = nil
		end
	end
	--dbgMsg(".Update() .. Trace: A", 1)
	lastUpdate = os.time()
	updCnt = updCnt + 1
	ctA = updCnt / 17 -- Adjustment Constants
	ctB = updCnt / 31 -- Using primes will lessen collisions,
	ctC = updCnt / 19 -- such as where more than 1 of these conditions may be
	ctD = updCnt / 67 -- evenly divisible.
	ctE = updCnt / 37
	ctF = updCnt / 5 -- do not change
	ctG = updCnt / 233
	ctH = updCnt / 23
	ctI = updCnt / 11 -- do not change
	ctJ = updCnt / 7
	ctK = updCnt / 13
	ctL = updCnt / 29
	ctM = updCnt / 53
	
	
	--[[if math.floor(ti) > lastChatUpdate and Game.Chat.Stamp > lastChatUpdate then
		lastChatUpdate = Game.Chat.Stamp
		ChatHandler()
	end]]--
	--CollisionTracker({ctA, ctB, ctC, ctD, ctE, ctF, ctG, ctH, ctI, ctK})
	
	if ctA == math.floor(ctA) and action ~= "routine" and not InDuty then
		currentUpdateCall = "A"
		--largestPrime = updCnt
		--MoodUpdate()
		if IsEmoting and (lastEmote == "pdead" and emoState.sleepy > 17) then
			IsSleeping = true
			MoodFromEmote(lastEmote)
		elseif not lastEmote then
			dbgMsg("Updater: LastEmote is " .. tostring(lastEmote) .. ".")
		elseif not emote[lastEmote]["cd"] then
			dbgMsg("Missing .cd .. " .. tostring(lastEmote) .. ".")
		elseif IsEmoting and lastEmote and (os.time() - rndTime) < emote[lastEmote].cd then
			--dbgMsg("Channeling.. " .. doEmo .. ".")
			MoodFromEmote(lastEmote)
		elseif (IsSitting and lastEmote == "doze") then
			MoodFromEmote(lastEmote)
			IsSleeping = true
		else
			IsSleeping = nil
		end
	elseif ctB == math.floor(ctB) then
		--largestPrime = updCnt
		currentUpdateCall = "B"
		decayPass()
		--QuirkHandler()
	elseif ctC == math.floor(ctC) then
		--largestPrime = updCnt
		currentUpdateCall = "C"
		TargetHandler()
		if Tracking then
			EmoCheck() --Tracking
		end
		--UpdatePos()
	elseif ctD == math.floor(ctD) and rnd and action ~= "routine" then
		--largestPrime = updCnt
		currentUpdateCall = "D"
		if IsSitting or IsSleeping then
			RestEffects()
		else
			DoRandom()
		end
	elseif ctE == math.floor(ctE) then
		--largestPrime = updCnt
		currentUpdateCall = "E"
		doEnvironment()
	elseif ctF == math.floor(ctF) and Sys.SND then
		--largestPrime = updCnt
		currentUpdateCall = "F"
		--FlagsHandler()
		UpdateFlags()
		--StartGilTracker()
	elseif ctG == math.floor(ctG) then
		--largestPrime = updCnt
		currentUpdateCall = "G"
		if Script.Storage.global.valid then
			CDUpdater()
		else
			dbgMsg("Invalid Character Data...", 0)
			--bad savedata
		end
		
		--SaveLog()
	elseif ctH == math.floor(ctH) and action ~= "routine" then
		--largestPrime = updCnt
		currentUpdateCall = "H"
		BeaconCheck()
	elseif ctI == math.floor(ctI) then
		--largestPrime = updCnt
		currentUpdateCall = "I"
		StatusHandler()
	elseif ctJ == math.floor(ctJ) then
		--largestPrime = updCnt
		currentUpdateCall = "J"
		tokenHandler()
	elseif ctK == math.floor(ctK) then
		--largestPrime = updCnt
		currentUpdateCall = "K"
		EmoRange()
		--MoodiTude()
		--Compulsions()
	elseif ctL == math.floor(ctL) then
		--largestPrime = updCnt
		currentUpdateCall = "L"
		MoodUpdate()
	elseif ctM == math.floor(ctM) then
		--largestPrime = updCnt
		currentUpdateCall = "M"
		if maintain then
			SelfCare()
		end
		--Game.SendChat("/snd run EmoAreaCheck")
	else
		--if IsPrime(updCnt) then
			--largestPrime = updCnt
		--end
		--p = factors(updCnt)
		--if #p == 1 then
			--largestPrime = updCnt
		--end
	end
	--dbgMsg(".Update() .. Trace: Z", 1)
	
	--if IsPrime(updCnt) == true then
		--dbgMsg("♦Prime♦ :: " .. tostring(updCnt), 1)
		--largestPrime = updCnt
	--end
	
	if os.time() - lastFlagCall > 1.5 then
		UpdateFlags()
	end
	
	if Script.QueueSize < 12 then
		Script.QueueDelay(SQD)
		Script.QueueAction(Update)
	end
	func_time["Update"].END = os.time()
	func_track("Update")
end

function CDHandler()
	CDUpdater()
end

--Character Data Handler
function CDUpdater()
	if filterLog["2"] then
		dbgMsg("ƒCDUpdaterƒ", 2)
	end
	func_time["CDUpdater"].ST = os.time()
	--dbgMsg(".CDUpdater.", 2)
	
	playerName = Game.Player.Name
	if not CD[playerName] then
		dbgMsg(".CDUpdater. Player not currently available.", 1)
		func_time["CDUpdater"].END = os.time()
		func_track("CDUpdater")
		return
	end
	for k,v in pairs(emoState) do
		CD[playerName].emotions[k] = math.floor(v*10000) / 10000
		if v < 0 or v > 34567 then
			CD[playerName].emotions[k] = 0
		end
	end
	CD[playerName].updCnt = updCnt
	CD[playerName].idles = idles
	CD[playerName].collisions = collisions
	CD[playerName].largestPrime = largestPrime
	CD[playerName].playerGilBuff = tostring(gilBuff)
	CD[playerName].traits = playerTraits
	CD[playerName].prog = playerProg
	CD[playerName].salesTotal = salesTotal
	CD[playerName].combatTime = combatTime
	CD[playerName].onTheFloor = napTime
	CD[playerName].distanceTraveled = DisT
	CD[playerName]["idleTime"] = idleTime
	CD[playerName]["lastBuff"] = lastBuff
	CD[playerName].favoriteEntree = favoriteEntree
	CD[playerName].favoriteMeal = favoriteMeal
	CD[playerName]["lastTransaction"] = tostring(lastTransaction)
	CD[playerName].lastSave = os.time()
	
	CD[playerName].Gyre = tcopy(Gyre)
	
	if playerTraits.spriggan then
		CD[playerName].sprigganSnaps = sprigganSnaps
	end
	if playerTraits.vixen then
		CD[playerName].vixenClaps = vixenClaps
	end
	
	if CD[playerName]["playerGil"] and CD.global.gil then
		CD["global"]["gil"] = CD["global"]["gil"] + (currentGil - CD[playerName]["playerGil"])
	end
	
	--CD["global"]["gil"] = tmp
	--Script.Storage[playerName]["outfits"][""] = nil
	Script.Storage[playerName] = CD[playerName]
	
	--- Important to convert DBG to a string when saving, since DBG can be negative, and the json handler
	--- Moonscript uses is finicky about 'raw' negatives, or I'm doing something wrong,
	--- which is possible. The save data however validates just fine on the validator > https://jsonlint.com/
	--- /shrugs...
	CD.global.lastChatUpdate = lastChatUpdate
	CD.global.dbg = tostring(DBG) 
	CD.g = _g
	Script.Storage["global"] = CD["global"]
	Script.Storage["g"] = _g
	
											
	Script.SaveStorage()
	func_time["CDUpdater"].END = os.time()
	func_track("CDUpdater")
end

function RestEffects()
	if filterLog["2"] then
		dbgMsg("ƒRestEffectsƒ", 2)
	end
	func_time["RestEffects"].ST = os.time()
	if IsSleeping and emoState.sleepy > 11 then
		EmoGyre("sleepy", -17)
		EmoGyre("energized", 3.77)
		EmoGyre("tired", -7)
		EmoGyre("bored", -7.7)
		Moodle("zzz", "apply", "self", "buffs", "default")
		func_time["RestEffects"].END = os.time()
		func_track("RestEffects")
		return
	end
	IsSleeping = nil
	if IsSitting then
		if totalFuncTime == math.floor(totalFuncTime) then
			local r = math.random(1,#sittin_motes)
			if sittin_motes[r] then
				DoRandom(sittin_motes[r])
			end
		end
		EmoGyre("tired", -1.23)
	end
	if emoState.sleepy > 369 then
		local s = emoState.sleepy / 67
		local r = math.random(963)
		if s > r then
			emoReact("sleepy", " as influenced by [sleepy] (" .. tostring(emoState.sleepy) .. ").")
		end
	end
	EmoGyre("bored", 1.23)
	EmoGyre("sleepy", emoState.bored * 0.00137)
	--dbgMsg("ƒRestEffectsƒ", 1)
	func_time["RestEffects"].END = os.time()
	func_track("RestEffects")
end

function GilEffects()
	adj = (gilBuff / currentGil) * 1379
	EmoGyre("sad", -adj)
	EmoGyre("happy", adj)
	EmoGyre("responsible", adj * 0.71)
end

function StatusHandler()
	if filterLog["2"] then
		dbgMsg("ƒStatusHandlerƒ", 2)
	end
	func_time["StatusHandler"].ST = os.time()
	local busy = 0
	local tmp = 0
	if Game.Player.WellFed then
		wellfed = true
		UpdateHunger(2.345)
	else
		wellfed = nil
		UpdateHunger(-0.234)
	end
	--[[if IsSprinting and IsMoving then
		CheckSprint(0.37)
	end
	if IsPeloton and IsMoving then
		CheckPeloton(0.29)
	end]]--
	if IsMedicated then
		AethericBuffer = true
	else
		AethericBuffer = nil
	end
	if IsMoving then
		--MovingEffects(6.1)
		busy = busy + 1
	end
	if IsCrafting then
		busy = busy + 1
	end
	if InCombat then
		busy = busy + 3
	end
	if IsEmoting then
		busy = busy + 1
	end
	if IsFlying or IsJumping or IsFishing or IsPerforming or IsInCutscene or IsTrading or IsGathering then
		busy = busy + 1
	end
	
	if AtBell then
		busy = busy + 2
	end
	--if IsPorting then
		--Porting(0.77)
	--end
	if IsCasting then
		CastingEffects()
		busy = busy + 1
	end
	if busy > 0 then
		idleTime = idleTime - busy
		if idleTime < 0 then
			idleTime = 0
		end
		IsBusy = true
	else
		IsBusy = nil
		idleTime = idleTime + 1
		RestEffects()
	end
	if wellfed then
		busy = busy * 0.61
	end
	
	EmoGyre("hungry", busy)
	EmoGyre("sleepy", busy)
	EmoGyre("grungy", busy * 0.23)
	EmoGyre("responsible", busy * 0.77)
	EmoGyre("bored", busy * -2.33)
	if emoState.dazed > 37 then
		Leech("focused", "dazed", 0.0167, -1)
	end
	--Leech("focused", "dazed", 0.67)
	--currentGil = Game.Player.GetGil()
	CD[playerName]["playerGil"] = currentGil
	if lastGil ~= currentGil then
		--gilBuff = tonumber(CD[playerName]["playerGilBuff"])
		lastTransaction = currentGil - lastGil
		gilBuff = gilBuff + lastTransaction
		lastGil = currentGil
	end
	GilEffects()
	
	if emoState.sad > 37 then
		Leech("happy", "sad", 0.0077, -1)
	end
	
	if IsDead then
		DeathEffects()
	end
	if InCombat then
		tmp = (os.time() - lastCombatCheck)
		if lastCombatCheck > 0 and tmp < 11 then
			combatTime = combatTime + tmp
		else
			combatTime = combatTime + 1.37
		end
		lastCombatCheck = os.time()
		--dbgMsg("ƒStatusHandlerƒ InCombat :: " .. tostring(combatTime), 1)
	end
	if IsSwimming or IsDiving then
		EmoGyre("aetheric", -1.39)
		EmoGyre("refreshed", 27.77)
		EmoGyre("grungy", -17.77)
		EmoGyre("wet", 2.77)
	else
		EmoGyre("refreshed", -1.11)
	end
	if emoState.grungy > 17 then
		Leech("refreshed", "grungy", 0.023, -0.67)
		Leech("responsible", "grungy", 0.017, 0.31)
	end
	
	if playerTraits.vixen then
		Dissolve("hot", "cold", 0.969 + emoState.hot * 0.169)
	elseif playerTraits.aetheric then
		--dbgMsg(":StatusHandler: Dissolve hot/cold :: ", 1)
		if emoState.hot >= 7 and reduce(emoState.hot,3) == reduce(emoState.cold,3) then
			EmoGyre("aetheric", emoState.hot * 2)
			EmoGyre("cold", emoState.cold * 0.77)
			Moodle("Aetheric Dissipation", "apply", "self", "buffs", "default")
		else
			Dissolve("hot", "cold", 1.111)
		end
	elseif playerTraits.spriggan then
		if emoState.hot >= 7 and diff(emoState.hot, emoState.cold) < 0.77 then
			EmoGyre("energized", emoState.hot * -1.77)
			EmoGyre("hot", emoState.hot * -0.77)
			EmoGyre("cold", emoState.cold * -0.44)
			Moodle("Aetheric Dissipation", "apply", "self", "buffs", "default")
		else
			Dissolve("hot", "cold", 1.477)
		end
	else
		Dissolve("hot", "cold", 0.999)
	end
	
	
	GyreCheck()
	
	func_time["StatusHandler"].END = os.time()
	func_track("StatusHandler")
end

function UpdateFlags()
	if filterLog["2"] then
		dbgMsg("ƒUpdateFlagsƒ", 2)
	end
	func_time["UpdateFlags"].ST = os.time()
	dbgMsg("FlagsUpdate :: " .. tostring(args), 31)
	
	if action == "loading" then
		return
	end
	
	IsCrafting = Game.Player.Crafting
	InCombat = Game.Player.InCombat
	IsMounted = Game.Player.Mounted
	IsFlying = Game.Player.Flying
	IsJumping = Game.Player.Jumping
	IsSwimming = Game.Player.Swimming
	IsDiving = Game.Player.Diving
	IsGathering = Game.Player.Gathering
	IsFishing = Game.Player.Fishing
	IsPerforming = Game.Player.Performing
	IsCasting = Game.Player.Casting
	IsInCutscene = Game.Player.InCutscene
	IsTrading = Game.Player.Trading
	IsSitting = Game.Player.Sitting
	IsEmoting = Game.Player.Emoting
	IsCarryingObject = Game.Player.CarryingObject
	--LoggingOut = Game.Player.LoggingOut
	--PilotingMech =  Game.Player.PilotingMech
	IsEditingPortrait = Game.Player.EditingPortrait
	IsAfk = Game.Player.IsAfk
	AtBell = Game.Player.AtBell
	BetweenAreas = Game.Player.BetweenAreas
	BetweenAreas51 = Game.Player.BetweenAreas51
	
	Occupied = Game.Player.Occupied or Game.Player.OccupiedInCutSceneEvent or Game.Player.OccupiedInQuestEvent or
				Game.Player.OccupiedInEvent or Game.Player.Occupied30 or Game.Player.Occupied33 or
				Game.Player.Occupied38 or Game.Player.Occupied39
	
	--OccupiedInCutSceneEvent = Game.Player.OccupiedInCutSceneEvent
	--OccupiedInQuestEvent = Game.Player.OccupiedInQuestEvent
	--OccupiedInEvent = Game.Player.OccupiedInEvent
	--Occupied30 = Game.Player.Occupied30
	--Occupied33 = Game.Player.Occupied33
	--Occupied38 = Game.Player.Occupied38
	--Occupied39 = Game.Player.Occupied39
	
	InDuty = Game.Player.InDuty
	UsingFashionAccessory = Game.Player.UsingFashionAccessory
	WeaponDrawn = Game.Player.WeaponDrawn
	IsMoving = Game.Player.Moving
	IsAlive = Game.Player.Entity.Alive
	IsSprinting = Game.Player.HasStatus("Sprint")
	HasMoonZoom = Game.Player.HasStatus("Stellar Sprint")
	IsJogging = Game.Player.HasStatus("Jog")
	IsPeloton = Game.Player.HasStatus("Peloton")
	IsMedicated = Game.Player.HasStatus("Medicated")

	IsDead = not IsAlive
	currentGil = Game.Player.GetGil()
		
	lastFlagCall = os.time()
	
	func_time["UpdateFlags"].END = lastFlagCall
	func_track("UpdateFlags")
end

function CollisionTracker(tbl)
	if filterLog["2"] then
		dbgMsg("ƒCollisionTrackerƒ", 2)
	end
	func_time["CollisionTracker"].ST = os.time()
	local cnt = -1
	for i = 1, #tbl do
		if tbl[i] == math.floor(tbl[i]) then
			cnt = cnt + 1
		end
	end
	if cnt == -1 then
		idles = idles + 1
	elseif cnt > 0 then
		collisions = collisions + cnt
	end
	CD[playerName].updCnt = updCnt
	CD[playerName].idles = idles
	CD[playerName].collisions = collisions
	func_time["CollisionTracker"].END = os.time()
	func_track("CollisionTracker")
end

function UpdateEmoting(is)
	dbgMsg(".UpdateEmoting.", 2)
	func_time["UpdateEmoting"].ST = os.time()
	if is == "true" then
		IsEmoting = true
		dbgMsg("Is Emoting? :: " .. is .. ".", 2)
	else
		IsEmoting = nil
		dbgMsg("Is Emoting? :: " .. is .. ".", 2)
	end
	func_time["UpdateEmoting"].END = os.time()
	func_track("UpdateEmoting")
end

function RunSndScript(script)
	if filterLog["2"] then
		dbgMsg("ƒRunSndScriptƒ", 2)
	end
	Game.SendChat("/snd run " .. script)
end

function SelfCare()
	if safe or pause then
		return
	end
	local r
	local role = GetRole()
	if playerTraits.aetheric then
		--dbgMsg("Self Care :: aetheric? hungry :: [" .. tostring(emoState.hungry) .. "] ::- rnd: :: " .. tostring(IsMedicated) .. ".", 1)
		if emoState.aetheric > 1111 then
			dbgMsg("Self Care :: aetheric :: [" .. tostring(emoState.aetheric) .. "].", 1)

			if not IsMedicated then
				dbgMsg("Self Care :: aetheric :: elixir",1)
				EatFood("elixir")
			elseif emoState.energized < 111 and IsMedicated and not wellfed and (role == "crafter" or role == "gatherer") then
				EatFood("meal")
			elseif emoState.energized < 111 and IsMedicated and not wellfed then
				EatFood("entree")
			elseif emoState.hungry > 777 and not wellfed then
				EatFood("meal")
			elseif emoState.energized < 111 and not tokenStack.GEN then
				DoRandom("tea", "from being low on energy") -- 
			elseif emoState.energized < 111 and not tokenStack.GEN.caffeinated then
				DoRandom("tea", "from being low on energy") -- 
			elseif not wellfed then
				EatFood("entree")
			end
		elseif emoState.aetheric < 111 and IsMedicated and role ~= "crafter" then
			Game.SendChat("/statusoff Medicated")
		elseif emoState.energized < 111 and IsMedicated and not wellfed and (role == "crafter" or role == "gatherer") then
				EatFood("meal")
		elseif emoState.energized < 111 and not tokenStack.GEN then
			DoRandom("tea", "from being low on energy") -- 
		elseif emoState.energized < 111 and not tokenStack.GEN.caffeinated then
			DoRandom("tea", "from being low on energy") -- 
		elseif emoState.energized < 111 and not wellfed then
			EatFood("entree")
		elseif emoState.hungry > 1777 and not wellfed then
			EatFood("meal")
		elseif emoState.hungry > 777 and not wellfed then
			EatFood("entree")
		end
	else
		if not wellfed then
			if emoState.hungry > 1111 then
				r = math.random(1,3333)
				dbgMsg("Self Care :: eat meal? hungry :: [" .. tostring(emoState.hungry) .. "] ::- rnd: :: " .. tostring(r) .. ".", 1)
				if r < emoState.hungry then
					EatFood("meal")
				end
			elseif emoState.hungry > 777 then
				r = math.random(1,3333)
				dbgMsg("Self Care :: eat entree? hungry :: [" .. tostring(emoState.hungry) .. "] ::- rnd: :: " .. tostring(r) .. ".", 1)
				if r < emoState.hungry then
					EatFood("entree")
				end
			end
		end
	end
end

roleKey = {
	["melee"] = "IsMeleeDPS",
	["ranged"] = "IsRangedDPS",
	["caster"] = "IsMagicDPS",
	["healer"] = "IsHealer",
	["tank"] = "IsTank",
	["crafter"] = "IsCrafter",
	["gatherer"] = "IsGatherer",
}

function GetRole()
	if Game.Player.Entity.Job.IsMeleeDPS then
		return "melee"
	elseif Game.Player.Entity.Job.IsRangedDPS then
		return "ranged"
	elseif Game.Player.Entity.Job.IsHealer then
		return "healer"
	elseif Game.Player.Entity.Job.IsMagicDPS then
		return "caster"
	elseif Game.Player.Entity.Job.IsTank then
		return "tank"
	elseif Game.Player.Entity.Job.IsGatherer then
		return "gatherer"
	elseif Game.Player.Entity.Job.IsCrafter then
		return "crafter"
	else
		return "unknown"
	end
end

function EatFood(what)
	if filterLog["2"] then
		dbgMsg("ƒEatFoodƒ", 2)
	end
	func_time["EatFood"].ST = os.time()
	
	local weight = 0
	local slct
	local role
	local try = 3
	if not what or what == "" then
		what = "meal"
	end
	if what == "entree" then
		if lastEntreeTime then
			if favoriteEntree ~= "" and (os.time() - lastEntreeTime) > 180 then
				if entrees[favoriteEntree] then
					slct = favoriteEntree
				end
			end
			dbgMsg("ƒEatFoodƒ :: Favorite entree? :: " .. tostring(slct), 1)
			if not slct then
				lastEntreeTime = lastEntreeTime - 90
				return
			end
		end
		if not slct then
			repeat
				for k,v in pairs(entrees) do
					if math.random(1,100) > 37 then
						slct = k
						break
					end
				end
				if lastEntree and lastEntreeTime then
					if k == lastEntree and (os.time() - lastEntreeTime) < 360 then
						slct = nil
					end
				end
				try = try - 1
				if try < 1 then
					if not slct then
						slct = "fail"
						dbgMsg("ƒEatFoodƒ :: Unable to find a suitable entree..", 1)
					end
				end
			until slct
		end
		if slct and slct ~= "fail" then
			lastEntree = slct
			lastEntreeTime = os.time()
			UseItem(entrees[slct].itemId, entrees[slct].allowHQ)
		end
	elseif what == "elixir" then
		if role == "crafter" then
			UseItem(44169, true)
		else
			UseItem(27960, true)
		end
		--UseItem(entrees[slct].itemId, entrees[slct].allowHQ)
	elseif what == "meal" then
		role = GetRole()
		repeat
			for k,v in pairs(meals) do
				if v[role] then
					if v[role] > weight then
						weight = v[role]
						slct = k
					end
				end
			end
			if lastMeal and lastMealTime then
				if k == lastMeal and (os.time() - lastMealTime) < 360 then
					slct = nil
				end
			end
			if not slct and favoriteMeal then
				slct = favoriteMeal
			end
			try = try - 1
			if try < 1 then
				if not slct then
					slct = "fail"
					dbgMsg("ƒEatFoodƒ :: Unable to find a suitable meal..", 1)
				end
			end
		until slct
		if slct and slct ~= "fail" and slct ~= "" then
			dbgMsg("Eat Food :: " .. tostring(slct), 1)
			lastMeal = slct
			lastMealTime = os.time()
			UseItem(meals[slct].itemId, meals[slct].allowHQ)
		end
	
	elseif what and what ~= "" then
		if meals[what] then
			if meals[what].itemId then
				lastMeal = meals[what].itemId
				lastMealTime = os.time()
				UseItem(meals[what].itemId, meals[what].allowHQ)
			end
		end
	elseif not wellfed then
		
		dbgMsg("Eat Food.", 1)
		
	end
	func_time["EatFood"].END = os.time()
	func_track("EatFood")
end

function MovingEffects(amt)
	if filterLog["2"] then
		dbgMsg("MovingEffects", 2)
	end
	local weather = Game.Weather.Name
	
	local map = Game.Player.MapZone
	local humidity = "normal"
	local otf = reduce(OutfitTempFactor() * 0.31, 3)
	local wcAdj, huAdj = 0.244, 0.377 - otf * 0.13
	local wc,hu = 0.27,0.21
	local tmp, x, y, WC
	local tf = 0
	--[[if IsSprinting then
		amt = amt * 1.7
	end
	if IsPeloton then
		amt = amt * 1.3
	end
	if IsJogging then
		amt = amt * 1.1
	end
	
	if HasMoonZoom then
		amt = amt * 2.7
	end]]--
	
	
	if zones[map] then
		if zones[map].climate then
			if zones[map].climate.type then
				if climates[zones[map].climate.type] then
					humidity = climates[zones[map].climate.type]
					tf = validTemps[zones[map].climate.temp]
				end
			end
		end
	end
	--
	--dbgMsg("MovingEffects :: windchill :: " .. tostring(amt * 0.67), 1)
	if humidity == "high" then
		hu = 0.11
		wc = 0.11
	elseif humidity == "wet" then
		hu = 0.07
		wc = 0.17
		--dbgMsg("MovingEffects :: windchill :: " .. tostring(amt * 0.17), 1)
		--EmoGyre("wet", amt * 0.17)
		--EmoGyre("cold", amt * 0.13)
	elseif humidity == "normal" then
		hu = -0.11
		wc = 0.27
		--EmoGyre("wet", amt * 0.13)
		--EmoGyre("cold", amt * 0.17)
	elseif humidity == "low" then
		hu = -0.23
		wc = 0.33
		--EmoGyre("wet", amt * -0.11)
		--EmoGyre("cold", amt * 0.27)
	elseif humidity == "dry" then
		hu = -0.31
		wc = 0.37
		--EmoGyre("wet", amt * -0.17)
		--EmoGyre("cold", amt * 0.37)
	elseif  humidity == "arid" then
		hu = -0.37
		wc = 0.41
		--EmoGyre("wet", amt * -0.23)
		--EmoGyre("cold", amt * 0.37)
	end
	
	if IsFlying then
		huAdj = huAdj * 1.11
		wcAdj = wcAdj * 1.17
	end
	if playerTraits.vixen then
		if Game.Player.Equipped.Head.GlamName == "Tamamo Headband" then
			wcAdj = wcAdj * 1.69
		end
	end
	
	WC = reduce(amt * wc * wcAdj, 3)
	dbgMsg("MovingEffects :: wind :: " .. tostring(WC), 1)
	tmp = reduce(WC * (1.77 - tf), 3)
	dbgMsg("MovingEffects :: windchill (cold) :: " .. tostring(tmp), 1)
	
	EmoGyre("wet", amt * hu * huAdj)
	EmoGyre("cold", tmp )
	
	y = CD[playerName].outfits[currentOutfit].wetAmt or 0
	if weather == "Rain" then
		x = 1.00 + OutfitTempFactor() * 0.01337
	else
		x = 1.00 - WC * OutfitTempFactor() * 0.0737
		--x = 1.03 - (WC * OutfitTempFactor() * 0.0337)
	end
	y = y * x
	if y < 0 then
		y = 0
	end
	CD[playerName].outfits[currentOutfit].wetAmt = y
	
	dbgMsg("MovingEffects :: windchill outfit drying :: " .. tostring(reduce(x,2)), 1)
	amt = tonumber(amt) * 0.337


	--EmoGyre("cold", amt * 0.41) -- wind chill
	
	if IsMounted then
		amt = amt * 0.17
	end
	if IsFlying then
		amt = amt * 0.37
	end
	 
	EmoGyre("hungry", amt * 1.77)
	EmoGyre("grungy", amt * 6.39)
	--EmoGyre("hungry", amt * 0.71)
	
	if playerRace == "Miqo'te" then
		amt = amt * 1.27
	end
	if playerTraits.aetheric then
		dbgMsg("Moving amt :: " .. tostring(reduce(amt,2)), 3)
		--emoState["aetheric"] = emoState["aetheric"] - amt*2.7
		--EmoGyre("aetheric", amt*-1.1)
		if emoState.aetheric > 333 and emoState.energized > 99 then
			tmp = emoState.hot
			Dissolve("aetheric", "hot", 0.233)
			EmoGyre("energized", (emoState.hot - tmp + amt) * -0.17)
		else
			EmoGyre("hot", amt * 0.339)
		end
		--EmoGyre("hot", amt * 0.66)
		--EmoGyre("energized", amt*-3.7)
		--AetherHandler(amt*-2.7, "aetheric", "CheckPeloton")
		--if emoState["aetheric"] < 0 then
			--emoState["energized"] = emoState["energized"] - emoState["aetheric"] * 2
			--emoState["aetheric"] = 0
		--end
	elseif playerTraits.spriggan then
		dbgMsg("Moving amt :: " .. tostring(reduce(amt,2)), 3)
		
		--AetherHandler((amt * -0.77), "energized", "CheckPeloton")
		EmoGyre("energized", amt * -1.17)
		EmoGyre("hot", amt * 0.44)
	elseif playerTraits.vixen then
		dbgMsg("Moving amt :: " .. tostring(reduce(amt,2)), 3)
		--AetherHandler((amt * -0.77), "energized", "CheckPeloton")
		EmoGyre("energized", amt * -2.69)
		EmoGyre("hot", amt * 1.69)
	else
		EmoGyre("energized", amt*-2.39)
		EmoGyre("hot", amt * 2.77)
		--AetherHandler(amt*-0.9, "energized", "CheckPeloton")
		--emoState["aetheric"] = emoState["aetheric"] + amt*0.9
	end

	--func_time["CheckPeloton"].END = os.time()
	--func_track("CheckPeloton")
end

function GotoGate()
	local map = Game.Player.MapZone
	if not beacons[map] then
		dbgMsg("ƒGotoGateƒ :: No data found for this map..", 1)
		return
	end
	if not currentGate then
		dbgMsg("ƒGotoGateƒ :: Current gate is unknown..", 1)
		return
	end
	if not beacons[map].beacon then
		dbgMsg("ƒGotoGateƒ :: No waypoints found for this map....", 1)
		return
	end
	if not beacons[map].beacon[currentGate] then
		dbgMsg("ƒGotoGateƒ :: No waypoint named [" .. currentGate .. "] was found for this map..", 1)
		return
	end
	MoveToBeacon(currentGate)
	--local dest = beacons[map].beacon[currentGate]
	--Game.SendChat("/vnavmesh moveto " .. tostring(dest.PosX) .. " " .. tostring(dest.PosZ) .. " " .. tostring(dest.PosY))
end

function DeathEffects()
	tmp = (os.time() - lastNapCheck)
	if lastNapCheck > 0 and tmp < 11 then
		napTime = napTime + tmp
	else
		EmoGyre("grungy", 3.37)
		EmoGyre("cold", 3.37)
		EmoGyre("sleepy", -7.37)
		napTime = napTime + 1.37
	end
	floorinIt = napTime
	onTheFloor = napTime
	lastNapCheck = os.time()
	dbgMsg("ƒStatusHandlerƒ Dead :: " .. tostring(onTheFloor), 1)
end

function UpdateHunger(amt)
	if filterLog["2"] then
		dbgMsg("ƒUpdateHungerƒ", 2)
	end
	
	func_time["UpdateHunger"].ST = os.time()
	if amt then
		amt = tonumber(amt) * 4.2
		if amt > 23 then
			amt = 13
		end
		if playerTraits.spriggan then
			amt = amt * 0.77
		elseif playerTraits.aetheric then
			amt = amt * 0.67
		elseif playerTraits.vixen then
			amt = amt * 0.39
		elseif playerTraits.muggle then
			amt = amt * 0.27
		else
			amt = amt * 0.37
		end
		
		EmoGyre("hungry", -amt)
		--EmoGyre("energized", amt)
		if emoState.sleepy > 33 then
			Leech("energized","sleepy", 0.037, -1.9)
		end
		if IsMedicated then
			if playerTraits.aetheric then
				EmoGyre("energized", 0.39)
			elseif playerTraits.spriggan then
				EmoGyre("mischievous", 0.77)
			elseif playerTraits.muggle then
				EmoGyre("scared", 0.27)
			else
				EmoGyre("happy", 0.33)
			end
			EmoGyre("dazed", 0.33)
		end
		--Convert("energized", "sleepy", -1)
		--EmoGyre("sleepy", -amt)
		
		if wellfed then
			if playerRace == "Miqo'te" then
				amt = amt * 0.67
			end
			if playerTraits.aetheric then
				if AethericBuffer then
					Relax("aetheric", "energized", 9.11)
				else
					EmoGyre("energized", amt * 0.67)
					--EmoGyre("aetheric", amt * 0.77)
					Convert("aetheric", "energized", 7.77)
				end
				--Reduction("aetheric", "energized", 0.31)
			elseif playerTraits.muggle then
				EmoGyre("energized", amt * 0.71)
			else
				EmoGyre("energized", amt * 0.77)
				--Relax("aetheric", "energized", 13)
			end
			if playerRace == "Miqo'te" then
				
			end
		end
	end
	func_time["UpdateHunger"].END = os.time()
	func_track("UpdateHunger")
end

function CheckElixir(val)
	if filterLog["2"] then
		dbgMsg("ƒCheckElixirƒ", 2)
	end
	func_time["CheckElixir"].ST = os.time()
	val = tonumber(val)
	if val == 1 then
		AethericBuffer = true
	else
		AethericBuffer = nil
	end
	func_time["CheckElixir"].END = os.time()
	func_track("CheckElixir")
end

function Porting(args)
	if filterLog["2"] then
		dbgMsg("ƒPortingƒ", 2)
	end
	func_time["Porting"].ST = os.time()
	dbgMsg("PortingCall " .. tostring(args), 1)
	lastPorted = os.time()
	local adj = args or 0
	
	adj = adj * 0.037
	if AethericBuffer then
		adj = adj * 0.67
	end
	if TraitCheck("aetheric") then
		--emoState["aetheric"] = emoState["aetheric"] + adj*6.39
		EmoGyre("aetheric", adj*6.7)
		--AetherHandler(adj*2.34, "aetheric", "Porting")
	elseif TraitCheck("spriggan") then
		EmoGyre("hungry", adj*1.77)
		EmoGyre("energized", adj-0.77)
		EmoGyre("aetheric", adj*1.11)
		if emoState.energized < 11 then
			EmoGyre("dazed", adj*1.69)
		end
		--emoState["focused"] = emoState["focused"] + adj*1.11
	elseif TraitCheck("vixen") then
		EmoGyre("energized", adj*1.3)
		EmoGyre("aetheric", adj*-3.7)
		if emoState.aetheric < 17 then
			EmoGyre("sleepy", adj*1.69)
		end
	else
		--emoState["aetheric"] = emoState["aetheric"] - adj*1.33
		EmoGyre("aetheric", adj*-1.39)
		--AetherHandler(adj*-1.39, "aetheric", "Porting")
		if emoState["aetheric"] < 13 then
			EmoGyre("dazed", adj*1.39)
			EmoGyre("energized", adj*-0.69)
			if emoState.energized < 11 then
				EmoGyre("sleepy", adj*0.66)
			end
		end
	end
	IsPorting = nil
	func_time["Porting"].END = os.time()
	func_track("Porting")
end

function UpdatePos()
	--dbgMsg("Distance Traveled  " .. tostring(DisT) .. ".", 1)
	local disA, disB, disC, disD
	if not LsC then
		LsC = os.time()
	end
	if not Lp then
		Lp = {
			["PosX"] = Game.Player.PosX,
			["PosY"] = Game.Player.PosY,
			["PosZ"] = Game.Player.PosZ,
		}
	end
	if (not Lp.PosX or not Game.Player.PosX) then
		if not IsPorting then
			dbgMsg("UpdatePos: Porting?", 1)
		end
		return
	end
	disA = (Lp.PosX - Game.Player.PosX)
	disB = (Lp.PosY - Game.Player.PosY)
	disC = (Lp.PosZ - Game.Player.PosZ)
	disD = math.sqrt(disA^2 + disB^2 + disC^2)
	
	local spd = disD * (os.time() - LsC) / 6
	spd = math.floor(spd * 777)/10
	
	
	Lp.PosX = Game.Player.PosX
	Lp.PosY = Game.Player.PosY
	Lp.PosZ = Game.Player.PosZ
	LsC = os.time()
	
	
	DisT = DisT + disD -- Fulms
	--1 Ilm (Im) = 2.54 cm
	--1 Fulm (Fm) = 12 Ilm = 30.48 cm
	--1 Yalm (Ym) = 3 Fulm = 0.9144 meters
	--1 Malm (Mm) = 1,760 Yalm = 1,609 meters
	
	if disD > 17 then
		dbgMsg("disD: Out of Expected Range, Porting?" .. disD .. ".", 1)
		Porting(disD)
		return
	end
	
	if (os.time() - lastDistUpdate) > 3.1415 then
		dbgMsg("disD: " .. disD .. ".", 3)
		if disD > 0 and disD < 7.77 then
			--dbgMsg("spd: " .. spd .. " mph.", 1)
			--dbgMsg("DisT: " .. tostring(DisT) .. " mph.", 1)
			--DisT = math.floor((DisT + disD) * 1000)/1000
			--DisT = DisT + disD
			--dbgMsg("DisT: " .. tostring(DisT) .. " mph.", 1)
			--Script.Storage.DT[playerName] = DisT
			--Script.SaveStorage()
			MovingEffects(spd * 0.37)
			if spd ~= lastSpd then
				dbgMsg("spd: " .. spd .. " Malms/Hour.", 3)
			end
		end
		lastDistUpdate = os.time()
	end
	lastSpd = spd

	
end

function CastingEffects()
	dbgMsg(".CastingEffects.", 2)
	func_time["CastingEffects"].ST = os.time()
	if filterLog["2"] then
		dbgMsg("ƒCastingEffectsƒ", 2)
	end
	func_time["CastingEffects"].ST = os.time()
	if CD[playerName].traits.aetheric then
		--dbgMsg(".FlagsHandler.", 2)
		--emoState["aetheric"] = emoState["aetheric"] - 0.169*castingX
		AetherHandler(-0.0169*(castingX/3), "aetheric", "CastingEffects")
	elseif CD[playerName].traits.spriggan then
		emoState["focused"] = emoState["focused"] + 0.111*castingX
		--AetherHandler(-0.169*castingX, "aetheric")
	elseif CD[playerName].traits.muggle then
		AetherHandler(0.144, "aetheric", "CastingEffects")
	else
		AetherHandler(0.031*castingX, "aetheric", "CastingEffects")
	end
	if emoState["aetheric"] < 0 then
		emoState["dazed"] = emoState["dazed"] + emoState["aetheric"]
		emoState["energized"] = emoState["energized"] + emoState["aetheric"] * 2
		if emoState["energized"] < 0 then
			emoState["sleepy"] = emoState["sleepy"] + emoState["energized"] * 2
			emoState["sleepy"] = 0
		end
		emoState["aetheric"] = 0
	end
	func_time["CastingEffects"].END = os.time()
	func_track("CastingEffects")
end

function Poke(ti)
	if not listenChn[Game.Chat.Chn] then
		return
	end
	dbgMsg("ƒPoke~Checkƒ " .. tostring(Game.Chat.Chn), 3)
	if not chatHooking then
		return
	elseif not lastPoke and not loaded and (action ~= "loading") then
		lastPoke = os.time()
		doLoad()
		return
	elseif tonumber(Game.Chat.Chn) == "8873" or tostring(Game.Chat.Chn) == "8746" then
		return
	end
	if diff(Game.Chat.Stamp,lastChatUpdate) < 0.01 and Game.Chat.Msg == lastChatMsg then
		lastPoke = os.time()
		return
	end
	
	stackIdx = #chatStack + 1
	if stackIdx < 11 then
		chatStack[stackIdx] = {}
		chatStack[stackIdx].stamp = Game.Chat.Stamp
		chatStack[stackIdx].msg = Game.Chat.Msg
		chatStack[stackIdx].chn = Game.Chat.Chn
		chatStack[stackIdx].chn:gsub("ls", "l")
		chatStack[stackIdx].sender = Game.Chat.Sender
		lastChatMsg = Game.Chat.Msg
		lastChatUpdate = Game.Chat.Stamp
	end
	lastPoke = os.time()
	--Update()
end



Script.QueueDelay(3500)
Script.QueueAction(doLoad)

--	^								^	--
--	^		^^^ CORE ^^^ 			^	--
--	^								^	--

function Find(what)
	local e = Game.FindNearestEntity(what)
	if e then
		dbgMsg("ƒFindƒ - what : e :: " .. tostring(e), 1)
		if e.Name then
			return e.Name
		end
	end
	return what .. " wasn't found."
end

local function onInvoke(textline)
	if filterLog["2"] then
		dbgMsg("ƒonInvokeƒ", 2)
	end
	func_time["onInvoke"].ST = os.time()
	local cmd, args
	local dat, e = string.find(textline, "|^|")
	if dat then
		cmd = string.sub(textline, 1, dat - 1) 
		args = string.gsub(textline, cmd .. "|^|", "", 1)
	else
		cmd, args = shiftWord(textline, string.lower)
	end
	
	if not loaded and Game.Player.Loaded and action ~= "loading" then
		doLoad()
	elseif playerName ~= Game.Player.Name and type(playerName) == "string" then
		CDUpdater()
		action = "loading"
		Script.ClearQueue()
		Script.QueueAction(doLoad)
	end
	--local e, z = shiftWord(args, string.lower)
	
	--Game.SendChat("/e sent: ".. tostring(args) .. ".")
	if cmd == "kill" or cmd == "off" or cmd == "pause" then
		action = "sleep"
		rnd = nil
		Script.ClearQueue()
		Update()
		dbgMsg("Emote queue stopped!")
		--
	elseif cmd == "poke" then
		Poke(args)
	elseif emote[cmd] then
		DoRandom(cmd)
	elseif cmd == "clear" then
		
	elseif cmd == "routine" then
		CallRoutine(args)
	elseif cmd == "start" then
		action = "idle"
		Update()
	elseif cmd == "load" then
		action = "loading"
		Script.ClearQueue()
		Script.QueueAction(doLoad)
	elseif cmd == "name" or cmd == "nick" or cmd == "nickname" then
		if #args > 0 then
			nickName = args
			CD[playerName]["nickName"] = args
			CDUpdater()
		end
	elseif cmd == "set" then
		EmotionSet(args)
	elseif cmd == "get" then
		EmotionGet(args)
	elseif cmd == "gg" or cmd == "giggle" or cmd == "giggle gas" or cmd == "gigglegas" then
		actDo = 0
		GetGiggly(args)
	elseif cmd == "sp" then
		doSpecial(args)
	elseif cmd == "jacks" or cmd == "jumpingjacks" or cmd == "jumpinjacks" or cmd == "jjs" or cmd == "jj" then
		doSpecial("jumpingjacks")
	elseif cmd == "info" then
		dumpInfo(args)
	elseif cmd == "version" or cmd == "ver" then
		dbgMsg("Current Version: " .. emoVer, 0)
	elseif cmd == "map" then
		dbgMsg("Current Zone: [".. Game.Player.MapZone .. "].")
	elseif cmd == "gate" then
		GotoGate()
	elseif cmd == "flag" then
		Game.SendChat("/vnav moveflag")
	elseif cmd == "flyflag" then
		Game.SendChat("/vnav flyflag")
	elseif cmd == "stop" then
		Game.SendChat("/vnav stop")
	elseif cmd == "vnav" then
		Game.SendChat("/e /vnavmesh moveto " .. tostring(Game.Player.Entity.PosX) .. " " .. tostring(Game.Player.Entity.PosZ) .. " " .. tostring(Game.Player.Entity.PosY))
		Script.Clipboard = "/vnavmesh moveto " .. tostring(Game.Player.Entity.PosX) .. " " .. tostring(Game.Player.Entity.PosZ) .. " " .. tostring(Game.Player.Entity.PosY)
	elseif cmd == "coords" then
		Game.SendChat("/e [\"XPos\"] = " .. tostring(Game.Player.Entity.PosX) .. ",")
		Game.SendChat("/e [\"YPos\"] = " .. tostring(Game.Player.Entity.PosY) .. ",")
		Game.SendChat("/e [\"ZPos\"] = " .. tostring(Game.Player.Entity.PosZ) .. ",")
		--dbgMsg("YPos: [".. tostring(Game.Player.Entity.MapY) .. "].")
		--dbgMsg("ZPos: [".. tostring(Game.Player.Entity.MapZ) .. "].")
	elseif cmd == "tarcoords" then
		Game.SendChat("/e [\"XPos\"] = " .. tostring(Game.Player.Target.PosX) .. ",")
		Game.SendChat("/e [\"YPos\"] = " .. tostring(Game.Player.Target.PosY) .. ",")
		Game.SendChat("/e [\"ZPos\"] = " .. tostring(Game.Player.Target.PosZ) .. ",")
	--elseif cmd == "afk" then -- Deprecated 7.0.1 as Game.Player.IsAfk replaces the need
		--AFK = true
		--Game.SendChat("/afk")
	elseif cmd == "rnd" or cmd == "random" then
		if rnd then
			rnd = nil
			Game.SendChat("/e random emotes OFF.")
		else
			rnd = true
			Game.SendChat("/e random emotes ON.")
			--DoRandom(args)
		end
	elseif cmd == "access" or cmd == "check" then
		CheckEmoteAccess(args)
	elseif cmd == "census" then
		Census()
	elseif cmd == "add" then
		AddTrait(args)
	elseif cmd == "remove" then
		RemoveTrait(args)
	elseif cmd == "list" then
		ListTraits()
	elseif cmd == "method" then
		method = args
		Game.SendChat("/e wait method set to [" .. method .. "].")
	elseif cmd == "test" then
		TestEmote(args)
	elseif cmd == "dbg" or cmd == "debug" then
		SetDBG(args)
	elseif cmd == "dump" then
		Dump(args)
	elseif cmd == "track" then
		TrackEmotion(args)
	elseif cmd == "outfitsave" then --used by SND Script
		OutfitSave(args)
	elseif cmd == "outfit" then
		OutfitHandler(args)
	elseif cmd == "dress" and (args == "" or #args > 1) then
		OutfitLoad(args)
	elseif cmd == "dress" and #args == 1 then
		OutfitHandler("load " .. args)
	elseif cmd == "puton" then
		OutfitHandler("puton " .. args)
	elseif cmd == "takeoff" then
		OutfitHandler("takeoff " .. args)
	elseif cmd == "time" then
		local tmp = Game.EorzeanTime
		Game.SendChat("/e Time:  ".. tostring(tmp.Hour) .. ".")
	elseif cmd == "beacon" or cmd == "goto" or cmd == "go" or cmd == "moveto" or cmd == "move" then
		if args == "afk" then
			CallRoutine("afk")
		else
			MoveToBeacon(args)
		end
	elseif cmd == "eat" then
		EatFood(args)
	elseif cmd == "tardis" then
		tardis()
	elseif cmd == "factor" or cmd == "factors" then
		args = tonumber(args)
		args = math.floor(args)
		local s = tostring(args) .. " = " .. table_to_string(factors(args), "*")
		Game.SendChat(s)
	elseif cmd == "clip" then
		ClipClip(args)
	elseif cmd == "dist" then
		GetBeaconDistance(args)
	elseif cmd == "bitwise" then
		local val1, val2 = shiftWord(args, tonumber)
		local tmp = bit32.extract(val1, val2)
		Game.SendChat("/e bit32: " .. tostring(tmp))
	elseif cmd == "flags" then
		UpdateFlags(args)
	--elseif cmd == "statuschecks" then -deprecated
		--UpdateStats(args)
	elseif cmd == "flagcheck" then
		local n = tonumber(args)
		Game.SendChat("/e flag: " .. args .. " :: " .. tostring(flags[n]))
	elseif cmd == "quirk" then
		QuirkSet(args)
	elseif cmd == "savelog" then
		SaveLog()
	elseif cmd == "backup" then
		Backup(args)
	elseif cmd == "restore" then
		Restore(args)
	--elseif cmd == "validate" then
		--CD["global"].valid = true
		--Script.Storage.global.valid = true
		--Backup()
	elseif cmd == "debuff" then
		RemoveBuff(args)
	--elseif cmd == "chatalert" then
		--ChatHandler(args)
	elseif cmd == "chatpoke" then
		dbgMsg("chatpoke: " .. args,1)
		Poke(args)
	elseif cmd == "gyre" then
		dbgGyre(args) --∮ 
	elseif cmd == "juju" then
		JujuHoodoo("juju " .. args, "e")
	elseif cmd == "nav" then
		Game.SendChat("/vnav stop")
	elseif cmd == "profiler" then
		local filter, mt = shiftWord(args, string.lower)
		profiler(filter, mt)
	elseif cmd == "phrash" then
		JujuHoodoo("juju phrasher " .. args)
	elseif cmd == "rotate" then
		if tonumber(args) then
			doRotate = tonumber(args)
			if doRotate == 0 then
				doRotate = nil
			end
		else
			doRotate = nil
		end
	elseif cmd == "setrot" then
		if tonumber(args) then
			Game.Player.SetRot(tonumber(args))
		end
	elseif cmd == "namesoff" then
		Game.SendChat("/nameplatedisp all 4")
	elseif cmd == "nameson" then
		Game.SendChat("/nameplatedisp all 1")
		--DBG = -DBG
		--if tonumber(args) then
			--DBG = tonumber(args)
		--end
		--if DBG > 1 then
			--Game.SendChat("/e EmoBot: Debugging ".. DBG .. " on.")
		--else
			--Game.SendChat("/e EmoBot: Debugging off.")
		--end
	end
	func_time["onInvoke"].END = os.time()
	func_track("onInvoke")
end

Script(onInvoke)


--[[
--TODO
Commands:

All commands must be preceded with "/.emo" or "/emo" ;if you have set a command alias in Simple Tweaks for it.
	
	kill; stop; off; pause -- Shuts EmoBot down, puts it into sleep mode, can still receive commands however.
	(To fully shut it down the main SND script should be stopped as well)
	•ex: /.emo kill or /emo kill
	
	<any valid emote> -- Will have EmoBot handle the emote
	

]]---