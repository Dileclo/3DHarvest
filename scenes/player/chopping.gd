
extends NodeState

@export var player:Player
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var neck: Node3D = $"../../Neck"
@onready var shape_cast_3d: ShapeCast3D = $"../../Neck/Camera3D/ShapeCast3D"


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(delta : float) -> void:
	player.handle_movement(delta,player.current_speed)


func _on_next_transitions() -> void:
	if !animation_player.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	player.can_regenerate_stamina = false

	player.current_stamina-=5
	shape_cast_3d.enabled = true
	animation_player.play("Chop")


func _on_exit() -> void:
	shape_cast_3d.enabled = false
#
func hit() -> void:
	shape_cast_3d.force_shapecast_update()
	if shape_cast_3d.is_colliding():
		for i in shape_cast_3d.get_collision_count():
			var collider = shape_cast_3d.get_collider(i)
			# Извлекаем тип инструмента для урона
			var tool_type = DataTools.Tools.None
			if player.current_tool:
				tool_type = player.current_tool
			var damage_to_deal = DataTools.get_damage(tool_type)
			if collider is HurtComponent:
				collider.take_damage(damage_to_deal)
				player.camera_3d.add_trauma(0.15)
				player.camera_3d.shake()
				
