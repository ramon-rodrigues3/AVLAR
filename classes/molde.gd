class_name Molde
extends Node


func _ready():
	pass


# Ainda não decidi se os parâmetros devem se chamar categoria ou molde
func get_fields(categoria: String) -> Dictionary:
	if categoria == "Filmes":
		return {
			"Diretor": "String",
			"Duração": "int",
			"Genero": "Enum"
		}
	
	return {}
	
func get_metrics(molde: String) -> Array:
	if molde == "Filmes":
		return ["Direção", "Roteiro", "Atuação"]
	
	return []
