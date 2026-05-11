extends StaticBody3D

@export var health = 3
@export var mesh:Node3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hurt_component: HurtComponent = $HurtComponent
@onready var icosphere: MeshInstance3D = $Tree1/Icosphere
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var gpu_particles_3d: GPUParticles3D = $GPUParticles3D

@onready var fall_tree = preload("res://fall_tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_health_component_health_changed(new_health: Variant) -> void:
	gpu_particles_3d.emitting = true
	gpu_particles_3d.restart()
	animation_player.play("shake")

func _on_health_component_died() -> void:
	var player = get_tree().get_first_node_in_group("player")
	var fall_tree_inst = fall_tree.instantiate()
	
	fall_tree_inst.global_position = Vector3(global_position.x,2,global_position.z)
	fall_tree_inst.rotation = Vector3(0,randi() % 360,0)
	get_tree().current_scene.add_child(fall_tree_inst)
	fall_tree_inst.apply_impulse(Vector3(10,0,0),Vector3(0,4,0))

	icosphere.visible = false
	collision_shape_3d.disabled = true
	hurt_component.queue_free()
