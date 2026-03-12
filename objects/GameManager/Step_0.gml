
resolve_cursor();

if (spawn_active) {
    
    spawn_timer++
    
    if (spawn_timer >= 5) {
        spawn_timer = 0
        
        if (spawn_index < array_length(windows)) {
            instance_create_layer(0,0,layer,windows[spawn_index])
            spawn_index++
        }
        else {
            spawn_active = false
        }
    }
    
}
