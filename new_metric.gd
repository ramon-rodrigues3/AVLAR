extends HBoxContainer

@onready var metric_name_line = $MetricNameLine
@onready var metric_weight_line = $MetricWeightLine

func _on_button_pressed():
	queue_free()
	
func to_dict() -> Dictionary:
	return {
		"name": metric_name_line.text,
		"weight": metric_weight_line.text
	}
