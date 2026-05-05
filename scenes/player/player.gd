class_name Player
extends CharacterBody3D


@export var SPEED:float  = 5.0
@export var JUMP_VELOCITY:float = 4.5
@export var SPRINT_SPEED:float = 10
@export var current_tool:DataTools.Tools
@onready var neck: Node3D = $Neck
@onready var camera_3d: Camera3D = $Neck/Camera3D


var currently_equipped :ItemData = null

var current_speed

var MouseSensitivity: float = 0.1

func _ready() -> void:
	current_speed = SPEED
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_camera_rotation(event: InputEvent):
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
			return
	if event is InputEventMouseMotion:
		neck.rotate_y(-event.relative.x * 0.003)
		camera_3d.rotate_x(-event.relative.y * 0.003)
		camera_3d.rotation.x = clamp(camera_3d.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func handle_movement(delta: float, speed: float):
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()	
		
