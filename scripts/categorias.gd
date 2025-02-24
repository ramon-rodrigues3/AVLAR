extends ScrollContainer

signal categoria_alterada(nova_categoria)

var data_api = DataAPI.new()
@onready var vbox = $VBoxContainer

func _ready():
	vbox.add_spacer(true)
	
	for categoria in data_api.get_category_name_list():
		var button = preload("res://categoria_button.tscn").instantiate()
		button.text = categoria
		button.categoria = categoria # talvez seja desnecessário
		button.pressionado.connect(alterar_categoria)
		button.custom_minimum_size = Vector2(200, 64)
		vbox.add_child(button)

func abrir_cena_nova_categoria():
	get_tree().change_scene_to_file("res://nova_categoria.tscn")

func alterar_categoria(categoria: String):
	Global.categoria = categoria
	emit_signal("categoria_alterada", categoria)
