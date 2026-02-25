function StartFight(_enemies, _map, _bg) {
	instance_create_depth(
		oCamera.x - oCamera.viewWhalf,
		oCamera.y - oCamera.viewHhalf,
		-9999,	oFightManager,
		{enemies: _enemies, _id: id, map: _map, background: _bg}
	)
}


/*
function FindDistance(_distance) {
	if (is_numeric(_distance)) {
		
	}
}

*/