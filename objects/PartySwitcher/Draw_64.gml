
var CurrentMember = global.Party[global.CurrentPartyM]
var PrevMember = global.CurrentPartyM - 1
var NextMember = global.CurrentPartyM + 1

if (PrevMember == -1) PrevMember = 2
if (NextMember == 3) NextMember = 0

PrevMember = global.Party[PrevMember]
NextMember = global.Party[NextMember]


if PartyUISwitchAnim == 0 {
	draw_sprite(CurrentMember.Sprites.Icon,-1,100, 475)
	draw_sprite(PrevMember.Sprites.Icon,-1,50, 575)
	draw_sprite(NextMember.Sprites.Icon,-1,150, 575)
	draw_sprite(PartyInBetween, 0, 100,575)
	draw_sprite(PartyInBetween, 2, 120,520)
	draw_sprite(PartyInBetween, 1, 80,520)
}

if PartyUISwitchAnim == 1 {
	var PartyUISwitchProgressLerp = (10 - PartyUISwitchProgress) / 10
	draw_sprite(CurrentMember.Sprites.Icon,-1,lerp(100, 50,PartyUISwitchProgressLerp), lerp(475, 575, PartyUISwitchProgressLerp))
	draw_sprite(PrevMember.Sprites.Icon,-1,lerp(50, 150, PartyUISwitchProgressLerp), 575)
	draw_sprite(NextMember.Sprites.Icon,-1,lerp(150, 100, PartyUISwitchProgressLerp), lerp(575, 475,PartyUISwitchProgressLerp))	
	PartyUISwitchProgress--
}

if PartyUISwitchAnim == 2  {
	var PartyUISwitchProgressLerp = (10 - PartyUISwitchProgress) / 10
	draw_sprite(CurrentMember.Sprites.Icon,-1,lerp(100, 150, PartyUISwitchProgressLerp), lerp(475, 575, PartyUISwitchProgressLerp))
	draw_sprite(PrevMember.Sprites.Icon,-1,lerp(50, 100, PartyUISwitchProgressLerp), lerp(575, 475, PartyUISwitchProgressLerp))
	draw_sprite(NextMember.Sprites.Icon,-1,lerp(150, 50, PartyUISwitchProgressLerp), 575)
	PartyUISwitchProgress--
}

if (PartyUISwitchProgress == 0) {PartyUISwitchAnim = 0}

