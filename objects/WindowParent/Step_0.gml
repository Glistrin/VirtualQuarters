image_xscale = lerp(1, finalxscale, _t)
image_yscale = lerp(1, finalyscale, _t)


 drawx = (_ogx - (sprite_width/2))
 drawy = (_ogy - (sprite_height/2))

if (_phase == 0) {_t += 0.2
	if _t >= 1.35 {_phase++}}
	
if (_phase == 1) {_t -= 0.1
	if _t <= 0.75 {_phase++}}

if (_phase == 2) {_t += 0.05
	if _t <= 1 {_phase++}}

if (_phase == 3) {
	_t = 1
}


var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

if (point_in_rectangle(mx, my,
    drawx,
    drawy,
    drawx + sprite_width,
    drawy + sprite_height))
{
    _hoverlength++
    _t += 0.005 * _hoverlength
    if (_hoverlength >= 5) _hoverlength = 5
	request_cursor(spr_cursor_click, 1)
}

else {_hoverlength = 0;}

if keyboard_check(ord("D")) {instance_destroy()}