extends Node2D


func _on_finish_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		get_tree().set_pause(true)
		get_node('Finish_menu').set_visible(true)


func _on_exit_button_up() -> void:
	get_tree().set_pause(false)
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	

func _on_continue_button_down() -> void:
	get_tree().set_pause(false)
	get_tree().change_scene_to_file('res://level_2_temporary.tscn')
	

func _on_reset_button_down() -> void:
	get_tree().set_pause(false)
	get_tree().change_scene_to_file('res://scenes/level_1_stage_1.tscn')
	
