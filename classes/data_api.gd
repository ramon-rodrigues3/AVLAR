class_name DataAPI
extends Node

var caminho = "res://armazenamento_teste/arquivo.cfg"
var category_path = "res://armazenamento_teste/category.cfg"

var config_file = ConfigFile.new()
var category_cf = ConfigFile.new()
var item_cf = ConfigFile.new()

func _init():
	config_file.load(caminho)
	category_cf.load(category_path)
	criar_diretorios()
	
func criar_diretorios():
	var dir = DirAccess.open("res://armazenamento_teste")
	
	if not dir.dir_exists("res://armazenamento_teste/itens"):
		dir.make_dir("res://armazenamento_teste/itens")

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

func get_item_list(category: String):
	item_cf.load("res://armazenamento_teste/itens/%s" % category)
	var itens = []
	
	for section in item_cf.get_sections():
		var item = {}
		for key in item_cf.get_section_keys(section):
			item[key] = item_cf.get_value(section, key)
		itens.append(item)
	
	return itens

func save_new_item(new_item, category):
	pass

func get_model_fields_from_category(category: String):
	var model_name = category_cf.get_value("Category", category)["model"]
	var model = config_file.get_value("Models", model_name)
		
	return model["fields"]
