extends Node2D

export (int) var VidaMaxima=1 setget set_VidaMaxima
var Vida= VidaMaxima setget set_vida
var Nexleve =0 setget set_Nexleve
var nex=Nexleve setget set_nex

signal novida
signal Vida_changed(value)
signal VidaMaxima_changed(value)
signal sigienteleve
func set_VidaMaxima(value):
	VidaMaxima=value
	self.Vida=min(Vida,VidaMaxima)
	emit_signal("VidaMaxima_changed")
func set_vida(value):
	Vida=value
	emit_signal("Vida_changed",Vida)
	if Vida <= 0:
		emit_signal("novida")
		Vida=VidaMaxima
		cargar.cambioEsena("res://nivles/inicio.tscn")
		
func _ready():
	self.Vida = VidaMaxima
func set_Nexleve(value):
	Nexleve=value
	self.nex=min(nex,Nexleve)
func set_nex(value):
	nex=value
	if nex >= 1:
		emit_signal("sigienteleve")
		Vida=VidaMaxima
		cargar.cambioEsena("res://nivles/nivel2.tscn")
	if nex >=2:
		emit_signal("sigienteleve")
		Vida=VidaMaxima
		cargar.cambioEsena("res://nivles/nivel3.tscn")
	if nex >=3:
		emit_signal("sigienteleve")
		Vida=VidaMaxima
		cargar.cambioEsena("res://nivles/inicio.tscn")
	
	
	
	
	
	
	
