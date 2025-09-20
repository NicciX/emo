
---	v								v	---
---	v	vvv Chat Handler vvv		v	---
---	v								v	---

function ChatHandler()
	dbgMsg("ƒChatHandlerƒ", 2)
	func_time["ChatHandler"].ST = os.time()
	--Script.Clipboard = args
	if stackIdx < 1 then
		return
	end
	if validFuncTrack["chat"] then
		dbgMsg("!ChatHandler :: stackIdx :: " .. tostring(stackIdx) .. " :: sender :: " .. tostring(chatStack[stackIdx].chn), 1, "chat")
	end
	--dbgMsg("!ChatHandler :: stackMsg :: " .. tostring(chatStack[stackIdx].msg), 1)
	local n
	local txt = chatStack[stackIdx].msg --Game.Chat.Msg
	local sender = chatStack[stackIdx].sender--Game.Chat.Sender
	local chn = chatStack[stackIdx].chn
	local stamp = chatStack[stackIdx].stamp
	
	sender = string.gsub(sender, "[]", "")

	if chn == "ls2" or chn == "Ls2" then
		chn = "l2"
	end
	
	chatStack[stackIdx] = nil
	stackIdx = #chatStack
	
	if filterLog["9"] then
		--Game.SendChat("/e CHAT: " .. tostring(txt))
		local t = formatTime(stamp)
		dbgMsg(t .. " ¶" .. txt, 9)
		--Game.SendChat("/e CHAT: " .. tostring(txt))
	end

	if #txt > 0 then
		if (txt:sub(1,4) == "juju" or txt:sub(1,5) == "chain") then
			chainLock = true
		end
		
		SALAD = ChattyChop(txt, not validChainChn[chn])
		
		if string.find(txt, " beckons to you.") then
			if not CD[playerName].traits["stubborn"] and playerRace ~= "Miqo'te" then
				txt = string.gsub(txt, " beckons to you.", "")
				Game.SendChat("/target " .. txt)
				CallRoutine("Follow")
			else
				txt = string.gsub(txt, " beckons to you.", "")
				Game.SendChat("/target " .. txt)
				n = math.random(100)
				if n > 77 then
					DoRandom("huh")
				elseif n > 44 then
					DoRandom("no")
				elseif n > 33 then
					DoRandom("vexed")
				elseif n > 23 then
					DoRandom("fume")
					Game.SendChat("/em refuses to follow <t>.")
				else
					CallRoutine("Follow")
				end
				--n = math.random(100)
				--if n > 65 then
					--Game.SendChat("/em refuses to follow <t>." .. txt)
				--end
			end
		--elseif string.find(txt, "juju")	then
			--Game.SendChat("/useitem 40392 ")
		elseif string.contains(txt, "entities matching") then
			dbgMsg(".•.Entities Found.•.", 1)
		elseif txt == "You have entered a sanctuary." then
			if action == "loading" then
				action = "idle"
				Update()
			end
		--elseif string.contains(txt, "FINAL FANTASY XIV") then
			--loginStatus = true
		elseif txt == "log" and sender == playerName then
			CallRoutine("logout")
		elseif txt == "reloading scripts" then
			--do nothing
		elseif txt == "reload" and sender == playerName and action ~= "loading" then
			action = "loading"
			dbgMsg(".•.Saving Character Data.•.", 1)
			Script.ClearQueue()
			CDUpdater()
			Game.PrintMessage("reloading scripts")
			--Game.SendChat("/woluax reload")
			Game.SendChat("/woluax reload")
		elseif string.sub(txt, 1, 4) == "emo " and sender == playerName then
			--Script.QueueDelay(37)
			--Script.QueueAction(delayedAction, txt)
			Game.SendChat("/wait 1")
			Game.SendChat("/" .. txt)
		elseif txt == "save" then
			CDUpdater()
		--elseif txt == "artisan" or txt == "xllog" or txt == "xldat" or txt == "wolua reload" then
			--Game.SendChat("/" .. txt)
		--elseif txt == "penumbra" or txt == "chatalerts" or txt == "xlstats" or txt == "moodles" or
			--txt == "penny toggle" or txt == "penny" or txt == "snd" or txt == "mare" then
			--Game.SendChat("/" .. txt)
		elseif txt == "glam" or txt == "glamourer" or txt == "currency" or txt == "macros" then
			Game.SendChat("/" .. txt)
		elseif txt == "armor" or txt == "armoury" or txt == "gear" then
			Game.SendChat("/isort condition armoury ilv des")
			Game.SendChat("/isort execute armoury")
			Game.SendChat("/armoury body")
		elseif string.startsWith(txt, "You use a") then
			--dbgMsg("chatter: test", 1)
			txt = string.gsub(txt, "You use a ", "")
			txt = string.gsub(txt, "", "")
			txt = string.gsub(txt, "serving of ", "")
			txt = string.gsub(txt, ".", "")
			
			if lastEntree then
				if string.contains(txt:lower(), lastEntree:lower()) then
					--lastEntree = nil
					lastEntreeTime = nil
				end
			end
			if lastMeal then
				if string.contains(txt:lower(), lastMeal:lower()) then
					--lastMeal = nil
					lastMealTime = nil
				end
			end
			lastConsumed = txt:gsub("(%l)(%w+)", function(a,b) return string.upper(a)..b end)
		elseif txt == "bags" or txt == "inventory" then
			Game.SendChat("/isort condition inventory ilv des")
			Game.SendChat("/isort execute inventory")
			Game.SendChat("/inventory")
		elseif string.startsWith(txt, "") then
			PlaceFlag(txt,chn)
		elseif txt == "minion" or txt == "pet" then
			Game.SendChat("/minionguide")
		elseif string.find(txt, "^item ") then
			txt = string.gsub(txt, "item ", "")
			Game.SendChat("/xlitem " .. txt)
		elseif string.find(txt, "lalafel") or string.find(txt, "lala") then
			GetAngry(match_type(txt, "provoked by thoughts of HIM", sender))
		elseif string.find(txt, "pffft~") or string.find(txt, "pfffft~") then
			DoRandom("deride", "a reaction to shitty luck")
		elseif string.find(txt, "pffft") or string.find(txt, "pfffft") then
			GetAngry("from being ready to kick some ass")
		elseif string.find(txt, "ahoy") or string.find(txt, "heya") then
			Greetings()
		elseif string.find(txt, "hiya") or string.find(txt, "hello") then
			Greetings()
		--elseif string.find(string.lower(txt), "babyshark girl") or string.find(string.lower(txt), "baby shark girl") then
			--CallRoutine("babysharkgirl")
		--elseif string.find(txt, "Updating online status. No longer away from keyboard.") then -- Deprecated 7.0.1
			--SetAfk(nil)
		elseif string.find(txt, "red chair") or string.find(txt, "redchair") then
			Game.SendChat("/mount \"Archon Throne\"")
		elseif (string.find(txt:lower(), ":p") and sender == playerName) then
			Razzle()
		elseif string.find(txt, "bird") or string.find(txt, "birb") then
			Game.SendChat("/useitem 41500")
		elseif string.find(txt, "sunshine") or string.find(txt, "birb") then
			Game.SendChat("/useitem 7809")
		elseif string.find(txt, "Kaldea") then
			DoRandom("doubt")
		--elseif string.find(txt, "pizza") then
			--DoRandom("pizza")
		--elseif string.find(txt, "chocolate") then
			--DoRandom("choco")
		elseif string.find(txt,"You gain the effect of") and string.find(txt, "Battle High V.") then
			phrash = "kittytoes"
			phrashDex = 1
			phrashTime = os.time()
			phrashDelay = 1
		elseif (string.find(txt, "brb") or string.find(txt, "afk")) and sender == playerName then
			--CallRoutine("redchairafk")
		elseif txt == "haha" and sender == playerName then
			DoRandom("laugh", " as directed by chat.")
		elseif string.find(txt, "haha") and sender == playerName then
			DoRandom("laugh", " as suggested by chat.")
		elseif string.find(txt, "rain") then
			DoRandom("water", " as inspired by chat.")
		elseif (string.find(txt, "lol") or string.find(txt, "hehe")) and sender == playerName then
			--Script.QueueDelay(123)
			--Script.QueueAction(DoRandom, "chuckle")
			DoRandom("chuckle", "suggested")
			--%s(no)%s
		elseif string.match(txt, "%f[A-Za-z]no%f[^A-Za-z]") and sender == playerName then
			if txt == "no" then
				DoRandom("no", "commanded")
			else
				DoRandom("no", "suggested by chat")
			end
		elseif string.match(txt, "%f[A-Za-z]yes%f[^A-Za-z]") and sender == playerName then
			if txt == "yes" then
				DoRandom("yes", "commanded")
			else
				DoRandom("yes", "suggested by chat")
			end
		elseif (string.match(txt, "%f[A-Za-z]embarrassed%f[^A-Za-z]") or string.match(txt, "%f[A-Za-z]embarrassing%f[^A-Za-z]")) and sender == playerName then
			DoRandom("blush", " a reaction of the conversation")
		elseif (string.match(txt, "%f[A-Za-z]angry%f[^A-Za-z]") or string.match(txt, "%f[A-Za-z]mad%f[^A-Za-z]")) and string.find(txt, playerName) then
			DoRandom("angry", "suggested by chat")
		--[[elseif string.find(txt, "mischief") or string.find(txt, "shenanigans") or string.find(txt, "tomfoolery") then
			local tmp = math.random(100)
			if tmp > 77 then
				Game.SendChat("/minion \"Mischief Maker\"")
			elseif tmp > 33 then
				Game.SendChat("/minion \"Motley Egg\"")
			else
				Game.SendChat("/minion \"Wind-up Fuath\"")
			end]]--
		elseif string.match(txt, "“[%a%s]+” equipped.") and Sys.Outfits then
			local mt = string.match(txt, "“([%a%s]+)” equipped.")
			gearsetChange = mt
			--currentOutfit = mt
			--CD[playerName]["outfits"]
			CD[playerName]["outfits"] = CD[playerName]["outfits"] or {}
			if not CD[playerName]["outfits"][gearsetChange] and action ~= "routine" then
				--CallRoutine("gearUpdate")
				UpdateOutfit(mt)
				dumpInfo("outfits supersimple")
			else
				currentOutfit = mt
				CD[playerName].currentOutfit = currentOutfit
				UpdateOutfit(mt)
				--CD[playerName].outfits = CD[playerName].outfits or {}
				CD[playerName].outfits.currentOutfit = CD[playerName].outfits.currentOutfit or {}
				dumpInfo("outfits glams")
			end
			--Game.SendChat("/e " .. mt)
			
			--“White Mage B” equipped.
		elseif string.match(txt, "“[%a%s]+” equipped, but glamours could not be restored.") and Sys.Outfits then
			local mt = string.match(txt, "“([%a%s]+)” equipped.")
			gearsetChange = mt
			Game.SendChat("/updategearset") -- this is a vanilla command
			--CallRoutine("gearUpdate")
		elseif string.find(txt, "grats") then
			DoRandom("congratulate", " as influenced by chat.")
		elseif string.find(txt, "The time limit has expired.") then
			Shame(txt)
		--elseif string.find(txt, "coffee") or string.find(txt, "tea") or string.find(txt, "thirsty") then
			--DoRandom("tea", " as influenced by chat.")
			--ApplyBuff("caffeinated")
			--dbgMsg("Tea Time!", 1)
		elseif string.find(txt, "shit") then
			DoRandom("furious")
		elseif string.find(txt, "dammit") or string.find(txt, "annoying") then
			DoRandom("furious")
		elseif string.find(txt, "Teleporting to") then
			--dbgMsg("Teleporting: <:> ", 1)
			local mt = string.match(txt, "Teleporting to ([%a%s]+)")
			--dbgMsg("Teleporting: :: " .. tostring(mt), 1)
			--Teleporting to The Gold Saucer...
		end
		txt = string.gsub(txt, playerName .. ": ", "")
		txt = string.gsub(txt, "!", "")
		if strings[txt] then
			dbgMsg("STRINGS", 1)
			local ac = strings[txt]
			StringsHandler(ac)
			--Yojimbo, come on down!
		else
			MatchStick(txt, sender, chn)
		end
		lastChat = txt
	end
	func_time["ChatHandler"].END = os.time()
	func_track("ChatHandler")
end

function favoriteFood()
	local val = 0
	local m = "unknown"
	for k,v in pairs(CD[playerName].diet) do
		if v > val then
			val = v
			m = k
		end
	end
	if m then
		return m .. " :: Has consumed " .. tostring(val) .. "."
	else
		return m
	end
end

function favoriteEmote()
	local val = 0
	local m = "unknown"
	for k,v in pairs(CD[playerName].favorites) do
		if v > val then
			val = v
			m = k
		end
	end
	if m then
		return m .. " :: Has been performed " .. tostring(val) .. " times."
	else
		return m
	end
end

function match_type(txt, mtc, sender)
	if sender == playerName then
		if txt == mtc then
			return "directed"
		else
			return "suggested"
		end
	end
	if txt == mtc then
		return "inspired"
	else
		return "influenced"
	end
end

function Shame(txt)
	EmoGyre("embarrassed", 13)
	EmoGyre("anxious", 11)
	EmoGyre("sad", 7)
	Moodle("Shameful", "apply", "self", "buffs", "default")
end

local bijous = {
	["keys"] = {"diamonds", "birds", "onibi", "sunshine", "emerald", "indigo", "stardust", "potpourri"},
	["diamonds"] = "/useitem 38539",
	["birds"] = "/useitem 41500",
	["onibi"] = "/useitem 40392",
	["sunshine"] = "/useitem 7809",
	["moonrabbits"] = "/useitem 48158",
	["emerald"] = "/useitem 5900",
	["indigo"] = "/useitem 5901",
	["stardust"] = "/useitem 7810",
	["pumpkin"] = "/useitem 16929",
	["potpourri"] = "/useitem 33710",

}

local cats = {
	["whiskers"] = {"Nagxian Cat", "Tora-jiro", "Coeurl Kitten", "Black Coeurl", "Byakko Cub", "Palico", "Jibanyan",
					"Bluecoat Cat", "Ilyikty'i", "Weatherproof Gaelicat", "Fat Cat", "Meerkat", "USApyon", "Shoebill",
					"Black Kitten", "Gimme Kitten"},
	["Nagxian Cat"] = true,
	["Tora-jiro"] = true,
	["Coeurl Kitten"] = true,
	["Black Coeurl"] = true,
	["Byakko Cub"] = true,
	["Palico"] = true,
	["Jibanyan"] = true,
	["Bluecoat Cat"] = true,
	["Ilyikty'i"] = true,
	["Weatherproof Gaelicat"] = true,
	["Fat Cat"] = true,
	["Black Kitten"] = true,
	["Meerkat"] = true,
	["USApyon"] = true,
	["Shoebill"] = true,
	["Gimme Kitten"] = true,
}

local mischief = {
	["makers"] = {"Motley Egg", "Mischief Maker", "Meerkat", "Shoebill", "Wind-up Cursor", "Manjimutt", "Clockwork Lantern"},
	["Motley Egg"] = true,
	["Mischief Maker"] = true,
	["Meerkat"] = true,
	["Page 63"] = true,
	["Treasure Box"] = true,
	["Porro Roggo"] = true,
	["Shoebill"] = true,
	["Wind-up Cursor"] = true,
	["Manjimutt"] = true,
	["Clockwork Lantern"] = true,
	["Meerkat"] = true,
	["Meerkat"] = true,
	["Meerkat"] = true,
	["Meerkat"] = true,
	["Meerkat"] = true,
}



local poppits = {
	["strings"] = {"Calca", "Brina", "Meerkat", "Wind-up Edda", "Wind-up Chimera", "Shoebill", "Manjimutt"},
	["Calca"] = true,
	["Brina"] = true,
	["Meerkat"] = true,
	["Shoebill"] = true,
	["Wind-up Chimera"] = true,
	["Wind-up Edda"] = true,
	["Manjimutt"] = true,
}

local turnips = {
	["roots"] = {"Kidragora", "Onion Prince", "Eggplant Knight", "Garlic Jester", "Tomato King", 
					"Mandragora Queen", "Korpokkur Kid", "Tiny Bulb", "Shoebill"},
	["Kidragora"] = true,
	["Onion Prince"] = true,
	["Eggplant Knight"] = true,
	["Shoebill"] = true,
	["Garlic Jester"] = true,
	["Tomato King"] = true,
	["Mandragora Queen"] = true,
	["Korpokkur Kid"] = true,
	["Tiny Bulb"] = true,
}

local bunnies = {
	["dust"] = {"Dust Bunny", "Unlucky Rabbit", "Dwarf Rabbit", "Meerkat", "Shoebill"},
	["Dust Bunny"] = true,
	["Unlucky Rabbit"] = true,
	["Meerkat"] = true,
	["Shoebill"] = true,
}

local razzle = {"pose", "dance", "deride", "spectacles", "shakedrink", "earwiggle", "photograph", "thumbsup"}

local dazzle = {"mime", "magictrick", "allsaintscharm", "crimsonlotus", "blowbubbles", "wow", "victory", "heart", "spectacles"}

local frazzle = {"aback", "shocked", "clutchhead", "sulk", "windmill", "panic", "angry", "furious", "no", "disappointed", "box", "malevolence", "deride", "sulk"}

local validEarnings = {
	["cosmic containers"] = 0,
	["lunar credits"] = 0,
	["cosmo credits"] = 0,
	["cosmocredits"] = 0,
	["Big Bang ticket"] = 0,
	["Storm Seals"] = 0,
	["Flame Seals"] = 0,
	["Serpent Seals"] = 0,
	["MGP"] = 0,
	["gil"] = 0,
	["mate cookies "] = 0,
	["whipped cream "] = 0,
	["rroneek steak "] = 0,
	["stuffed peppers "] = 0,
	["tsai tou vounou"] = 0,
	["tsai tou vounou "] = 0,
	["tiny key"] = 0,
	["venture coffer"] = 0,
	["cruiser holosaber"] = 0,
	["tsai tou vounou"] = 0,
	["seafarer s cowries"] = 0,
	["Mamool Ja nanook"] = 0,
	["orpiment demiatma"] = 0,
	["Orpiment Demiatma"] = 0,
	["realgar demiatma"] = 0,
	["Realgar Demiatma"] = 0,
	["azurite demiatma"] = 0,
	["Azurite Demiatma"] = 0,
	["caput mortuum demiatma"] = 0,
	["a caput mortuum demiatma"] = 0,
	["Caput Mortuum Demiatma"] = 0,
	["malachite demiatma"] = 0,
	["Malachite Demiatma"] = 0,
	["Enlightenment silver pieces"] = 0,
	["Enlightenment gold pieces"] = 0,
	["knowledge points"] = 0,
	["Phantom Bard experience points"] = 0,
	["magicked prism (ribbons)"] = 0,
	["Allagan tomestones of heliometry"] = 0,
	["Allagan tomestones of mathematics"] = 0,
	["wind crystals"] = 0,
	["fire crystals"] = 0,
	["water crystals"] = 0,
	["earth crystals"] = 0,
	["lightning crystals"] = 0,
	["ice crystals"] = 0,
	["wind clusters"] = 0,
	["fire clusters"] = 0,
	["water clusters"] = 0,
	["earth clusters"] = 0,
	["lightning clusters"] = 0,
	["ice clusters"] = 0,
	["wind shards"] = 0,
	["fire shards"] = 0,
	["water shards"] = 0,
	["earth shards"] = 0,
	["lightning shards"] = 0,
	["ice shards"] = 0,
	["sacks of Nuts"] = 0,
	["sacks of Nuts"] = 0,
	["sacks of Nuts"] = 0,
	["sacks of Nuts"] = 0,
	["vault key"] = 0,
	["Allagan silver pieces"] = 0,
	["Allagan gold pieces"] = 0,
	["Allagan platinum pieces"] = 0,
	["Allied Seals"] = 0,
	["Stuffed Bom Boko"] = 0,
	["an alien onion"] = 0,
	["dark rye flour"] = 0,
	["cronopio leather"] = 0,
	["purple crafters scrips"] = 0,
	["orange crafters scrips"] = 0,
	["orange gatherers scrips"] = 0,
	["purple gatherers scrips"] = 0,
	["sacks of Nuts"] = 0,
	["bicolor gemstones"] = 0,
	["handfuls of sideritis leaves"] = 0,
	["Thavnairian perilla leaves"] = 0,
}

destinations = {
	["saucer"] = "The Gold Saucer",
	["limsa"] = "Limsa Lominsa",
	["home"] = "Estate Hall (Free Company)",
	["house"] = "Estate Hall (Private)",
	["shar"] = "Old Sharlayan",
	["tuli"] = "Tuliyollal",
	["snine"] = "Solution Nine",
	["radz"] = "Radz-at-Han",
	["gridania"] = "Gridania",
	["ulda"] = "Ul'dah",
	["uldah"] = "Ul'dah",
	["ishgard"] = "Foundation",
	["foundation"] = "Foundation",
	["kugane"] = "Kugane",
	["shiro"] = "Kugane",
	["mamook"] = "Mamook",
	["mamo"] = "Mamook",
	["gc"] = "Grand Company",
	["moonrabbits"] = "Bestways Burrow",
	["bestways"] = "Bestways Burrow",
	["shaal"] = "Hhusatahwi",
	["shesh"] = "Sheshenewezi Springs",
	["eulmore"] = "Eulmore",
	["tailfeather"] = "Tailfeather",
	["fanow"] = "Fanow",
	["lahee"] = "Fanow",
	["fringes"] = "Castrum Oriens",
	["pstones"] = "The Peering Stones",
	["virdjala"] = "The Peering Stones",
	--["moon"] = "Mare"
}



function Razzle(msg)
	local r = math.random(1, #razzle)
	DoRandom(razzle[r], msg)
end

function Dazzle(msg)
	local r = math.random(1, #dazzle)
	DoRandom(dazzle[r], msg)	
end

function Frazzle(msg)
	local r = math.random(1, #frazzle)
	--DoRandom(frazzle[r], " upon seeing <t>.")
	lastFrazzle = lastFrazzle or 0
	if frazzle[r] == "windmill" and Game.Player.Job.ShortName == "DNC" and (os.time() - lastFrazzle > 60) then
		Game.SendChat("/ac windmill")
		Script.QueueAction(TakeoffRandom, {"top", "pants", "shoes", "gloves", "necklace", "earrings"})
		lastFrazzle = os.time()
		--TakeoffRandom({"top", "pants", "shoes", "gloves", "necklace", "earrings"})
	elseif frazzle[r] == "windmill" and Game.Player.Job.ShortName == "WHM" and (os.time() - lastFrazzle > 60) then
		Game.SendChat("/ac assize")
		Script.QueueAction(TakeoffRandom, {"top", "pants", "shoes", "gloves", "necklace", "earrings"})
		lastFrazzle = os.time()
	elseif frazzle[r] == "windmill" and Game.Player.Job.ShortName == "WAR" and (os.time() - lastFrazzle > 60) then
		Game.SendChat("/ac overpower")
		Script.QueueAction(TakeoffRandom, {"top", "pants", "shoes", "gloves", "necklace", "earrings"})
		lastFrazzle = os.time()
	elseif frazzle[r] == "windmill" and Game.Player.Job.ShortName == "MCH" and (os.time() - lastFrazzle > 60) then
		Game.SendChat("/ac flamethrower")
		Script.QueueAction(TakeoffRandom, {"top", "pants", "shoes", "gloves", "necklace", "earrings"})
		lastFrazzle = os.time()
	elseif frazzle[r] == "windmill" then
		-- ω♥∩♥ω
	else
		DoRandom(frazzle[r], msg)
	end
end

function doBijou(tag)
	if tag == "any" then
		dbgMsg("doBijou: tag :: " .. tostring(tag), 1)
		local r = math.random(1, #bijous.keys)
		local k = bijous.keys[r]
		dbgMsg("doBijou: k :: " .. tostring(k), 1)
		Game.SendChat(bijous[k])
	elseif bijous[tag] then
		Game.SendChat(bijous[tag])
	end
	return true
end

function getKitty(cat)
	if cat == "random" then
		dbgMsg("getKitty: cat :: " .. tostring(cat), 1)
		local r = math.random(1, #cats.whiskers)
		local k = cats.whiskers[r]
		dbgMsg("getKitty: k :: " .. tostring(k), 1)
		if cats[k] then
			Game.SendChat("/minion \"" .. k .. "\"")
		end
	elseif cats[cat] then
		Game.SendChat("/minion \"" .. cats[cat] .. "\"")
	end
	return true
end

local birds = {
	["feathers"] = {"Bluebird", "Owlet", "Ugly Duckling", "Hunting Hawk", "Road Sparrow",
					"Silver Dasher", "Gull", "Blue-footed Booby", "Puffin", "Uolosapa", 
					"Skallic Uolosapa", "Heavy Hatchling", "Quetzal", "Micro Crow", "Zu Hatchling",
					"Tight-beaked Parrot", "Sponge Silkie", "Morpho", "Gull", "Toco Toquito"},
	["Bluebird"] = {"blue"},
	["Owlet"] = {"owl", "wise", "hoot"},
	["Ugly Duckling"] = {"duck", "goose"},
	["Hunting Hawk"] = {"hawk"},
	["Road Sparrow"] = {"sparrow", "tiny"},
	["Silver Dasher"] = {"tiny"},
	["Gull"] = {"gull", "sea", "pirate"},
	["Blue-footed Booby"] = {"booby"},
	["Puffin"] = {"puffin"},
	["Uolosapa"] = {"uolo", "uolosapa"},
	["Skallic Uolosapa"] = {"skallic", "uolosapa"},
	["Heavy Hatchling"] = {"overstuffed", "fat", "turkey"},
	["Quetzal"] = {"parrot", "quetzal"},
	["Micro Crow"] = {"crow", "blackbird"},
	["Zu Hatchling"] = {"zu"},
	["Tight-beaked Parrot"] = {"parrot", "pirate"},
	["Sponge Silkie"] = {"soft", "sponge", "mouse"},
	["Morpho"] = {"morpho", "butterfly"},
	["Toco Toquito"] = {"toucan", "pirate"},
}

local minDex = {
	["Wayward Hatchling"] = "bird",
}

local minions = {
	["bird"] = {
		["Wayward Hatchling"] = {"yellow", "chocobo", "chick"},
		["Black Chocobo Chick"] = {"black", "chocobo", "chick"},
		["Princely Hatchling"] = {"crown", "chocobo", "yellow", "princely"},
		["Castaway Chocobo Chick"] = {"pirate", "chocobo", "water", "blue", "float"},
		["Ryunosuke"] = {"green", "dragon", "chocobo"},
		["Bluebird"] = {"blue"},
		["Owlet"] = {"owl", "wise", "hoot", "bush"},
		["Ugly Duckling"] = {"duck", "goose", "flock"},
		["Hunting Hawk"] = {"hawk", "raptor", "fierce"},
		["Road Sparrow"] = {"sparrow", "tiny"},
		["Silver Dasher"] = {"tiny", "silver"},
		["Gull"] = {"gull", "sea", "pirate", "flock"},
		["Blue-footed Booby"] = {"booby", "blue", "goofy", "funny"},
		["Puffin"] = {"puffin", "fluffy"},
		["Uolosapa"] = {"uolo", "uolosapa"},
		["Skallic Uolosapa"] = {"skallic", "uolosapa"},
		["Heavy Hatchling"] = {"overstuffed", "fat", "fluffy", "turkey"},
		["Quetzal"] = {"parrot", "quetzal", "pirate", "green"},
		["Micro Crow"] = {"crow", "blackbird", "black", "murder", "raven"},
		["Zu Hatchling"] = {"zu", "ugly", "weird", "creepy", "skinny"},
		["Tight-beaked Parrot"] = {"parrot", "pirate"},
		["Sponge Silkie"] = {"soft", "sponge", "mouse"},
		["Morpho"] = {"morpho", "butterfly"},
		["Golden Beaver"] = {"bush"},
		["Shoebill"] = {"him", "wise", "not a bird", "bush", "not"},
		["Toco Toquito"] = {"toucan", "pirate"},
	},
	["kitty"] = {
		["Nagxian Cat"] = {"siamese", "noble", "dark", "magestic", "black"},
		["Tora-jiro"] = {"cute", "fat", "adorable", "fluffy", "orange", "kitten"},
		["Coeurl Kitten"] = {"alley", "wild", "orange"},
		["Black Coeurl"] = {"alley", "wild", "black", "coeurl", "couerl", "kitten"},
		["Byakko Cub"] = {"tiger", "white", "tiger"},
		["Palico"] = {"devious", "shovel", "pal", "helmet", "digger", "digging", "dig", "miner"},
		["Jibanyan"] = {"red"},
		["Bluecoat Cat"] = {"blue", "grey", "lovey"},
		["Ilyikty'i"] = {"icky", "orange", "tiger", "kitten"},
		["Weatherproof Gaelicat"] = {"flying"},
		["Fat Cat"] = {"fat", "soft", "big", "fluffy", "hungry"},
		["Black Kitten"] = {"black", "fashionable", "pink"},
		["Meerkat"] = {"fake", "polecat"},
		["USApyon"] = {"plastic"},
		["Giant Beaver"] = {"beaver", "snae ling", "not a kitty", "giant", "large", "hungry", "lran", "pixies", "terror"},
		["Shoebill"] = {"him", "wise", "not a cat"},
		["Wind-up Chimera"] = {"patchwork", "quilted", "not a cat", "pink"},
		["Gimme Kitten"] = {"electric", "crazy", "wild"},	
	},
	["dog"] = {
		["Gestahl"] = {"poodle", "fancy", "hat", "pedigree"},
		["Wolf Pup"] = {"pup", "black", "fluffy", "red bandana"},
		["Torgal Pup"] = {"pup", "black", "fluffy", "white"},
		["Royal Hound"] = {"beagle", "tan", "brown", "white"},
		["Manjimutt"] = {"horrid", "creepy", "creepiest", "bastard", "mangi", "hideous", "vomit", "horrible", "lapping", "flea-bitten", "poodle", "ugly", "mangy", "mangey", "cringey", "chloe", "chloe's"},
	},
	["moogle"] = {
		["Wind-up Moogle"] = {"plain"},
		["Taoist Moogle"] = {"taoist", "monk"},
		["Bridesmoogle"] = {"wedding", "bride", "basket"},
	},
	["duck"] = {
		["Ugly Duckling"] = {"duck", "goose"},
		["Heavy Hatchling"] = {"overstuffed", "fat", "turkey"},
	},
	["poppit"] = {
		["Calca"] = {"anabelle", "calca", "matoya", "creepy", "chloe", "doll", "blue"},
		["Brina"] = {"anabelle", "brina", "matoya", "creepy", "chloe", "doll", "red"},
		["Meerkat"] = {"kat", "cat", "polecat"},
		["Shoebill"] = {"him", "wise", "powerful"},
		["Wind-up Chimera"] = {"patchwork", "quilted", "cat"},
		["Wind-up Edda"] = true,
		["Manjimutt"] = {"horrid", "creepy", "creepiest", "dog", "mutt", "cringey", "chloe", "chloe's"},
	},
	["bunny"] = {
		["Dust Bunny"] = {"dusty", "black", "spriggan", "sandy's", "sandy"},
		["Unlucky Rabbit"] = {"unlucky", "sad", "brown"},
		["Meerkat"] = {"kat", "not a bunn", "polecat"},
		["Shoebill"] = {"him", "wise", "not a bunn", "not a rabbit"},
	},
	["turnip"] = {
		["Kidragora"] = {"mandrake", "sprout", "shrill", "nightshade"},
		["Onion Prince"] = {"onion", "allium", "prince"},
		["Eggplant Knight"] = {"eggplant", "knight", "black", "nightshade"},
		["Shoebill"] = {"him", "wise", "not a bunn", "not a rabbit"},
		["Garlic Jester"] = {"garlic", "allium"},
		["Tomato King"] = {"king", "red", "tomato", "saucy", "nightshade"},
		["Mandragora Queen"] = {"queen", "pink", "mandrake", "deafening", "nightshade"},
		["Korpokkur Kid"] = {"pitcher", "kid", "sprout"},
		["Tiny Bulb"] = {"bulb", "sprout"},
	},
	["motley"] = {
		["Motley Egg"] = {"egg", "black and white"},
		["Mischief Maker"] = {"jester"},
		["Meerkat"] = {"curious"},
		["Page 63"] = {"forbidden", "library", "matoya"},
		["Treasure Box"] = {"mimic", "trickery"},
		["Porro Roggo"] = {"illusion", "frog", "matoya"},
		["Shoebill"] = {"him", "wise", "powerful", "annoyed", "smug"},
		["Wind-up Cursor"] = {"tag", "hand", "finger", "point"},
		["Manjimutt"] = {"horrid", "rotten", "miserable", "cursed", "mangey", "mangy","creepy", "creepiest", "dog", "mutt", "cringey", "chloe"},
		["Clockwork Lantern"] = {"light"},
		["Meerkat"] = {"imposter", "cat", "polecat"},
	},
	["doll"] = {
		["Wind-up Alphinaud"] = {"alphi", "alphinaud", "windup", "wind-up", "doll", "human"},
	},
	["booger"] = {
		["Wind-up Tonberry"] = {"green", "knife", "lalafel", "dungeon", "palace", "seven"},
		["Mummy's Little Mummy"] = {"undead", "mummy", "tomb", "zombie", "dust"},
		["Beady Eye"] = {"eye", "flying", "gaze", "leathery wings", "stone", "ahriman"},
		["Wind-up Ultros"] = {"purple", "godbert", "octopus", "lecherous", "handy"},
		["Puff of Darkness"] = {"vampire", "wings", "wraith", "dungeon", "darkness", "dark", "wisp", "cloud"},
	},
	["creature"] = {
		["Giant Beaver"] = {"beaver", "snae ling", "giant", "large", "hungry", "lran", "pixies", "terror"},
		["Bacon Bits"] = {"geordie", "pig", "flying", "not a beaver", "porxie", "pixies"},
		["Piggy"] = {"bipedal", "pig", "not a pig", "not a beaver", "not a porxie", "strange", "booger"},
	},
	["critter"] = {
		["Wide-eyed Fawn"] = {"deer", "four legs", "blue", "baby"},
	},
	["mammet"] = {
	
	},
	["beaver"] = {
		["Meerkat"] = {"imposter", "cat", "polecat", "not a beaver"},
		["Golden Beaver"] = {"gold", "golden", "magnificent", "royalty", "pixies", "terror", "lyhe ghia"},
		["Giant Beaver"] = {"beaver", "snae ling", "giant", "large", "hungry", "lran", "pixies", "terror"},
		["Capybara Pup"] = {"brown", "adorable", "not a beaver", "capybara", "pup"},
	},
	["squirrel"] = {
		["Nutkin"] = {"squirrel", "nuts", "sacks", "grey"},
	}

}

function MinionMadness(minion, madness)
	local slct
	local variance = 63
	if minions[minion] then
		if minions[minion][madness] then
			Game.SendChat("/minion \"" .. minions[minion][madness] .. "\"")
			return
		end
	end
	
	for k,v in pairs(minions[minion]) do
		if type(v) == "table" and k ~= currentMinion then
			for i,x in ipairs(v) do
				if string.contains(madness:lower(), x:lower()) then
					if not slct then
						slct = k
						variance = variance + 14
					elseif math.random(1,111) > variance then
						variance = variance + 11
						slct = k
					end
				end
			end
		end
	end
	--dbgMsg("MinionMadness: madness :: " .. tostring(madness), 1)
	dbgMsg("MinionMadness: slct :: " .. tostring(slct), 1)
	if slct then
		Game.SendChat("/minion \"" .. slct .. "\"")
		currentMinion = slct
	end
end

function getBird(bird)
	local slct
	if birds[bird] then
		Game.SendChat("/minion \"" .. birds[bird] .. "\"")
		return
	end
	for k,v in pairs(birds) do
		if k ~= "feathers" then
			if type(v) == "table" then
				for i,x in ipairs(v) do
					if string.contains(bird:lower(), x:lower()) then
						if not slct then
							slct = k
						elseif math.random(1,100) > 77 then
							slct = k
						end
					end
				end
			end
		end
	end
	dbgMsg("getBird: slct :: " .. tostring(slct), 1)
	if slct then
		Game.SendChat("/minion \"" .. slct .. "\"")
		
	else -- bird == "random" then
		dbgMsg("getBird: bird :: " .. tostring(bird), 1)
		local r = math.random(1, #birds.feathers)
		local k = birds.feathers[r]
		dbgMsg("getBird: k :: " .. tostring(k), 1)
		if birds[k] then
			Game.SendChat("/minion \"" .. k .. "\"")
		end
	--elseif birds[bird] then
		--Game.SendChat("/minion \"" .. birds[bird] .. "\"")
	end
	return true
end

function getKyurghen(turnip)
	if turnip == "random" then
		dbgMsg("getKyurghen: turnip :: " .. tostring(turnip), 1)
		local r = math.random(1, #turnips.roots)
		local k = turnips.roots[r]
		dbgMsg("getKyurghen: k :: " .. tostring(k), 1)
		if turnips[k] then
			Game.SendChat("/minion \"" .. k .. "\"")
		end
	elseif turnips[turnip] then
		Game.SendChat("/minion \"" .. turnips[turnip] .. "\"")
	end
	return true
end

function getBunny(bunny)
	if bunny == "random" then
		dbgMsg("getBunny: bunny :: " .. tostring(bunny), 1)
		local r = math.random(1, #bunnies.dust)
		local k = bunnies.dust[r]
		dbgMsg("getBunny: k :: " .. tostring(k), 1)
		if bunnies[k] then
			Game.SendChat("/minion \"" .. k .. "\"")
		end
	elseif bunnies[bunny] then
		Game.SendChat("/minion \"" .. cats[cat] .. "\"")
	end
	return true
end

function getPoppit(poppit)
	if poppit == "random" then
		dbgMsg("getPoppit: poppit :: " .. tostring(poppit), 1)
		local r = math.random(1, #poppits.strings)
		local k = poppits.strings[r]
		dbgMsg("getPoppit: k :: " .. tostring(k), 1)
		if poppits[k] then
			Game.SendChat("/minion \"" .. k .. "\"")
		end
	elseif poppits[poppit] then
		Game.SendChat("/minion \"" .. poppits[poppit] .. "\"")
	end
	EmoGyre("focused", 19.1)
	return true
end

function getMotley(egg)
	if egg == "random" then
		dbgMsg("getMotley: egg :: " .. tostring(egg), 1)
		local r = math.random(1, #mischief.makers)
		local k = mischief.makers[r]
		dbgMsg("getMotley: k :: " .. tostring(k), 1)
		if mischief[k] then
			Game.SendChat("/minion \"" .. k .. "\"")
		end
	elseif mischief[egg] then
		Game.SendChat("/minion \"" .. mischief[egg] .. "\"")
	end
	EmoGyre("mischievous", 19.1)
	return true
end

function GetAngry(msg)
	local angry = moods.angry
	local r = math.random(1, #angry)
	if angry[r] then
		DoRandom(angry[r],msg)
	end
end

function emoReact(emo, msg)
	dbgMsg("emoReact: emo :: " .. tostring(emo), 3)
	if not msg then
		msg = "inspirited by unseen forces"
	end
	local mote = moods[emo]
	local r = math.random(1, #mote)
	if mote and mote[r] then
		--DoRandom(mote[r], " as inspired by chat.")
		DoRandom(mote[r], msg)
	end
end

function Greetings()
	local r = math.random(1, 99)
	if r < 23 then
		DoRandom("laliho")
	elseif r < 37 then
		DoRandom("ohokaliy")
	elseif r < 67 then
		DoRandom("greet")
	else
		DoRandom("wave")
	end
end


function TimeGate()
	dbgMsg(".TimeGate.", 2)
	local eTime = Game.EorzeanTime
	local t = os.time()
	local m, s = tonumber(os.date("%M", t)), tonumber(os.date("%S", t))
	local lTime = m * 60 + s
	local round =  math.floor(m / 20) + 1
	local rTime = formatTime(20 * 60 * round - lTime)
	--dbgMsg("TimeGate: lTime :: " .. tostring(lTime), 9)
	dbgMsg("TimeGate: time remaining :: " .. tostring(rTime), 9)
	
	if round == 1 then
		--
	else
		--
	end
	return rTime
end

function Blimey(that)
	dbgMsg(".Blimey.", 2)
	if not that then 
		return
	end
	local tg = TimeGate()
	local st
	if tg then
		st = string.gsub(that, "<timegate>", tostring(tg))
	end
	dbgMsg("Blimey: TG :: " .. tostring(st), 9)
	that = st
	for x,y in pairs(yaaar) do
		that = string.gsub(that, "%f[A-Za-z]" .. x .. "%f[^A-Za-z]", y)
	end
	return that
end

function GetCharSet(dx)
	local c
	local s = ""
	for i=dx,dx+200,1 do
		c = string.char(i)
		if c then
			s = s..string.char(i)
		end
	end
	return s
end

function StringsHandler(dat)
	dbgMsg(".StringsHandler.", 2)
	dbgMsg("type(dat): " .. type(dat), 9)
	if type(dat) == "function" then
		local er, ret = pcall(dat)
		if ret then
			Game.SendChat("/" .. tostring(ret))
		end
	elseif type(dat) == "table" then
		if dat.report then
			dbgMsg("Blimey report ::" .. Blimey(dat.report), 1)
			if dat.report and CD[playerName].traits["gossiper"] then
				--dbgMsg("Blimey: " .. Blimey(dat.report), 1)
				Game.SendChat("/fc " .. Blimey(dat.report))
			end
		elseif dat.routine then
			CallRoutine(dat.routine)
		end
	elseif type(dat) == "string" then
		Game.SendChat("/" .. dat)		
	end
end

function Chatty(what)
	if what == "random" then
		
	end
end

function ChattyChop(chat, opt)
	dbgMsg(".ChattyChop.", 2)
	func_time["ChattyChop"].ST = os.time()
	
	if lockChain then
		lockChain = nil
		func_time["ChattyChop"].END = os.time()
		func_track("ChattyChop")
		return nil
	end
	
	if not cHAIn then
		cHAIn = {}
	end
	
	if chat:sub(1,4) == "juju" or chat:sub(1,5) == "chain" or opt then
		lockChain = true
	end
	
	local salad = {}
	local cnt = 0
	local cm = 0
	local s = string.match(chat, "(%a+)")
	local t = string.match(chat, "([%a][%w']*[%w]+)")
	local u = string.match(chat, "(%a+),")
	if s ~= t then
		if s ~= "a" and s ~= "i" and s ~= "q" then
			s = t
		end
	end
		
	if s == u and s and u then
		cm = 1
	end
	--local s = string.match(chat, "([%a][%w']*[%w]+)")
	
	local c,pr,fl,fw
	while s and cnt < 377 do
		salad[#salad+1] = s
		--dbgMsg("ChattyChop:  word :: " .. tostring(s), 1)
		c = string.lower(s)
		if not lockChain then
			cHAIn[c] = cHAIn[c] or {}
			cHAIn[c].link = (cHAIn[c].link or 0) + 1
			cHAIn[c].time = os.time()
			cHAIn[c].comma = (cHAIn[c].comma or 0) + cm
			cHAIn[c].pos = math.floor(((cHAIn[c].pos or 0) + cnt + 1) / 2)
			if ((fl or c) ~= c) then
				cHAIn[c].follows = cHAIn[c].follows or {}
				cHAIn[c].follows[fl] = (cHAIn[c].follows[fl] or 0) + 1
			end
						
			if cnt == 0 then
				cHAIn[c].isFW = (cHAIn[c].isFW or 0) + 1
				fw = c
			elseif fw then
				cHAIn[c].fw = cHAIn[c].fw or {}
				cHAIn[c].fw[fw] = (cHAIn[c].fw[fw] or 0) + 1
			end
			
		end
		pr = nil
		fl = c
		chat = string.gsub(chat, s, "", 1)
		s = string.match(chat, "(%a+)")
		t = string.match(chat, "([%a][%w']*[%w]+)")
		u = string.match(chat, "(%a+), ")
		if s ~= "a" and s ~= "i" and s ~= "q" then
			if s ~= "a" then
				s = t
			end
		end
		
		cm = 0
		if s == u and s and u then
			cm = 1
			dbgMsg("ChattyChop:  comma✓ :: " .. tostring(s), 1)
		end
		--s = string.match(chat, "([%a][%w']*[%w]+)")
		if (c and s) then
			if not lockChain then
				pr = string.lower(s)
				cHAIn[c].precedes = cHAIn[c].precedes or {}
				cHAIn[c].precedes[pr] = (cHAIn[c].precedes[pr] or 0) + 1
			end
		end
		
		cnt = cnt + 1
	end
	if opt then
		lockChain = nil
	end
	func_time["ChattyChop"].END = os.time()
	func_track("ChattyChop")
	return salad
end

function doPhrash()
	if not Sys.Juju then
		return
	end
	local delay
	local ph
	if phrash and phrashDex and os.time() - phrashTime > phrashDelay then
		ph = phrasher[phrash][phrashDex]
		if ph then
			if type(ph) == "string" then
				if string.match(ph, "<w[a]?[i]?[t]?.(%d+.*)>") then
					phrashDelay = tonumber(string.match(ph, "<w[a]?[i]?[t]?.(%d+.*)>"))
					dbgMsg("doPhrash:  Delay :: " .. tostring(phrashDelay), 1)
					ph = string.gsub(ph, "(<w[a]?[i]?[t]?.(%d+.*)>)", "")
				end
				Game.SendChat(ph)
				phrashDex = phrashDex + 1
				phrashTime = os.time()
				if phrashDex > #phrasher[phrash] then
					phrashDex = 0
					phrash = nil
					phrashDelay = 1
				end
			end
		end
	end
	
end

--states top: bra = top; 

function Hoot()
	local tmp
	local x = 0
	dbgMsg(".Hoot.  X", 1)
	if CD[playerName].outfits[currentOutfit].bra > 0 then
		if CD[playerName].outfits[currentOutfit].braGlam ~= "" then
			tmp = (CD[playerName].outfits[currentOutfit].braGlam == Game.Player.Equipped.Body.GlamName)
			if tmp == false then
				phrasher.hoot[2] = "           \\v/"
			else
				phrasher.hoot[2] = "           `ω´"
			end
			x = x + 1
			--dbgMsg(".Hoot.  \\v/", 1)
		else
			tmp = (CD[playerName].outfits[currentOutfit].braName == Game.Player.Equipped.Body.ItemName)
			if tmp == false then
				phrasher.hoot[2] = "           \\v/"
			else
				phrasher.hoot[2] = "           `ω´"
			end
			x = x + 1
			--dbgMsg(".Hoot.  `ω´", 1)
		end
	else
		--dbgMsg(".Hoot.  (•Y•)", 1)
		phrasher.hoot[2] = "         (•Y•)"
	end
	if CD[playerName].outfits[currentOutfit].panties > 0 then
		if CD[playerName].outfits[currentOutfit].pantiesGlam ~= "" then
			tmp = (CD[playerName].outfits[currentOutfit].pantiesGlam == Game.Player.Equipped.Legs.GlamName)
			if tmp == false then
				phrasher.hoot[3] = "          ̆♡̆"
			else
				phrasher.hoot[3] = "          ¯▽¯"
			end
			x = x + 1
		else
			tmp = (CD[playerName].outfits[currentOutfit].pantiesName == Game.Player.Equipped.Legs.ItemName)
			if tmp == false then
				phrasher.hoot[3] = "          ̆♡̆"
			else
				phrasher.hoot[3] = "          ¯▽¯"
			end
			x = x + 1
		end
	else
		phrasher.hoot[3] = "        (^♥^)"
	end
	if CD[playerName].outfits[currentOutfit].nails > 0 then
		if CD[playerName].outfits[currentOutfit].nailsGlam ~= "" then
			tmp = (CD[playerName].outfits[currentOutfit].nailsGlam == Game.Player.Equipped.Hands.GlamName)
			if tmp == false then
				phrasher.hoot[4] = "          ̆Ω̆"
			else
				phrasher.hoot[4] = "          _∩_"
			end
			x = x + 1
		else
			tmp = (CD[playerName].outfits[currentOutfit].braName == Game.Player.Equipped.Body.ItemName)
			if tmp == false then
				phrasher.hoot[4] = "          ̆Ω̆"
			else
				phrasher.hoot[4] = "          _∩_"
			end
			x = x + 1
		end
	else
		phrasher.hoot[4] = "          ] ^ ["
	end
	if CD[playerName]["outfits"][currentOutfit]["facewear"] then
		if currentOutfitSet["facewear"] then
			phrasher.hoot[5] = "      ⌐■_■"
		else
			phrasher.hoot[5] = "        ◯▽◯"
		end
	else
		phrasher.hoot[5] = "        ◯▽◯"
	end
	if x < 1 then
		phrasher.hoot[1] = "     ~~"
	elseif x < 2 then
		phrasher.hoot[1] = "     ~~"
	elseif x < 3 then
		phrasher.hoot[1] = "     ~~"
	elseif x < 4 then
		phrasher.hoot[1] = "     ~~"
	end
end

function JujuHoodoo(txt, chn)
	dbgMsg(".JujuHoodoo.", 2)
	foodoo = string.match(txt, "juju (.+)$")
	if not Sys.Juju then
		return
	end
	local doorun = false
	if not foodoo or foodoo == "" then
		dbgMsg("JujuHoodoo:  OooOoo :: ", 9)
		return
	end
	dbgMsg("JujuHoodoo:  Test OooOoo :: " .. tostring(txt), 1)
	if string.find(foodoo, "phrasher") and not string.find(foodoo, "set") then
		foodoo = string.gsub(foodoo, "juju", "")
		foodoo = string.gsub(foodoo, "phrasher", "")
		foodoo = string.gsub(foodoo, "^%s*", "")
		if foodoo then
			if phrasher[foodoo] then
				phrash = foodoo
				phrashDex = 1
				phrashTime = os.time()
				phrashDelay = 1
				dbgMsg("JujuHoodoo:  Phrasher :: Start : " .. tostring(foodoo), 1)
				--phrashChn = chn
				--for k,v in pairs(phrasher[foodoo]) do
					--if type(v) == "string" then
						--Game.SendChat(tostring(v))
					--end
				--end
			end
		end
	elseif txt == "juju hoot" then
		Hoot()
		phrash = "hoot"
		phrashDex = 1
		phrashTime = os.time()
		phrashDelay = 1
		dbgMsg("JujuHoodoo:  Phrasher :: Hoot : ", 1)
	else
		dbgMsg("JujuHoodoo:  Trace :: " .. tostring(foodoo), 1)
		local funCoo = nil
		local bo = "return "
		local be = ""
		local preef = " hoodoo ∞ "
		local mo = Game.Player.FieldMouseOverTarget.Name or Game.Player.MouseOverTarget.Name
		
		--local func, oopsoo = load("return "..foodoo)
		--if string.find(foodoo, "%*set%*") then
		if string.find(foodoo, "%*set%*") then
			foodoo = string.gsub(foodoo, "(%*set%*)", "")
			--foodoo = string.gsub(foodoo, "(set)", "")
			foodoo = string.gsub(foodoo, "^%s*", "")
			bo = ""
			be = " return \"'As you wish " .. appellation .. "...'\""
			if domiMood then
				preef = " ◯"..gewgaw[domiMood].."◯ "
			else
				preef = " ◯▽◯ "
			end
			dbgMsg("JujuHoodoo:  *set* :: " .. tostring(foodoo), 1)
		elseif _g.cups then
			foodoo = string.gsub(foodoo, "%[t%]", "['" .. tostring(Game.Player.Target.Name) .. "']")
			foodoo = string.gsub(foodoo, "%[me%]", "['" .. tostring(playerName) .. "']")
			foodoo = string.gsub(foodoo, "%[mo%]", "['" .. tostring(mo) .. "']")
			foodoo = string.gsub(foodoo, "%[f%]", "['" .. tostring(Game.Player.FocusTarget.Name) .. "']")
		end
		if string.find(foodoo, "%*run%*") then
			foodoo = string.gsub(foodoo, "(%*run%*)", "")
			--foodoo = string.gsub(foodoo, "(set)", "")
			foodoo = string.gsub(foodoo, "^%s*", "")
			bo = "return "
			be = ""
			--foodoo = " " .. foodoo
			local func, oopsoo = load(bo..foodoo..be)
			if func then
				funCoo = {pcall(func)}
			end
			dbgMsg("JujuHoodoo:  *run* foodoo :: " .. tostring(foodoo), 1)
			if funCoo then
				foodoo = funCoo[2]
				dbgMsg("JujuHoodoo:  *run* funCoo.1 :: " .. tostring(funCoo[1]), 1)
				dbgMsg("JujuHoodoo:  *run* funCoo.2 :: " .. tostring(funCoo[2]), 1)
			else
				foodoo = "return 'Could not load function..'"
			end
			doorun = true
			dbgMsg("JujuHoodoo:  *run* foodoo.. :: " .. tostring(foodoo), 1)
		end
		if foodoo then
			local func, oopsoo = load(bo..foodoo..be)
			if func then
				funCoo = {pcall(func)}
			end
		end
		--dbgMsg("JujuHoodoo:  hoohoo :: " .. tostring(foodoo), 9)
		if oopsoo then
			Game.SendChat("/useitem 32861")
			dbgMsg("JujuHoodoo:  oopsoo :: " .. tostring(oopsoo), 1)
		end
		
		if type(funCoo) == "table" then
			--dbgMsg("JujuHoodoo:  funCoo :: " .. tostring(funCoo[1]), 9)
			--dbgMsg("JujuHoodoo:  funCoo :: " .. tostring(funCoo[2]), 9)
			if not funCoo[2] then
				if chn then
					lockChain = true
					Game.SendChat("/" .. string.lower(chn) .. preef .. tostring(funCoo[2]))
				else
					Game.SendChat("/e" .. preef .. tostring(funCoo[2]))
				end
				--Game.SendChat("/useitem 32860")
				--Game.SendChat("/wait 1.5")
				--Game.SendChat("/no")
			else
				if not doorun then
					--Game.SendChat("/yes <wait.1>")
				end
				
				if type(funCoo[2]) == "function" then
					local x, o = {pcall(funCoo[2])}
					if type(x) == "table" then
						if chn then
							lockChain = true
							Game.SendChat("/" .. string.lower(chn) .. preef .. tostring(x[2]))
							
						else
							Game.SendChat("/e" .. preef .. tostring(x[2]))
						
						end
						
					end
				else
					if chn then
						--dbgMsg("JujuOut: " .. string.lower(chn) .. " HooDoo JuJu  " .. tostring(funCoo[2]), 1)
						--dbgMsg("JujuHoodoo:  doorunfoo :: " .. tostring(doorun), 1)
						
						if doorun == true then
							foodoo = tostring(funCoo[2])
							func, oopsoo = load(foodoo)
							dbgMsg("JujuHoodoo:  doorunfoo :: " .. tostring(foodoo), 1)
							if func then
								funCoo = {pcall(func)}
							end
							if oopsoo then
								Game.SendChat("/useitem 32861")
								dbgMsg("JujuHoodoo:  oopsoo :: " .. tostring(oopsoo), 9)
							end
							--local x, o = {pcall(funCoo[2])}
							--x, o = {pcall(funCoo[2])}
							--Game.SendChat("/e" ..  preef .. tostring(funCoo[2]))
							lockChain = true
							Game.SendChat("/" .. string.lower(chn) .. preef .. tostring(funCoo[2]))
						else
							--Game.SendChat("/e" ..  preef .. tostring(funCoo[2]))
							lockChain = true
							Game.SendChat("/" .. string.lower(chn) .. preef .. tostring(funCoo[2]))
						end
						
					else
						Game.SendChat("/e" ..  preef .. tostring(funCoo[2]))
					end
				end
			end
		end
	end
	
end

function Expense(txt, chn, toss)
	dbgMsg(".Expense.", 2)
	dbgMsg("Expense: txt :: " .. tostring(txt), 1)
	dbgMsg("Expense: toss :: " .. tostring(toss), 1)
	if not validSysChan[chn] then
		dbgMsg("Expense: invalid (chn) :: " .. tostring(chn), 1)
		--return
	end
	if toss == "You purchase" or toss == "You spent" then
		lastPurchase = txt
		local gilamt = currentGil - Game.Player.GetGil()
		if gilamt == 0 then
			if lastGil then
				gilamt = lastGil - Game.Player.GetGil()
			end
		end
		txt = string.gsub(txt, toss, "")
		txt = string.gsub(txt, " ", "")
		txt = string.gsub(txt, "a ", "")
		txt = string.gsub(txt, "an ", "")
		txt = string.gsub(txt, "", "")
		
		local val = string.match(txt, "(%d+,?%d+,?%d*)")
		if not val then
			val = string.match(txt, "(?%d+,?%d*)")
		end
		if not val then
			val = string.match(txt, "(%d+)")
		end
		--dbgMsg("Windfall: val :: " .. tostring(val), 1)
		--dbgMsg("Windfall: key :: " .. tostring(txt), 1)
		if val then
			txt = string.gsub(txt, val, "")
			--txt = string.gsub(txt, " ", "")
			txt = string.gsub(txt, "%.", "")
			val = tonumber(val)
		else
			val = 1
		end
		
		
		
		--local val = string.match(txt, "(%d+,?%d+,?%d*)")
		if not val then
			val = 0
		end
		--dbgMsg("Market: Item :: " .. tostring(txt), 1)
		txt = string.gsub(txt, "a copy of ", "")
		txt = string.gsub(txt, "fistfuls of ", "")
		txt = string.gsub(txt, "vials of ", "")
		txt = string.gsub(txt, "bottles of ", "") 
		
		local tmp = ChattyChop(txt, not validChainChn[chn])
		
		if not tmp or type(tmp) ~= "table" then
			dbgMsg("Expense: ERROR! .. :: " .. tostring(tmp), 1)
			tmp = {}
		end
		
		txt = ""
		
		for i,v in ipairs(tmp) do
			txt = txt .. v
			if i < #tmp then
				txt = txt .. " "
			end
		end
		--dbgMsg("Market: chopped :: " .. tostring(txt), 1)
		
		CD[playerName]["purchases"][txt] = CD[playerName]["purchases"][txt] or {}
		CD[playerName]["purchases"][txt].total = CD[playerName]["purchases"][txt].total or 0
		CD[playerName]["purchases"][txt].total = CD[playerName]["purchases"][txt].total + val
		CD[playerName]["purchases"][txt].cost = CD[playerName]["purchases"][txt].cost or 0
		CD[playerName]["purchases"][txt].cost = CD[playerName]["purchases"][txt].cost + gilamt
		
		dbgMsg("Expense: key :: " .. tostring(txt), 1) 
		dbgMsg("Expense: val :: " .. tostring(val), 1) --Chloe had it backwards
		dbgMsg("Expense: cost :: " .. tostring(gilamt), 1)
		return
	end
end

function cookTheBooks()
	local x = 0
	local tb = tcopy(CD[playerName]["earnings"])
	CD[playerName]["earnings"] = {}
	for k,v in pairs(tb) do
		if not validEarnings[k] then
			x = x + 1
		else
			CD[playerName]["earnings"][k] = v
		end
	end
	if x > 0 then
		return "The books have been cooked and " .. tostring(x) .. " invalid keys were removed!"
	else
		return "All keys found to be valid, the books do not need cooking."
	end
end

function Windfall(txt, chn, toss)
	dbgMsg(".Windfall.", 2)
	if sysTrack["windfall"] then
		dbgMsg("Windfall: txt :: " .. tostring(txt), 2, "windfall")
	end
	--dbgMsg("Windfall: toss :: " .. tostring(toss), 1)
	if not validSysChan[chn] then
		dbgMsg("Windfall: invalid (chn) :: " .. tostring(chn), 1)
		--return
	end
	--for 85 gil.
	if toss == "You obtain" or toss == "You gain" or toss == "You earn" then
		lastWindfall = txt
		txt = string.gsub(txt, toss, "")
		txt = string.gsub(txt, "a ", "")
		txt = string.gsub(txt, "an ", "")
		txt = string.gsub(txt, " ", "")
		
		--local val = string.match(txt, "(%d+)")
		--local val = string.match(txt, "(%d+,?%d*)")
		local val = string.match(txt, "(%d+,?%d+,?%d*)")
		if not val then
			val = string.match(txt, "(?%d+,?%d*)")
		end
		if not val then
			val = string.match(txt, "(%d+)")
		end
		
		--dbgMsg("Windfall: val :: " .. tostring(val), 1)
		--dbgMsg("Windfall: key :: " .. tostring(txt), 1)
		if val then
			txt = string.gsub(txt, val, "")
			--txt = string.gsub(txt, " ", "")
			txt = string.gsub(txt, "%.", "")
			val = tonumber(val)
		else
			val = 1
		end
		local tmp = ChattyChop(txt, not validChainChn[chn])
		if not tmp then
			dbgMsg("Windfall: ERROR!", 1)
			tmp = {}
		end
		txt = ""
		for i,v in ipairs(tmp) do
			txt = txt .. v
			if i < #tmp then
				txt = txt .. " "
			end
		end
		--txt = string.gsub(txt, "(^%s*)", "")
		--txt = ChattyChop(txt)
		
		--txt = string.gsub(txt, " ", "")
		--txt = string.gsub(txt, " ", "")
		
		if validEarnings[txt] then
			if sysTrack["windfall"] then
				dbgMsg("Windfall: valid ✓", 1, "windfall")
			end
			CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] or 0
			CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] + val
		end
		
		if not Occupied and not safe then
			if val < 10000 and val > 1000 then
				DoRandom("surprised", "pleased by recent windfall.")
			elseif val > 10000 then
				DoRandom("cheer", "astonished by recent windfall.")
			elseif val > 100000 then
				UseItem(8214)
			end
		end
		
		windfallTime = os.time()
		
		if sysTrack["windfall"] then
			dbgMsg("Windfall: key :: " .. tostring(txt), 1, "windfall") 
			dbgMsg("Windfall: val :: " .. tostring(val), 1, "windfall") --Chloe had it backwards
			return
		end
	elseif string.find(txt, "You sell") and (string.find(txt, " gil.") or string.find(txt, " gil.")) then
		lastSale = txt
		local cnt = string.match(txt, "^You sell (%d+) ")
		txt = string.gsub(txt, "You sell a ", "")
		txt = string.gsub(txt, "You sell (%d+) ", "")
		txt = string.gsub(txt, "You sell ", "")
		--txt = string.gsub(txt, "handfuls of", "")
		
		if cnt then
			cnt = tonumber(cnt)
			--txt = string.gsub(txt, "^The (%d+) ", "")
		else
			cnt = 1
		end
		
		local sale = string.match(txt, "(%d+,?%d+,?%d*)")
		if not sale then
			sale = string.match(txt, "(?%d+,?%d*)")
		end
		if not sale then
			sale = string.match(txt, "(%d+)")
		end
		if not sale then
			sale = 0
		end
		
		txt = string.gsub(txt, sale, "")
		sale = tonumber(sale)
		salesTotal = salesTotal + sale
		
		if sysTrack["windfall"] or sysTrack["gil"] then
			dbgMsg("Windfall: cnt :: " .. tostring(cnt), 1, {"windfall", "gil"})
			dbgMsg("Windfall: sale :: " .. tostring(sale), 1, {"windfall", "gil"})
		end
		txt = string.gsub(txt, "(for  gil.)", "")
		txt = string.gsub(txt, "(.+ of )", "")
		--txt = string.gsub(txt, "you put up for sale in the (%a+) markets ", "")
		
		if sysTrack["windfall"] or sysTrack["gil"] then
			dbgMsg("Windfall: txt :: " .. tostring(txt), 1, {"windfall", "gil"})
		end
		
		
		CD[playerName].sales = CD[playerName].sales or {}
		CD[playerName].sales[txt] = CD[playerName].sales[txt] or 0
		CD[playerName].sales[txt] = CD[playerName].sales[txt] + sale
		if sale > 7777 then
			Report(lastSale)
		end
	elseif (chn == "RetainerSale" or chn == "say" or chn == "l2") and string.find(txt, "you put up for sale") then
		--dbgMsg("Windfall: txt :: " .. tostring(txt), 1)
		lastSale = txt
		txt = string.gsub(txt, "handfuls of", "")
		txt = string.gsub(txt, ",", "")
		--txt = string.gsub(txt, "handfuls of", "")
		
		--local cnt = string.match(txt, "^The (%d+) ")
		local cnt = string.match(txt, "^The (%d+) ")
		if cnt then
			cnt = tonumber(cnt)
			txt = string.gsub(txt, "^The (%d+) ", "")
		else
			cnt = 1
		end
		
		local sale = string.match(txt, "(%d+,?%d+,?%d*)")
		if not sale then
			sale = string.match(txt, "(?%d+,?%d*)")
		end
		if not sale then
			sale = string.match(txt, "(%d+)")
		end
		if not sale then
			sale = 0
		end
		
		sale = tonumber(sale)
		salesTotal = salesTotal + sale
		
		if sysTrack["windfall"] or sysTrack["gil"] then
			dbgMsg("Windfall: cnt :: " .. tostring(cnt), 1, {"windfall", "gil"})
			dbgMsg("Windfall: sale :: " .. tostring(sale), 1)
		end
		txt = string.gsub(txt, "you put up for sale in the (%a+) markets ", "")
		if sysTrack["windfall"] or sysTrack["gil"] then
			dbgMsg("Windfall: txt :: " .. tostring(txt), 1, {"windfall", "gil"})
		end
		
		if sale > 7777 then
			Report(lastSale)
		end
		--CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] or 0
		--CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] + val
		--have sold for 12,921 gil (after fees).
	elseif chn == "2242" and string.find(txt, "You synthesize") then
		--dbgMsg("Windfall: txt :: " .. tostring(txt), 1)
		lastCraft = txt
		txt = string.gsub(txt, "You synthesize", "")
		txt = string.gsub(txt, "(^%a*)", "")
		local x = string.match(txt, "(%d+)")
		if not x then
			x = 1
			--txt = string.gsub(txt, "(^[a]? )", "")
		else
			txt = string.gsub(txt, "(%d+)", "")
		end
		
		txt = string.gsub(txt, "(%d+)", "")
		txt = string.gsub(txt, "(%a+ of)", "")
		txt = string.gsub(txt, "", "")
		txt = string.gsub(txt, "%.", "")
		txt = string.gsub(txt, "^%s*(.-)", "%1")
		--txt = string.gsub(txt, "(^%s+)", "")
		CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] or 0
		CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] + x
		
		if string.find(txt, " ") then
			x = x * 3
			txt = string.gsub(txt, " ", "")
		end
		if playerTraits.aetheric then
			EmoGyre("energized", x*3.69)
			EmoGyre("focused", x)
		end
		EmoGyre("aetheric", -x*7)
		EmoGyre("responsible", 7)
		if sysTrack["windfall"] then
			dbgMsg("Windfall Craft: x :: " .. tostring(x), 1, "windfall")
		end
		Moodle("-AetherSpriggan-", "apply", "self", "buffs", "default")
		if sysTrack["windfall"] then
			dbgMsg("Windfall: |txt| :: " .. tostring(txt), 1, "windfall")
		end
	elseif string.find(txt, "MGP") then
		bits, bobs = string.match(txt, "(%d+,?%d*).+(MGP)")
		dbgMsg("MatchStick: Bits & Bobs :: " .. tostring(bits) .. " & " .. tostring(bobs), 1)
		if not bits then
			--4,800 (+60%) MGP.
			bits, bobs = string.match(txt, "(%d+,?%d*) %(%d%%%) (MGP)")
		end
	--if not bobs then
		--bits, bobs = string.match(txt, "(%d+,?%d*).*([%a]+)")
	--end
		if bits and bobs then
			dbgMsg("MatchStick: Bits & Bobs :: " .. tostring(bits) .. " & " .. tostring(bobs), 9)
			if bobs == "MGP" then
				bits = tonumber(bits)
				if bits then
					if bits >= 8000 then
						CallRoutine("hoot-n-holler")
					elseif bits >= 4000 then
						DoRandom("cheer")
					elseif bits >= 1000 then
						DoRandom("clap")
					end
				end
			end
		end
	end
end

function ProgHandler(txt, toss, chn)
	dbgMsg("ProgHandler :: " .. tostring(txt), 1)
	if not validSysChan[chn] then
		dbgMsg("ProgHandler: invalid (chn) :: " .. tostring(chn), 1)
		return
	end
	lastProg = txt
	if string.find(txt, "Gold Star rating") then
		Moodle("GoldStar", "apply", "self", "buffs", "default")
		playerProg.GoldStar = playerProg.GoldStar + 1
		EmoGyre("aetheric", -17.7)
		Moodle("-AetherSpriggan-", "apply", "self", "buffs", "default")
		EmoGyre("responsible", 7)
		EmoGyre("confident", 7)
		if os.time() - (lastCheer or 0) > 444 then
			DoRandom("cheer", " moved by excellent performance.")
			lastCheer = os.time()
		end
	elseif string.find(txt, "Silver Star rating") then
		Moodle("SilverStar", "apply", "self", "buffs", "default")
		playerProg.SilverStar = playerProg.SilverStar + 1
		EmoGyre("aetheric", -13.3)
		Moodle("-AetherSpriggan-", "apply", "self", "buffs", "default")
		EmoGyre("responsible", 3)
		EmoGyre("confident", 3)
		if os.time() - (lastClap or 0) > 333 then
			DoRandom("clap", " from a job well done.")
			lastClap = os.time()
		end
		
	elseif string.find(txt, "Bronze Star rating") then
		Moodle("BronzeStar", "apply", "self", "buffs", "default")
		playerProg.BronzeStar = playerProg.BronzeStar + 1
		EmoGyre("embarrased", 12.3)
		EmoGyre("responsible", 1)
		EmoGyre("confident", -1)
		DoRandom("shrug", " meh.")
	elseif string.find(txt, "You submitted") or string.find(txt, "You earned a score") or
		string.find(txt, "experience points") then
		Moodle("BusyBee", "apply", "self", "buffs", "default")
		--playerProg.SilverStar = playerProg.SilverStar + 1
		local val = string.match(txt, "(%d+,?%d+,?%d*)")
		if tonumber(val) then
			local adj = 3.71
			if string.find(txt, "experience") then
				txt = "Experience"
				adj = (val / Game.Player.Level) * 0.00477
			elseif string.find(txt, "points") then
				adj = (val / Game.Player.Level) * 0.17
				txt = "Points"
			elseif string.find(txt, "score") then
				adj = (val / Game.Player.Level) * 0.017
				txt = "Score"
			else
				txt = "Unknown"
			end
			if adj > 77 then
				dbgMsg("ProgHandler: value > limit (adj) :: " .. tostring(adj), 1)
				adj = 77
			end
			playerProg[txt] = playerProg[txt] or 0
			playerProg[txt] = playerProg[txt] + val * adj
			EmoGyre("aetheric", val * -0.0369)
			Moodle("-AetherSpriggan-", "apply", "self", "buffs", "default")
			EmoGyre("responsible", adj)
		end
	elseif string.find(txt, "You refreshed the stable") then
		playerProg["refresheded stable"] = playerProg["refresheded stable"] or 0
		playerProg["refresheded stable"] = playerProg["refresheded stable"] + 1
		EmoGyre("responsible", 29)
	elseif string.find(txt, "received a player commendation") then
		playerProg["commendation"] = playerProg["commendation"] or 0
		playerProg["commendation"] = playerProg["commendation"] + 1
		EmoGyre("responsible", 69)
	elseif string.find(txt, "Sightseeing log entry") then
		playerProg["sightseeing log"] = playerProg["sightseeing log"] or {}
		local val = string.match(txt, "“(%d+)”")
		playerProg["sightseeing log"][val] = formatTime(os.time())
		bubbleBuff = os.time()
		Report(txt)
		dbgMsg("ProgHandler: log entry :: " .. tostring(val), 1)
	elseif string.find(txt, "You attain level") then
		UseItem(8215)
	elseif string.find(txt, "upgrading your tool") then
		EmoGyre("responsible", 11)
		EmoGyre("confident", 11)
	end
end

function SharkHandler()
	CallRoutine("babysharkgirl")
end

function Crystal(txt, chn, toss)
	if chn == "2114" then
		dbgMsg("Crystal: txt :: " .. tostring(txt), 1)
		local crystal
		local amt = string.match(txt, "(%d+)")
		if string.find(txt, "crystal") then
			crystal = 2
		elseif string.find(txt, "shard") then
			crystal = 1
		elseif string.find(txt, "cluster") then
			crystal = 3
		end
		amt = amt * 0.77 * crystal
		EmoGyre("aetheric", -amt)
		if playerTraits.aetheric then
			EmoGyre("energized", amt*3.69)
			EmoGyre("focused", amt)		
		else
			EmoGyre("energized", -amt/3)
			EmoGyre("focused", -amt)
		end
		if emoState.aetheric < 13 then
			EmoGyre("dazed", amt/3)
		end
		--if emoState.focused < 17 then
			--EmoGyre("dazed", amt)
		--end
		dbgMsg("Crystal: amt :: " .. tostring(amt), 1)
		Moodle("Aether+", "apply", "self", "buffs", "default")
	end
end

function Report(txt)
	if not playerTraits.gossiper then
		dbgMsg("Report: You do not have the 'gossiper' trait", 1)
		return
	end
	if (os.time() - lastGossip) < gossipCD then
		dbgMsg("Report: lastGossip :: " .. tostring(os.time() - lastGossip) .. " :|: gossipCD :: " .. tostring(gossipCD), 1)
		return
	end
	lastGossip = os.time()
	txt = Blimey(txt)
	Game.SendChat("/fc " .. txt)
	Game.SendChat("/fc Reporting from <pos>.")
end

function ConsumableHandler(txt, chn, toss)
	lastConsumed = txt
	txt = string.gsub(txt, toss, "")
	txt = string.gsub(txt, " ", "")

	CD[playerName]["diet"][txt] = CD[playerName]["diet"][txt] or 0
	CD[playerName]["diet"][txt] = CD[playerName]["diet"][txt] + 1

end

function StartTour(txt)
	local map = Game.Player.MapZone
	local dis
	local key = "A"
	local dx = 1
	local best = 7777
	if beacons[map] then
		if beacons[map].beacon and beacons[map].confluences then
			for i,v in pairs(beacons[map].confluences) do
				dis = GetBeaconDistance(v)
				if dis < best then
					best = dis
					key = v
					dx = i
				end
			end
		end
	end
	if key then
		beacons[map].curCur = dx
		MoveToBeacon(key)
	end
end

function LettuceLoad()
	SG = {}
	local x = 1
	local row = 1
	for k,v in pairs(cHAIn) do
		SG[row] = SG[row] or {}
		table.insert(SG[row], k)
		x = x + 1
		if x > 17 then
			row = row + 1
			x = 1
		end
	end
	rWs = row
	for i=1, 17 do
		shiftSG(i, i, Gyre.black[1])
	end
	
	dbgMsg("∫LettuceLoad∫ •‡• Loaded!", 1)
end

function chaiNLength()
	local n = 0
	for k,v in pairs(cHAIn) do
		n = n + 1
	end
	return n
end

function shiftSG(row, col, amt)
	local tmpA = tcopy(SG)
	--local rws = 1 + math.floor((ChL - 1) / 17)
	local dxPtr
	if row ~= 0 then
		for i = 1, 17 do
			dxPtr = i + amt - 17 * ((i + amt > 17) and 1 or 0)
			SG[row][dxPtr] = tmpA[row][i]
		end
	end
	if col ~= 0 then
		--dbgMsg("∫shiftSG∫ •‡• col: " .. tostring(col) .. " •‡• amt: " .. tostring(amt), 1)
		for i = 1, rWs do
			dxPtr = i + amt - rWs * ((i + amt > rWs) and 1 or 0)
			if not tmpA[i] then
				tmpA[i] = {}
			end
			if not tmpA[i][col] then
				--dbgMsg("∫shiftSG∫ •‡• booger: " .. tostring(i) .. " •‡• dxPtr: " .. tostring(dxPtr), 1)
				tmpA[i][col] = "booger" -- Keep a full table and you wont get boogers in your salad. ~Sandy Skittles
			end
			if dxPtr < 1 then
				dxPtr = rWs + dxPtr
				--dbgMsg("∫shiftSG∫ •‡• dxPtr: " .. tostring(dxPtr), 1)
			end
			if not SG[dxPtr] then
				dbgMsg("∫shiftSG∫ •‡• dxPtr: " .. tostring(dxPtr), 1)
				SG[dxPtr] = SG[dxPtr] or {}
			end
			SG[dxPtr][col] = tmpA[i][col]
		end
	end
end

function TossSalad()
	--local rws = 1 + math.floor((ChL - 1) / 17)
	--local sv = Gyre.black[3]
	--local ln = 3 + Gyre.red[4]
	--local brk = 0
	--local tomato = ""
	--local salt
	local salt = math.random(1,77)
	--if not lastWord then
		--lastWord = SG[toSSit][9]
	--end
	if not cHAIn[SG[toSSit][9]].precedes then
		shiftSG(toSSit, 0, 1)
	elseif not lastWord then
		toMAto = SG[toSSit][9] .. " "
		lastWord = SG[toSSit][9]
		dbgMsg("∫TossSalad∫ •‡• firstWord: " .. tostring(lastWord) .. " <se.1>", 1)
		
		toSSit = toSSit + 1
	elseif not cHAIn[lastWord].precedes[SG[toSSit][9]] then
		--dbgMsg("∫TossSalad∫ •‡• " .. tostring(SG[toSSit][9]) .. " <•‡•> " .. tostring(SG[toSSit+1][9]), 1)
		if salt > 53 then
			shiftSG(toSSit, 0, 1)
		elseif salt > 47 then
			shiftSG(0, 8, 2)
			shiftSG(0, 10, 2)
			shiftSG(toSSit, 0, -1)
		elseif salt > 37 then
			shiftSG(0, 7, 1)
			shiftSG(0, 11, 1)
			shiftSG(toSSit, 0, -2)
		elseif salt > 29 then
			shiftSG(0, 6, 3)
			shiftSG(0, 12, 3)
			shiftSG(toSSit, 0, -3)
		elseif salt > 19 then
			shiftSG(0, 5, 4)
			shiftSG(0, 13, 4)
			shiftSG(toSSit, 0, -4)
		elseif salt > 9 then
			shiftSG(0, 8, 1)
			shiftSG(0, 10, -1)
			shiftSG(toSSit, 0, -1)
		else
			--shiftSG(0, 9, salt)
		end
	else
		
		--if toMAto == "" then
			--toMAto = SG[toSSit][9] .. " "
		--end
		toMAto = toMAto .. SG[toSSit][9] .. " "
		lastWord = SG[toSSit][9]
		--lastWord = SG[toSSit+1][9]
		
		dbgMsg("∫TossSalad∫ •‡• " .. tostring(SG[toSSit][9]) .. " <se.7>", 1)
		
		toSSit = toSSit + 1
		--lastWord = SG[toSSit][9]
		if toSSit > leTTuce or not cHAIn[lastWord].precedes then
			toSSit = nil
			Game.SendChat(tostring(toMAto))
		end
	end
	
	
	
	toSSes = toSSes + 1
	
	if IsPrime(toSSes) then
		dbgMsg("∫TossSalad∫ •‡• " .. tostring(lastWord) .. " <•‡•> " .. tostring(SG[toSSit][9]), 1)
		--dbgMsg("∫TossSalad∫ •‡• " .. tostring(SG[toSSit][9]), 1)
	end
	

	--dbgMsg("∫TossSalad∫ •‡• " .. tostring(toMAto), 1)
	--return toSSit
	--shiftSG(3, 0, -3)
	--dbgMsg("∫TossSalad∫ •‡• " .. tostring(SG[3][9]), 1)
end

function SpinTheBowl(n)
	dbgMsg("∫SpinTheBowl∫ • get ready for the spike!✓", 1)
	local row,col
	for i=1, rWs do
		for j=1, 17 do
			if SG[i][j] == n then
				row = i
				col = j
				break
			end
		end
		if row then
			dbgMsg("∫SpinTheBowl∫ • break chk✓", 1)
			break
		end
	end
	for i=1, 17 do
		shiftSG(0, i, 1 - row)
	end
	dbgMsg("∫SpinTheBowl∫ • shift rows✓", 1)
	for i=1, rWs do
		shiftSG(i, 0, 9 - col)
	end
	dbgMsg("∫SpinTheBowl∫ • shift columns✓", 1)
end

function SaladGyre(n, chn)
	--dbgMsg("∫SaladGyre∫ •", 1)
	runGyreMethod("black-snake")
	if not SG or (ChL or 0) ~= chaiNLength() then
		ChL = chaiNLength()
		LettuceLoad()
	end
	
	--local rws = 1 + math.floor((ChL - 1) / 17)
	--local sv = Gyre.black[3]
	--local ln = 3 + Gyre.red[4]
	
	--rWs = 1 + math.floor((ChL - 1) / 17)
	leTTuce = 2 + Gyre.red[4]
	if leTTuce > 17 then
		leTTuce = 11
	end
	
	if cHAIn[n] then
		SpinTheBowl(n)
	else
		shiftSG(1, 0, 1)
	end
	
	lastWord = nil
	toSSes = 1
	saLad = Gyre.black[3]
	toMAto = ""
	toSSit = 1
	
	--local bowl = TossSalad()
	--Game.SendChat("/" .. string.lower(chn) .. " " .. bowl)
	--dbgMsg("∫SaladGyre∫ Tossed •", 1)
	--dbgMsg("∫SaladGyre∫ • toss salad •‡• " .. tostring(SG[1][9]), 1)
	
end

function Proclaim(n, chan)
	local jot = ""
	local cnt = 1
	local pot, hot, dot, spot, snot, shot, quot, wot, bot, cot, sot, rot
	local plot, slot, snp, trot, itshit, got, lot
	local idx = 0
	local lmX = 7
	local cX = 0
	
	runGyreMethod("black-snake")
	Moodle("Aetheric++", "apply", "self", "buffs", "default")
	EmoGyre("aetheric", 27)
	
	if type(n) == "string" then
		if string.contains(n, " ") then
			jot = n
			n = n:match("%w+$")
			jot = string.gsub(jot, n, "")
			lot = jot:match("(%w+) $")
		end
	end
	
	if not n then
		n = 27
	elseif not tonumber(n) then
		--dbgMsg("∫Proclaim∫ • n •‡• " .. tostring(n), 1)
		if #n > 0 then
			shot = n
			--dbgMsg("∫Proclaim∫ • shot •‡• " .. tostring(cHAIn[shot]), 1)
			if playerTraits.spriggan then
				n = 3 + Gyre.yellow[1]
				--dbgMsg("∫Proclaim∫ • ∫prig~ [ylw] •‡• " .. tostring(n), 1)
				if n > 17 then
					n = n - Gyre.red[6]
					--dbgMsg("∫Proclaim∫ • ∫prig~ [red] •‡• " .. tostring(n), 1)
				end
				if n < 7 then
					n = n + Gyre.white[6]
					--dbgMsg("∫Proclaim∫ • ∫prig~ [grn] •‡• " .. tostring(n), 1)
				end
				if n > 17 then
					n = n - Gyre.blue[4]
					--dbgMsg("∫Proclaim∫ • ∫prig~ [wht] •‡• " .. tostring(n), 1)
				end
				if n < 7 or n > 17 then
					n = 7
				end
				--dbgMsg("∫Proclaim∫ • ∫prig~n •‡• " .. tostring(n), 1)
			else
				n = 13
			end
		else
			n = 9
		end
	else
		n = tonumber(n)
	end
	
	dbgMsg("∫Proclaim∫ • -n- •‡• " .. tostring(n), 1)
	
	lmX = n
	
	chan = chan or "fc"
	wot = {}
	
	for k,v in pairs(cHAIn) do
		idx = idx + 1
		wot[idx] = k
	end
	
	disco = math.floor((Gyre.blue[2] + Gyre.green[3]) / 3)
		
	if disco < 3 then
		disco = Gyre.blue[2] + Gyre.green[3]
	end
	
	while disco > 11 do
		disco = disco - 7
	end
	
	repeat
		hot = 0
		pot = nil
		if cnt == 1 and shot then
			pot = shot
			spot = pot
			--lot
			dbgMsg("∫Proclaim∫ • pot shot •‡• " .. tostring(pot), 1)
		elseif cnt == 1 then
			repeat
				cX = cX + 1
				dot = math.random(1, idx)
				--dbgMsg("∫Proclaim∫ • wot •‡• " .. tostring(wot[dot]), 1)
				if cHAIn[wot[dot]] then
					if cHAIn[wot[dot]].precedes then
						pot = wot[dot]
					end
					dbgMsg("∫Proclaim∫ • |wot| •‡• " .. tostring(pot), 1)
				end
			until (pot or cX > 7)
		else
			if cHAIn[spot] then
				if cHAIn[spot].precedes then
					dot = 0.5
					snot = 0.5
					rot = 1 + math.floor(Gyre.blue[5] * 0.1)
					bot = 1
					trot = Gyre.black[4]
					itshit = 0
					for k,v in pairs(cHAIn[spot].precedes) do
						if v > dot and (v / dot < 777 or math.random(1,100) > 44) and k ~= spot then
							quot = 0
							
							if cHAIn[k] then
								slot = 7
								if cHAIn[k].time then
									slot = math.floor((os.time() - cHAIn[k].time) / 369)
								end
								if cHAIn[k].precedes then
									for o,p in pairs(cHAIn[k].precedes) do quot = quot + 1 end
								end
								if not string.contains(jot, k .. " ") or math.random(1,77) > 44 then
									if playerTraits.aetheric and cHAIn[k].link > snot and Gyre.black[1] > 23 and slot > 7 then
										bot = quot
										dot = v
										pot = k
										if emoState.aetheric < 366 then
											snot = cHAIn[k].link - math.floor(emoState.aetheric / 66)
										else
											snot = cHAIn[k].link + math.floor(emoState.aetheric / 66)
										end
										dbgMsg("∫Proclaim∫ • aetheric •" .. pot .. " •‡• snot: " .. tostring(snot) .. " •‡• cnt: " .. tostring(cnt), 1)
									elseif cHAIn[k].follows[spot] > 11 + slot + trot then
										pot = k
										trot = cHAIn[k].follows[spot] + 17
										rot = rot - cHAIn[k].follows[spot] * 0.37
										dbgMsg("∫Proclaim∫ • follower •" .. pot .. " •‡• " .. tostring(cHAIn[k].follows[spot]) .. " •‡• cnt: " .. tostring(cnt), 1)
									elseif diff(cHAIn[k].pos, cnt) < rot then
										pot = k
										rot = diff(cHAIn[k].pos, cnt)
										dbgMsg("∫Proclaim∫ • " .. pot .. " •‡• rot: " .. tostring(rot) .. " •‡• cnt: " .. tostring(cnt), 1)
										--rot = 
									elseif rot > 3 and cHAIn[k].link > snot and quot >= math.random(1, bot) then
										bot = quot
										dot = v
										pot = k
										dbgMsg("∫Proclaim∫ • " .. pot .. " •‡• dot: " .. tostring(dot).. " •‡• bot: " .. tostring(bot) .. " •‡• cnt: " .. tostring(cnt), 1)
										snot = cHAIn[k].link + Gyre.yellow[3]
									elseif not cot then
										--if slot > 7 then
										
										cot = k
										dbgMsg("∫Proclaim∫ •‡• cot: " .. cot .. " •‡• cnt: " .. tostring(cnt) , 1)
										--end
									elseif slot > 7 then
										snot = snot - math.floor(Gyre.yellow[6] / 7)
										cot = k
										dbgMsg("∫Proclaim∫ • " .. cot .. " •‡• snot: " .. tostring(snot).. " •‡• cnt: " .. tostring(cnt), 1)
									end
								end
							end
						elseif not cot then
							dot = dot + Gyre.black[3] * 0.1
							if Gyre.red[6] < idx then
								sot = math.random(Gyre.red[6], idx)
								--dbgMsg("∫Proclaim∫ • red sot •‡• " .. tostring(sot), 1)
							else
								sot = math.random(1, idx)
								--dbgMsg("∫Proclaim∫ • sot •‡• " .. tostring(sot), 1)
							end
							
							cot = wot[sot]
							dbgMsg("∫Proclaim∫ • wot cot •‡• " .. tostring(cot) .. " •‡• cnt: " .. tostring(cnt), 1)
						end
						if cot or pot then
							itshit = itshit + 1
						end
						if itshit > 3 then
							dbgMsg("∫Proclaim∫ • break! •‡• cot: " .. tostring(cot) .. " •‡• pot: " .. tostring(pot) , 1)
							break
						end
					end
					
					

				else
					--
				end
			end
		end
		
		
		
		if ((matchsticks.strikes[pot] == "*PW*" or matchsticks.strikes[pot] == "*panic*") and cnt == 1) then
			lmX = lmX - 1
			dbgMsg("∫Proclaim∫ • (PW) •‡• " .. tostring(lmX), 1)
			--dbgMsg("∫Proclaim∫ • (pot) •‡• " .. tostring(pot), 1)
		elseif not pot and not cot then
			lmX = lmX - cnt
			dbgMsg("∫Proclaim∫ • not cot •‡• " .. tostring(lmX), 1)
		elseif not pot then
			spot = cot
			got = cot
			--jot = jot .. tostring(cot) .. " "
			snp = nil
			cnt = cnt + 1
			dbgMsg("∫Proclaim∫ • not pot •‡• " .. tostring(cot), 1)
		elseif cnt / disco == math.floor(cnt / disco) then
			dbgMsg("∫Proclaim∫ • (disco) •‡• " .. tostring(disco), 1)
			dbgMsg("∫Proclaim∫ • (cot) •‡• " .. tostring(cot), 1)
			if not cot then
				cot = pot
			end
			spot = cot
			got = cot
			
			--[[
			if Gyre.white[1] > 23 then
				jot = jot:sub(1, #jot - 1)
				jot = jot .. ", " .. tostring(cot) .. " "
			else
				jot = jot .. tostring(cot) .. ", "
			end
			]]--
			
			snp = nil
			cnt = cnt + 1
		elseif not cHAIn[pot] then
			lmX = lmX - 1
			dbgMsg("∫Proclaim∫ • pot not •‡• " .. tostring(pot), 1)
		elseif not cHAIn[pot].precedes and lmX > 1 then
			lmX = lmX - 1
			
			if cot and cot ~= pot then
				if cHAIn[cot].precedes then
					spot = cot
					got = cot
					--jot = jot .. cot .. " "
					cnt = cnt + 1
					lmX = lmX - cnt
				end
			end
			if snp then
				lmX = 0
				if pot then
					spot = pot
					got = pot
					--jot = jot .. pot .. " "
					cnt = cnt + 1
					dbgMsg("∫Proclaim∫ • end of chain •‡• " .. tostring(pot), 1)
					--lmX = lmX - cnt
				end
			else
				snp = 1
			end
			--if lmX == 0 then
				--spot = pot
				--jot = jot .. pot .. " "
				--cnt = cnt + 1
			--end
			--dbgMsg("∫Proclaim∫ • pot •‡• " .. tostring(pot), 1)
		else
			if cot and pot then
				if math.random(1,Gyre.white[2] + 7) > Gyre.yellow[3] + Gyre.black[4] then
					pot = cot
					dbgMsg("∫Proclaim∫ • pot-cot •‡• " .. tostring(cot) ..  " [WHT] •‡• " .. tostring(Gyre.white[2] + 7) .. " •‡•  [YLW] •‡• " .. tostring(Gyre.yellow[3] + Gyre.black[4]) , 1)
				end
			end
			spot = pot
			--dbgMsg("∫Proclaim∫ • spot •‡• " .. tostring(spot), 1)
			
			got = pot
			--jot = jot .. pot .. " "
			snp = nil
			cnt = cnt + 1
		end
		cot = nil
		if got then
			if cHAIn[got].cap then
				--dbgMsg("∫Proclaim∫ • Cap✓ •‡• got: " .. tostring(got), 1)
				dbgMsg("∫Proclaim∫ • Cap✓ •‡• lot: " .. tostring(lot), 1)
				dbgMsg("∫Proclaim∫ • Cap✓ •‡• cap: " .. tostring(cHAIn[got].cap), 1)
				if cHAIn[got].cap == true then
					got = got:sub(1,1):upper() .. got:sub(2, #got)
				elseif cHAIn[got].cap == lot then
					got = got:sub(1,1):upper() .. got:sub(2, #got)
				end
			end
			jot = jot .. got .. " "
			lot = got
		end
		got = nil
	until (cnt > n or lmX < 1 or lmX == cnt)
	
	if jot:sub(#jot-1, #jot) == ", " then
		jot = jot:sub(1,1):upper() .. jot:sub(2, #jot - 2) .. "."
	else
		jot = jot:sub(1,1):upper() .. jot:sub(2, #jot - 1) .. "."
	end
	
	lastProclamation = jot
	
	Game.SendChat("/" .. string.lower(chan) .. " " .. jot)
	--dbgMsg("∫hip∫ • πpos •‡• " .. tostring(math.floor(snap)), 1)
end

function WhipIT(chain,chan)
	local good, bad = shiftWord(chain)
	local snap, dragon
	if bad == "" then
		if cHAIn[good] then
			snap = cHAIn[good].pos / (cHAIn[good].link or 1)
			lockChain =  true
			--Game.SendChat("/" .. string.lower(chan) .. " ∫hip∫ • πpos •‡• " .. tostring(math.floor(snap)))
			dbgMsg("∫hip∫ • πpos •‡• " .. tostring(math.floor(snap)), 1)
		end
	--elseif good == "proclaim" and tonumber(bad) > 0 then
		
	else
		dbgMsg("∫hip∫ • bad • " .. tostring(bad), 1)
	end

end

function JogBot(act)
	local beans = LoadBeacons()
	local x,y,z = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
	local sh = "JogPath"
	local ch
	local n, p, dis
	local d = 5000
	if not beans.JogPath1 then
		dbgMsg("✓JogBot✓ :: No paths were found for this map.", 1)
		return
	end
	
	if jogTime then
		rm = math.floor(jogTime - os.time())
		dbgMsg("✓✓ Jog time remaining ::  " .. formatTime(rm), 1)
	end
	
	if act == "start" then
		jogKey = nil
		n = 1
		ch = sh .. tostring(n)
		repeat
			--dis = distTarget(x,y,z,beans[ch].XPos,beans[ch].YPos,beans[ch].ZPos)
			dis = distBeacon(ch)
			if dis < d then
				d = dis
				p = n
			end
			--n = string.char(string.byte(n)+1)
			n = n + 1
			ch = sh .. tostring(n)
			if not beans[ch] then
				n = nil
			end
		until not n
		ch = sh .. tostring(p)
		if (os.time() > (jogTime or (os.time() + 69))) or (p == jogStart and not jogTime) then
		
		--if os.time() > (jogTime or (os.time() + 69))  then
			
		--elseif (p == jogStart) then
			MoveToBeacon(ch)
			jogKey = nil
			jogStart = nil
			jogTime = nil
			dbgMsg("✓JogBot✓ :: ~~^~~.", 1)
			return
		else
			jogKey = tostring(p)
			jogStart = tostring(p)
		end
	elseif not jogKey then
		jogKey = "1"
		jogStart = "1"
		ch = "JogPath1"
	else
		--jogKey = string.char(string.byte(jogKey)+1)
		jogKey = tostring(tonumber(jogKey)+1)
		ch = sh .. jogKey
		if not beans[ch] then
			jogKey = "1"
			ch = "JogPath1"
		end
		if (os.time() > (jogTime or (os.time() + 69))) or ((jogKey == jogStart or jogKey == jogStop) and not jogTime) then
			MoveToBeacon(ch)
			jogKey = nil
			jogStart = nil
			jogStop = nil
			jogTime = nil
			dbgMsg("✓JogBot✓ :: ~~^~~.", 1)
			return
		end
	end
	jogX = beans[ch].XPos
	jogY = beans[ch].YPos
	jogZ = beans[ch].ZPos
	MoveToBeacon(ch)
	if d > 22 then
		Game.SendChat("/gaction Sprint")
	end
	
end

function NextCurrent(txt)
	local map = Game.Player.MapZone
	local con, cur
	local adj = 1
	if txt then
		if txt == "-" then
			adj = -1
		elseif tonumber(txt) then
			adj = tonumber(txt)
		end
	end
	if beacons[map] then
		if beacons[map].curCur then
			beacons[map].curCur = beacons[map].curCur + adj
			if beacons[map].curCur > #beacons[map].confluences then
				beacons[map].curCur = 1
			elseif beacons[map].curCur < 1 then
				beacons[map].curCur = #beacons[map].confluences
			end
			cur = beacons[map].curCur
			con = beacons[map].confluences[cur]
			MoveToBeacon(con)
		end
	end
end

function ChaiNGanG(txt)
	if txt:sub(1,3) == "BRK" then
		txt = string.gsub(txt, "BRK ", "")
		if txt == "BRK" then
			--cHAIn = nil -- only enable if necessary
			--cHAIn = {}
			dbgMsg("‡ChaiNGanG‡ • ♪I can still hear you sayin'...♪ •‡• " .. tostring(cHAIn), 1)
			return
		end
		local a,b = shiftWord(txt)
		if a ~= "" and b ~= "" then
			dbgMsg("‡ChaiNGanG‡ • ♪cHAIn BRK♪  ",1)
			if cHAIn[a] and cHAIn[b] then
				if cHAIn[a].precedes then
					cHAIn[a].precedes[b] = nil
				end
				if cHAIn[a].follows then
					cHAIn[a].follows[b] = nil
				end
				if cHAIn[b].precedes then
					cHAIn[b].precedes[a] = nil
				end
				if cHAIn[b].follows then
					cHAIn[b].follows[a] = nil
				end
				dbgMsg("‡PowerWords‡ • ♪cHAIn BRK♪  " .. tostring(a) .. " •∞• " .. tostring(b), 1)
			end
		elseif cHAIn[a] then
			dbgMsg("‡ChaiNGanG‡ • ♪cHAIn BRK♪  •∞• " .. tostring(a),1)
			for k,v in pairs(cHAIn) do
				if cHAIn[k].precedes then
					cHAIn[k].precedes[a] = nil
				end
				if cHAIn[k].follows then
					cHAIn[k].follows[a] = nil
				end
			end
			cHAIn[a] = nil
			dbgMsg("‡ChaiNGanG‡ • ♪cHAIn BRK♪  " .. tostring(a) .. " •∞• removed from memory |", 1)
		end
			
		return
	elseif txt:sub(1,3) == "CHK" then
		txt = string.gsub(txt, "CHK ", "")
		if txt == "CHK" then
			--cHAIn = nil -- only enable if necessary
			--cHAIn = {}
			dbgMsg("‡ChaiNGanG‡ • ♪The CHK's in the mail...♪ •‡• " .. tostring(cHAIn), 1)
			return
		end
		
		local a,b = shiftWord(txt)
		if a ~= "" and b ~= "" then
			dbgMsg("‡ChaiNGanG‡ • ♪cHAIn CHK♪  ",1)
			if cHAIn[a] and cHAIn[b] then
				if cHAIn[a].precedes then
					dbgMsg("‡ChaiNGanG‡ • CHK:: " .. tostring(a) .. " <precedes> " .. tostring(b) .. " •∞• " .. tostring(cHAIn[a].precedes[b]),1)
				end
				if cHAIn[a].follows then
					dbgMsg("‡ChaiNGanG‡ • CHK:: " .. tostring(a) .. " <follows> " .. tostring(b) .. " •∞• " .. tostring(cHAIn[a].follows[b]),1)
				end
				if cHAIn[b].precedes then
					dbgMsg("‡ChaiNGanG‡ • CHK:: " .. tostring(b) .. " <precedes> " .. tostring(a) .. " •∞• " .. tostring(cHAIn[b].precedes[a]),1)
				end
				if cHAIn[b].follows then
					dbgMsg("‡ChaiNGanG‡ • CHK:: " .. tostring(b) .. " <follows> " .. tostring(a) .. " •∞• " .. tostring(cHAIn[b].follows[a]),1)
				end
			end
		end
		return
	elseif txt:sub(1,3) == "PRE" then
		txt = string.gsub(txt, "PRE ", "")
		if txt == "PRE" then
			--cHAIn = nil -- only enable if necessary
			--cHAIn = {}
			dbgMsg("‡ChaiNGanG‡ • ♪PRE CEDE...♪ •‡• " .. tostring(cHAIn), 1)
			return
		end
		local a,b,c
		
		a,b = shiftWord(txt)
		b,c = shiftWord(b)
		
		dbgMsg("‡ChaiNGanG‡ • ♪cHAIn PRE♪ a: " .. tostring(a) .. " •‡• b: " .. tostring(b) .. " •‡• c: " .. tostring(c),1)
		
		if a ~= "" and b ~= "" and c ~= "" then
			--dbgMsg("‡ChaiNGanG‡ • ♪cHAIn PRE♪  ",1)
			
			if cHAIn[a] and cHAIn[b] and tonumber(c) >= 0  then
				cHAIn[a].precedes = cHAIn[a].precedes or {}
				cHAIn[a].precedes[b] = tonumber(c)
				cHAIn[b].follows = cHAIn[b].follows or {}
				cHAIn[b].follows[a] = tonumber(c)
			end
		end
		return
	elseif txt:sub(1,4) == "ATTR" then
		txt = string.gsub(txt, "ATTR ", "")
		if txt == "ATTR" then
			--cHAIn = nil -- only enable if necessary
			--cHAIn = {}
			dbgMsg("‡ChaiNGanG‡ • ♪ATTRibute Set :: No value specified >•< ", 1)
			return
		end
		local a,b,c
		
		a,b = shiftWord(txt)
		b,c = shiftWord(b)
		
		dbgMsg("‡ChaiNGanG‡ • ♪ATTRibute Set♪ [" .. tostring(a) .. "] •‡• ‡" .. tostring(b) .. "‡ (•" .. tostring(c) .. "•)",1)
		
		if a ~= "" and b ~= "" and c ~= "" then
			--dbgMsg("‡ChaiNGanG‡ • ♪cHAIn PRE♪  ",1)
			
			if cHAIn[a] then
				cHAIn[a][b] = c
			end
		end
		return
	end
	--dbgMsg("∫PW∫ • txt •‡• " .. tostring(txt), 1)
	WhipIT(txt, chn)
end

function Study()
	local lettuce = Script.Clipboard
	
	if lettuce then
		DoRandom("study", "trying to make sense of the data.")
		lettuce = ChattyChop(lettuce)
		dbgMsg("∫Study∫ • Salad Chopped • " .. tostring(#lettuce), 1)
	end
end

function Ascend(txt)
	local map = Game.Player.MapZone
	local x,y,z = Game.Player.Entity.PosX, Game.Player.Entity.PosY, Game.Player.Entity.PosZ
	z = z + 17
	dbgMsg("‡Ascend‡ :: " .. tostring(x) .. " " .. tostring(z) .. " " .. tostring(y), 1)
	Game.SendChat("/vnavmesh flyto " .. tostring(x) .. " " .. tostring(z) .. " " .. tostring(y))
end

function PowerWords(txt, toss, chn, sender)
	if safe or pause then
		dbgMsg("Power Words :: security settings prevent this ability (safe : " .. tostring(safe) .. " | or | pause : " .. tostring(pause) .. ").", 1)
		return
	end	
	if sender ~= playerName and not playerTraits.obedient then
		DoRandom("no", "doesn't feel that's a good idea")
		return
	end
	if toss == "revert" and txt == toss then
		Game.SendChat("/glamour revert <me>")
	elseif string.sub(txt, 1,7) == "reflect" then
		if toss == txt and lastCensus then
			Game.SendChat("/glamour apply " .. lastCensus .. " | <me>")
		else
			txt = string.gsub(txt, toss .. " ", "")
			Game.SendChat("/glamour apply " .. txt .. " | <me>")
		end
	elseif string.sub(txt, 1, 7) == "recount" then
		if lastProclamation then
			Game.SendChat(tostring(lastProclamation))
		end
	elseif string.sub(txt, 1, 6) == "invoke" then
		txt = string.gsub(txt, "invoke ", "")
		txt = string.gsub(txt, "invoke", "")
		SaladGyre(txt, chn)
	elseif string.sub(txt, 1,6) == "switch" then
		txt = string.gsub(txt,"switch", "")
		txt = string.gsub(txt," ", "")
		txt = txt:sub(1,1):upper()..txt:sub(2,#txt):lower()
		--dbgMsg("‡PowerWords‡ Switching to" .. txt, 1)
		if CD.global[txt] then
			CDUpdater()
			dbgMsg("‡PowerWords‡ Switching to " .. CD.global[txt], 1)
			local name = CD.global[txt]
			local world = Script.Storage[name].world
			Game.SendChat("/autoretainer relog " .. CD.global[txt] .. "@" .. world)
		end
	elseif string.sub(txt, 1,7) == "logging" then
		txt = string.gsub(txt,"logging", "")
		txt = string.gsub(txt," ", "")
		if txt == "on" then
			filterLog["76"] = true
			dbgMsg("‡PowerWords‡ logging enabled :: log size π " .. tostring(#dbg_log) , 1)
		elseif txt == "off" then
			filterLog["76"] = nil
			dbgMsg("‡PowerWords‡ logging disabled :: log size π " .. tostring(#dbg_log) , 1)
		else
			filterLog["76"] = not filterLog["76"]
			dbgMsg("‡PowerWords‡ logging toggled :: logging ∫ " .. tostring(filterLog["76"]) , 1)
		end
	elseif string.sub(txt,1,5) == "leave" and InDuty then
		Game.SendChat("/pdfleave")
	elseif string.sub(txt,1,5) == "dress" then
		txt = string.gsub(txt,"dress", "")
		if txt ~= "" then
			txt = string.gsub(txt," ", "")
			txt = txt:upper()
			DressBest(txt)
			--OutfitHandler("load " .. txt)
		elseif txt == "best" or txt == "temp" then
			DressBest()
		else
			OutfitLoad(txt)
		end
		DressedCheck()
		OutfitTempFactor()
	elseif string.sub(txt,1,8) == "maintain" then
		CD[playerName].maintain = not CD[playerName].maintain
		maintain = CD[playerName].maintain
		if maintain then
			dbgMsg("‡PowerWords‡ enabling self maintenance", 1)
		else
			dbgMsg("‡PowerWords‡ disabling self maintenance", 1)
		end
	elseif string.sub(txt,1,7) == "undress" then
		CallRoutine("undress")
		DressedCheck()
		OutfitTempFactor()
	elseif string.sub(txt,1,4) == "swim" then
		txt = string.gsub(txt, "swim ", "")
		swimTime = nil
		if (tonumber(txt) or 0) > 0 then
			swimTime = os.time() + tonumber(txt) * 60
		elseif txt == "end" or txt == "stop" or txt == "exit" then
			SwimHandler(true)
		end
		laundry = nil
		SwimHandler()
	elseif string.sub(txt,1,7) == "laundry" or string.sub(txt,1,7) == "launder" then
		swimTime = nil
		laundry = true
		SwimHandler()
	elseif string.sub(txt,1,3) == "jog" then
		txt = string.gsub(txt, "jog", "")
		txt = string.gsub(txt, " ", "")
		if txt == "stop" then
			jogKey = nil
			jogStart = nil
		elseif string.contains(txt,"stopat") or string.contains(txt,"stop at") then
			txt = string.gsub(txt, "stopat", "")
			txt = string.gsub(txt, "stop at", "")
			if tonumber(txt) > 0 then
				jogStop = txt
			end
			JogBot("start")
		elseif (tonumber(txt) or 0) > 0 then
			jogTime = os.time() + tonumber(txt) * 60
			JogBot("start")
		else
			JogBot("start")
		end
	elseif string.sub(txt,1,4) == "mark" then
		txt = string.gsub(txt, "mark ", "")
		if string.sub(txt,1,2) == "me" then
			Game.SendChat("/wmark a <me>")
		elseif string.sub(txt, 1,3) == "tar" then
			Game.SendChat("/wmark a <t>")
		elseif string.sub(txt, 1, 5) == "clear" then
			Game.SendChat("/wmark clear")
		end
	elseif txt == "return" then
		Game.SendChat("/return")
	elseif string.sub(txt,1,5) == "chain" then
		txt = string.gsub(txt, "chain ", "")
		ChaiNGanG(txt)
		
	elseif string.sub(txt,1,7) == "impress" then
		txt = string.gsub(txt, "impress ", "")
		for i = 1, 77 do
			ChattyChop(txt)
		end
		dbgMsg("∫PW∫ • impression complete •‡• ", 1)
	elseif string.sub(txt,1,8) == "proclaim" then
		txt = string.gsub(txt, "proclaim ", "")
		
		Proclaim(txt, chn)
		
		--dbgMsg("∫PW∫ • txt •‡• " .. tostring(txt), 1)
		WhipIT(txt, chn)
	elseif string.sub(txt,1,5) == "study" then
		Study()
	elseif string.startsWith(txt, "tour") then
		txt = string.gsub(txt, "tour ", "")
		StartTour(txt)
	elseif string.startsWith(txt, "current") then
		txt = string.gsub(txt, "current ", "")
		NextCurrent(txt)
	elseif string.startsWith(txt, "flagme") then
		txt = string.gsub(txt, "flagme ", "")
		FlagMe(txt)
	elseif string.startsWith(txt, "flag") then
		txt = string.gsub(txt, "flag ", "")
		Flagit(txt)
	elseif string.startsWith(txt, "ascend") then
		txt = string.gsub(txt, "ascend ", "")
		Ascend(txt)
	elseif string.startsWith(txt, "purchase") then
		txt = string.gsub(txt, "purchases ", "")
		txt = string.gsub(txt, "purchased ", "")
		Purchased(txt, chn)
	end
end

tribe_key = {
	["midlander"] = "Midlander",
	["middie"] = "Midlander",
	["highlander"] = "Highlander",
	["thighlander"] = "Highlander",
	["mooncat"] = "Keeper of the Moon",
	["suncat"] = "Seeker of the Sun",
	["moon"] = "Keeper of the Moon",
	["sun"] = "Seeker of the Sun",
	["keeper"] = "Keeper of the Moon",
	["seeker"] = "Seeker of the Sun",
	["rava"] = "Rava",
	["veena"] = "Veena",
	["raen"] = "Raen",
	["rean"] = "Raen",
	["xaela"] = "Xaela",
}
race_key = {
	["midlander"] = "Hyur",
	["middie"] = "Hyur",
	["highlander"] = "Hyur",
	["hlander"] = "Hyur",
	["thighlander"] = "Hyur",
	["hyur"] = "Hyur",
	["mooncat"] = "Miqo'te",
	["suncat"] = "Miqo'te",
	["keeper"] = "Miqo'te",
	["seeker"] = "Miqo'te",
	["catgirl"] = "Miqo'te",
	["cats"] = "Miqo'te",
	["catboi"] = "Miqo'te",
	["catboy"] = "Miqo'te",
	["miqo"] = "Miqo'te",
	["bunn"] = "Viera",
	["rava"] = "Viera",
	["veena"] = "Viera",
	["rean"] = "Au Ra",
	["raen"] = "Au Ra",
	["xaela"] = "Au Ra",
	["lizard"] = "Au Ra",
	["aura"] = "Au Ra",
	["elf"] = "Elezen",
	["elezen"] = "Elezen",
}
-- optA = race/tribe query, optB = <key for match> (optC = check value) 
	--ex.
	--("midlander", "height", "100")
	--("bunn", "name", "Jessicca Rabbit") returns any midlanders with the name 'Jessicca Rabbit'
	--("bunn", "firstname", "Jessicca") returns any midlanders with the firstname 'Jessicca'
	--("bunn", "lastname", "Rabbit") returns any midlanders with the lastname 'Rabbit'
 -- 
function Census(optA, optB, optC, rpt) 
	if not playerTraits.sulsul then
		dbgMsg("Census: Sorry, " .. appellation .. ", you do not meet the requirements to be a census taker.. ", 0)
		EmoGyre("dazed", 33)
		return
	end
	local race, tribe
	local list = {}
	if optA and not optB then
		
	end
	if optA then
		dbgMsg("Census: optA :: " .. tostring(optA),1)
		dbgMsg("Census: optB :: " .. tostring(optB),1)
		dbgMsg("Census: optC :: " .. tostring(optC),1)
		local cnt = 0
		local reply
		local tmp
		tribe = tribe_key[optA]
		race = race_key[optA]
		if CD.global.Census[race] then
			for t,c in pairs(CD.global.Census[race]) do
				if t == tribe or not tribe then
					if c then
						for k,v in pairs(c) do
							--dbgMsg("Census: val :: " .. tostring(v[optB]),1)
							if not optB then
								cnt = cnt + 1
								list[#list+1] = k .. "-" .. t
							elseif optB and optC then
								if type(v[optB]) == "number" then
									if v[optB] == tonumber(optC) then
										cnt = cnt + 1
										list[#list+1] = k .. "-" .. t
									end
								elseif optB == "firstname" then
									tmp = string.startsWith(k, optC)
									--tmp = string.match(k, "^(%a+)")
									dbgMsg("Census: val :: " .. tostring(k) .. " :match:> " .. tostring(tmp),1)
									if tmp then
										cnt = cnt + 1
										list[#list+1] = k .. "-" .. t
									end
								elseif optB == "lastname" then
									tmp = string.endsWith(k, optC)
									--tmp = string.match(k, "(%a+)$")
									dbgMsg("Census: val :: " .. tostring(k) .. " :match:> " .. tostring(tmp),1)
									if tmp then
										cnt = cnt + 1
										list[#list+1] = k .. "-" .. t
									end
								elseif v[optB] == optC then
									cnt = cnt + 1
									list[#list+1] = k .. "-" .. t
								end
							end
						end
					end
				end
			end
				--cnt = #CD.global.Census.Hyur.Midlander or 0
				if cnt == 1 and not optB then
					reply = "One entry was found in the records matching your query " .. appellation .. "."
				elseif cnt > 1 and not optB then
					reply = "There were " .. tostring(cnt) .. " entries found in the records for 'Midlander', " .. appellation .. "."
				elseif cnt == 1 and optB then
					reply = "I was able to find one entry matching your criteria " .. appellation .. "."
				elseif cnt > 1 and optB then
					reply = "There were " .. tostring(cnt) .. " records found matching the data you provided " .. appellation .. "."
				end
				if rpt then
					for i,v in pairs(list) do
						Game.SendChat("/fc " .. v)
					end
				end
			--end
		end
		if cnt == 0 then
			return "There were no records that matched your request " .. appellation .. "."
		elseif reply then
			return reply
		end
	end
	local gender, name, height, boobs, home
	if Game.Player.Target.IsPlayer or Game.Player.MouseOverTarget.IsPlayer then
		if Game.Player.Target.Name then
			--Game.SendChat("/glamour copy <t>")
			name = Game.Player.Target.Name
			race = Game.Player.Target.Race
			tribe = Game.Player.Target.Tribe
			if not CD.global.Census[race] then
				CD.global.Census[race] = {}
				CD.global.Census[race][tribe] = {}
			end
			if not CD.global.Census[race][tribe] then
				--CD.global.Census[race] = {}
				CD.global.Census[race][tribe] = {}
			end
			if not CD.global.Census[race][tribe][name] then
				CD.global.Census[race][tribe][name] = {}
				if Game.Player.Target.IsMale then
					gender = "M"
				else
					gender = "F"
				end
				CD.global.Census[race][tribe][name].gender = gender
				--gender = Game.Player.Target.IsMale
				--CD.global.Census[race][tribe][name].gender = (gender == true and 1 or gender == false and 0)
				--name = Game.Player.Target.Name
				CD.global.Census[race][tribe][name].home = Game.Player.Target.HomeWorld
				CD.global.Census[race][tribe][name].height = Game.Player.Target.Height
				CD.global.Census[race][tribe][name].boobs = Game.Player.Target.BustSize
				CD.global.Census[race][tribe][name].agent = playerName
				--CD.global.Census[race][tribe][name].glam = CD.global.Census[race][tribe][name].glam or {}
				--local gl = #CD.global.Census[race][tribe][name].glam + 1
				--CD.global.Census[race][tribe][name].glam[1] = tostring(Script.Clipboard)
				lastCensus = name .. "-" .. tribe
				Game.SendChat("/glamour save " .. name .. "-" .. tribe .. " |  <t>")
				dbgMsg("Census: " .. name .. " added to the records, well done " .. appellation .. ".", 0)
			else
				--Game.SendChat("/glamour save " .. name .. "-" .. tribe .. " |  <t>")
				dbgMsg("Census: " .. name .. " has already been recorded in the records, " .. appellation .. ".", 0)
			end
		elseif Game.Player.MouseOverTarget.Name then
			Game.SendChat("/glamour copy <mo>")
			name = Game.Player.MouseOverTarget.Name
			race = Game.Player.MouseOverTarget.Race
			tribe = Game.Player.MouseOverTarget.Tribe
			if not CD.global.Census[race] then
				CD.global.Census[race] = {}
				CD.global.Census[race][tribe] = {}
			end
			if not CD.global.Census[race][tribe] then
				--CD.global.Census[race] = {}
				CD.global.Census[race][tribe] = {}
			end
			if not CD.global.Census[race][tribe][name] then
				CD.global.Census[race][tribe][name] = {}
				if Game.Player.MouseOverTarget.IsMale then
					gender = "M"
				else
					gender = "F"
				end
				CD.global.Census[race][tribe][name].gender = gender
				--name = Game.Player.Target.Name
				CD.global.Census[race][tribe][name].home = Game.Player.MouseOverTarget.HomeWorld
				CD.global.Census[race][tribe][name].height = Game.Player.MouseOverTarget.Height
				CD.global.Census[race][tribe][name].boobs = Game.Player.MouseOverTarget.BustSize
				CD.global.Census[race][tribe][name].agent = playerName
				--CD.global.Census[race][tribe][name].glam = CD.global.Census[race][tribe][name].glam or {}
				--local gl = #CD.global.Census[race][tribe][name].glam + 1
				--CD.global.Census[race][tribe][name].glam[gl] = tostring(Script.Clipboard)
				lastCensus = name .. "-" .. tribe
				Game.SendChat("/glamour save " .. name .. "-" .. tribe .. " |  <mo>")
				dbgMsg("Census: " .. name .. " added to the records, well done " .. appellation .. ".", 0)
			else
				--local gl = #CD.global.Census[race][tribe][name].glam + 1
				--CD.global.Census[race][tribe][name].glam[gl] = tostring(Script.Clipboard)
				--dbgMsg("Census: " .. name .. " found, adding new glam to the records..", 0)
				dbgMsg("Census: " .. name .. " has already been recorded in the records, " .. appellation .. ".", 0)
			end
		end
	end
end

function FlameCheck(flame, toss, txt, chn, sender)
	dbgMsg(".FlameCheck.", 2)
	dbgMsg("MatchStick: " .. txt, 9)
	dbgMsg(".FlameCheck: flame :: " .. tostring(flame), 9)
	dbgMsg(".FlameCheck: toss :: " .. tostring(toss), 9)
	--local chn = Game.Chat.Chn
	dbgMsg(".FlameCheck: chn :: " .. tostring(chn), 9)
	
	--[2]<Sandy Skittles> juju lastChat

	if flame == "*creature*" then
		MinionMadness("creature", txt)
	elseif flame == "*critter*" then
		MinionMadness("critter", txt)
	elseif flame == "*squirrel*" then
		MinionMadness("squirrel", txt)
	elseif flame == "*booger*" then
		emoReact("scared")
		MinionMadness("booger", txt)
	elseif flame == "*expense*" then
		--bits, bobs = string.match(txt, "(%d+) (gil)")
		bits, bobs = string.match(txt, "(%d*,?%d*) (gil)")
		if bits and bobs then
			dbgMsg("MatchStick: Bits & Bobs :: " .. tostring(bits) .. " & " .. tostring(bobs), 9)
			if IsPorting then
				--dbgMsg("MatchStick: Porting finished: time :: " .. tostring(os.time() - IsPorting), 1)
				dbgMsg("MatchStick: Porting finished: time :: " .. tostring(tonumber(bits)), 1)
				Porting(tonumber(bits) * (os.time() - IsPorting))
				--IsPorting = nil --Porting function now handles this
			end
		end
		Expense(txt, chn, toss)
	elseif flame == "*porting*" or flame == "*travel*" then
		IsPorting = os.time()
		dbgMsg("PortingCall :: " .. tostring(toss), 1)
	elseif flame == "*action*" and chn == "NPCDialogueAnnouncements" then
		
	elseif flame == "*action*" and sender == playerName then
		Game.SendChat("/" .. toss)
	elseif flame == "*sulsul*" and sender == playerName then
		if txt == toss then
			if toss == "census" then
				Census()
			end
		end
	elseif flame == "*PW*" and not safe and (sender == playerName or playerTraits.obedient) then
		PowerWords(txt, toss, chn, sender)
	elseif flame == "*token*" then
		HandleSpecial(txt, toss, chn, sender)
	elseif flame == "*shark*" then
		SharkHandler()
	elseif flame == "*prog*" then
		ProgHandler(txt, toss, chn)
	elseif flame == "*failure*" then
		Shame(toss)
	elseif flame == "*panic*" and sender == playerName then
		if string.sub(txt, 1, #toss) == toss and sender == playerName then
			dbgMsg("PanicCheck toss :: " .. tostring(toss), 1)
			dbgMsg("PanicCheck txt :: " .. tostring(txt), 1)
			--dbgMsg("PanicCheck sender :: " .. tostring(sender), 1)
			if toss == "safe" then
				safe = true
				rnd = nil
				dbgMsg("PanicHandler switching to safe mode :: ✓", 0)
			elseif toss == "pause" and toss == txt and sender == playerName then
				pause = not pause
				CD.global.pause = pause
				if pause then
					dbgMsg("PanicHandler is now paused :: ||", 0)
				else
					dbgMsg("PanicHandler resuming normal functions :: ", 0)
				end
			elseif toss == "off" or toss == "kill" or toss == "nuke" then
				dbgMsg("PanicHandler shutting down...", 0)
				action = "sleep"
				rnd = nil
				safe = true
				blockAutonomousActions = true
				Game.SendChat("/vnav stop")
				Script.ClearQueue()
				dbg = 1
				
				dbgMsg("PanicHandler Emote queue stopped :: ✓ ", 0)
				--Update()
				if toss == "off" then
					return
				elseif toss == "nuke" then
					dbgMsg("PanicHandler Shutting Down All Systems :: ", 0)
					blockNegativeEffects = true
					Sys.Weather = nil
					Sys.Outfits = nil
					Sys.Buffs = nil
					Sys.Gyre = nil
					Sys.Aether = nil
					Sys.Beacons = nil
					Sys.Emotions = nil
					Sys.Moodles = nil
					Sys.Chat = nil
					Sys.SND = nil
					Sys.Nav = nil
					dbgMsg("PanicHandler Congratulations, you are no longer emo, you are now normal and may join the other normals in stasis around an aetheryte of your choice... :: ✓", 0)
					chatHooking = nil
				end
				Sys.Juju = nil
				Sys.Emotes = nil
				Sys.Routines = nil
				Script.ClearQueue()
				dbgMsg("PanicHandler Halting All Lua Scripts :: ✓", 0)
				Game.SendChat("/woluax halt-all")
			elseif toss == "secure" or toss == "security" then
				dumpInfo("security")
			elseif toss == "stop" then
				dbgMsg("PanicHandler Stopping Navigator :: ✓ ", 0)
				Game.SendChat("/vnav stop")
			end
		end
	elseif flame == "*duty*" then
		ProgHandler(txt, toss, chn)
	elseif flame == "*jujuhoodoo*" and sender == playerName then
		JujuHoodoo(txt, chn)
	elseif flame == "*profit*" then
		Windfall(txt, chn, toss)
	elseif flame == "*gossip*" then
		Report(txt)
	elseif flame == "*food*" or flame == "*drink*" then
		DoRandom(toss, match_type(txt, toss, sender))
	elseif flame == "*consume*" and sender == playerName then
		ConsumableHandler(txt, chn, toss)
	elseif flame == "*balmung*" then
		emoReact("scared")
	elseif flame == "*crystal*" then
		Crystal(txt, chn, toss)
	elseif flame == "*kitty*" then
		MinionMadness("kitty", txt)
		--getKitty("random")
	elseif flame == "*bird*" then
		MinionMadness("bird", txt)
		--getBird(txt)
		--getBird("random")
	elseif flame == "*bunny*" then
		getBunny("random")
	elseif flame == "*motley*" then
		MinionMadness("motley", txt)
		--getMotley("random")
	elseif flame == "*poppit*" then
		MinionMadness("poppit", txt)
		--getPoppit("random")
	elseif flame == "*doll*" then
		MinionMadness("doll", txt)
	elseif flame == "*mammet*" then
		MinionMadness("mammet", txt)
	elseif flame == "*turnip*" then
		MinionMadness("turnip", txt)
	elseif flame == "*beaver*" then
		MinionMadness("beaver", txt)
	elseif flame == "*dog*" then
		MinionMadness("dog", txt)
		--getKyurghen("random")
	elseif flame == "*zoom*" and not InCombat and not safe then
		CallRoutine("automove")
	elseif flame == "*goober*" then
		Razzle()
	elseif flame == "*dazzle*" then
		Dazzle()
	elseif flame == "*plogon*" and sender == playerName then
		if txt == "leves" then
			CallRoutine("leves")
			--Game.SendChat("/chilledleves")
		elseif txt:sub(1,#toss) == toss then
			Game.SendChat("/"..txt)
		else
			dbgMsg("FlameCheck:  ω̆♡̆∩    :: " .. tostring(txt), 1)
		end
	elseif flame == "*emo*" and (sender == playerName or playerTraits.mimic) then
		emoReact(toss)
	elseif flame == "*destination*" and (sender == playerName or playerTraits.obedient) then
		if destinations[toss] and not safe and txt == toss then
			if toss == "gc" then
				local gc = Game.Player.GrandCompany
				dbgMsg("Porting: GC :: " .. tostring(gc), 1)
				if string.find(gc, "Maelstrom") then
					Game.SendChat("/item 21069")
				elseif string.find(gc, "Adder") then
					Game.SendChat("/item 21070")
				elseif string.find(gc, "Flames") then
					Game.SendChat("/item 21071")
				end
			else
				Game.SendChat("/tp " .. destinations[toss])
			end
		elseif not safe and txt == toss then
			Game.SendChat("/tp " .. toss)
		end
	--elseif flame == "*profit*" then
		--Windfall(txt, chn, toss)
	--elseif flame == "*expense*" then
		--Expense(txt, chn, toss)
	elseif flame == "*bijou*" then
		doBijou("any")
		--Game.SendChat("/useitem 12042")
	elseif flame == "*booger*" then
		emoReact("scared")
	elseif flame == "*disappointment*" then
		DoRandom("disappointed")
	end
	--matchMadness[flame] = {} --deprecated 0.7.23
end

function MatchStick(txt, sender, chn)
	dbgMsg(".MatchStick.", 2)
	local sticks = ""
	local stones = ""
	local bones = ""
	local words = ""
	local flame = ""
	local smoke = ""
	txt = string.gsub(txt, "  ", " ")
	txt = string.gsub(txt, "", "")
	txt = string.gsub(txt, " ", "")
	
	local bits, bobs, cnt
	
	--local salad = ChattyChop(txt)
	local salad = SALAD
	
	if not salad then
		salad = ChattyChop(txt, not validChainChn[chn])
	end
	
	local toss = ""
	
	local fire = {}
	
	if type(salad) == "table" then
		dbgMsg("MatchStick: salad: " .. type(salad) .. " :: #" .. tostring(#salad), 9)
		cnt = 1
		for i,v in ipairs(salad) do
			if cnt + 3 <= #salad then -- catch 4 word phrases
				toss = salad[i] .. " " .. salad[i+1] .. " " .. salad[i+2] .. " " .. salad[i+3]
				smoke = matchsticks.strikes[toss]
				if smoke then
					if string.match(smoke, "@(%a+)@") then
						stones = ""
						for w in string.gmatch(toss, "(%w+)") do
							stones = stones .. string.upper(string.sub(w,1,1))
						end
						sticks = sticks .. stones .. "•"
						flame = string.gsub(smoke, "@", "*")
					else
						sticks = sticks .. toss .. "•"
						flame = smoke
					end
				end
			end
			if #flame > 0 and not fire[flame] then
				dbgMsg("MatchStick: flame(+3): " .. tostring(flame), 9)
				FlameCheck(flame, toss, txt, chn, sender)
				fire[flame] = toss
			end
			if cnt + 2 <= #salad then -- catch 3 word phrases
				toss = salad[i] .. " " .. salad[i+1] .. " " .. salad[i+2]
				smoke = matchsticks.strikes[toss]
				if smoke then
					if string.match(smoke, "@(%a+)@") then
						stones = ""
						for w in string.gmatch(toss, "(%w+)") do
							stones = stones .. string.upper(string.sub(w,1,1))
						end
						sticks = sticks .. stones .. "•"
						flame = string.gsub(smoke, "@", "*")
					else
						sticks = sticks .. toss .. "•"
						flame = smoke
					end
				end
			end
			if #flame > 0 and not fire[flame] then
				dbgMsg("MatchStick: flame(+2): " .. tostring(flame), 9)
				FlameCheck(flame, toss, txt, chn, sender)
				fire[flame] = toss
			end
			if cnt + 1 <= #salad then -- catch 2 word phrases
				toss = salad[i] .. " " .. salad[i+1]
				smoke = matchsticks.strikes[toss]
				dbgMsg("MatchStick: flame-1: " .. tostring(toss), 9)
				if smoke then
					if string.match(smoke, "@(%a+)@") then
						stones = ""
						for w in string.gmatch(toss, "(%w+)") do
							stones = stones .. string.upper(string.sub(w,1,1))
						end
						sticks = sticks .. stones .. "•"
						flame = string.gsub(smoke, "@", "*")
					else
						sticks = sticks .. toss .. "•"
						flame = smoke
					end
				end
			end
			if #flame > 0 and not fire[flame] then
				dbgMsg("MatchStick: flame(+1): " .. tostring(flame), 9)
				FlameCheck(flame, toss, txt, chn, sender)
				fire[flame] = toss
			end
			-- check single words
			toss = salad[i]
			smoke = matchsticks.strikes[toss]
			if smoke then
				if string.match(smoke, "@(%a+)@") then
					stones = ""
					for w in string.gmatch(toss, "(%w+)") do
						stones = stones .. string.upper(string.sub(w,1,1))
					end
					sticks = sticks .. stones .. "•"
					flame = string.gsub(smoke, "@", "*")
				else
					sticks = sticks .. toss .. "•"
					flame = smoke
				end
			end
			if #flame > 0 and not fire[flame] then
				dbgMsg("MatchStick: flame (singles): " .. tostring(flame), 9)
				FlameCheck(flame, toss, txt, chn, sender)
				fire[flame] = toss
			end
			cnt = cnt + 1
		end
	end
	if #sticks > 0 then
		dbgMsg(".:Matchsticks : sticks: " .. sticks, 9)
	end
	if matchsticks.lights[sticks] then
		if type(matchsticks.lights[sticks]) == "table" then
			if matchsticks.lights[sticks].routine then
				CallRoutine(matchsticks.lights[sticks].routine)
			else
				dbgMsg("MatchStick .:. Blimey: report: " .. Blimey(matchsticks.lights[sticks].report), 1)
				
				if matchsticks.lights[sticks].report and CD[playerName].traits["gossiper"] then
					Report(matchsticks.lights[sticks].report)
					--Game.SendChat("/fc " .. Blimey(matchsticks.lights[sticks].report))
				elseif matchsticks.lights[sticks].routine then
					CallRoutine(matchsticks.lights[sticks].routine)
				end
				if matchsticks.lights[sticks].gate then
					currentGate = matchsticks.lights[sticks].gate
					lastGateCheck = os.time()
				end
			end
		elseif type(matchsticks.lights[sticks]) == "string" then
			Game.SendChat("/" .. matchsticks.lights[sticks])
		end
	end
end

return {ChatHandler, Blimey, StringsHandler, Chatty, ChattyChop, JujuHoodoo, FlameCheck, MatchStick, Windfall,
		TimeGate, doPhrash, ProgHandler, emoReact, Crystal, doBijou, bijous, Expense, cookTheBooks, validEarnings,
		Census, StartTour, NextCurrent, JogBot, WhipIT, Proclaim, MinionMadness, minions, SaladGyre, chaiNLength,
		LettuceLoad, shiftSG, ChaiNGanG}

--	^								^	--
--	^	^^^ Chat Handler ^^^ 		^	--
--	^								^	--



