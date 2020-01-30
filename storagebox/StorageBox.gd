extends Area2D

# 2020-02-01 acodemia.pl

const engine_count = 4


func _on_StorageBox_body_entered( body ):
	if(body.has_method("update_item")):
		if(body.engine_count >= engine_count):
			print (body.name + " szuka klucza")
			#uruchomienie animacji otwierania schowka
			$AnimationPlayer.play("storagebox_animation_open")
			#deaktywacja sygnału - czujnik schowka został użyty
			self.disconnect("body_entered", self, "_on_StorageBox_body_entered")
	pass
	