extends KinematicBody2D

# 2019-01-12 acodemia.pl

const MOTION_SPEED = 120 # Pixels/seconds
var health = 100
var on_scene = false
var gear_count = 0
var engine_count = 0


func _ready():
	set_physics_process(true)
	on_scene = true
	pass
	
func _physics_process(delta):
	
	var motion = Vector2()
	var collision = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		motion += Vector2(0, -1)
		rotation_degrees = 0
	if (Input.is_action_pressed("ui_down")):
		motion += Vector2(0, 1)
		rotation_degrees = 180
	if (Input.is_action_pressed("ui_left")):
		motion += Vector2(-1, 0)
		rotation_degrees = -90
	if (Input.is_action_pressed("ui_right")):
		motion += Vector2(1, 0)
		rotation_degrees = 90
		
	# p r o t o t y p e
	#if Input.is_action_pressed("left_click"):
	#	move_and_slide(get_global_mouse_position() - position)
	#look_at(get_global_mouse_position())
	# s o l u t i o n
	# bazując na kodzie pocisku:
	# - kliknięcie
	# - cel to punkt kliknięcia myszy
	# - wyliczenie długości do pokonania (cel - pozycja gracza)
	# - normalizacja wektora
	# - sprawdzenie, czy obiekt dotarł do celu
	# - pomnieszamy długość i sprawdzamy czy została skonsumowana
	#
	# SOLUTION
	# 2D Movement Demo - pobrać ze strony...
		
	if(not motion):
		$AnimationPlayer.play("shaggy_walk")
		pass
		
	motion = motion.normalized() * MOTION_SPEED * delta
	motion = move_and_collide(motion)
		
	if(health <= 0):
		self.queue_free()
		
		
func update_health(damage):
	health -= damage
	print(health)
	pass
	
	
func update_item(item):
	gear_count += 1
	get_parent().update_hud(gear_count)
	pass
	

	
