extends Control

var next_wait_time := 0
var waited := 0
var open_details_pane : PanelContainer
var speed_levels := [1, 3, 5]  # Define as velocidades 1x, 2x e 3x e 10x
var current_speed_level := 0  # Começa com a velocidade normal (1x)

@onready var speed_button := $SpeedButton


func _ready():
	Globals.hud = self
	Globals.baseHpChanged.connect(update_hp)
	Globals.goldChanged.connect(update_gold)
	Globals.waveStarted.connect(show_wave_count)
	Globals.waveCleared.connect(show_wave_timer)
	Globals.enemyDestroyed.connect(update_enemy_count)

# Conecta o botão SpeedButton ao método para alternar a velocidade
	speed_button.connect("pressed", Callable(self, "_on_speed_button_pressed"))


func _on_speed_button_pressed():
	# Alterna entre as velocidades 1x, 2x e 3x
	current_speed_level = (current_speed_level + 1) % speed_levels.size()
	var new_speed = speed_levels[current_speed_level]
	# Atualiza o texto do botão para mostrar a velocidade atual
	speed_button.text = str(new_speed) + "x"
	# Ajusta a velocidade do jogo
	set_game_speed(new_speed)

func set_game_speed(multiplier):
	# Ajusta o tempo do jogo
	Engine.time_scale = multiplier

func update_hp(newHp, maxHp):
	%HPLabel.text = "HP: "+str(round(newHp))+"/"+str(round(maxHp))

func update_gold(newGold):
	%GoldLabel.text = "Gold: "+str(round(newGold))

func show_wave_count(current_wave, enemies):
	$WaveWaitTimer.stop()
	waited = 0
	%WaveLabel.text = "Current Wave: "+str(current_wave)
	%RemainLabel.text = "Enemies: "+str(enemies)
	%RemainLabel.visible = true
	
func show_wave_timer(wait_time):
	%RemainLabel.visible = false
	next_wait_time = wait_time-1
	$WaveWaitTimer.start()

func _on_wave_wait_timer_timeout():
	%WaveLabel.text = "Next wave in "+str(next_wait_time-waited)
	waited += 1

func update_enemy_count(remain):
	%RemainLabel.text = "Enemies: "+str(remain)

func reset():
	if is_instance_valid(open_details_pane):
		open_details_pane.turret.close_details_pane()
