# Camera3D.gd
extends Camera3D

var trauma = 0.0  # Текущий уровень "стресса" камеры (от 0 до 1)
var trauma_power = 2  # Степень для более резкой тряски (квадратичная)
var decay = 0.8  # Как быстро затихает тряска
var max_offset = Vector2(0.2, 0.2)  # Максимальный сдвиг в метрах
var max_roll = 0.1  # Максимальный наклон (в радианах)

func _process(delta):
	if trauma > 0:
		trauma = max(trauma - decay * delta, 0)
		shake()

func shake():
	var amount = pow(trauma, trauma_power)
	# Используем шум (FastNoiseLite) или рандом
	rotation.z = max_roll * amount * randf_range(-1, 1)
	h_offset = max_offset.x * amount * randf_range(-1, 1)
	v_offset = max_offset.y * amount * randf_range(-1, 1)

# Метод, который мы будем вызывать извне
func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)
