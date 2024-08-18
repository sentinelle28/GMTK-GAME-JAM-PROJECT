extends Area2D

class_name Activable_Cell
var is_colliding:bool = false
func _on_body_entered(body)->void:
	if body is Player or body is PushableEntities:
		is_colliding = true
		get_parent()._change_value(1)


func _on_body_exited(body)->void:
	if body is Player or body is PushableEntities:
		is_colliding = false
		get_parent()._change_value(-1)

func _change():
	$AnimatedSprite2D.play("activated")
