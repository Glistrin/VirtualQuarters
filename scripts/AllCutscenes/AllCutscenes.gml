
global.CutscenesText = {
	Debug: {
		DebugOne: [
			[AddText, ["Did you know that cutscenes come from the greek word cut and scene", 0,0,0]],
			[AddText, ["And that you should cut yourself", 0,0,0]],
			[AddText, ["And pretend I had good worldplay ideas for the word scene", 0,0,0]]
		],
		DebugOneWait: [[AddText, ["Why are you still here", 0,0,0]]],
	
		DebugUndyne: [
			[AddText, ["The knight.", 0,0,0]],
			[AddText, ["The roaring knight.",0,0,0]],
			[AddText, ["wait no thats not what undyne says.",0,0,0]],
			[AddText, ["mb gng im going insane.",0,0,0]],
			[AddText, ["Seven.",0,0,0]],
			[AddText, ["The Roaring Se- ??? what am i on.",0,0,0]],
			[AddText, ["Seven human souls.",0,0,0]]
			[AddText, ["Always bet on Papyrus knight.",0,0,0]]
			[AddText, ["Or Sans worldsmith.",0,0,0]]
			[AddText, ["Or Papyrus Friend!",0,0,0]]
		],
		DebugUndyneAA: [[AddText, ["Something !!",0,0,0]]],
		DebugUndyneAAA: [[AddText, ["Raaa!!!",0,0,0]]],
		DebugUndyneAAAA: [[AddText, ["AAAAAA!!!",0,0,0]]]
	}
}


global.Cutscenes = {
	Debug: {
		DebugOne:  [
					[CutsceneStart, [-1]],
					[CutsceneFindText, [global.CutscenesText.Debug, "DebugOne"]],
					[CutsceneWait, [-1]],
					[CutsceneWait, [5]],
					[CutsceneFindText, [global.CutscenesText.Debug, "DebugOneWait"]],
					[CutsceneWait, [-1]],
					[CutsceneEnd, [-1]],
				],
		DebugUndyne:  [
					[CutsceneStart, [-1]],
					[CutsceneCamSize, [100, 160]],
					[CutsceneCamFollow, [Undyne, 40]],
					[CutsceneFindText, [global.CutscenesText.Debug, "DebugUndyne"]],
					[CutsceneWait, [-1]],
					[CutsceneWait, [1]],
					[CutsceneFindText, [global.CutscenesText.Debug, "DebugUndyneAA"]],
					[CutsceneWait, [-1]],
					[CutsceneCamRot, [45]],
					[CutsceneFindText, [global.CutscenesText.Debug, "DebugUndyneAAA"]],
					[CutsceneWait, [-1]],
					[CutsceneCamRot, [135]],
					[CutsceneFindText, [global.CutscenesText.Debug, "DebugUndyneAAAA"]],
					[CutsceneWait, [-1]],
					[CutsceneCamRot, [45]],
					[CutsceneCamRot, [0]],
					[CutsceneWait, [-1]],
					[CutsceneMoveObj, [Undyne, 0, 200, true, 20]],
					[CutsceneEnd, [-1]],
				]
	}
}
