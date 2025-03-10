extends Control

@onready var category_name_line = $ScrollContainer/VBoxContainer/CategoryNameLine
@onready var category_model_option = $ScrollContainer/VBoxContainer/CategoryModelOption

func _ready():
	var models = DataApi.get_model_name_list()
	for model in models:
		category_model_option.add_item(model)

func _on_save_button_pressed():
	if category_name_line.text:
		var new_category = {
			"name": category_name_line.text,
			"model_id": category_model_option.get_item_text(
				category_model_option.selected
			)
		}
		DataApi.save_new_category(new_category)
	
	get_tree().change_scene_to_file("res://main.tscn")
