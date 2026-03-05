extends Node2D

func _ready() -> void:
	pass

func _on_finish_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):	
		get_tree().change_scene_to_file("res://scenes/level_1_stage_3.tscn")
