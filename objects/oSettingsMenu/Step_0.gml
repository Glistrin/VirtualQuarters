var MoveUp = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
var MoveDown = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
var Accept = (keyboard_check_pressed(vk_space) ||(keyboard_check_pressed(ord("F"))) ) 

pos += MoveDown - MoveUp

op_length =  array_length(option[menulevel])

if (pos >= op_length) {pos = 0};
if (pos < 0) {pos = op_length - 1}

if (Accept) {
	var level = menulevel
	switch(menulevel) {
		case 0 : 
			switch(pos) {
				case 0: with (oPlayer) {_State = StateMachFree}; instance_destroy(self); break;
				case 1: break;
				case 2: break;
				case 3: break;
				case 4: break;
			}
		break;

		
		}
	if level != menulevel pos = 0
	
	op_length = array_length(option[menulevel])

}