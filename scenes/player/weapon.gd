@tool

extends Marker3D

@export var item:ItemData
@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_weapon()


func load_weapon():
	mesh_instance_3d.mesh = item.mesh
	position = item.position
	rotation = item.rotation
	scale = item.scale
