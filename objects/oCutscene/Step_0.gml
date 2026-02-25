var current_scene = allscenes[currentscene]
if (current_scene == cutscene_length) {instance_destroy()}
ScriptExecute_array(current_scene[0], current_scene[1])
