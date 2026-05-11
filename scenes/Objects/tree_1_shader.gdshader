shader_type spatial;

uniform vec3 wood_dark : source_color = vec3(0.3, 0.15, 0.1);
uniform vec3 wood_light : source_color = vec3(0.5, 0.3, 0.15);
uniform float variation_intensity : hint_range(0.0, 1.0) = 0.3;

// Создаем "мостик" для передачи ID
varying float v_instance_hash;

float hash(uint x) {
    x = ((x >> 16u) ^ x) * 0x45d9f3bU;
    x = ((x >> 16u) ^ x) * 0x45d9f3bU;
    x = (x >> 16u) ^ x;
    return float(x) / 4294967295.0;
}

void vertex() {
    // Вычисляем хэш один раз здесь
    v_instance_hash = hash(uint(INSTANCE_ID));
    
    // Слегка меняем размер щепок
    VERTEX *= (0.8 + v_instance_hash * 0.4);
}

void fragment() {
    // Используем переданный хэш для цвета
    vec3 final_color = mix(wood_dark, wood_light, v_instance_hash);
    
    // Добавляем вариативность яркости
    final_color *= (1.0 - variation_intensity * 0.5 + v_instance_hash * variation_intensity);
    
    ALBEDO = final_color;
    ROUGHNESS = 0.8;
}