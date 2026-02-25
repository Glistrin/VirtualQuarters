enum DIALOUGE_SPECIAL_TYPE {
	QUESTS
}


enum SPECIFY {
	NAME,
	SOUND,
	BACKGROUND,
	SPRITE,
	EXPRESSION,
	SIDE,
	PARASEP
}

global.TempFullIDFull = 0
global.Lines = {
	Debug: {
		BaconGames: {
			Norm: [ 
				[AddText, ["Aaaaa", [0]]],
				[AddText, ["aaaaa", [0]]],
				[AddText, ["a or b", [CHARAS.JADE, 0, -1, 0]]],
					[AddOptions, ["A?", "A"]],
					[AddOptions, ["B?",  "B"]],
					[AddOptions, ["what","C"]],
					[DIALOUGE_SPECIAL_TYPE.QUESTS, global.Quests.Testing, "TalkedtoBaconornoGames", true],
			],
			
			A: [
					[AddText, ["aaaa", [0]]]
			],
		
			B: [
					[AddText, ["bbbb", [0]]]
			],
		
			C: [ 
					[AddText, ["c", [0]]]
			]
		},
		TextTuts: [
			[AddText, ["People talk too slow, don't you think?", [0]]],
			[AddText, ["I heard that pressing SPACE or F twice makes them talk faster!", [0]]],
			[AddText, ["and pressing it a third time makes them finish their text immediatly!", [0]]],
			[AddText, ["I also heard that you can press Z after that to finish all of their dialouge...", [0]]],
			[AddText, ["I'd never do that to someone though...", [0]]],
			[AddText, ["You should <c, 4, 0, 255, 0><d, 4, 4>test it on the person next to me!!", [0]]]
		],
		
		Longahh: [
			[AddText, ["This is a very long text aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 1", [0]]],
			[AddText, ["This is short but there is many of ussssssssssssssssssssssssssssssssssssssssssss 2", [0]]]
		],
		
		Test: [
				[AddText, ["Test, Maple", [CHARAS.MAPLE, 0, -1, 1]]],
				[AddText, ["Test, MapleThinking", [CHARAS.MAPLE, 1, 1, 1]]],
				[AddText, ["hi my name is leon", [CHARAS.LEON, 0, 1, 1]]],
				[AddText, ["hi my name is km", [CHARAS.KM, 0, -1, 1]]],
				[AddText, ["myer", [CHARAS.MYER, 0, 1, 1]]],
				[AddText, ["jafe", [CHARAS.JADE, 0, -1, 1]]],
				[AddText, ["Test, Hoddo", [CHARAS.HODDO, 0, -1, 1]]],
				[AddText, ["Test, Tem", [CHARAS.TEM, 0, 1, 1]]],
				[AddText, ["Test, Special", ["Faggot", MidVoice, 3, MyerTalk, 0, -1, 0]]],
				[AddText, ["Test, Nameless", [51, 0, -1, 0]]]

		],
		
		ParagraphingTest: [
				[AddText, ["Hello", [CHARAS.MAPLE, 0, -1, 0]]],
				[AddText, ["I am continuing my dialouge", [CHARAS.MAPLE, 0, -1, 0]]],
				[AddText, ["I am interjecting from the same side!", [CHARAS.KM, 0, -1, 1]]],
				[AddText, ["I am interjecting from the oppositte side!", [CHARAS.MYER, 0, 1, 1]]],			
		],
		
		REALCBCONVO: [
				[AddText, ["Guys", [CHARAS.HODDO, 0, -1, 1]]],
				[AddText, ["My Nintendo Wii", [CHARAS.HODDO, 0, -1, 0]]],
				[AddText, ["what", [CHARAS.TEM, 0, 1, 1]]],
				[AddText, ["i heard wii and instantly came", [CHARAS.TEM, 0, 1, 0]]],
				[AddText, ["NOT IN THAT WAY", [CHARAS.TEM, 0, 1, 1]]],	
				[AddText, ["SmallishB", [CHARAS.SYOL, 0, -1, 1]]],
				[AddText, ["Big Bean", [CHARAS.SYOL, 0, -1, 1]]],	
				[AddText, ["NOT IN THAT WAY", [CHARAS.TEM, 0, 1, 1]]],
				[AddText, ["NOT IN THAT WAY", [CHARAS.TEM, 0, 1, 0]]],
				[AddText, ["NOT IN THAT WAY", [CHARAS.TEM, 0, 1, 0]]],	
				[AddText, ["NOT IN THAT WAY", [CHARAS.TEM, 0, 1, 0]]],	
				[AddText, ["NOT IN THAT WAY", [CHARAS.TEM, 0, 1, 0]]],	
				[AddText, ["????", [CHARAS.MAPLE, 0, 1, 1]]],
		],
		
		QuestProgression: {
				First: [
				[AddText, ["Hi! Youve done nothing.", [0]]]
				],
				
				Second: [
				[AddText, ["Hi! Youve talked to one thing.", [0]]],
				[DIALOUGE_SPECIAL_TYPE.QUESTS, global.Quests.Testing, "TalkedtoTracker", true]
				],

				Third: [
				[AddText, ["Hi! Youve done everything!.", [0]]]
				]
		}
	}

}