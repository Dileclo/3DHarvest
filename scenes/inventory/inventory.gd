extends Control
class_name Inventory
@onready var grid_container: GridContainer = $UI/GridContainer
@onready var hotbar: HBoxContainer = $UI/Hotbar
var active_slot:int = 0
signal slot_change
func _ready():
	grid_container.visible = false # Скрыт по умолчанию

func _input(event):
	if event.is_action_pressed("Inventory"): # Настройте в Input Map
		grid_container.visible = !grid_container.visible
		# Освобождаем или захватываем мышь
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if grid_container.visible else Input.MOUSE_MODE_CAPTURED
func get_active_item_data() -> ItemData:
	if hotbar.get_child_count() > active_slot:
		var slot = hotbar.get_child(active_slot)
		# Убедитесь, что у вашего узла слота есть переменная item
		return slot.item as ItemData 
	return null

func _on_hotbar_slot_change() -> void:
	emit_signal("slot_change")
