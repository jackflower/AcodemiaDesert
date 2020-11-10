extends Area2D

# 2020-02-01 acodemia.pl

var repaired = false


func _on_Engine_body_entered(body):
	if(not repaired):
		if(body.gear_count > 0):
			$Sprite_head.visible = true
			body.gear_count -= 1
			get_parent().update_hud(body.gear_count)
			repaired = true
			body.engine_count += 1
			get_parent().update_engines(body.engine_count)
			print("Zreperowanych: " + str(body.engine_count))
			pass
		pass
	pass
	
