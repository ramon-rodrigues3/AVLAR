extends ScrollContainer
var categoriaAPI = Categoria.new()
@onready var vbox = $VBoxContainer

func _ready():
	for categoria in categoriaAPI.get_categoria_list():
		var button = Button.new()
		button.text = categoria
		button.custom_minimum_size = Vector2(200, 64)
		vbox.add_child(button)

