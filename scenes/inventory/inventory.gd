extends Control

@onready var grid_container: GridContainer = $UI/GridContainer

func _ready():
	grid_container.visible = false # Скрыт по умолчанию

func _input(event):
	if event.is_action_pressed("Inventory"): # Настройте в Input Map
		grid_container.visible = !grid_container.visible
		# Освобождаем или захватываем мышь
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if grid_container.visible else Input.MOUSE_MODE_CAPTURED
