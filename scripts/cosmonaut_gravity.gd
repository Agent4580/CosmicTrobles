extends Area2D


func _on_cosmonaut_change_gravity() -> void:
	set_gravity_direction(get_gravity_direction() * -1)
	print(get_gravity_direction())
