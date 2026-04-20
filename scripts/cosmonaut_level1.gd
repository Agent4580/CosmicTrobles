extends CharacterBody2D

#Скорость
const SPEED = 300
#Сила прыжка
const JUMP_FORCE = -400

func _physics_process(delta: float) -> void:
	
	#Если персонаж не на полу:
	if not is_on_floor():
		#то начинайте просчитывать гравитацию
		$AnimatedSprite2D.play('jump')
		velocity += get_gravity() * delta
		
	#если персонаж на земле и ничего не нажато:
	if is_on_floor() and not Input.is_anything_pressed():
		#то просто проиграйте анимацию бездействия
		$AnimatedSprite2D.play('idle')
		
	#Переменная, которая равняется -1, если нажат 1 параметр,
	#а 1 - 2 параметр
	var direction = Input.get_axis('move_left', 'move_right')
	
	#если переменная не равна 0 (false):
	if direction:
		#то пройдись
		velocity.x = SPEED * direction
		#если на полу:
		if is_on_floor():
			#то проиграй анимацию
			$AnimatedSprite2D.play('walk')
		#если переменная больше 0:
		if direction > 0:
			#то не отражай спрайт
			$AnimatedSprite2D.flip_h = false
		#иначе:
		else:
			#отрази его
			$AnimatedSprite2D.flip_h = true
	#иначе:
	else:
		#пододвинь героя из текущей позиции в 0 со скоростью SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#если персонаж на полу и просто нажата кнопка прыжка
	if is_on_floor() and Input.is_action_just_pressed("jump (change_gravity)"):
		#то проиграйте анимацию и прыгните
		
		velocity.y = JUMP_FORCE 
		
	#метод расчета физики героя
	move_and_slide()
