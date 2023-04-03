extends Area2D

const EfectoGolpe=preload("res://efectos/EfectoGolpe.tscn")

func _on_Hurtbox_area_entered(area):
	var efectogolpe=EfectoGolpe.instance()
	var main =get_tree().current_scene
	main.add_child(efectogolpe)
	efectogolpe.global_position=global_position
