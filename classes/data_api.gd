extends Node

class Category:
	var name: String
	var model: Model
	
	func _init(name: String, model: Model):
		self.name = name
		self.model = model
	
class Model:
	var name: String
	var fields: Array
	var metrics: Array
	
	func _init(dict: Dictionary):
		self.name = dict["name"]
		self.fields = dict["fields"]
		self.metrics = dict["metrics"]

class Item:
	pass

var categorias: Array[Category]

var model_path = "res://armazenamento_teste/model.cfg"
var category_path = "res://armazenamento_teste/category.cfg"

var model_cf = ConfigFile.new()
var category_cf = ConfigFile.new()
var item_cf = ConfigFile.new()

func _ready():
	if model_cf.load(model_path) != OK:
		initialize_models()
	if category_cf.load(category_path) != OK:
		initialize_category()
	
	criar_diretorios()
	load_categorys()

func initialize_models():
	model_cf.set_value("Info", "count", 0)
	model_cf.save(model_path)

func initialize_category():
	category_cf.set_value("Info", "count", 0)
	category_cf.save(category_path)

func load_categorys():
	if not category_cf.has_section("Category"):
		return 
	
	for key in category_cf.get_section_keys("Category"):
		var data_category = category_cf.get_value("Category", key)

		var categoria = Category.new(
			data_category["name"],
			get_model(data_category["model_id"])
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
	var count = model_cf.get_value("Info", "count")
	
	model_cf.set_value("Models", str(count + 1), new_model)
	model_cf.set_value("Info", "count", count + 1)
	model_cf.save(model_path)
	
func save_new_category(new_category: Dictionary) -> void:
	var count = category_cf.get_value("Info", "count")
	category_cf.set_value("Category", str(count + 1), new_category)
	category_cf.set_value("Info", "count", count + 1)
	category_cf.save(category_path)

func get_model_name_list() -> Array:
	return model_cf.get_section_keys("Models")

func get_category_name_list() -> Array:
	if not category_cf.has_section("Category"):
		return []
	
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
	for categoria in categorias:
		if categoria.name == category:
			return categoria.model.fields
	return []

func get_model_metrics_from_category(category: String):
	for categoria in categorias:
		if categoria.name == category:
			return categoria.model.metrics
	return []
