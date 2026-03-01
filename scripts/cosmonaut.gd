extends CharacterBody2D

var speed = 300.0
var jump_force = -300.0
var gravity_changing = 1

signal change_gravity

func _physics_process(delta: float) -> void:
	# Отвечает за гравитацию.
	if not (is_on_floor() or is_on_ceiling()):
		velocity += get_gravity() * delta
	
	#Смена гравитации в воздухе
	if not (is_on_ceiling() or is_on_floor()) and Input.is_action_just_pressed("jump (change_gravity)") and can_change_gravity():
		change_gravity.emit()
		gravity_changing -= 1
	
	# Отвечает за прыжок.
	if Input.is_action_just_pressed("jump (change_gravity)") and (is_on_floor() or is_on_ceiling()):
		velocity.y = jump_force if is_on_floor() else -jump_force
	
	if is_on_ceiling() or is_on_floor():
		gravity_changing = 1
	#Отвечает за направление движения
	#Принимает значения от -1 до 1
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
func can_change_gravity():
	if gravity_changing > 0:
		return true
	else:
		return false
