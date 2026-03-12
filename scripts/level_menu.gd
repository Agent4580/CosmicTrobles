extends Node2D

func _ready() -> void:
	pass

func _on_level_1_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1_stage_1.tscn")
