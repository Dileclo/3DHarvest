class_name HurtComponent
extends Area3D

@export var health_component: HealthComponent

func take_damage(amount: float) -> void:
	if health_component:
		health_component.damage(amount)
