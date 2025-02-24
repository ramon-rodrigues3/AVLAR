extends ScrollContainer
var categoriaAPI = Categoria.new()
@onready var vbox = $VBoxContainer

func _ready():
	vbox.add_spacer(true)
	
	var add_new_categoria_button = Button.new()
	add_new_categoria_button.text = "+"
	add_new_categoria_button.custom_minimum_size = Vector2(200, 64)
	add_new_categoria_button.pressed.connect(abrir_cena_nova_categoria)
	vbox.add_child(add_new_categoria_button)
	
	for categoria in categoriaAPI.get_categoria_list():
		var button = Button.new()
		button.text = categoria
		button.custom_minimum_size = Vector2(200, 64)
		vbox.add_child(button)

func abrir_cena_nova_categoria():
	get_tree().change_scene_to_file("res://nova_categoria.tscn")
