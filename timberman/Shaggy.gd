extends KinematicBody2D

# 2019-01-12 acodemia.pl

const MOTION_SPEED = 120 # Pixels/seconds
var health = 100
var on_scene = false


func _ready():
	set_physics_process(true)
	on_scene = true
	pass
	
func _physics_process(delta):
	
	var motion = Vector2()
	var collision = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		motion += Vector2(0, -1)
		#global_rotation_degrees = 0
		rotation_degrees = 0
	if (Input.is_action_pressed("ui_down")):
		motion += Vector2(0, 1)
		#global_rotation_degrees = 180
		rotation_degrees = 180
	if (Input.is_action_pressed("ui_left")):
		motion += Vector2(-1, 0)
		#global_rotation_degrees = -90
		rotation_degrees = -90
	if (Input.is_action_pressed("ui_right")):
		motion += Vector2(1, 0)
		#global_rotation_degrees = 90
		rotation_degrees = 90
		
		
	if(not motion):
		$AnimationPlayer.play("shaggy_walk")
		pass
		
	motion = motion.normalized() * MOTION_SPEED * delta
	motion = move_and_collide(motion)
		
	if(motion):
		$AnimationPlayer.play("shaggy_walk")
		pass
	
	if(health <= 0):
		self.queue_free()
	
func update_health(damage):
	health -= damage
	print(health)
	pass
	
	
func update_item(item):
	print (self.name + ": znalazłem " + item)
	pass
	
	