extends Node2D
const Efecto_pasto= preload("res://efectos/efectoPasto.tscn")

func crear_efecto_pasto():
	var efecto_pasto = Efecto_pasto.instance()
	var Beta= get_tree().current_scene
	Beta.add_child(efecto_pasto)
	efecto_pasto.global_position=global_position


func _on_Hurtbox_area_entered(area):
	crear_efecto_pasto()
	queue_free()
