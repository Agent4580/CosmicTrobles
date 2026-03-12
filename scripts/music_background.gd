extends AudioStreamPlayer2D

var current_scene = 'Main_menu'

func _ready() -> void:
	current_scene = get_tree().current_scene.name
	if MusicBackground.is_playing():
		MusicBackground.set_stream_paused(true)
	

func _process(delta: float) -> void:
	
	
	if not (current_scene == "Main_menu" or current_scene == 'Level_menu'):
		
		MusicBackground.set_stream_paused(false)
	else:
		
		MusicBackground.set_stream_paused(true)
	
	await get_tree().scene_changed
	current_scene = get_tree().current_scene.name
