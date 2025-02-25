class_name ItemApi
extends Node

func _ready():
	pass # Replace with function body.

func get_item_list(categoria: String):
	if categoria == "Filmes":
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
	elif categoria == "Séries":
		return [
			{"nome": "Nikita", "metricas": {
				"ação": 4, "atuação": 3, "roteiro": 2
				}
			},
			{"nome": "Rick and Morty", "metricas": {
				"ação": 3, "atuação": 2, "roteiro": 1
				}
			},
			{"nome": "Sob Pressão", "metricas": {
				"ação": 4, "atuação": 4, "roteiro": 5
				}
			}
		]
	else:
		return [
			{"nome": "O Pequeno Principe", "metricas": {
				"ação": 4, "atuação": 3, "roteiro": 2
				}
			},
			{"nome": "Os Caras", "metricas": {
				"ação": 3, "atuação": 2, "roteiro": 1
				}
			},
			{"nome": "Vidas Secas", "metricas": {
				"ação": 4, "atuação": 4, "roteiro": 5
				}
			}
		]
