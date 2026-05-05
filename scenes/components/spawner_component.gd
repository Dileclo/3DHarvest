class_name SpawnerComponent
extends Node3D


@export var object:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn():
	var object_instance = object.instantiate()
	var spawn_pos = global_position
	get_tree().current_scene.add_child(object_instance)
	object_instance.global_position = spawn_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_health_component_died() -> void:
	spawn()
