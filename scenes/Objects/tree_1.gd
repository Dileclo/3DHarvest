extends StaticBody3D

@export var health = 3
@export var mesh:Node3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hurt_component: HurtComponent = $HurtComponent
@onready var icosphere: MeshInstance3D = $Tree1/Icosphere
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_health_component_health_changed(new_health: Variant) -> void:
	animation_player.play("shake")

func _on_health_component_died() -> void:
	icosphere.visible = false
	collision_shape_3d.disabled = true
	hurt_component.queue_free()
