randomize()

global.Volume = .67
global.GamePaused = false
iCamera = instance_create_layer(0,0,layer,oCamera) 



windows = [
    ConfigWindow,
    EquipWindow,
    ItemWindow,
    PartyWindow
]
spawn_index = 0
spawn_timer = 0
spawn_active = false


window_set_cursor(cr_none);
global.cursor_requests = [];
global.cursor_sprite = -1;