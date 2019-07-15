extends Node2D

# 2019-01-12 acodemia.pl

var portal_data = preload("res://oasis/Oasis.tscn")
const ENGINE_COUNT = 4
var portal_position = Vector2()

func _ready():
	portal_position.x = 400
	portal_position.y = 300
#	#set_physics_process(true)
#	#set_process(true)
	pass
	
	
#func _physics_process(delta):
#	pass
	
	
#func _process(delta):
#	pass
	
func update_hud(gears):
	$Hud/Label_gears.text = str(gears)
	pass
	
	
func update_portal(engines):
	$Hud/Label_engines.text = str(engines)
	if(engines >= ENGINE_COUNT):
		
		var portal = portal_data.instance()
		portal.global_position = portal_position
		portal.global_scale = portal.global_scale * 4
		get_parent().add_child(portal)
		
		pass
	pass
	