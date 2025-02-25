extends Control

@onready var vbox = $ScrollContainer/VBoxContainer

func _ready():
	print(DataApi.get_item_list(Global.categoria))
	for campo in DataApi.get_item_list(Global.categoria):
		var vbox_2 = VBoxContainer.new()
		var label = Label.new()
		label.text = campo
		var line_edit = LineEdit.new()
		
		vbox_2.add_child(label)
		vbox_2.add_child(line_edit)
		vbox.add_child(vbox_2)

	for metrica in []: #DataApi.get_metrics(Global.categoria):
		var vbox_2 = VBoxContainer.new()
		var label = Label.new()
		label.text = metrica
		var line_edit = LineEdit.new()
		
		vbox_2.add_child(label)
		vbox_2.add_child(line_edit)
		vbox.add_child(vbox_2)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
