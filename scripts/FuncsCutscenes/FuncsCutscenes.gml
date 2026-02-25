function StartCutscene(ID, OnlyOnce) {
	FindCutscene(ID)
	if (OnlyOnce) {instance_destroy()}
}


{ // Cutscene Controllers
	function CutsceneEndAction() {
		with (oPlayer) {_State = StateMachLock}
		with (oCutscene) {currentscene++}
	}

	function CutsceneStart() {
		with (oPlayer) {
			_State = StateMachLock
		}

		CutsceneEndAction()
	}

	function CutsceneEnd() {
		with (oPlayer) {
			_State = StateMachFree
		}
			
		instance_destroy(oCutscene)
	}
}

{ // Camera Based
	function CutsceneCamRot(Rotation) {
			camera_set_view_angle(view_camera[1], Rotation)	
			CutsceneEndAction()
	}

	function CutsceneCamSize(w, h) {
			camera_set_view_size(view_camera[1],w, h)
			CutsceneEndAction()
	}

	function CutsceneCamPos(X,Y) {
			camera_set_view_pos(view_camera[1],X, Y)
			CutsceneEndAction()
	}

	function CutsceneCamFollow(obj, spd) {
			camera_set_view_target(view_camera[1], obj)
			camera_set_view_speed(view_camera[1],spd, spd)
			CutsceneEndAction()
	}
}

function CutsceneWait(seconds) {
	if (seconds == -1) { // -1 = Wait for Textbox
			if (!instance_exists(oTextBox)) {CutsceneEndAction()}
			} else {
		timer++
		if (timer >= seconds * game_get_speed(gamespeed_fps)) {
			timer = 0
			CutsceneEndAction()
		}
	}
}


{
	function CutsceneMoveObjSetUp(Obj, MoveX, MoveY, Relative) {
		if (other.Move_X_Target == -1) { // Set up where to go
		if (Relative) {
			other.Move_X_Target = Obj.x + MoveX
			other.Move_Y_Target = Obj.y + MoveY
			} else {
			other.Move_X_Target = MoveX
			other.Move_Y_Target = MoveY
			}
		}
	}
	function CutsceneMoveObjMoveEnd(Obj,_self) {
		Obj.x = _self.Move_X_Target
		Obj.y = _self.Move_Y_Target
		_self.Move_X_Target = -1
		_self.Move_Y_Target = -1
	
		CutsceneEndAction()
				
		_self.moving = false
	}
	function CutsceneMoveObjMove(Obj, Speed, _other) {
		var Direction = point_direction(x, y, _other.Move_X_Target, _other.Move_Y_Target)
		var LengthX = lengthdir_x(Speed, Direction)
		var LengthY = lengthdir_y(Speed, Direction)
			
		Obj.x += LengthX
		Obj.y += LengthY
		Obj.moving = true
	}
	function CutsceneMoveObj(Obj, MoveX, MoveY, Relative, Speed) {
		CutsceneMoveObjSetUp(Obj, MoveX, MoveY, Relative)
		
		with (Obj) {
			var Length_Distance = point_distance(x, y,other.Move_X_Target,other.Move_Y_Target)
			if (Length_Distance < Speed) // End of movement
				CutsceneMoveObjMoveEnd(self, other)
			else CutsceneMoveObjMove(self, Speed, other)
		}
	}
}

function CutsceneFindText(Struct, Text) {
	FindText(Struct, Text)
	CutsceneEndAction()
}


function FindCutscene(Cutscene) {
	if (instance_exists(oCutscene)) return 
	with (instance_create_layer(0,0,"Instances",oCutscene)) {
		allscenes = Cutscene
	}
	
}

