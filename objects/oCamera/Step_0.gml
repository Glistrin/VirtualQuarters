if (instance_exists(_Follow)) {
	_toX = _Follow.x
	_toY = _Follow.y
}

x += (_toX - x) / 30
y += (_toY - y) / 30

x = clamp(x, viewWhalf, room_width-viewWhalf)
y = clamp(y, viewHhalf, room_height-viewHhalf)


camera_set_view_pos(_Camera,x - viewWhalf,y - viewHhalf)

