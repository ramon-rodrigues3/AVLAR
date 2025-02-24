extends HBoxContainer

@onready var field_name_line = $FieldNameLine
@onready var field_type_option = $FieldTypeOption

func _on_button_pressed():
	queue_free()

func to_dict() -> Dictionary:
	return {
		"name": field_name_line.text,
		"type": type_id_to_text()
	}

func type_id_to_text() -> String: # Talvez seja desnecessária
	var id = field_type_option.get_selected_id()
	
	match id:
		0:
			return "String"
		1: 
			return "int"
		2: 
			return "float"
		_:
			return "String"
