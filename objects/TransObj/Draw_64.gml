	switch(Type) {
	case 1: // Bars (Horizontal)
		draw_rectangle_color(0,0,Tracker,100, c_black, c_black, c_black, c_black,false)
		draw_rectangle_color(room_width-Tracker,100,room_width,200,  c_black, c_black, c_black, c_black, false)	
		draw_rectangle_color(0,200,Tracker,300, c_black, c_black, c_black, c_black, false)	
		draw_rectangle_color(room_width-Tracker,300,room_width,400, c_black, c_black, c_black, c_black, false)	
		draw_rectangle_color(0,400,Tracker,500, c_black, c_black, c_black, c_black, false)
		draw_rectangle_color(room_width-Tracker,500,room_width,600, c_black, c_black, c_black, c_black, false)	
		draw_rectangle_color(0,600,Tracker,700, c_black, c_black, c_black, c_black, false)
		if (Tracker >= room_width) {room_goto(Room)}
		Tracker += room_width / 20
	break;
	case 2: // Bars (Verticle)
		draw_rectangle_color(0,0,100,Tracker*2, c_black, c_black, c_black, c_black,false)
		draw_rectangle_color(100,room_height-Tracker*2,200,room_height*2,  c_black, c_black, c_black, c_black, false)	
		draw_rectangle_color(200,0,300,Tracker*2, c_black, c_black, c_black, c_black, false)	
		draw_rectangle_color(300,room_height-Tracker*2,400,room_height*2, c_black, c_black, c_black, c_black, false)	
		draw_rectangle_color(400,0,500,Tracker*2, c_black, c_black, c_black, c_black, false)
		draw_rectangle_color(500,room_height-Tracker*2,600,room_height*2, c_black, c_black, c_black, c_black, false)	
		draw_rectangle_color(600,0,700,Tracker*2, c_black, c_black, c_black, c_black, false)
		if (Tracker >= room_height) {room_goto(Room)}
		Tracker += room_height / 20
	break;
	case 3: // Fade out
		draw_set_alpha(Tracker)
		draw_rectangle_color(0,0,room_width, room_height*2, c_black, c_black, c_black, c_black, false)
		if (Tracker >= 0.8) {room_goto(Room)}
		Tracker += .01
	break;
}