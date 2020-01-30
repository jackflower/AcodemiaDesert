extends Area2D

# 2020-02-01 acodemia.pl

var item


func _on_Gear_body_entered( body ):
	if(body.has_method("update_item")):
		item = self.name
		body.update_item( item )
		queue_free()
	pass
	