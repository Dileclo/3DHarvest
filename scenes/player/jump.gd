# Jump state
extends NodeState

@export var player: Player
@onready var neck: Node3D = $"../../Neck"

func _on_physics_process(delta: float) -> void:
	player.handle_movement(delta,player.current_speed)

func _on_next_transitions() -> void:
	# Переходим в Idle или Walk только когда приземлились
	if player.is_on_floor():
		if player.velocity.x != 0 or player.velocity.z != 0:
			transition.emit("Walk")
		else:
			transition.emit("Idle")

func _on_enter() -> void:
	player.velocity.y = player.JUMP_VELOCITY
