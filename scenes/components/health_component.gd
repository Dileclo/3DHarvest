class_name HealthComponent
extends Node3D

@export var health = 10;
var current_health: float

signal health_changed(new_health)
signal died

func _ready() -> void:
	current_health = health

func damage(amount: float) -> void:
	current_health -= amount
	health_changed.emit(current_health)
	
	if current_health <= 0:
		die()

func die() -> void:
	died.emit()
