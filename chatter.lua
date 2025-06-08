
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
	dbgMsg("!ChatHandler :: stackIdx :: " .. tostring(stackIdx) .. " :: sender :: " .. tostring(chatStack[stackIdx].chn), 1)
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
	
	--if #chatBuffer
	
	--Game.SendChat("/e CHAT: " .. tostring(filterLog[9]))
	if filterLog["9"] then
		--Game.SendChat("/e CHAT: " .. tostring(txt))
		local t = formatTime(stamp)
		dbgMsg(t .. " ¶" .. txt, 9)
		--Game.SendChat("/e CHAT: " .. tostring(txt))
	end

	if #txt > 0 then
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
		elseif txt == "bags" or txt == "inventory" then
			Game.SendChat("/isort condition inventory ilv des")
			Game.SendChat("/isort execute inventory")
			Game.SendChat("/inventory")
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
		elseif string.find(txt, "beaver") or string.find(txt, "bvr") then
			Game.SendChat("/minion \"Golden Beaver\"")
		--elseif string.find(txt, "apple") then
			--DoRandom("apple", )
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
	["keys"] = {"diamonds", "birds", "onibi", "sunshine", "emerald", "indigo", "stardust"},
	["diamonds"] = "/useitem 38539",
	["birds"] = "/useitem 41500",
	["onibi"] = "/useitem 40392",
	["sunshine"] = "/useitem 7809",
	["moonrabbits"] = "/useitem 48158",
	["emerald"] = "/useitem 5900",
	["indigo"] = "/useitem 5901",
	["stardust"] = "/useitem 7810",
	["pumpkin"] = "/useitem 16929",

}

local cats = {
	["whiskers"] = {"Nagxian Cat", "Tora-jiro", "Coeurl Kitten", "Black Coeurl", "Byakko Cub", "Palico", "Jibanyan",
					"Bluecoat Cat", "Ilyikty'i", "Weatherproof Gaelicat", "Fat Cat", "Meerkat", "USApyon", "Shoebill",
					"Black Kitten"},
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
	["strings"] = {"Calca", "Brina", "Meerkat", "Wind-up Edda", "Wind-up Chimera", "Shoebill"},
	["Calca"] = true,
	["Brina"] = true,
	["Meerkat"] = true,
	["Shoebill"] = true,
	["Wind-up Chimera"] = true,
	["Wind-up Edda"] = true,
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

local frazzle = {"aback", "shocked", "clutchhead", "panic", "furious", "no", "disappointed", "box", "malevolence"}

local validEarnings = {
	["cosmic containers"] = 0,
	["lunar credits"] = 0,
	["cosmo credits"] = 0,
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
	["sacks of Nuts"] = 0,
	["bicolor gemstones"] = 0,
	
	
}

destinations = {
	["saucer"] = "The Gold Saucer",
	["limsa"] = "Limsa Lominsa",
	["home"] = "Estate Hall (Free Company)",
	["shar"] = "Old Sharlayan",
	["tuli"] = "Tuliyollal",
	["s9"] = "Solution Nine",
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
	DoRandom(frazzle[r], msg)	
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
		dbgMsg("Blimey report ::" .. Blimey(dat.report), 1)
		if dat.report and CD[playerName].traits["gossiper"] then
			--dbgMsg("Blimey: " .. Blimey(dat.report), 1)
			Game.SendChat("/fc " .. Blimey(dat.report))
		end
	elseif type(dat) == "string" then
		Game.SendChat("/" .. dat)		
	end
end

function Chatty(what)
	if what == "random" then
		
	end
end

function ChattyChop(chat)
	dbgMsg(".ChattyChop.", 2)
	func_time["ChattyChop"].ST = os.time()
	
	local salad = {}
	local cnt = 0
	local s = string.match(chat, "(%a+)")
	while s and cnt < 53 do
		salad[#salad+1] = s
		chat = string.gsub(chat, s, "", 1)
		s = string.match(chat, "(%a+)")
		cnt = cnt + 1
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
			dbgMsg("JujuHoodoo:  oopsoo :: " .. tostring(oopsoo), 9)
		end
		
		if type(funCoo) == "table" then
			--dbgMsg("JujuHoodoo:  funCoo :: " .. tostring(funCoo[1]), 9)
			--dbgMsg("JujuHoodoo:  funCoo :: " .. tostring(funCoo[2]), 9)
			if not funCoo[2] then
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
							Game.SendChat("/" .. string.lower(chn) .. preef .. tostring(funCoo[2]))
						else
							--Game.SendChat("/e" ..  preef .. tostring(funCoo[2]))
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

		local tmp = ChattyChop(txt)
		txt = ""
		for i,v in ipairs(tmp) do
			txt = txt .. v
			if i < #tmp then
				txt = txt .. " "
			end
		end
		
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
	dbgMsg("Windfall: txt :: " .. tostring(txt), 1)
	--dbgMsg("Windfall: toss :: " .. tostring(toss), 1)
	if not validSysChan[chn] then
		dbgMsg("Windfall: invalid (chn) :: " .. tostring(chn), 1)
		--return
	end
	--for 85 gil.
	if toss == "You obtain" or toss == "You gain" or toss == "You earn" then
		lastWindfall = txt
		txt = string.gsub(txt, toss, "")
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
		local tmp = ChattyChop(txt)
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
			dbgMsg("Windfall: valid ✓", 1)
			CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] or 0
			CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] + val
		end
		
		if not Occupied and not safe then
			if val < 10000 and val > 1000 then
				DoRandom("surprised", " from recent windfall.")
			elseif val > 10000 then
				DoRandom("cheer", " from recent windfall.")
			elseif val > 100000 then
				UseItem(8214)
			end
		end
		
		windfallTime = os.time()
		
		dbgMsg("Windfall: key :: " .. tostring(txt), 1) 
		dbgMsg("Windfall: val :: " .. tostring(val), 1) --Chloe had it backwards
		return
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
		
		
		dbgMsg("Windfall: cnt :: " .. tostring(cnt), 1)
		dbgMsg("Windfall: sale :: " .. tostring(sale), 1)
		txt = string.gsub(txt, "(for  gil.)", "")
		txt = string.gsub(txt, "(.+ of )", "")
		--txt = string.gsub(txt, "you put up for sale in the (%a+) markets ", "")
		dbgMsg("Windfall: txt :: " .. tostring(txt), 1)
		CD[playerName].sales = CD[playerName].sales or {}
		CD[playerName].sales[txt] = CD[playerName].sales[txt] or 0
		CD[playerName].sales[txt] = CD[playerName].sales[txt] + sale
		if sale > 7777 then
			Report(lastSale)
		end
	elseif (chn == "RetainerSale" or chn == "say") and string.find(txt, "you put up for sale") then
		--dbgMsg("Windfall: txt :: " .. tostring(txt), 1)
		lastSale = txt
		txt = string.gsub(txt, "handfuls of", "")
		--txt = string.gsub(txt, "handfuls of", "")
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
		
		
		dbgMsg("Windfall: cnt :: " .. tostring(cnt), 1)
		dbgMsg("Windfall: sale :: " .. tostring(sale), 1)
		txt = string.gsub(txt, "you put up for sale in the (%a+) markets ", "")
		dbgMsg("Windfall: txt :: " .. tostring(txt), 1)
		
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
		dbgMsg("Windfall Craft: x :: " .. tostring(x), 1)
		Moodle("-AetherSpriggan-", "apply", "self", "buffs", "default")
		dbgMsg("Windfall: |txt| :: " .. tostring(txt), 1)
		
	end
	if string.find(txt, "MGP") then
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
		DoRandom("cheer", " moved by excellent performance.")
	elseif string.find(txt, "Silver Star rating") then
		Moodle("SilverStar", "apply", "self", "buffs", "default")
		playerProg.SilverStar = playerProg.SilverStar + 1
		EmoGyre("aetheric", -13.3)
		Moodle("-AetherSpriggan-", "apply", "self", "buffs", "default")
		EmoGyre("responsible", 3)
		EmoGyre("confident", 3)
		DoRandom("clap", " from a job well done.")
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
	elseif string.find(txt, "You clean the stable") then
		playerProg["cleaned stable"] = playerProg["cleaned stable"] or 0
		playerProg["cleaned stable"] = playerProg["cleaned stable"] + 1
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
	elseif string.sub(txt,1,5) == "dress" then
		txt = string.gsub(txt,"dress", "")
		if txt ~= "" then
			OutfitHandler("load " .. txt)
		else
			OutfitLoad(txt)
		end
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
	elseif txt == "return" then
		Game.SendChat("/return")
	elseif string.startsWith(txt, "tour") then
		txt = string.gsub(txt, "tour ", "")
		StartTour(txt)
	elseif string.startsWith(txt, "current") then
		txt = string.gsub(txt, "tour ", "")
		NextCurrent(txt)
	elseif string.startsWith(txt, "flag") then
		txt = string.gsub(txt, "flag ", "")
		Flagit(txt)
	elseif string.startsWith(txt, "ascend") then
		txt = string.gsub(txt, "ascend ", "")
		Ascend(txt)
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
		--words = string.lower(words)
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
	elseif flame == "*PW*" and not safe then
		PowerWords(txt, toss, chn, sender)
	elseif flame == "*shark*" then
		SharkHandler()
	elseif flame == "*prog*" then
		ProgHandler(txt, toss, chn)
	elseif flame == "*failure*" then
		Shame(toss)
	elseif flame == "*panic*" then
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
	elseif flame == "*jujuhoodoo*" then
		JujuHoodoo(txt, chn)
	elseif flame == "*profit*" then
		Windfall(txt, chn, toss)
	elseif flame == "*gossip*" then
		Report(txt)
	elseif flame == "*food*" or flame == "*drink*" then
		DoRandom(toss, match_type(txt, toss, sender))
	elseif flame == "*consume*" then
		ConsumableHandler(txt, chn, toss)
	elseif flame == "*balmung*" then
		emoReact("scared")
	elseif flame == "*crystal*" then
		Crystal(txt, chn, toss)
	elseif flame == "*kitty*" then
		getKitty("random")
	elseif flame == "*bunny*" then
		getBunny("random")
	elseif flame == "*motley*" then
		getMotley("random")
	elseif flame == "*poppit*" then
		getPoppit("random")
	elseif flame == "*turnip*" then
		getKyurghen("random")
	elseif flame == "*zoom*" and not InCombat and not safe then
		CallRoutine("automove")
	elseif flame == "*goober*" then
		Razzle()
	elseif flame == "*dazzle*" then
		Dazzle()
	elseif flame == "*plogon*" then
		if txt == "leves" then
			CallRoutine("leves")
			--Game.SendChat("/chilledleves")
		else
			Game.SendChat("/"..txt)
		end
	elseif flame == "*emo*" then
		emoReact(toss)
	elseif flame == "*destination*" then
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
	
	local salad = ChattyChop(txt)
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
		startTour, NextCurrent}

--	^								^	--
--	^	^^^ Chat Handler ^^^ 		^	--
--	^								^	--



