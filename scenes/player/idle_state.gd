
extends NodeState

@export var player:Player

@onready var neck: Node3D = $"../../Neck"
@onready var camera_3d: Camera3D = $"../../Neck/Camera3D"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"



func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(delta : float) -> void:
	player.handle_movement(delta,player.current_speed)

func _unhandled_input(event: InputEvent) -> void:
	player.handle_camera_rotation(event)

func _on_next_transitions() -> void:
	if Input.is_action_just_pressed("hit"):
		transition.emit("Chopping")
	if player.velocity != Vector3.ZERO:
		transition.emit("Walk")
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		transition.emit("Jump")
	

func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
