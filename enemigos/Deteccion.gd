extends Area2D

var jugado =null

func Segirjugador():
	return jugado !=null

func _on_Deteccion_body_entered(body):
	jugado= body


func _on_Deteccion_body_exited(body):
	jugado =null
