extends ScrollContainer

var itemAPI = Item.new()
@onready var vbox = $VBoxContainer

func _ready():
	for item in itemAPI.get_item_list():
		var panel = Panel.new()
		panel.custom_minimum_size = Vector2(700, 200) 
		panel.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		panel.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		var label = Label.new()
		label.text = item["nome"]
		panel.add_child(label)
		vbox.add_child(panel)
