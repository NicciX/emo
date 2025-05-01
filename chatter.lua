
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
	--dbgMsg("!ChatHandler :: stackIdx :: " .. tostring(stackIdx), 1)
	--dbgMsg("!ChatHandler :: stackMsg :: " .. tostring(chatStack[stackIdx].msg), 1)
	local n
	local txt = chatStack[stackIdx].msg --Game.Chat.Msg
	local sender = chatStack[stackIdx].sender--Game.Chat.Sender
	local chn = chatStack[stackIdx].chn
	local stamp = chatStack[stackIdx].stamp
	
	sender = string.gsub(sender, "[]", "")

	
	
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
		elseif string.sub(txt, 1, 4) == "emo " then
			Game.SendChat("/" .. txt)
		elseif txt == "save" then
			CDUpdater()
		elseif txt == "artisan" or txt == "xllog" or txt == "xldat" or txt == "wolua reload" then
			Game.SendChat("/" .. txt)
		elseif string.find(txt, "lalafel") or string.find(txt, "lala") then
			GetAngry()
		elseif string.find(txt, "ahoy")  or string.find(txt, "heya") then
			Greetings()
		elseif string.find(txt, "hiya") or string.find(txt, "hello") then
			Greetings()
		--elseif string.find(string.lower(txt), "babyshark girl") or string.find(string.lower(txt), "baby shark girl") then
			--CallRoutine("babysharkgirl")
		--elseif string.find(txt, "Updating online status. No longer away from keyboard.") then -- Deprecated 7.0.1
			--SetAfk(nil)
		elseif string.find(txt, "red chair") or string.find(txt, "redchair") then
			Game.SendChat("/mount \"Archon Throne\"")
		elseif string.find(txt, "bird") or string.find(txt, "birb") then
			Game.SendChat("/useitem 41500")
		elseif string.find(txt, "sunshine") or string.find(txt, "birb") then
			Game.SendChat("/useitem 7809")
		elseif string.find(txt, "beaver") or string.find(txt, "bvr") then
			Game.SendChat("/minion \"Golden Beaver\"")
		elseif string.find(txt, "apple") then
			DoRandom("apple")
		elseif string.find(txt, "Kaldea") then
			DoRandom("doubt")
		elseif string.find(txt, "pizza") then
			DoRandom("pizza")
		elseif string.find(txt, "chocolate") then
			DoRandom("choco")
		elseif string.find(txt,"You gain the effect of") and string.find(txt, "Battle High V.") then
			phrash = "kittytoes"
			phrashDex = 1
			phrashTime = os.time()
			phrashDelay = 1
		elseif (string.find(txt, "brb") or string.find(txt, "afk")) and sender == playerName then
			CallRoutine("redchairafk")
		elseif string.find(txt, "haha") and sender == playerName then
			DoRandom("laugh")
		elseif string.find(txt, "rain") then
			DoRandom("water")
		elseif (string.find(txt, "lol") or string.find(txt, "hehe")) and sender == playerName then
			DoRandom("chuckle")
			--%s(no)%s
		elseif string.match(txt, "%f[A-Za-z]no%f[^A-Za-z]") and sender == playerName then
			DoRandom("no")
		elseif string.match(txt, "%f[A-Za-z]yes%f[^A-Za-z]") and sender == playerName then
			DoRandom("yes")
		elseif (string.match(txt, "%f[A-Za-z]embarrassed%f[^A-Za-z]") or string.match(txt, "%f[A-Za-z]embarrassing%f[^A-Za-z]")) and sender == playerName then
			DoRandom("blush")
		elseif (string.match(txt, "%f[A-Za-z]angry%f[^A-Za-z]") or string.match(txt, "%f[A-Za-z]mad%f[^A-Za-z]")) and string.find(txt, playerName) then
			DoRandom("angry")
		elseif string.find(txt, "mischief") or string.find(txt, "shenanigans") or string.find(txt, "tomfoolery") then
			local tmp = math.random(100)
			if tmp > 77 then
				Game.SendChat("/minion \"Mischief Maker\"")
			elseif tmp > 33 then
				Game.SendChat("/minion \"Motley Egg\"")
			else
				Game.SendChat("/minion \"Wind-up Fuath\"")
			end
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
				dumpInfo("outfits supersimple")
			end
			--Game.SendChat("/e " .. mt)
			
			--“White Mage B” equipped.
		elseif string.match(txt, "“[%a%s]+” equipped, but glamours could not be restored.") and Sys.Outfits then
			local mt = string.match(txt, "“([%a%s]+)” equipped.")
			gearsetChange = mt
			Game.SendChat("/updategearset") -- this is a vanilla command
			--CallRoutine("gearUpdate")
		elseif string.find(txt, "grats") then
			DoRandom("congratulate")
		elseif string.find(txt, "The time limit has expired.") then
			Shame(txt)
		elseif string.find(txt, "coffee") or string.find(txt, "tea") or string.find(txt, "thirsty") then
			DoRandom("tea")
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
			MatchStick(txt)
		end
		lastChat = txt
	end
	func_time["ChatHandler"].END = os.time()
	func_track("ChatHandler")
end

function Shame(txt)
	EmoGyre("embarrassed", 13)
	EmoGyre("anxious", 11)
	EmoGyre("sad", 7)
	Moodle("Shameful", "apply", "self", "buffs", "default")
end


function GetAngry()
	local angry = moods.angry
	local r = math.random(1, #angry)
	if angry[r] then
		DoRandom(angry[r])
	end
end

function emoReact(emo)
	dbgMsg("emoReact: emo :: " .. tostring(emo), 9)
	local mote = moods[emo]
	local r = math.random(1, #mote)
	if mote and mote[r] then
		DoRandom(mote[r])
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

function JujuHoodoo(txt, chn)
	dbgMsg(".JujuHoodoo.", 2)
	foodoo = string.match(txt, "juju (.+)$")
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
			doorun = true
			dbgMsg("JujuHoodoo:  *run* :: " .. tostring(foodoo), 1)
		end
		local func, oopsoo = load(bo..foodoo..be)
		if func then
			funCoo = {pcall(func)}
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
				Game.SendChat("/useitem 32860")
				Game.SendChat("/wait 1.5")
				Game.SendChat("/no")
			else
				if not doorun then
					Game.SendChat("/yes <wait.1>")
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
							func, oopsoo = load(bo..foodoo..be)
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
							Game.SendChat("/" .. string.lower(chn) .. preef .. tostring(funCoo[2]))
						else
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

function Windfall(txt, chn, toss)
	dbgMsg(".Windfall.", 2)
	--dbgMsg("Windfall: txt :: " .. tostring(txt), 1)
	--dbgMsg("Windfall: toss :: " .. tostring(toss), 1)
	if toss == "You obtain" or toss == "You gain" or toss == "You earn" or toss == "put up for sale" then
		txt = string.gsub(txt, toss, "")
		txt = string.gsub(txt, " ", "")
		--local val = string.match(txt, "(%d+)")
		--local val = string.match(txt, "(%d+,?%d*)")
		local val = string.match(txt, "(%d+,?%d+,?%d*)")
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
		CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] or 0
		CD[playerName]["earnings"][txt] = CD[playerName]["earnings"][txt] + val
		
		dbgMsg("Windfall: key :: " .. tostring(txt), 1) 
		dbgMsg("Windfall: val :: " .. tostring(val), 1) --Chloe had it backwards
		
		return
	end
	bits, bobs = string.match(txt, "(%d+,?%d*).+(MGP)")
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

function ProgHandler(txt, toss)
	dbgMsg("ProgHandler :: " .. tostring(txt), 1)
	if string.find(txt, "Gold Star rating") then
		Moodle("GoldStar", "apply", "self", "buffs", "default")
		playerProg.GoldStar = playerProg.GoldStar + 1
		EmoGyre("responsible", 10)
		EmoGyre("confident", 7)
		DoRandom("cheer")
	elseif string.find(txt, "Silver Star rating") then
		Moodle("SilverStar", "apply", "self", "buffs", "default")
		playerProg.SilverStar = playerProg.SilverStar + 1
		EmoGyre("responsible", 5)
		EmoGyre("confident", 3)
		DoRandom("clap")
	elseif string.find(txt, "Bronze Star rating") then
		Moodle("BronzeStar", "apply", "self", "buffs", "default")
		playerProg.BronzeStar = playerProg.BronzeStar + 1
		EmoGyre("responsible", 1)
		EmoGyre("confident", -1)
		DoRandom("shrug")
	elseif string.find(txt, "You submitted") or string.find(txt, "You earned a score") or
		string.find(txt, "experience points") then
		Moodle("BusyBee", "apply", "self", "buffs", "default")
		playerProg.SilverStar = playerProg.SilverStar + 1
		local val = string.match(txt, "(%d+,?%d+,?%d*)")
		if tonumber(val) then
			if string.find(txt, "experience") then
				txt = "Experience"
			elseif string.find(txt, "points") then
				txt = "Points"
			elseif string.find(txt, "score") then
				txt = "Score"
			else
				txt = "Unknown"
			end
			playerProg[txt] = playerProg[txt] or 0
			playerProg[txt] = playerProg[txt] + val
			EmoGyre("responsible", val / 777)
		end
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

function FlameCheck(flame, toss, txt)
	dbgMsg(".FlameCheck.", 2)
	dbgMsg("MatchStick: " .. txt, 9)
	dbgMsg(".FlameCheck: flame :: " .. tostring(flame), 9)
	dbgMsg(".FlameCheck: toss :: " .. tostring(toss), 9)
	local chn = Game.Chat.Chn
	dbgMsg(".FlameCheck: chn :: " .. tostring(chn), 9)
	if chn then
		if #chn > 0 then
			if tonumber(chn) then
				chn = "l"..chn
			end
		end
		chn = string.lower(chn)
		if not validChn then
			chn = "fc"
		end
	end
	--[2]<Sandy Skittles> juju lastChat

	if flame == "*creature*" then
		--words = string.lower(words)
	elseif flame == "*expense*" then
		--bits, bobs = string.match(txt, "(%d+) (gil)")
		bits, bobs = string.match(txt, "(%d*,?%d*) (gil)")
		if bits and bobs then
			dbgMsg("MatchStick: Bits & Bobs :: " .. tostring(bits) .. " & " .. tostring(bobs), 9)
			if IsPorting then
				dbgMsg("MatchStick: Porting finished: time :: " .. tostring(os.time() - IsPorting), 9)
				Porting(tonumber(bits))
				IsPorting = nil
			end
		end
	elseif flame == "*porting*" or flame == "*travel*" then
		IsPorting = os.time()
	elseif flame == "*shark*" then
		SharkHandler()
	elseif flame == "*prog*" then
		ProgHandler(txt, toss)
	elseif flame == "*failure*" then
		Shame(toss)
	elseif flame == "*duty*" then
		ProgHandler(txt, toss)
	elseif flame == "*jujuhoodoo*" then
		JujuHoodoo(txt, chn)
	elseif flame == "*profit*" then
		Windfall(txt, chn, toss)
	elseif flame == "*kitty*" then
		local r = math.random(1,100)
		if r < 10 then
			Game.SendChat("/minion \"Nagxian Cat\"")
		elseif r < 20 then
			Game.SendChat("/minion \"Tora-jiro\"")
		elseif r < 30 then
			Game.SendChat("/minion \"Coeurl Kitten\"")
		elseif r < 40 then
			Game.SendChat("/minion \"Black Coeurl\"")
		elseif r < 50 then
			Game.SendChat("/minion \"Byakko Cub\"")
		elseif r < 60 then
			Game.SendChat("/minion \"Palico\"")
		elseif r < 70 then
			Game.SendChat("/minion \"Jibanyan\"")
		elseif r < 80 then
			Game.SendChat("/minion \"Bluecoat Cat\"")
		elseif r < 90 then
			Game.SendChat("/minion \"Ilyikty'i\"")
		else
			Game.SendChat("/minion \"Weatherproof Gaelicat\"")
		end
	elseif flame == "*emo*" then
		emoReact(toss)
	elseif flame == "*profit*" then
		Windfall(txt, chn, toss)
	elseif flame == "*gewgaw*" then
		Game.SendChat("/useitem 12042")
	elseif flame == "*booger*" then
		DoRandom("aback")
	elseif flame == "*disappointment*" then
		DoRandom("disappointed")
	end
	matchMadness[flame] = {}
end

function MatchStick(txt)
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
				FlameCheck(flame, toss, txt)
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
				FlameCheck(flame, toss, txt)
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
				FlameCheck(flame, toss, txt)
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
				FlameCheck(flame, toss, txt)
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
					Game.SendChat("/fc " .. Blimey(matchsticks.lights[sticks].report))
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
		TimeGate, doPhrash, ProgHandler, emoReact}

--	^								^	--
--	^	^^^ Chat Handler ^^^ 		^	--
--	^								^	--



