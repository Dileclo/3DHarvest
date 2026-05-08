@tool
extends Marker3D

@export var item: ItemData:
	set(value):
		# Отключаем сигнал от старого ресурса, если он был
		if item and item.changed.is_connected(load_weapon):
			item.changed.disconnect(load_weapon)
		
		item = value
		
		# Подключаем сигнал к новому ресурсу
		if item:
			if not item.changed.is_connected(load_weapon):
				item.changed.connect(load_weapon)
		
		load_weapon()

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

func _ready() -> void:
	load_weapon()

func load_weapon() -> void:
	if not is_node_ready() or not item or not mesh_instance_3d:
		return
		
	mesh_instance_3d.mesh = item.mesh
	position = item.position
	rotation = item.rotation
	scale = item.scale
	print("Обновлено визуально!") # Для проверки в консоли
