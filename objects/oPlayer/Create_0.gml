
KeyMenu = (keyboard_check_pressed(vk_control))
KeyInteract = (keyboard_check_pressed(ord("F")))




_Direction = 0
_Magnitude = 0

_PartyMember = 0

_State = StateMachFree
_lastState = _State

_colMap = layer_tilemap_get_id("Collision")

image_speed = 0
_hSpeed = 0
_vSpeed = 0
_WalkSpeed = 4.5

_LocalSprFrame = 0

if (global.CurrentX != -1) {
 	x = global.CurrentX
	y = global.CurrentY
	direction = global.CurrentDir
}