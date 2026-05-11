extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node) -> void:
	# Это напечатает имя ВООБЩЕ ЛЮБОГО объекта, которого коснулось дерево
	if body.is_in_group("Ground"):
		var player = get_tree().get_first_node_in_group("player")
		player.camera_3d.add_trauma(0.7)
		player.camera_3d.shake()
