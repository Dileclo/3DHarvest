extends Panel
class_name InventorySlot

@onready var icon: TextureRect = $Icon
@onready var amount_label: Label = $Amount

var item: ItemData
var amount: int = 0

func display(new_item: ItemData, new_amount: int):
	item = new_item
	amount = new_amount

	if item:
		icon.texture = item.icon
		icon.show()
		amount_label.text = str(amount) if amount > 1 else ""
	else:
		icon.texture = null
		icon.hide()
		amount_label.text = ""

func _get_drag_data(_at_position: Vector2):
	if not item: return null

	var preview = TextureRect.new()
	preview.texture = item.icon
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.custom_minimum_size = Vector2(40, 40)
	set_drag_preview(preview)

	return self

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is InventorySlot

func _drop_data(_at_position: Vector2, origin_slot: Variant):
# Логика обмена данными между слотами
	var temp_item = item
	var temp_amount = amount

	display(origin_slot.item, origin_slot.amount)
	origin_slot.display(temp_item, temp_amount)
