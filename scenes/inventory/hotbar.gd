extends HBoxContainer

var active_slot_index: int = 0

func _unhandled_input(event: InputEvent):
	if event is InputEventKey and event.pressed:
		if event.keycode >= KEY_1 and event.keycode <= KEY_5:
			active_slot_index = event.keycode - KEY_1
			highlight_slot(active_slot_index)

func highlight_slot(index: int):
	for i in get_child_count():
		var slot = get_child(i)
		# Визуально выделяем активный слот (например, через modulate или стиль)
		slot.modulate = Color.WHITE if i == index else Color(0.5, 0.5, 0.5)

	var active_item = get_child(index).item
	if active_item:
		print("В руках: ", active_item.name)
