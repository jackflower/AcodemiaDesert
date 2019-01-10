extends Area2D

# 2019-01-12 acodemia.pl

var repaired = false

#func _ready():
#	#set_physics_process(true)
#	#set_process(true)
#	pass
	
	
#func _physics_process(delta):
#	pass
	
	
#func _process(delta):
#	pass
	
	
func _on_Portal_body_entered( body ):
	if(not repaired):
		if(body.gear_count > 0):
			$Sprite_head.visible = true
			body.gear_count -= 1
			get_parent().update_hud(body.gear_count)
			repaired = true
			body.engine_count += 1
			get_parent().update_portal(body.engine_count)
			print("Zreperowanych: " + str(body.engine_count))
			pass
		pass
	pass
	