extends KinematicBody2D
var movimiento = Vector2 ()
const gravedad = 10
const up = Vector2 (0,-1)
const Velocidad = 40
const salto = -300

var on_ground = false
var atacando = false
var is_muerto = false

func _ready():
	pass 
func _physics_process(delta):
	movimiento.y+=gravedad
	
	if Input. is_action_pressed("ui_right"):
		if atacando == false || is_on_floor() == false:
				movimiento.x=Velocidad
				if atacando == false:
					$Sprait.flip_h=false
					$Sprait.play("adelante")
					if sign($Position2D.position.x) ==-1:
						$Position2D.position.x *=-1
				
	elif Input. is_action_pressed("ui_left"):
		movimiento.x +=-3
	else:
		movimiento.x =0
	
	move_and_collide(movimiento*delta*Velocidad)
