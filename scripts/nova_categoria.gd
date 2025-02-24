extends Control

var data_api = DataAPI.new()
@onready var category_model_option = $ScrollContainer/VBoxContainer/CategoryModelOption

func _ready():
	var models = data_api.get_model_name_list()
	for model in models:
		category_model_option.add_item(model)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
