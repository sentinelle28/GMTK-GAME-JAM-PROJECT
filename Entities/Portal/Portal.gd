extends Node2D

@export_category("portal scale")
@export var EnterScale:int = 1
@export var ExistScale:int = 1

#enter
func _on_enter_body_exited(body:Player)->void:
	_exit_procedure($Exist,body,EnterScale)


#exit
func _on_exist_body_exited(body:Player)->void:
	_exit_procedure($Enter,body,ExistScale)

		
func _exit_procedure(area:Area2D,body:Player,ScaleToApply:int)->void:
	if body.global_position == area.global_position:
		body._update_scale(ScaleToApply)
