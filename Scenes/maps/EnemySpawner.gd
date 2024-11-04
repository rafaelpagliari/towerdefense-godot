extends Path2D
class_name EnemyPath

var map_type := "":
	set(val):
		map_type = val
		for config in Data.maps[val]["spawner_settings"].keys():
			set(config, Data.maps[val]["spawner_settings"][config])

var difficulty := {}
var spawnable_enemies := []
var max_waves := 3
var special_waves := {}
var wave_spawn_count := 10
var health_multiplier := 1.0

var current_wave_spawn_count := 0
var current_difficulty := 1.0
var current_wave := 0
var enemies_spawned_this_wave := 0
var killed_this_wave := 0

func spawn_new_enemy(enemy_type = null):
	var enemyScene := preload("res://Scenes/enemies/enemy_mover.tscn")
	var enemy = enemyScene.instantiate()
	
	if enemy_type:
		enemy.enemy_type = enemy_type
	else:
		enemy.enemy_type = spawnable_enemies.pick_random()
	
	# Aplique o multiplicador de vida
	enemy.hp *= health_multiplier

	add_child(enemy)
	enemies_spawned_this_wave += 1


func get_spawnable_enemies():
	var enemies := []
	match current_wave:
		1:
			enemies.append("redDino")  # Só o vermelho
		2:
			enemies.append("redDino")
			enemies.append("blueDino")  # Vermelho e azul
		3:
			enemies.append("redDino")
			enemies.append("blueDino")
			enemies.append("yellowDino")  # Vermelho, azul e amarelo
		4:
			enemies.append("redDino")
			enemies.append("blueDino")
			enemies.append("yellowDino")
			enemies.append("greenDino")  # Todos os inimigos
		5:
			enemies.append("miniboss")
		6,7,8,9:
			enemies.append("redDino")
			enemies.append("blueDino")
			enemies.append("yellowDino")
			enemies.append("greenDino")  # Todos os inimigos
		10:
			enemies.append("boss")
		_:
			# Se o jogo continuar após a 4ª onda, mantenha todos os inimigos
			enemies.append("redDino")
			enemies.append("blueDino")
			enemies.append("yellowDino")
			enemies.append("greenDino")
	return enemies


func get_current_difficulty() -> float:
	var default_diff = difficulty["initial"]
	var increase = difficulty["increase"]
	var calculated_diff = default_diff * pow(increase, current_wave) if difficulty["multiplies"] else default_diff + increase * current_wave
	return calculated_diff

func _on_spawn_delay_timeout():
	if enemies_spawned_this_wave < current_wave_spawn_count:
		spawn_new_enemy()
		$SpawnDelay.start()

func _on_wave_delay_timer_timeout():
	# Move para a próxima onda
	current_wave += 1
	killed_this_wave = 0
	enemies_spawned_this_wave = 0
	
	# Aumenta o multiplicador de vida por 0.5 em cada nova onda
	health_multiplier += 0.5

	current_difficulty = get_current_difficulty()
	
	if current_wave == 5:
		current_wave_spawn_count = 5  # Exatamente 5 minibosses
	elif current_wave == 10:
		current_wave_spawn_count = 1  # Apenas 1 boss
	else:
		current_wave_spawn_count = round(wave_spawn_count * current_difficulty)
		
		
	spawnable_enemies = get_spawnable_enemies()
	Globals.waveStarted.emit(current_wave, current_wave_spawn_count)
	$SpawnDelay.start()


func enemy_destroyed():
	killed_this_wave += 1
	Globals.enemyDestroyed.emit(current_wave_spawn_count - killed_this_wave)
	check_wave_clear()
	
func check_wave_clear():
	if killed_this_wave == current_wave_spawn_count:
		#Wave cleared
		if not current_wave == max_waves:
			Globals.waveCleared.emit($WaveDelayTimer.wait_time)
			$WaveDelayTimer.start()
			return
		#game completion
		var mapCompletedScene := preload("res://Scenes/ui/mapCompleted/mapCompleted.tscn")
		var mapCompleted := mapCompletedScene.instantiate()
		Globals.hud.add_child(mapCompleted)
