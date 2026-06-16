extends Node2D


func _on_cabins_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		$cabins/AnimationPlayer.play("fade out")


func _on_cabins_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		$cabins/AnimationPlayer.play_backwards("fade out")


func _on_next_level_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		get_node("next_level2").visible = true



func _on_next_level_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		get_node("next_level2").visible = false
