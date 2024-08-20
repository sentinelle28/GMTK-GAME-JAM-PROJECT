extends Area2D

class_name Activable_Cell
var is_colliding:bool = false
func _on_body_entered(body)->void:
	if body is Player :
		if not body.is_growing:
			is_colliding = true
			get_parent()._change_value(1)
	elif  body is PushableEntities:
		is_colliding = true
		get_parent()._change_value(1)


func _on_body_exited(body)->void:
	if body is Player or body is PushableEntities:
		is_colliding = false
		get_parent()._change_value(-1)

func _change():
	$AnimatedSprite2D.play("activated")

func _process(_delta:float)->void:
	if get_tree().current_scene.get_node("Player").is_growing:
		get_parent().value = 0
