
extends NodeState

@export var player:Player
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var collision_shape_3d: CollisionShape3D = $"../../Neck/Camera3D/MeshInstance3D/Area3D/CollisionShape3D"
@onready var neck: Node3D = $"../../Neck"


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(delta : float) -> void:
	player.handle_movement(delta,player.current_speed)


func _on_next_transitions() -> void:
	if !animation_player.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	collision_shape_3d.disabled = false
	animation_player.play("Chop")


func _on_exit() -> void:
	collision_shape_3d.disabled = true

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area is HurtComponent:
		var damage_to_deal = DataTools.get_damage(player.current_tool)
		area.take_damage(damage_to_deal)
