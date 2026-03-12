volpercent = global.Volume * 100 


var rightpress = keyboard_check_pressed(ord("D"))
var leftpress = keyboard_check_pressed(ord("A"))
var right = keyboard_check(ord("D"))
var left = keyboard_check(ord("A"))

if rightpress global.Volume += 0.05
if leftpress global.Volume -= 0.05
if right global.Volume += 0.01
if left global.Volume -= 0.01


global.Volume = clamp(global.Volume, 0, 1)

var die = keyboard_check(vk_space)

if die {instance_destroy(); with (oPlayer) {_State = StateMachFree}}