extends HBoxContainer

@export var inv:Inventory
signal slot_change
func _unhandled_input(event: InputEvent):
	if event is InputEventKey and event.pressed:
		if event.keycode >= KEY_1 and event.keycode <= KEY_4:
			inv.active_slot = event.keycode - KEY_1
			highlight_slot(inv.active_slot)
			emit_signal("slot_change")

func highlight_slot(index: int):
	for i in get_child_count():
		var slot = get_child(i)
		# Визуально выделяем активный слот (например, через modulate или стиль)
		slot.modulate = Color.WHITE if i == index else Color(0.5, 0.5, 0.5)
