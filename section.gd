extends ScrollContainer

var itemAPI = Item.new()
@onready var vbox = $VBoxContainer

func _ready():
	vbox.add_spacer(true)
	
	var add_new_item_button = Button.new()
	add_new_item_button.text = "+"
	add_new_item_button.custom_minimum_size = Vector2(700, 200) 
	add_new_item_button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	add_new_item_button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	vbox.add_child(add_new_item_button)
	
	for item in itemAPI.get_item_list():
		var button = Button.new()
		button.custom_minimum_size = Vector2(700, 200) 
		button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		var label = Label.new()
		label.text = item["nome"]
		button.add_child(label)
		vbox.add_child(button)
	

