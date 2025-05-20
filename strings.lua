local matchMadness = {
	["*event*"] = {
	
	},
	["*state*"] = {
	
	},
	["*location*"] = {
	
	},
	["*personality*"] = {
	
	},
	["*action*"] = {
	
	},
	["*thing*"] = {
	
	},
	["*effect*"] = {
	
	},
	["*wildcard*"] = {
	
	},
	["*wildcardb*"] = {
	
	},
	["*activity*"] = {
	
	},
	["*action*"] = {
		
	}, 
	["*destinaton*"] = {
		--["func"] = function()
	},
	["*gewgaw*"] = {
	
	},
	["*riffraff*"] = {
	
	},
	["*prog*"] = {
	
	},
	["*proverb*"] = {
	
	},
	["*jujuhoodoo*"] = {
	
	},
	["*expense*"] = {
	
	},
	["*profit*"] = {
	
	},
	["*emotion*"] = {
	
	},
	["*payback*"] = {
	
	},
	["*failure*"] = {
	
	},
	["*humility*"] = {
	
	},
	["*cat*"] = {
	
	},
	["*duck*"] = {
	
	},
	
}



local strings = {
	["Yojimbo, come on down!"] = "magictrick",
	["ahoy"] = "laliho",
	--["Gold Saucer Attendant: The limited-time event"] = {
		--["whim"] = "do",
		--["report"] = "The limited-time event “Cliffhanger” is now underway in Wonder Square East.",
	--},
	--["Gold Saucer Attendant: The limited-time event “Air Force One” is now underway in Round Square. All guests are encouraged to participate!"] = "pdead",
		--["whim"] = "do",
	--},
	["Yojimbo: Behold, the sword art of legend─Zanmato!"] = "paintyellow",
	["“The Capten lykes his wyne Redd.”"] = {
		["routine"] = "ReddWyne",
	},
	["“The Capten likes his cabege Green.”"] = {
		["routine"] = "GreenCebege",
	},
	["“The Capten likes his sees Bloo.”"] = {
		["routine"] = "Bloo",
	},
	--["juju hoodoo (.*)$"] = "clap",
		
	["Beauty's Wicked Wiles is now playing."] = "songbird",
	["Amusement Park is now playing."] = "hum",
	["Tomorrow and Tomorrow is now playing."] = "songbird",
	["Valse di Fantastica is now playing."] = "tdance",
	["Seven Hundred Seventy-Seven Whiskers is now playing."] = "yoldance",
	["Agent of Inquiry is now playing."] = "mdance",
	["Torn from the Heavens is now playing."] = "songbird",
	["The Grand Duchy of Jeuno is now playing."] = "bdance",
	["Close in the Distance is now playing."] = "songbird",
	--["Updating online status. No longer away from keyboard."] = function()
		--AFK = nil
		--return "e AFK set to nil" -- Deprecated
	--end,
	["Answers is now playing."] = "cheerwave",
	["erp"] = "panic motion",
	["bunny"] = "minion \"Dust Bunny\"",
	
	
	--Gold Saucer Attendant: Thar limited-time event “Leap o' Faith” be now underway in Round Square. All guests be encouraged t' participate!
}

local phrasher = {
	["firefly"] = {
		[1] = "/beesknees motion",
		[2] = "♪Firefly, can you see me?<w.2>♪",
		[3] = "♪Shine on, glowing, brief and brightly<w.2>♪",
		[4] = "♪Could you imagine? One summer day<w.2>♪",
		[5] = "♪That same night be on your way<w.2>♪",
		[6] = "♪Do you remember? Hearts were too cold<w.2>♪",
		[7] = "♪Seasons have frozen us into our souls<w.2>♪",
		[8] = "♪People were saying the whole world is burning<w.2>♪",
		[9] = "♪Ashes have scattered too hard to turn<w.2>♪",
	},
	["false alarm"] = {
		[1] = "/cheerjump motion",
		[2] = "♪Upside out or inside down<w.2>♪",
		[3] = "♪False alarm, the only game in town<w.2>♪",
		[4] = "♪No man's land, the only game in town<w.2>♪",
		[5] = "♪Terrible, the only game in town<w.2>♪",
	},
	["passenger"] = {
		[1] = "/cheerwave motion",
		[2] = "♪Passenger, don't you hear me?<w.2>♪",
		[3] = "♪Destination, seen unclearly<w.2>♪",
		[4] = "♪What is a man deep down inside?<w.2>♪",
		[5] = "♪But a raging beast, with nothing to hide<w.2>♪",
	},
	["playing in the band"] = {
		[1] = "♪Some folks trust to reason<w.2>♪",
		[2] = "♪Others trust to might<w.2>♪",
		[3] = "♪I don't trust to nothing<w.2>♪",
		[4] = "♪But I know it come out right<w.2>♪",

		[5] = "♪Say it once again now<w.2>♪",
		[6] = "♪Oh I hope you understand<w.2>♪",
		[7] = "♪When it's done and over<w.2>♪",
		[8] = "♪Lord, a man is just a man<w.2>♪",

		[9] = "♪Playing<w.2>♪",
		[10] = "♪Playing in the band<w.2>♪",
		[11] = "♪Daybreak<w.2>♪",
		[12] = "♪Daybreak on the land<w.2>♪",

		[13] = "♪Some folks look for answers<w.2>♪",
		[14] = "♪Others look for fights<w.2>♪",
		[15] = "♪Some folks up in treetops<w.2>♪",
		[16] = "♪Just look to see the sights<w.2>♪",

		[17] = "♪I can tell your future<w.2>♪",
		[18] = "♪Look what's in your hand<w.2>♪",
		[19] = "♪But I can't stop for nothing<w.2>♪",
		[20] = "♪I'm just playing in the band<w.2>♪",

		[21] = "♪Playing<w.2>♪",
		[22] = "♪Playing in the band<w.2>♪",
		[23] = "♪Daybreak<w.2>♪",
		[24] = "♪Daybreak on the land<w.2>♪",

		[25] = "♪Standing on a tower<w.2>♪",
		[26] = "♪World at my command<w.2>♪",
		[27] = "♪You just keep a turning<w.2>♪",
		[28] = "♪While I'm playing in the band<w.2>♪",

		[29] = "♪If a man among you<w.2>♪",
		[30] = "♪Got no sin upon his hand<w.2>♪",
		[31] = "♪Let him cast a stone at me<w.2>♪",
		[32] = "♪For playing in the band<w.2>♪",

		[33] = "♪Playing<w.2>♪",
		[34] = "♪Playing in the band<w.2>♪",
		[35] = "♪Daybreak<w.2>♪",
		[36] = "♪Daybreak on the land<w.2>♪",
		[37] = "♪Playing<w.2>♪",
		[38] = "♪Playing in the band<w.2>♪",
		[39] = "♪Daybreak Daybreak on the land<w.2>♪",
		[40] = "Playing in the Band - Grateful Dead",
	},
	["kittytoes"] = {
		[1] = "         ／l、         Clap<wait.1.5>",
		[2] = "        (°､ 。７つ,    Them",
		[3] = "        と,、⌒) )        Cheeks",
		[4] = "            （ ﾉﾉ	",
		[5] = "    Battle High V.",
		[6] = "/lophop motion<w.13.37>",
		[7] = "/cheer motion",
	},
	["greatjob"] = {
		[1] = "               ●<wait.0.55>",
		[2] = "                \\ ",
		[3] = "          /\\__\\__/\\ ",
		[4] = "        /                  \\ ",
		[5] = "       (ﾐ ⌒ ● ⌒ ﾐ)",
		[6] = "        \\                 / ",
		[7] = "       _ /              |",
		[8] = "    (                ,   \\ ",
		[9] = "     -          / /`\\  \\ ",
		[10] = "      ,'       (  (     \\  \\ ",
		[11] = "    /              `-, ",
		[12] = "   {               )   } ",
		[13] = "    :           .-  ,-` ",
		[14] = "     \\       |   | ",
		[15] = "   ",
	},
	["tyfp"] = {
		[1] = "       /)/)",
		[2] = "       ( . .)      Thank you",
		[3] = "    o( づ ♡  Take care"
	},
}

local matchsticks = {
	["strikes"] = {
		["Gold Saucer Attendant"] = "@personality@",
		["GATE Keeper"] = "@personality@",
		--["“([%a%s*%c*]+)”"] = "*wildcard*",
		["“([%w%s*?]+)”"] = "*wildcard*",
		["“(.*)”"] = "@wildcardb@",
		--["([%a,?%s*%c*]+)"] = "*short-phrase*",
		["underway"] = "*state*",
		["Round Square"] = "@location@",
		["Wonder Square East"] = "@location@",
		["Yojimbo"] = "*personality*",
		["Behold"] = "*action*",
		["Zanmato"] = "*thing*",
		["come on down"] = "*action*",
		["Uncover the coin"] = "*action*",
		["Daigoro"] = "*personality*",
		["sent running"] = "*humility*",
		["participation"] = "*thing*",
		["participate"] = "*action*",
		["Triple Triad"] = "*activity*",
		["chocobo"] = "*creature*",
		["You clean the stable"] = "*duty*",
		--["Teleporting to"] = "*porting*",
		["to The Gold Saucer..."] = "*destination*",
		["Minion Square"] = "*location*",
		["Event Square"] = "*location*",
		["loyal minions"] = "*creature*",
		--["You spent (%d+) (gil)."] = "*expense*",
		["You spent"] = "*expense*",
		["Any Way the Wind"] = "@event@",
		["Cliffhanger"] = "*event*",
		["You earn the achievement"] = "*prog*",
		["indigo star"] = "*bijou*",
		--["GATE Keeper"] = "*personality*",
		["Air Force One"] = "@event@",
		["Kongo Genji"] = "*riffraff*",
		["Leap of Faith"] = "*event*",
		["Slice Is Right"] = "@event@",
		["Wind Blows"] = "*event*",
		["trigger finger"] = "*action*",
		["Thank"] = "*action*",
		["lucky stars"] = "*bijou*",
		["your blood"] = "*duty*",
		["Fortune favors the bold"] = "*proverb*",
		--["You obtain (%d+,%d+) MGP"] = "*profit*",
		["juju"] = "*jujuhoodoo*",
		["You obtain"] = "*profit*",
		["dotes upon you."] = "*emotion*",
		["Supercilious Spellweaver"] = "@personality@",
		["put you in your place"] = "*humility*",
		["Let 'em have it"] = "*payback*",
		["Master Typhon"] = "*personality*",
		["umbrella"] = "*umbrella*",
		["beaver"] = "*beaver*",
		["cat"] = "*kitty*",
		["kitty"] = "*kitty*",
		["kitteh"] = "*kitty*",
		["duck"] = "*duck*",
		["bunn"] = "*bunny*",
		["bunny"] = "*bunny*",
		["rabbit"] = "*bunny*",
		["rabbits"] = "*bunny*",
		["bunnies"] = "*bunny*",
		["bunns"] = "*bunny*",
		["dust"] = "*bunny*",
		["sprite"] = "*bunny*",
		["familiar"] = "*poppit*",
		["minion"] = "*poppit*",
		["calca"] = "*poppit*",
		["brina"] = "*poppit*",
		["Calca"] = "*poppit*",
		["Brina"] = "*poppit*",
		["motley"] = "*motley*",
		["Motley"] = "*motley*",
		["prank"] = "*motley*",
		["goon"] = "*motley*",
		["troll"] = "*motley*",
		["hoodlum"] = "*motley*",
		["mummer"] = "*motley*",
		["rascal"] = "*motley*",
		["hooligan"] = "*motley*",
		["mimic"] = "*motley*",
		["ass"] = "*motley*",
		["tricks"] = "*motley*",
		["shards"] = "*crystal*",
		["crystals"] = "*crystal*",
		["clusters"] = "*crystal*",
		["charm"] = "*bijou*",
		["glamour"] = "*bijou*",
		["bijou"] = "*bijou*",
		["talisman"] = "*bijou*",
		["prism"] = "*bijou*",
		["trinket"] = "*bijou*",
		["You synthesize"] = "*profit*",
		["Teleporting to"] = "*travel*",
		["You use Teleport"] = "*travel*",
		["You ready Teleport"] = "*travel*",
		["gewgaw"] = "*bijou*",
		["booger"] = "*booger*",
		["boogeyman"] = "*booger*",
		["vampire"] = "*booger*",
		["wraith"] = "*booger*",
		["spook"] = "*booger*",
		["booger"] = "*booger*",
		["boogers"] = "*booger*",
		["ghost"] = "*booger*",
		["spirit"] = "*booger*",
		["bugaboo"] = "*booger*",
		["devil"] = "*booger*",
		["demon"] = "*booger*",
		["eidolan"] = "*booger*",
		["Gold Star"] = "*prog*",
		["Silver Star"] = "*prog*",
		["Bronze Star"] = "*prog*",
		["Sightseeing log entry"] = "*prog*",
		["You earn"] = "*prog*",
		["You earned"] = "*prog*",
		["You gain"] = "*profit*",
		["put up for sale"] = "*profit*",
		["time limit has expired"] = "*failure*",
		["mission abandoned"] = "*failure*",
		["You failed a craft"] = "*failure*",
		["You attain"] = "*prog*",
		["experience points"] = "*prog*",
		["You submitted"] = "*duty*",
		["babyshark girl"] = "*shark*",
		["baby shark girl"] = "*shark*",
		["bsg"] = "*shark*",
		["Cerrionia"] = "*shark*",
		["HER"] = "*shark*",
		["SHE"] = "*shark*",
		["Hydaelyn"] = "*shark*",
		["erp"] = "*balmung*",
		["tit"] = "*balmung*",
		["boob"] = "*balmung*",
		["ass"] = "*balmung*",
		["balmung"] = "*balmung*",
		["Red alert"] = "*gossip*",
		["has logged out"] = "*gossip*",
		["You use Aetherial Shift"] = "*zoom*",
		["You use En Avant"] = "*zoom*",
		-- Black
		["focused"] = "*emo*",
		["dazed"] = "*emo*",
		["mischievous"] = "*emo*",
		["anxious"] = "*emo*",
		["flippant"] = "*emo*",
		["aetheric"] = "*emo*",
		-- Blue
		["bored"] = "*emo*",
		["scared"] = "*emo*",
		["sleepy"] = "*emo*",
		["sad"] = "*emo*",
		["cold"] = "*emo*",
		["wet"] = "*emo*",
		-- Red
		["angry"] = "*emo*",
		["embarrassed"] = "*emo*",
		["curious"] = "*emo*",
		["hot"] = "*emo*",
		["flirty"] = "*emo*",
		["amused"] = "*emo*",
		-- Yellow
		["hungry"] = "*emo*",
		["puzzled"] = "*emo*",
		["energized"] = "*emo*",
		["busy"] = "*emo*",
		["amazed"] = "*emo*",
		["surprised"] = "*emo*",
		-- Green
		["tense"] = "*emo*",
		["uncomfortable"] = "*emo*",
		["impatient"] = "*emo*",
		["bathing"] = "*emo*",
		["diving"] = "*emo*",
		["nosey"] = "*emo*",
		-- White
		["happy"] = "*emo*",
		["playful"] = "*emo*",
		["confident"] = "*emo*",
		["social"] = "*emo*",
		["neutral"] = "*emo*",
		["responsible"] = "*emo*",
		--Plogons
		["chatalerts"] = "*plogon*",
		["chatx"] = "*plogon*",
		["tweaks"] = "*plogon*",
		["penny"] = "*plogon*",
		["glamourer"] = "*plogon*",
		--["glam"] = "*plogon*",
		["snd"] = "*plogon*",
		["artisan"] = "*plogon*",
		["penny toggle"] = "*plogon*",
		["xllog"] = "*plogon*",
		["phb"] = "*plogon*",
		[":p"] = "*goober*",
		["panic"] = "*panic*",
		["stop"] = "*panic*",
		["kill"] = "*panic*",
		["break"] = "*panic*",
		["off"] = "*panic*",
		["safe"] = "*panic*",
		["exit"] = "*panic*",

		
		["Pilot selection has"] = "*disappointment*",
		--["Teleporting to ([%a+%s?])..."] = "*porting*",
	},
	["lights"] = {
		--Yojimbo: Uncover the coin and it is yours, Chance upon Daigoro, and you will be sent running with your tail between your legs!
		
		["Yojimbo•Fortune favors the bold•"] = {
			["routine"] = "CenterStage",
		},
		["AFO•underway•RS•participate•"] = { -- Air Force One
			["report"] = "The limited-time event “Air Force One” is now underway in Round Square. All guests are encouraged to participate!",
			["gate"] = "Air Force One",
		},
		["Yojimbo•Behold•Zanmato•"] = "paintyellow",
		["umbrella•"] = {
			["routine"] = "rainyday",
		},
		["Leap of Faith•underway•RS•participate•"] = { --Leap of Faith
			["report"] = "The limited-time event “Leap of Faith” is now underway in Round Square. All guests are encouraged to participate!",
			["gate"] = "Leap of Faith",
		},
		["Cliffhanger•underway•RS•participate•"] = { -- Cliffhanger
			["report"] = "The limited-time event “Cliffhanger” is now underway in Round Square. All guests are encouraged to participate!",
		},
		["participate•AWTW•Wind Blows•Event Square•"] = { -- Wind Blows
			["report"] = "The limited-time event “Any Way the Wind Blows” is now underway in Event Square. All guests are encouraged to participate!",
			["gate"] = "Any Way the Wind Blows",
		},
		["Yojimbo•come on down•"] = "magictrick",
		["GSA•SIR•underway•Event Square•participate•"] = {
			["report"] = "The limited-time event “The Slice Is Right” is now underway in Event Square. All guests are encouraged to participate!",
			["gate"] = "The Slice Is Right",
		},
		["Open the Gates•"] = "useitem 12042",
		["Kongo Genji"] = "slap motion",
		["juju hoodoo•"] = "dance motion",
		["Leap of Faith•RS•participate•"] = {
			["report"] = "The limited-time event “Leap of Faith” starts in <timegate>.",
		},
		--GSA•SIR•underway•Event Square•participate•
		["SIR•Event Square•participate•"] = {
			["report"] = "The limited-time event “The Slice Is Right” starts in <timegate>.",
		},
		["AFO•RS•participate•"] = {
			["report"] = "The limited-time event “Air Force One” starts in <timegate>.",
		},
		["AWTW•Wind Blows•Event Square•participate•"] = {
			["report"] = "The limited-time event “Any Way the Wind Blows” starts in <timegate>.",
		},
		["participate•Leap of Faith•RS•"] = {
			["report"] = "The limited-time event “Leap of Faith” is currently underway in Round Square.",
		},
		["participate•AFO•RS•"] = {
			["report"] = "The limited-time event “Air Force One” is currently underway in Round Square.",
		},
		["Wind Blows•Event Square•participate•"] = {
			["report"] = "The limited-time event “Any Way the Wind Blows” starts in <timegate>.",
		},
		["Cliffhanger•RS•participate•"] = {
			["report"] = "The limited-time event “Cliffhanger” starts in <timegate> in Round Square.",
		},
		["Cliffhanger•WSE•participate•"] = {
			["report"] = "The limited-time event “Cliffhanger” starts in <timegate>.",
		},
		["Cliffhanger•underway•WSE•participate•"] = {
			["report"] = "The limited-time event “Cliffhanger” is currently underway in Wonder Square East.",
		},
		["Yojimbo•Uncover the coin•Daigoro•sent running•"] = "magictrick",
		
		["Yojimbo•Thank•lucky stars•Zanmato•"] = "wow",
		--1,000,000 gil taken from message.
		--GSA•Cliffhanger•underway•WSE•participate•
		--GK•participate•Leap of Faith•RS•
		--GK•Cliffhanger•RS•participate•
		--Yojimbo•Thank•lucky stars•Zanmato•
		--Yojimbo•Uncover the coin•Daigoro•sent running•
		--Supercilious Spellweaver: That should put you in your place. Let 'em have it, Master Typhon!
	}
	--Gold Saucer Attendant: The limited-time event “Air Force One” is now underway in Round Square. All guests are encouraged to participate!

}

return {strings, matchsticks, matchMadness, phrasher}
