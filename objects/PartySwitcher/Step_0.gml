// The Party Switching 

var QButton = keyboard_check_pressed(ord("Q"))
var EButton = keyboard_check_pressed(ord("E"))

if (QButton) {
	global.CurrentPartyM += 1
	if (global.CurrentPartyM > 2) global.CurrentPartyM = 0
	PartyUISwitchAnim = 1
	PartyUISwitchProgress = 10
	}
if (EButton) {
	global.CurrentPartyM -= 1
	if (global.CurrentPartyM < 0) global.CurrentPartyM = 2
	PartyUISwitchAnim = 2
	PartyUISwitchProgress = 10
	}