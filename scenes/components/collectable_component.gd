class_name CollectableComponent
extends Area3D

@export var item:ItemData
@export var count:int = 1
signal collect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if not body is Player or item == null:
		return
		
	InventoryManager.add_item(item, count)
	get_parent().queue_free()
