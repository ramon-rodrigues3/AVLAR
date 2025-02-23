class_name Item
extends Node

func _ready():
	pass # Replace with function body.

func get_item_list():
	return [
		{"nome": "Avatar", "metricas": {
			"ação": 4, "atuação": 3, "roteiro": 2
			}
		},
		{"nome": "Titanic", "metricas": {
			"ação": 3, "atuação": 2, "roteiro": 1
			}
		},
		{"nome": "Tropa de Elite", "metricas": {
			"ação": 4, "atuação": 4, "roteiro": 5
			}
		}
	]
