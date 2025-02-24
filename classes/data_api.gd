class_name DataAPI
extends Node

var caminho = "res://armazenamento_teste/arquivo.json"

func _ready():
	pass
	
func save_new_model(new_model: Dictionary):
	var file_acess = FileAccess.open(caminho, FileAccess.WRITE)
	file_acess.store_string(JSON.stringify(new_model))
	print(new_model)
