class_name DataAPI
extends Node

var caminho = "res://armazenamento_teste/arquivo.cfg"
var category_path = "res://armazenamento_teste/category.cfg"

var config_file = ConfigFile.new()
var category_cf = ConfigFile.new()

func _init():
	config_file.load(caminho)
	category_cf.load(category_path)
	
func save_new_model(new_model: Dictionary) -> void:
	config_file.set_value("Models", new_model["name"], new_model)
	config_file.save(caminho)
	
func save_new_category(new_category: Dictionary) -> void:
	print("Debug ... Salvando")
	category_cf.set_value("Category", str(new_category.hash()), new_category)
	category_cf.save(category_path)

func get_model_name_list() -> Array:
	return config_file.get_section_keys("Models")

func get_category_name_list() -> Array:
	var categorys = category_cf.get_section_keys("Category")
	var category_names = []
	for category in categorys:
		category_names.append(category_cf.get_value("Category", category)["name"])
	
	return category_names
