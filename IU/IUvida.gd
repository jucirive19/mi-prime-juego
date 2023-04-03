extends Control

var corazones =3 setget set_corazones
var corazonestotal=3 setget set_corazonestotal

onready var coraonesv=$corazonesvIU
onready var corazonesd=$corazonesdIU


func set_corazones(value):
	corazones= clamp(value,0,corazonestotal)
	if coraonesv != null:
		coraonesv.rect_size.x=corazones*64

func set_corazonestotal(value):
	corazonestotal=max(value,1)
	self.corazones=min(corazones,corazonestotal)
	if corazonesd != null:
		corazonesd.rect_size.x=corazonestotal*64

func _ready():
	self.corazonestotal=estadisticasjugador.VidaMaxima
	self.corazones=estadisticasjugador.Vida
	estadisticasjugador.connect("Vida_changed",self,"set_corazones")
	estadisticasjugador.connect("VidaMaxima_changed",self,"set_corazonestotal")
