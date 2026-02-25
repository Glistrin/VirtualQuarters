
function TransitionRoom(TransType, RoomNext, ToBattle) {
	if ToBattle != -1 global.CurrentBattle = ToBattle
	instance_create_layer(0,0,"Instances",TransObj,{Type: TransType, Room: RoomNext})
}

function ChangeRoom(Room, xx, yy, TransType) {
	global.CurrentRoom = Room
	global.CurrentY = xx
	global.CurrentX = yy
	global.CurrentDir = oPlayer.direction;
	TransitionRoom(TransType, Room, -1)
} 