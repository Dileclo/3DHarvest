extends Node

@onready var hotbar_slots = get_tree().get_nodes_in_group("hotbar_slots")
@onready var inventory_slots = get_tree().get_nodes_in_group("inventory_slots")

# Функция добавления предмета
func add_item(item_data: ItemData, count: int = 1):
	# 1. Сначала ищем, есть ли уже такой предмет в слотах (для стака)
	if item_data.stackable:
		if _try_stack(item_data, count):
			return

	# 2. Если не стакается или не нашли такой же, ищем пустой слот
	# Сначала в хотбаре
	for slot in hotbar_slots:
		if slot.item == null:
			slot.display(item_data, count)
			return

	# 3. Затем в основном инвентаре
	for slot in inventory_slots:
		if slot.item == null:
			slot.display(item_data, count)
			return
	
	print("Инвентарь полон!")

# Вспомогательная функция для стака предметов
func _try_stack(item_data: ItemData, count: int) -> bool:
	# Объединяем все слоты для поиска
	var all_slots = hotbar_slots + inventory_slots
	
	for slot in all_slots:
		if slot.item == item_data: # Если ресурс тот же самый
			slot.display(item_data, slot.amount + count)
			return true
	return false
