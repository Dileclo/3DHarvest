# Jump state
extends NodeState

@export var player: Player
@onready var stamina: Timer = $Stamina

func _on_physics_process(delta: float) -> void:
	player.can_regenerate_stamina = false

	player.handle_movement(delta,player.current_speed)
	
func _on_next_transitions() -> void:
	if player.current_stamina <=1:
		transition.emit("Walk")
		return
	if not Input.is_action_pressed("sprint"):
		transition.emit("Walk")
		return
	if player.velocity == Vector3.ZERO:
		transition.emit("Idle")
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		transition.emit("Jump")

func _on_enter() -> void:
	player.current_speed = player.SPRINT_SPEED
	stamina.start()

func _on_exit() -> void:
	player.current_speed = player.SPEED
	stamina.stop()

func _on_stamina_timeout() -> void:
	player.current_stamina -=10
