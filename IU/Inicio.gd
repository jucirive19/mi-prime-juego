extends Node
var estadisticas=estadisticasjugador


func _on_TextureButton_pressed():
	estadisticas.Nexleve = 0
	cargar.cambioEsena("res://nivles/nivle1.tscn")


	
func _on_TextureButton2_pressed():
	get_tree().quit()
