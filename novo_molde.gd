extends Control

@onready var vbox_fields = $ScrollContainer/VBoxContainer/VboxFields
@onready var vbox_metrics = $ScrollContainer/VBoxContainer/VBoxMetrics

func _ready():
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_new_field_button_pressed():
	var new_field = preload("res://new_field.tscn").instantiate()
	vbox_fields.add_child(new_field)


func _on_new_metric_button_pressed():
	var new_metric = preload("res://new_metric.tscn").instantiate()
	vbox_metrics.add_child(new_metric)
