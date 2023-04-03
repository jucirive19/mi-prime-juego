extends CanvasLayer

onready var cambio:	AnimationPlayer=$Transicion
func cambioEsena(scene:String)-> void:
	layer=1
	cambio.play("fade_in")
	yield(cambio,"animation_finished")
	get_tree().change_scene(scene)
	cambio.play_backwards("fade_in")
	layer=-1
func _ready():
	layer=-1

	

