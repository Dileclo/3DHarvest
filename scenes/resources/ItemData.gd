extends Resource
class_name ItemData
@export var name: String = ""
@export var icon: Texture2D
@export var weight: float = 0.0
@export var max_durability: int = 100
@export var current_durability: int = 100
@export var stackable:bool = false
@export var tool:DataTools.Tools
