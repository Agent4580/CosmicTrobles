extends CharacterBody2D

var speed = 300			#Отвечает за скорость перемещения
var gravity = 300		#Отвечает за гравитацию
var gravity_vector = 1	#Отвечает за направление гравитации
var jump_force = 300	#Отвечает за высоту прыжка
var gravity_changing = 1#Отвечает за количество изменений гравитаций в полете

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	var direction		#Отвечает за направление движения
	
	#Значение может быть от -1 до 1
	direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	#Отвечает за гравитацию
	if not (is_on_floor() or is_on_ceiling()):
		velocity.y = gravity * gravity_vector
	
	#Отвечает за то, могу ли я сменить гравитацию в возухе
	if can_change_gravity() and not (is_on_floor() or is_on_ceiling()) and Input.is_action_just_pressed('jump (change_gravity)'):
		gravity_vector *= -1
		gravity_changing -= 1
	
	if is_on_ceiling() or is_on_floor():
		gravity_changing = 1

func can_change_gravity():
	if gravity_changing > 0:
		return true
	else:
		return false
