extends AudioStreamPlayer


func _play():
	if not playing:
		play()
	
func _change_sound(volume:int)->void:
	volume_db = -(100-volume)
