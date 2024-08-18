extends ActivationManager

class_name Water

@export var Layer:CanvasLayer

func _activate()->void:
	Layer.show()
	InputManager._set_input(false)
