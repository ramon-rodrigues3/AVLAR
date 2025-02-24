extends Control

var moldeAPI = Molde.new()
@onready var vbox = $ScrollContainer/VBoxContainer

func _ready():
	
	for campo in moldeAPI.get_fields(Global.categoria):
		var vbox_2 = VBoxContainer.new()
		var label = Label.new()
		label.text = campo
		var line_edit = LineEdit.new()
		
		vbox_2.add_child(label)
		vbox_2.add_child(line_edit)
		vbox.add_child(vbox_2)

	for metrica in moldeAPI.get_metrics(Global.categoria):
		var vbox_2 = VBoxContainer.new()
		var label = Label.new()
		label.text = metrica
		var line_edit = LineEdit.new()
		
		vbox_2.add_child(label)
		vbox_2.add_child(line_edit)
		vbox.add_child(vbox_2)
