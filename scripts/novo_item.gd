extends Control

@onready var vbox = $ScrollContainer/VBoxContainer

func _ready():
	for campo in DataApi.get_model_fields_from_category(Global.categoria):
		var vbox_2 = VBoxContainer.new()
		var label = Label.new()
		label.text = campo["name"]
		var line_edit = LineEdit.new()
		
		vbox_2.add_child(label)
		vbox_2.add_child(line_edit)
		vbox.add_child(vbox_2)

	for metrica in DataApi.get_model_metrics_from_category(Global.categoria):
		var vbox_2 = VBoxContainer.new()
		var label = Label.new()
		label.text = metrica.name
		var line_edit = LineEdit.new()
		
		vbox_2.add_child(label)
		vbox_2.add_child(line_edit)
		vbox.add_child(vbox_2)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
