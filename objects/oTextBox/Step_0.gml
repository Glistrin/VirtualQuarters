
with(oPlayer) {_State = StateMachLock}
	
var _end_of_text = _drawChara >= _lengthText[_dialougeCurrent]
var _end_of_dialouge = _dialougeCurrent == _DialougeTotal-1
	
// "Texting"
var no_suspense = _timerTextPause[_dialougeCurrent, _drawChara] <= 0
if !no_suspense {_timerTextPause[_dialougeCurrent, _drawChara]--} 

if (!_end_of_text and no_suspense) {
	_drawChara += _textSpeed
	_drawChara = clamp(_drawChara, 0, _lengthText[_dialougeCurrent])
	
	var time_to_play_sound = _soundCount >= _soundDelay
	if (time_to_play_sound) {
		_soundCount = -1; 
		audio_play_sound(_sound[_dialougeCurrent], 4, false)
	}
		_soundCount++

} 



if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("F")) ) {

	if (_end_of_text) {
		var _to_next_text = !_end_of_dialouge && _sent
		
		if _to_next_text { 
			_dialougeCurrent++;
			_drawChara = 0;
			_sent = false
		}  else if !_sent {
				_sent = true
		} else {
			if options > 0  {FindText(ParentStruct, _optionID[_optionsPos])}
			with(oPlayer) {_State = StateMachFree}
			instance_destroy()
		}

		_Impatience = 0;
		_textSpeed = 0.5
		}
	else if (_Impatience < 3) {_textSpeed *= 3; _Impatience++}
	else {_drawChara = _lengthText[_dialougeCurrent]; _sent = true}
	


}



var OptionsExist = (_end_of_text && _end_of_dialouge && options > 0)
if OptionsExist {
	
	var _keydown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
	var _keyup = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
	_optionsPos += _keydown - _keyup
	if (_optionsPos < 0) _optionsPos = options - 1
	if (_optionsPos == options) _optionsPos = 0
}


fps1 += 0.05
