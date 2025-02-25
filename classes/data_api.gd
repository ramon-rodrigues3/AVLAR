extends Node

class Category:
	var name: String
	var model: Model
	
	func _init(name: String, model: Model):
		name = name
		model = model
	
class Model:
	var name: String
	var fields: Array
	var metrics: Array
	
	func _init(dict: Dictionary):
		name = dict["name"]
		fields = dict["fields"]
		metrics = dict["metrics"]

class Item:
	pass

var categorias: Array[Category]

var caminho = "res://armazenamento_teste/arquivo.cfg"
var category_path = "res://armazenamento_teste/category.cfg"

var model_cf = ConfigFile.new()
var category_cf = ConfigFile.new()
var item_cf = ConfigFile.new()

func _init():
	model_cf.load(caminho)
	category_cf.load(category_path)
	criar_diretorios()

func load_categorys():
	for key in category_cf.get_section_keys("Category"):
		var data_category = category_cf.get_value("Category", key)
		var categoria = Category.new(
			data_category["name"],
			get_model(data_category["model"])
		)
		categorias.append(categoria)

func get_model(model_id) -> Model:
	var model_dict = model_cf.get_value("Models", model_id)
	return Model.new(model_dict)

func criar_diretorios():
	var dir = DirAccess.open("res://armazenamento_teste")
	
	if not dir.dir_exists("res://armazenamento_teste/itens"):
		dir.make_dir("res://armazenamento_teste/itens")

func save_new_model(new_model: Dictionary) -> void:
	model_cf.set_value("Models", new_model["name"], new_model)
	model_cf.save(caminho)
	
func save_new_category(new_category: Dictionary) -> void:
	print("Debug ... Salvando")
	category_cf.set_value("Category", str(new_category.hash()), new_category)
	category_cf.save(category_path)

func get_model_name_list() -> Array:
	return model_cf.get_section_keys("Models")

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
	var model = model_cf.get_value("Models", model_name)
		
	return model["fields"]
