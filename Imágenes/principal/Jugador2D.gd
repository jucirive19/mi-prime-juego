extends KinematicBody2D
var movimiento = Vector2.ZERO
const Aceleracion=100
const Velocidad=30
const varnocbak=80
const Fritcion=120

enum{
	Movimiento,
	Defesa,
	Ataque,
}
var nocbak=Vector2.ZERO
var Estado=Movimiento
var rollnocbak=Vector2.DOWN
var estadis=estadisticasjugador


onready var animacionjuga = $AnimationPlayer
onready var ArbolDeAnimaciones=$AnimationTree
onready var AnimacionJugado=$AnimationTree.get("parameters/playback")
onready var HitboxEspada=$Hitboxpoci/HitboxEspada

func _ready():
	estadis.connect("novida",self,"queue_free")
	ArbolDeAnimaciones.active=true
	HitboxEspada.nockback_vector=rollnocbak
func _physics_process(delta):
	match Estado:
		Movimiento:
			estado_movimiento(delta)
		Defesa:
			estado_defensa(delta)
		Ataque:
			estado_ataque(delta)
	
func estado_movimiento(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x= Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y= Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector=input_vector.normalized()
	
	if input_vector !=Vector2.ZERO:
		rollnocbak=input_vector
		HitboxEspada.nockback_vector=input_vector
		ArbolDeAnimaciones.set("parameters/Estatico/blend_position",input_vector)
		ArbolDeAnimaciones.set("parameters/Caminar/blend_position",input_vector)
		ArbolDeAnimaciones.set("parameters/Ataque/blend_position",input_vector)
		AnimacionJugado.travel("Caminar")
		movimiento=movimiento.move_toward(input_vector*Velocidad, Aceleracion*delta)
		
		retoceso()

	else:
		AnimacionJugado.travel("estatico")
		movimiento= movimiento.move_toward(Vector2.ZERO, Fritcion*delta)
	
	movimiento = move_and_slide(movimiento)
	
	if Input.is_action_just_pressed("Ataque"):
		Estado=Ataque

func estado_defensa(delta):
	nocbak=rollnocbak*varnocbak
	retoceso()

func estado_ataque(delta):
	AnimacionJugado.travel("Ataque")

func retoceso():
	nocbak=move_and_slide(nocbak)
	
func Ataque_final():
	Estado=Movimiento

func _on_Hurtbox_area_entered(area):
	estadis.Vida -=1

func _on_nexlevel_area_entered(area):
	estadis.nex +=1
