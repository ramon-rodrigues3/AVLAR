class_name CategoriaButton
extends Button

signal pressionado(categoria)

@export var categoria: String

func _on_pressed():
	emit_signal("pressionado", categoria)
