@tool
extends Resource
class_name ItemData
@export var name: String = ""
@export var icon: Texture2D
@export var weight: float = 0.0
@export var max_durability: int = 100
@export var current_durability: int = 100
@export var stackable:bool = false
@export var tool:DataTools.Tools
@export_category("Position")
@export var mesh: Mesh:
	set(v): mesh = v; emit_changed()

@export var position: Vector3:
	set(v): position = v; emit_changed()

@export var rotation: Vector3:
	set(v): rotation = v; emit_changed()

@export var scale: Vector3 = Vector3.ONE:
	set(v): scale = v; emit_changed()
