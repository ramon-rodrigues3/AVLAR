class_name DataAPI
extends Node

var caminho = "res://armazenamento_teste/arquivo.cfg"
var config_file = ConfigFile.new()

func _init():
	var err = config_file.load(caminho)
	
	if err != OK:
		return
	
func save_new_model(new_model: Dictionary):
	config_file.set_value("Models", new_model["name"], new_model)
	config_file.save(caminho)

func get_model_name_list() -> Array:
	return config_file.get_section_keys("Models")
