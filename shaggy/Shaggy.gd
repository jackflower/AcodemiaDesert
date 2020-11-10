extends KinematicBody2D

# 2020-02-01 acodemia.pl

const MOTION_SPEED = 120
var health = 100
var gear_count = 0
var engine_count = 0


func _ready():
	set_physics_process(true)
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
	
