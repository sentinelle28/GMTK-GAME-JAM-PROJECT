extends Node2D

@export var New_scale:float = 1



func _on_area_2d_body_entered(body:CharacterBody2D)->void:
	if body is Player:
		body._update_scale(New_scale)
		queue_free()
