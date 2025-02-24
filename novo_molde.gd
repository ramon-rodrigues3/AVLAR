extends Control

var data_api = DataAPI.new()

@onready var vbox_fields = $ScrollContainer/VBoxContainer/VboxFields
@onready var vbox_metrics = $ScrollContainer/VBoxContainer/VBoxMetrics
@onready var model_name_line = $ScrollContainer/VBoxContainer/VBoxContainer/ModelNameLine

func _ready():
	pass # Replace with function body.

func _on_new_field_button_pressed():
	var new_field = preload("res://new_field.tscn").instantiate()
	new_field.add_to_group("field")
	vbox_fields.add_child(new_field)


func _on_new_metric_button_pressed():
	var new_metric = preload("res://new_metric.tscn").instantiate()
	new_metric.add_to_group("metric")
	vbox_metrics.add_child(new_metric)

func _on_save_button_pressed():
	if model_name_line.text:
		var new_model = {
			"name": model_name_line.text,
			"fields": get_fields_array(),
			"metrics": get_metrics_array()
		}
		data_api.save_new_model(new_model)
	
	get_tree().change_scene_to_file("res://main.tscn")

func get_fields_array() -> Array: # Talvez o nome correto seja field_array
	var fields_array = []
	for field in get_tree().get_nodes_in_group("field"):
		fields_array.append(field.to_dict())
		
	return fields_array

func get_metrics_array() -> Array:
	var metrics_array = []
	for metric in get_tree().get_nodes_in_group("metric"):
		metrics_array.append(metric.to_dict())
		
	return metrics_array
