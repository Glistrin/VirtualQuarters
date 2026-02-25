
{ // SetUp UI Vars
	function SetUpDialougeSpeaker(d) {
		text_x_offset[d] = 120
			
		if (_sideSpeaker[d] == 1) {
			text_x_offset[d] = 436
			portrait_offset[d] = 472
		}
		else if (_sideSpeaker[d] == -1) {
			text_x_offset[d] = 96
			portrait_offset[d] = 54
		}
	}
	
		
	function FindClosingBracket(startchar, d) {
		for (var c = startchar; c < _lengthText[d]; c++) {
			if (string_char_at(_text[d], c) == ">") {return (c + 1 - startchar)}
		}
	}
	function GetParameters(Paras, Num) {
		var Args = [""]
		var CurrentArg = 0
		var ArgCharaCount = 1
		var ArgStart = 0
		
		for (var c = 0; c < string_length(Paras); c++) {
			var _charapos = c+1
			var CurrentChara = string_char_at(Paras, _charapos)
			
			switch (CurrentChara) {
				
				case "<":
					ArgStart = _charapos+1
				break;
				case " ":
					ArgStart = _charapos+1
					CurrentArg++
					ArgCharaCount = 1
				break;
				

				
				case ">": break;
				case ",": break;
				
				default:
					Args[CurrentArg] = string_copy(Paras, ArgStart, ArgCharaCount)
					ArgCharaCount++
				break;
				
			}
		}
		return Args[Num-1]
	}
		
	function PlaceEffectsColor(Parameters, Start, Count, Type, d) {
		var RR = real(GetParameters(Parameters, 3))
		var GG = real(GetParameters(Parameters, 4))
		var BB = real(GetParameters(Parameters, 5))
		
		var rgbcolor = make_color_rgb(RR, GG, BB)
		for (var c = Start-1; c <= Start-1+Count; c++) {
			_col1[d,c] = rgbcolor
			_col2[d,c] = rgbcolor
			_col3[d,c] = rgbcolor
			_col4[d,c] = rgbcolor
		}
	}
	function PlaceEffectSoundDelay(Parameters, Start, Count, Type, d) {
		var Speed = real(GetParameters(Parameters, 3))
		
		for (var c = Start-1; c <= Start-1+Count; c++) {
			_timerTextPause[d,c] = Speed
		}
	}
	function PlaceEffects(Parameters, Start, Count, Type, d) {
		switch(Type) {
			case "c": 
				PlaceEffectsColor(Parameters, Start, Count, Type, d)
			break;
			case "d": 
				PlaceEffectSoundDelay(Parameters, Start, Count, Type, d)
			break;
		
		}
	}
		
	function SetUpDialougeLineBreak(d) {
		for (var c = 0; c < _lengthText[d]; c++) { // Finding where the linebreaks go
			var _charapos = c+1	
		
			_currentChara[d, c] = string_char_at(_text[d], _charapos)
			
			var squishiness = 0.85
			var String_until_chara = string_copy(_text[d], 1, _charapos)
			var String_until_chara_width = string_width(String_until_chara)*squishiness - string_width(_currentChara[d, c])*squishiness
			var Chara_is_Space = _currentChara[d, c] == " "
			var CurrentLineWidth =  String_until_chara_width - _Linebreak_PreviousLines[d]
			var Line_is_too_long = CurrentLineWidth > _linewidth
			
			
			if  Chara_is_Space {_lastfreespace = _charapos + 1}

			if Line_is_too_long { 
				_positionLinebreak[d, _numberLinebreak[d]] = _lastfreespace
				_numberLinebreak[d]++
			
				var previouslines = string_copy(_text[d], 1, _lastfreespace)
				var lastfreespace = string_char_at(_text[d], _lastfreespace)
				var previouslinesWidth = string_width(previouslines)*squishiness
				var lastfreespacewidth = string_width(lastfreespace)*squishiness
		

			
				var Offset_amount = previouslinesWidth - lastfreespacewidth
				_Linebreak_PreviousLines[d] = Offset_amount
			} else {if (_sideSpeaker[d] == 1) {text_x_offset[d] -= string_width(_currentChara[d, c])*squishiness}}
			
		}
		for (var c = 0; c < _lengthText[d]; c++) { // Changing the x and y's based on that info
			var _charapos = c+1
			var _textypos = 0
			var _textxpos = 0
			
			var squishiness = 0.85
			var String_until_chara = string_copy(_text[d], 1, _charapos)
			var String_until_chara_width = string_width(String_until_chara)*squishiness - string_width(_currentChara[d, c])*squishiness
			var _textline = 0
			
			for (var linebreaks = 0; linebreaks < _numberLinebreak[d]; linebreaks++) {
				if _charapos >= _positionLinebreak[d, linebreaks] {
					var line_start = _positionLinebreak[d, linebreaks]
					var line_count = _charapos-_positionLinebreak[d, linebreaks]
					var str_copy = string_copy(_text[d], line_start, line_count)
					String_until_chara_width = string_width(str_copy)*squishiness
					
					
					_textline = linebreaks+1
				}	
			}
			
			_currentCharaX[d, c] = String_until_chara_width + text_x_offset[d] + _border
			_currentCharaY[d, c] = _textline * _newlineSep + _border + 	_box_y - 6
		}


	}
	function SetUpDialougeTextEffects(d) {
		var CurrentEffect = 0
		
		var String_chara_count = []
		var FullString = []

		var EffectPosition = []
		var EffectCount = []
		var EffectType = []
		
		for (var c = 0; c < _lengthText[d]; c++) {

			var _charapos = c+1
			if (string_char_at(_text[d], _charapos) != "<") continue;

				
			String_chara_count[CurrentEffect] = FindClosingBracket(_charapos, d)
			FullString[CurrentEffect] = string_copy(_text[d], _charapos, String_chara_count[CurrentEffect])

			EffectPosition[CurrentEffect] = _charapos
			EffectType[CurrentEffect] = GetParameters(FullString[CurrentEffect], 1)
			EffectCount[CurrentEffect] = real(GetParameters(FullString[CurrentEffect], 2))
				
			CurrentEffect++
		}
		
		for (var i = 0; i < CurrentEffect; i++) {
			
			_text[d]  = string_delete(_text[d], EffectPosition[i], String_chara_count[i])
			
			// Offset, so that it affects correct charas
			if i+1 != CurrentEffect {EffectPosition[i+1] -= String_chara_count[i]}
			
			_lengthText[d] = string_length(_text[d])
			PlaceEffects(FullString[i], EffectPosition[i], EffectCount[i], EffectType[i], d)
		}
	}

	function SetUpDialougeEffects(d) {
		SetUpDialougeTextEffects(d)
		SetUpDialougeLineBreak(d)
	}

	function SetUpDialouge() {
		if (_setup == true) return;
		
		draw_set_font(NormalText)
		draw_set_color(c_white)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
			for (var d = 0; d < _DialougeTotal; d++) {
				_lengthText[d] = string_length(_text[d])
				SetUpDialougeSpeaker(d)
				SetUpDialougeEffects(d)
			}
			_setup = true
	}
}

{ // SetUp Info Vars
	function SetDefaults() {
	
		_positionLinebreak[_DialougeTotal, 0] = 99
		_numberLinebreak[_DialougeTotal] = 0
		_Linebreak_PreviousLines[_DialougeTotal] = 0
	
		for (var c = 0; c < 99; c++) {
		
			_currentChara[_DialougeTotal, c] = ""
			_currentCharaX[_DialougeTotal, c] = 0
			_currentCharaY[_DialougeTotal, c] = 0
		
			_col1[_DialougeTotal, c] = c_black
			_col2[_DialougeTotal, c] = c_black
			_col3[_DialougeTotal, c] = c_black
			_col4[_DialougeTotal, c] = c_black
		
			_timerTextPause[_DialougeTotal, c] = 0
		
		}

		_FinalBoxWidth[_DialougeTotal] = 0
		_FinalBoxHeight[_DialougeTotal] = 0
		
		_ParaSep[_DialougeTotal] = 0
		
		_sideSpeaker[_DialougeTotal] = 0
		_sprite[_DialougeTotal] = 0
		_name[_DialougeTotal] = ""
		
		_sound[_DialougeTotal] = InteractVoice
		_textbg[_DialougeTotal] = 0
 
	}
	
	function ChangeDefaults_Chara(Character, Expression, Side, ParaSep) {
		_SpriteExpression[_DialougeTotal] = Expression
		_sideSpeaker[_DialougeTotal] = Side
		_ParaSep[_DialougeTotal] = ParaSep
		
		switch (Character) {
		case CHARAS.MAPLE:
			if (ParaSep == 1) {
				_name[_DialougeTotal] = "Maple"
				_sprite[_DialougeTotal] = MapleTalk
			}
			_sound[_DialougeTotal] = MidVoice
			_background[_DialougeTotal] = 1

		break;
		
		case CHARAS.LEON:
			if (ParaSep == 1) {
				_name[_DialougeTotal] = "Leon"
				_sprite[_DialougeTotal] = LeonTalk
			}
			_sound[_DialougeTotal] = LowVoice
			_background[_DialougeTotal] = 7
			
		break;
		
		case CHARAS.KM:
			if (ParaSep == 1) {
				_name[_DialougeTotal] = "KM"
				_sprite[_DialougeTotal] = KMTalk
			}
			_sound[_DialougeTotal] = LowestVoice
			_background[_DialougeTotal] = 4
			
		break;
		
		case CHARAS.MYER:
			if (ParaSep == 1) {
				_name[_DialougeTotal] = "Myer"
				_sprite[_DialougeTotal] = MyerTalk
			}
			_sound[_DialougeTotal] = HighVoice
			_background[_DialougeTotal] = 5

		break;
		
		case CHARAS.JADE:
			if (ParaSep == 1) {
				_name[_DialougeTotal] = "Jade"
				_sprite[_DialougeTotal] = JadeTalk
			}
			_sound[_DialougeTotal] = LowVoice
			_background[_DialougeTotal] = 6

		break;
		
		case CHARAS.HODDO:
			if (ParaSep == 1) {
				_name[_DialougeTotal] = "Hoddo"
				_sprite[_DialougeTotal] = HoddoTalk
			}
			_sound[_DialougeTotal] = MidVoice
			_background[_DialougeTotal] = 2

		break;
		
		case CHARAS.TEM:
			if (ParaSep == 1) {
				_name[_DialougeTotal] = "Tem"
				_sprite[_DialougeTotal] = TemTalk
			}
			_sound[_DialougeTotal] = LowestVoice

		break;
		
		case CHARAS.SYOL:
			if (ParaSep == 1) {
				_name[_DialougeTotal] = "Syol"
				_sprite[_DialougeTotal] = SyolTalk
			}
			_sound[_DialougeTotal] = MidVoice

		break;	

		default: break;
		}

	}
		
	function ChangeDefaults_All(Name, Sound, Background, Sprite, Expression, Side, ParaSep) {
		_name[_DialougeTotal] = Name
		_sound[_DialougeTotal] = Sound
		_background[_DialougeTotal] = Background
		_sprite[_DialougeTotal] = Sprite
		_SpriteExpression[_DialougeTotal] = Expression
		_sideSpeaker[_DialougeTotal] = Side
		_ParaSep[_DialougeTotal] = ParaSep
	}
	
	function ChangeDefaults_Specify(Dictionary) {
		for (var i = 0; i > array_length(Dictionary[0]); i++) {
			var _key = Dictionary[0][i]
			var _value = Dictionary[1][i]
			var d = _DialougeTotal
			switch (_key) {
				case SPECIFY.NAME: _value = _name[d] = _value; break
				case SPECIFY.SOUND:	_sound[d] = _value; break
				case SPECIFY.BACKGROUND:_background[d] = _value; break
				case SPECIFY.SPRITE: _sprite[d] = _value; break
				case SPECIFY.EXPRESSION:_SpriteExpression[d] = _value; break
				case SPECIFY.SIDE: _sideSpeaker[d] = _value; break
				case SPECIFY.PARASEP:_ParaSep[d] = _value; break
				default: break;
			}
		}	
	}
}


function AddText(Curtext, Changes) {
	SetDefaults()
	_text[_DialougeTotal] = Curtext
	
	var Character = 0
	var Name = 0
	var Sound = 0
	var Background = 0
	var Sprite = 0
	var Expression = 0
	var Side = 0
	var ParaSep = 0
	
	switch (array_length(Changes)) {
		case 2:
			ChangeDefaults_Specify(Changes)
			break;
		
		case 4: 
			Character = Changes[0]
			Expression = Changes[1]
			Side = Changes[2]
			ParaSep = Changes[3]
			ChangeDefaults_Chara(Character, Expression, Side, ParaSep)
		break;
		
		case 7:
			Name = Changes[0]
			Sound = Changes[1]
			Background = Changes[2]
			Sprite = Changes[3]
			Expression = Changes[4]
			Side = Changes[5]
			ParaSep = Changes[6]
			ChangeDefaults_All(Name, Sound, Background, Sprite, Expression, Side, ParaSep)
		break;
		
		default: break;
	}
	_DialougeTotal++
}
	
function AddOptions(_name, _id) {
	_optionName[options] = _name
	_optionID[options] = _id

	options++

}


function FindText(Struct, TextID) {
	var TextBox = instance_create_depth(0,0,-9999, oTextBox, {ParentStruct: Struct})
	var Text = variable_struct_get(Struct, TextID)
	for (var d = 0; d < array_length(Text); d++) {
		switch(Text[d][0]) {
			case DIALOUGE_SPECIAL_TYPE.QUESTS:
				variable_struct_set(Text[d][1], Text[d][2], Text[d][3])
			break;
			
			default:
				with TextBox ScriptExecute_array(Text[d][0], Text[d][1])
			break;
			
		}
	}
}

