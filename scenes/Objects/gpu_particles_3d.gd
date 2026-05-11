extends GPUParticles3D

func spawn_splinters(hit_position: Vector3):
	# Перемещаем узел частиц в точку удара
	self.global_position = hit_position
	
	# Перезапускаем излучение
	self.emitting = true
	
	# Если нужно, чтобы щепки летели ОТ места удара, 
	# можно развернуть узел через look_at
