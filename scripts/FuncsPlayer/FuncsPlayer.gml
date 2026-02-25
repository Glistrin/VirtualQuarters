
function EntityCheck(xx, yy, ReqCheck) {
	_Entity = instance_position(xx, yy, EntityParent)
	
	var Error__No_Entity = (_Entity == noone)
	if (Error__No_Entity) {return -3} 
	
	var Error__No_Script = (_Entity.entActivateScript == -1)
	if (Error__No_Script) {return -2}

	if (ReqCheck != _Entity.entActivationReq) {return _Entity.entActivationReq}
		
	ScriptExecute_array(_Entity.entActivateScript, _Entity.entActivationArg)			
}


function UpdateSprite() {
	var oldSpr = sprite_index
	if(_Magnitude != 0) { 
		direction = _Direction
		sprite_index = _PartyMember.Sprites.Walk
	} else	sprite_index = _PartyMember.Sprites.Idle 
	if (oldSpr != sprite_index) _LocalSprFrame = 0;
	
	var _cardinalDir = round(direction/90)
	var _FrameMax = sprite_get_number(sprite_index) / 4
	image_index = _LocalSprFrame + (_cardinalDir * _FrameMax)
	if (_LocalSprFrame+1 != _FrameMax) _LocalSprFrame += sprite_get_speed(sprite_index) / 60

	if (_LocalSprFrame + 1 >= _FrameMax) {
		_endAnim = true
		_LocalSprFrame -= _FrameMax - 1
	} else _endAnim = false;


}
	
function PlayerMove(_colMap) {
	_hSpeed = lengthdir_x(_Magnitude * _WalkSpeed, _Direction)
	_vSpeed = lengthdir_y(_Magnitude * _WalkSpeed, _Direction)
	
	var _collision = false; 

	if (tilemap_get_at_pixel(_colMap,x + _hSpeed, y)){_hSpeed	= 0; _collision = true}
	if (tilemap_get_at_pixel(_colMap,x, y + _vSpeed)) {_vSpeed	= 0; _collision = true}

	y += _vSpeed
	x += _hSpeed
	
	return _collision
}

function StateMachFree() {
	
	PlayerMove(_colMap)
	UpdateSprite()
	
	
	if (KeyInteract) { // When Interacting with an Interact Entity
		var _activateX = lengthdir_x(10, direction)
		var _activateY = lengthdir_y(10, direction)
		EntityCheck(x+_activateX, y+_activateY, 1) 
	}
	
	if (instance_exists(EntityParent) && position_meeting(x, y, EntityParent)) {
		EntityCheck(x, y, 2)
	}
	
}

function StateMachLock() {
	
}
