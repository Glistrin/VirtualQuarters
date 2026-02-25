var MoveLeft = (keyboard_check(vk_left) || keyboard_check(ord("A")))
var MoveRight = (keyboard_check(vk_right) || keyboard_check(ord("D")))
var MoveUp = (keyboard_check(vk_up) || keyboard_check(ord("W")))
var MoveDown = (keyboard_check(vk_down) || keyboard_check(ord("S")))
_PartyMember  = global.Party[global.CurrentPartyM]
KeyMenu = (keyboard_check_pressed(vk_control))
KeyInteract = (keyboard_check_pressed(ord("F")))

	_Direction = point_direction(0,0,MoveRight-MoveLeft,MoveDown-MoveUp)
	_Magnitude = (MoveRight - MoveLeft != 0) ||(MoveDown - MoveUp  != 0)	
	
_State()

depth = -bbox_bottom