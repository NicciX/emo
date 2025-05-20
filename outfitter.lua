--Outfit Stuff

local validTemps = {
	["arctic"] = "arctic",
	["cold"] = "cold", -- ☃▽
	["cool"] = "cool", -- ☆▼
	["warm"] = "warm", -- ○ 
	["normal"] = "normal", -- ★    °
	["def"] = "normal", -- ★ ≡
	["hot"] = "hot", -- ●▲
	["wet"] = "wet", -- ☂ ☁
	["aetheric"] = "aetheric",  --₆☀∮
	["space"] = "space",
	["hell"] = "hellworld", -- ☀
	["naked"] = "scorchin",
	["scorchin"] = "scorchin",
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

local outfitTempEffects = {
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

local validTypes =  {
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
	["pants"] = "legs", --6
	["skirt"] = "legs",
	["shorts"] = "legs",
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

local SNDRemoveCall = { --Deprecate
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

function SNDEquipHandler(args) -- deprecate
	if args == "Fail!" then
		dbgMsg("Failed to equip anything," .. slot, 0)
		dbgMsg("Please try again after resolving the issue...", 0)
	else
		dbgMsg("Item successfully equiped!", 0)
	end
end

function TakeoffRandom(list)
	dbgMsg(".OutfitLoad.", 2)
	dbgMsg("TakeoffRandom: :: ", 1)
	local r
	if type(list) == "table" then
		r = math.floor(math.random(1, #list))
		if list[r] then
			if validSlotId[list[r]] then
				dbgMsg("TakeoffRandom: :: " .. tostring(list[r]), 1)
				RemoveItem(list[r])
			end
		end
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
		elseif slot == "panties" and currentOutfitSet[slot] == currentOutfitSet.legs then
			currentOutfitSet[slot] = 0
			Game.Player.Equipped.Legs.Remove()
		elseif slot == "bra" and currentOutfitSet[slot] == currentOutfitSet.bra then
			currentOutfitSet[slot] = 0
			Game.Player.Equipped.Body.Remove()
		elseif slot == "nails" and currentOutfitSet[slot] == currentOutfitSet.nails then
			currentOutfitSet[slot] = 0
			Game.Player.Equipped.Hands.Remove()
		elseif slot == "panties" and currentOutfitSet[slot] ~= currentOutfitSet.legs then
			currentOutfitSet[slot] = 0
			dbgMsg("Panties removed for " .. currentOutfit .. " O₀oLaLa.", 0)
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

function UpdateOutfit(co)
	if not co then
		return
	end
	local glam
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
		if glam then
			if not CD[playerName].glams.head[glam] then
				CD[playerName].glams.head[glam] = {}
				CD[playerName].glams.head[glam]["temp"] = "normal"
			end
		end
		--Body
		CD[playerName].outfits[currentOutfit].body = Game.Player.Equipped.Body.Item
		CD[playerName].outfits[currentOutfit].bodyName = Game.Player.Equipped.Body.ItemName
		--CD[playerName].outfits[currentOutfit].bodyGlam = Game.Player.Equipped.Body.GlamName
		CD[playerName].outfits[currentOutfit].bodyDyeA = Game.Player.Equipped.Body.DyeA
		CD[playerName].outfits[currentOutfit].bodyDyeB = Game.Player.Equipped.Body.DyeB
		glam = Game.Player.Equipped.Body.GlamName
		CD[playerName].outfits[currentOutfit].bodyGlam = glam
		if glam then
			if not CD[playerName].glams.body[glam] then
				CD[playerName].glams.body[glam] = {}
				CD[playerName].glams.body[glam]["temp"] = "normal"
			end
		end
		--Hands
		CD[playerName].outfits[currentOutfit].hands = Game.Player.Equipped.Hands.Item
		CD[playerName].outfits[currentOutfit].handsName = Game.Player.Equipped.Hands.ItemName
		--CD[playerName].outfits[currentOutfit].handsGlam = Game.Player.Equipped.Hands.GlamName
		CD[playerName].outfits[currentOutfit].handsDyeA = Game.Player.Equipped.Hands.DyeA
		CD[playerName].outfits[currentOutfit].handsDyeB = Game.Player.Equipped.Hands.DyeB
		glam = Game.Player.Equipped.Hands.GlamName
		CD[playerName].outfits[currentOutfit].handsGlam = glam
		if glam then
			if not CD[playerName].glams.hands[glam] then
				CD[playerName].glams.hands[glam] = {}
				CD[playerName].glams.hands[glam]["temp"] = "normal"
			end
		end
		--Legs
		CD[playerName].outfits[currentOutfit].legs = Game.Player.Equipped.Legs.Item
		CD[playerName].outfits[currentOutfit].legsName = Game.Player.Equipped.Legs.ItemName
		--CD[playerName].outfits[currentOutfit].legsGlam = Game.Player.Equipped.Legs.GlamName
		CD[playerName].outfits[currentOutfit].legsDyeA = Game.Player.Equipped.Legs.DyeA
		CD[playerName].outfits[currentOutfit].legsDyeB = Game.Player.Equipped.Legs.DyeB
		glam = Game.Player.Equipped.Legs.GlamName
		CD[playerName].outfits[currentOutfit].legsGlam = glam
		if glam then
			if not CD[playerName].glams.legs[glam] then
				CD[playerName].glams.legs[glam] = {}
				CD[playerName].glams.legs[glam]["temp"] = "normal"
			end
		end
		--Feet
		CD[playerName].outfits[currentOutfit].feet = Game.Player.Equipped.Feet.Item
		CD[playerName].outfits[currentOutfit].feetName = Game.Player.Equipped.Feet.ItemName
		--CD[playerName].outfits[currentOutfit].feetGlam = Game.Player.Equipped.Feet.GlamName
		CD[playerName].outfits[currentOutfit].feetDyeA = Game.Player.Equipped.Feet.DyeA
		CD[playerName].outfits[currentOutfit].feetDyeB = Game.Player.Equipped.Feet.DyeB
		glam = Game.Player.Equipped.Feet.GlamName
		CD[playerName].outfits[currentOutfit].feetGlam = glam
		if glam then
			if not CD[playerName].glams.feet[glam] then
				CD[playerName].glams.feet[glam] = {}
				CD[playerName].glams.feet[glam]["temp"] = "normal"
			end
		end
		--Ears
		CD[playerName].outfits[currentOutfit].ears = Game.Player.Equipped.Ears.Item
		CD[playerName].outfits[currentOutfit].earsName = Game.Player.Equipped.Ears.ItemName
		--CD[playerName].outfits[currentOutfit].earsGlam = Game.Player.Equipped.Ears.GlamName
		glam = Game.Player.Equipped.Ears.GlamName
		CD[playerName].outfits[currentOutfit].earsGlam = glam
		if glam then
			if not CD[playerName].glams.ears[glam] then
				CD[playerName].glams.ears[glam] = {}
				CD[playerName].glams.ears[glam]["temp"] = "normal"
			end
		end
		--Neck
		CD[playerName].outfits[currentOutfit].neck = Game.Player.Equipped.Neck.Item
		CD[playerName].outfits[currentOutfit].neckName = Game.Player.Equipped.Neck.ItemName
		--CD[playerName].outfits[currentOutfit].neckGlam = Game.Player.Equipped.Neck.GlamName
		glam = Game.Player.Equipped.Neck.GlamName
		CD[playerName].outfits[currentOutfit].neckGlam = glam
		if glam then
			if not CD[playerName].glams.neck[glam] then
				CD[playerName].glams.neck[glam] = {}
				CD[playerName].glams.neck[glam]["temp"] = "normal"
			end
		end
		--Wrist
		CD[playerName].outfits[currentOutfit].wrist = Game.Player.Equipped.Wrist.Item
		CD[playerName].outfits[currentOutfit].wristName = Game.Player.Equipped.Wrist.ItemName
		--CD[playerName].outfits[currentOutfit].wristGlam = Game.Player.Equipped.Wrist.GlamName
		glam = Game.Player.Equipped.Wrist.GlamName
		CD[playerName].outfits[currentOutfit].wristGlam = glam
		if glam then
			if not CD[playerName].glams.wrist[glam] then
				CD[playerName].glams.wrist[glam] = {}
				CD[playerName].glams.wrist[glam]["temp"] = "normal"
			end
		end
		--RRing
		CD[playerName].outfits[currentOutfit].rring = Game.Player.Equipped.RRing.Item
		CD[playerName].outfits[currentOutfit].rringName = Game.Player.Equipped.RRing.ItemName
		--CD[playerName].outfits[currentOutfit].rringGlam = Game.Player.Equipped.RRing.GlamName
		glam = Game.Player.Equipped.RRing.GlamName
		CD[playerName].outfits[currentOutfit].rringGlam = glam
		if glam then
			if not CD[playerName].glams.ring[glam] then
				CD[playerName].glams.ring[glam] = {}
				CD[playerName].glams.ring[glam]["temp"] = "normal"
			end
		end
		--LRing
		CD[playerName].outfits[currentOutfit].lring = Game.Player.Equipped.LRing.Item
		CD[playerName].outfits[currentOutfit].lringName = Game.Player.Equipped.LRing.ItemName
		--CD[playerName].outfits[currentOutfit].lringGlam = Game.Player.Equipped.LRing.GlamName
		glam = Game.Player.Equipped.LRing.GlamName
		CD[playerName].outfits[currentOutfit].lringGlam = glam
		if glam then
			if not CD[playerName].glams.ring[glam] then
				CD[playerName].glams.ring[glam] = {}
				CD[playerName].glams.ring[glam]["temp"] = "normal"
			end
		end
		
		CD[playerName].outfits[currentOutfit].panties = CD[playerName].outfits[currentOutfit].panties or 0
		CD[playerName].outfits[currentOutfit].bra = CD[playerName].outfits[currentOutfit].bra or 0
		CD[playerName].outfits[currentOutfit].nails = CD[playerName].outfits[currentOutfit].nails or 0
		
		CD[playerName].outfits[currentOutfit]["job"] = Game.Player.Entity.Job.ShortName
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
			if validTypes[var1] then
				CD[playerName]["outfits"][currentOutfit]["type"][validTypes[var1]] = set
			end
			
		end
	end
	CDHandler()
	--Script.SaveStorage()
end



return {validTemps, smartOutfitSelect, outfitTempEffects, validTypes, validStyles,
		validSlotId, gearSlotName, SNDRemoveCall, OutfitSave, OutfitLoad, SNDEquipHandler, 
		TakeoffRandom, RemoveItem, PutonItem, SmartOutfit, OutfitHandler, UpdateOutfit}