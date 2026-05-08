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
@export var position:Vector3
@export var rotation:Vector3
@export var scale:Vector3
@export var mesh:Mesh
