extends Node2D

# 2020-02-01 acodemia.pl


func update_hud(gears):
	$Hud/Label_gears.text = str(gears)
	pass
	
	
func update_engines(engines):
	$Hud/Label_engines.text = str(engines)
	pass
	