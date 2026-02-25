SetUpDialouge()
	


var prev_lines_offset = 0;
for (var messages = 0; messages < 9; messages++) {

	var drawnDialouge = _dialougeCurrent - messages 
	
	var Out_of_Bounds_Message = (drawnDialouge < 0)
	if Out_of_Bounds_Message break;
	
	var currentdialouge = (drawnDialouge == _dialougeCurrent) && (_drawChara < _lengthText[_dialougeCurrent])

	prev_lines_offset += (_numberLinebreak[drawnDialouge]*_newlineSep) + 20 + _border*2
	
	var drawtalker = (_name[drawnDialouge] != "") && (!currentdialouge)
	if drawtalker { 	// Speaker
		var _textboxW = sprite_get_width(UIBackground)
		var _textboxH = sprite_get_height(UIBackground)
		
		// Name
		var MiddleOfText = 0
		if (_sideSpeaker[drawnDialouge] == -1) MiddleOfText = 96
		if (_sideSpeaker[drawnDialouge] == 1) MiddleOfText = 330

		draw_sprite_ext(UIBackground, _background[drawnDialouge], MiddleOfText, _box_y-20-prev_lines_offset, 125/_textboxW, 25/_textboxH, 0, c_white,1)
		
		MiddleOfText += 64 - (string_width(_name[drawnDialouge]) / 2)

		draw_text_transformed(MiddleOfText, _box_y-20-prev_lines_offset, _name[drawnDialouge], 1, 0.75, 0)
	 
		// PFP
		var sprite = _sprite[drawnDialouge]
		var _pfp_x_pos = portrait_offset[drawnDialouge]
		
		var _expression = (3 * _SpriteExpression[drawnDialouge])
		var _frame = round(fps1) % 3 + _expression
		
		draw_sprite_ext(UIBackground, _background[drawnDialouge], _pfp_x_pos-4, _box_y-11-prev_lines_offset, 4.5, 7, 0,c_white,1)
		draw_sprite_ext(sprite,_frame,_pfp_x_pos, _box_y-15-prev_lines_offset, 0.5,1,0,c_white,1)
	
	}


	
	var maxlengthx  = 0
	for (var char = 0; char < _drawChara; char++) {
	
		var d = drawnDialouge
		var amount_of_characters_to_write = 0
		var y_draw = 0
		if !currentdialouge y_draw = _box_y - prev_lines_offset else  y_draw = _box_y + 24
		
		if currentdialouge {amount_of_characters_to_write = char} 
		else {amount_of_characters_to_write = array_length(_currentChara[d]) - 1}
		

		if !currentdialouge {draw_sprite_ext(TextBackground, _textbg[d],
		text_x_offset[d], y_draw,
		_FinalBoxWidth[d], _FinalBoxHeight[d], 0, c_white, 1)
		peak_length_y = _FinalBoxHeight[d]} else { 
		
		var text_length_y = _currentCharaY[d,char] - (_box_y-10) + _border*2
		var text_length_x = _currentCharaX[d,char] - text_x_offset[d] + 20
		if text_length_x > maxlengthx {maxlengthx = text_length_x}
		

		maxlengthx /= sprite_get_width(TextBackground)
		text_length_y /= sprite_get_height(TextBackground)
		
		if _sideSpeaker[d] == -1 _textbg[d] = 0 else _textbg[d] = 1
		
		draw_sprite_ext(TextBackground, 2,
		text_x_offset[d], y_draw,
		maxlengthx, text_length_y, 0, c_white, 1)
		
		_FinalBoxWidth[_dialougeCurrent] = maxlengthx
		_FinalBoxHeight[_dialougeCurrent] = text_length_y


		}
		
	
		// Text
		for (var _char = 0; _char <= amount_of_characters_to_write; _char++) {
			var c = _char
			var lines
			if currentdialouge lines = prev_lines_offset-68
			else lines = prev_lines_offset
			draw_text_transformed_color	(_currentCharaX[d, c], _currentCharaY[d, c]-lines, _currentChara[d, c], 1, 1, 0, _col1[d,c], _col2[d,c],_col3[d,c], _col4[d,c],1)
		}
	}
	prev_lines_offset += _ParaSep[drawnDialouge]*50 
}


var ShowOptions = (_drawChara == _lengthText[_dialougeCurrent] && _dialougeCurrent == _DialougeTotal-1)
if  ShowOptions {
	var _textboxW = sprite_get_width(UIBackground)
	var _textboxH = sprite_get_height(UIBackground)
	
	var _op_height = 36
	var _op_border = 12
	var _op_width = 0
	for (var _op = 0; _op < options; _op++) {
		var cur_width = string_width(_optionName[_op]) + _op_border * 2
		if (cur_width > _op_width) _op_width = cur_width	
	}
	for (var _op = 0; _op < options; _op++) {
		
		var _dialougeY = (_box_y-20) - _op_height*options + _op_height*_op + 5*_op
		draw_sprite_ext(UIBackground,0,text_x_offset[_dialougeCurrent] + 16, _dialougeY,_op_width/_textboxW, (_op_height - 2)/_textboxH,0,c_white,1)
		draw_text(text_x_offset[_dialougeCurrent] + 16 + _op_border, _dialougeY + 2, _optionName[_op])
		
		var is_finaloption = _optionsPos == _op
		if is_finaloption {
			draw_sprite(DialougeArrow,-1, text_x_offset[_dialougeCurrent],_dialougeY) 
	}
	
}
}

