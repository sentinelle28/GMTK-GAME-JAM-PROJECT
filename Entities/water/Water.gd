extends ActivationManager

class_name Water

@export var Layer:CanvasLayer

func _activate()->void:
	$AudioStreamPlayer.play()
	Layer.show()
	InputManager._set_input(false)

func _process(_delta:float)->void:
	if not player.is_static and value != 0:
		value = 0
