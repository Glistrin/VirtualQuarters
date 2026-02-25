
var _new_w = 0;
for (var i = 0; i < op_length; i++) {
	var _op_w = string_width(option[menulevel][i])
	_new_w = max(_new_w, _op_w);
}

_width = _new_w + op_border*2
_height = op_border*2 + 24 + (op_length-1)*op_space

x = 30
y = camera_get_view_y(view_camera[0]) + 30


draw_sprite_ext(UIBackground, 0,x, y,_width/9, _height/9, 0, c_white,1)



draw_set_font(NormalText)
draw_set_valign(fa_top)
draw_set_halign(fa_left)

for (var i = 0; i < op_length; i++) {
	var _c = c_white
	if pos == i {_c = c_yellow}
	draw_text_color(x+op_border, y+op_border + op_space*i, option[menulevel][i], _c,_c,_c,_c,1)

	}