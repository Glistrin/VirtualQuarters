
with(oPlayer) {_State = StateMachLock}
			
// Get length of text
if (_timerTextPause[_dialougeCurrent, _drawChara] <= 0) { 
	if (_drawChara < _lengthText[_dialougeCurrent] ) {
		_drawChara += _textSpeed
		_drawChara = clamp(_drawChara, 0, _lengthText[_dialougeCurrent])
		
		var _characheck = string_char_at(_text[_dialougeCurrent],_drawChara)

		if (_soundCount < _soundDelay) {
			_soundCount++
		} else {
			_soundCount = 0; 
			audio_play_sound(_sound[_dialougeCurrent], 4, false)
			}
	} 
} else {
	_timerTextPause[_dialougeCurrent, _drawChara]--
}

// Next line of text
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("F"))) {
	// If done
	if (_drawChara >= _lengthText[_dialougeCurrent]) {
		if _dialougeCurrent < _DialougeTotal-1 {_drawChara = 0; _dialougeCurrent++;} // Move to next dialouge
		else {
			if options > 0  {FindText(ParentStruct, _optionID[_optionsPos])}
			with(oPlayer) {_State = StateMachFree}
			instance_destroy()
		}
		
		_Impatience = 0;
		_textSpeed = 0.5
		}
	
	else if (_Impatience == 3) {
		_drawChara = _lengthText[_dialougeCurrent]
	}
	
	else if (_Impatience >= 0 && _Impatience != 3) {_textSpeed *= 3; _Impatience++}

}
// Skip entirety of text
if (keyboard_check_pressed(ord("Z")) && _Impatience == 3) {
	
	_dialougeCurrent = _DialougeTotal - 1
	_drawChara = _lengthText[_dialougeCurrent]}


			
if _drawChara == _lengthText[_dialougeCurrent] && _dialougeCurrent == _DialougeTotal-1 {
	
	var _keydown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
	var _keyup = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
	_optionsPos += _keydown - _keyup
	if (_optionsPos < 0) _optionsPos = options - 1
	if (_optionsPos == options) _optionsPos = 0
}


fps1 += 0.05
