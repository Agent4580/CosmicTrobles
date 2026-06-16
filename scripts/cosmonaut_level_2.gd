extends CharacterBody2D

#Скорость движения
const SPEED = 300
#Сила прыжка
const JUMP = -400

func _physics_process(delta: float) -> void:
	
	#Если не на полу
	if not is_on_floor():
		#то проиграй анимацию прыжка
		$AnimatedSprite2D.play("jump")
		#и просчитай гравитацию
		velocity += get_gravity() * delta
		
	#Если персонаж на земле и ничего не нажато:
	if is_on_floor() and not Input.is_anything_pressed():
		#то просто проиграйте анимацию бездействия
		$AnimatedSprite2D.play('idle')
		
	#Принимает значение -1 если нажат параметр №1
	#и 1 - если №2
	var direction = Input.get_axis("move_left", "move_right")
	
	#Если переменная не равна 0(false)
	if direction:
		#то расчитай скорость движения
		velocity.x = SPEED * direction
		#если ты на полу
		if is_on_floor():
			#то проиграй анимацию
			$AnimatedSprite2D.play("walk")
	#а также если значение больше 0
		if direction > 0:
			#то не переворачивай спрайт по горизонтали
			$AnimatedSprite2D.flip_h = false
		#иначе если меньше 0
		elif direction < 0:
			#то переверни спрайт по горизонтали
			$AnimatedSprite2D.flip_h = true
			
	#иначе
	else:
		#передвинь персонажа из velocity.x в 0 со скоростью Speed
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#если ты на полу и нажата кнопка прыжка
	if is_on_floor() and Input.is_action_just_pressed("jump (change_gravity)"):
		#то посчитай прыжок
		velocity.y += JUMP 
		#обязательный пункт
	move_and_slide()
