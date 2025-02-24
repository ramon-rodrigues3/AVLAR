extends ScrollContainer

var itemAPI = Item.new()
@onready var vbox = $VBoxContainer

func _ready():
	vbox.add_spacer(true)
	carregar_itens()

func carregar_itens() -> void:
	for item in get_tree().get_nodes_in_group("item"):
		item.queue_free()
	
	for item in itemAPI.get_item_list(Global.categoria):
		var button = Button.new()
		button.custom_minimum_size = Vector2(700, 200) 
		button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		button.add_to_group("item")
		var label = Label.new()
		label.text = item["nome"]
		button.add_child(label)
		vbox.add_child(button)

func abrir_cena_novo_item():
	get_tree().change_scene_to_file("res://novo_item.tscn")


func _on_categorias_categoria_alterada(_nova_categoria):
	carregar_itens()
