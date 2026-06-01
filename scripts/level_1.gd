extends Node2D

var next_scene = preload('res://scenes/level_1_1.tscn')
var player_nerby = false

func _on_wc_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		player_nerby = true

func _process(delta: float) -> void:
	if player_nerby and Input.is_action_just_pressed("accept"):
		get_tree().change_scene_to_file("res://scenes/level_1_1.tscn")
