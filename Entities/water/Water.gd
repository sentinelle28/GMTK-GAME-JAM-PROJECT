extends ActivationManager

class_name Water

@export var Layer:CanvasLayer

func _activate()->void:
	$AudioStreamPlayer.play()
	Layer.show()
	InputManager._set_input(false)
