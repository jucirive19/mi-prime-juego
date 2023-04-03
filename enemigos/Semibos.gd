extends KinematicBody2D

const Ripenemigo=preload("res://efectos/RipEneimgo.tscn")

export var acelerecion=80
export var velocidamaxima=20
export var fritcion=250

enum{
	quieto,
	caminando,
	perseguir
}

var nockback= Vector2.ZERO
var velocidad=Vector2.ZERO
var estados= quieto

onready var sprite=$Semibos
onready var estadisticas=$etadisticas
onready var deteccion=$Deteccion

func _physics_process(delta):
	nockback=nockback.move_toward(Vector2.ZERO,fritcion*delta)
	nockback = move_and_slide(nockback)
	
	match estados:
		quieto:
			velocidad=velocidad.move_toward(Vector2.ZERO,fritcion*delta)
			seguir_jugador()
		caminando:
			pass
		perseguir:
			var jugado =deteccion.jugado
			if jugado != null:
				var direccion =(jugado.global_position-global_position).normalized()
				velocidad= velocidad.move_toward(direccion*velocidamaxima,acelerecion*delta)
			else:
				estados=quieto
			sprite.flip_h=velocidad.x<0
	velocidad=move_and_slide(velocidad)
	
func seguir_jugador():
	if deteccion.Segirjugador():
		estados=perseguir


func _on_Hurtbox_area_entered(area):
	var ripnemigo=Ripenemigo.instance()
	get_parent().add_child(ripnemigo)
	ripnemigo.global_position=global_position
	estadisticas.vida-=1
	if estadisticas.vida <= 0:
		queue_free()
	#nockback=Vector2.RIGHT*80
	nockback=area.nockback_vector * 110
	
	#queue_free()
