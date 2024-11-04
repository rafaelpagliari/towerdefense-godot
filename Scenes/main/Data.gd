extends Node

const turrets := {
	"gatling": {
		"stats": {
			"damage": 10,
			"attack_speed": 2.0,
			"attack_range": 200.0,
			"bulletSpeed": 200.0,
			"bulletPierce": 1,
		},
		"upgrades": {
			"damage": {"amount": 2.5, "multiplies": false},
			"attack_speed": {"amount": 1.5, "multiplies": true},
		},
		"name": "Gatling Gun",
		"cost": 50,
		"upgrade_cost": 50,
		"max_level": 2,
		"scene": "res://Scenes/turrets/projectileTurret/projectileTurret.tscn",
		"sprite": "res://Assets/turrets/technoturret.png",
		"scale": 4.0,
		"rotates": true,
		"bullet": "fire",
	},
	"laser": {
		"stats": {
			"damage": 0.5,
			"attack_speed": 20.0,
			"attack_range": 250.0,
			"bulletSpeed": 400.0,
			"bulletPierce": 4,
		},
		"upgrades": {
			"damage": {"amount": 2.5, "multiplies": false},
			"attack_speed": {"amount": 1.5, "multiplies": true},
		},
		"name": "Flamethrower",
		"cost": 70,
		"upgrade_cost": 50,
		"max_level": 3,
		"scene": "res://Scenes/turrets/projectileTurret/projectileTurret.tscn",
		"sprite": "res://Assets/turrets/laserturret.png",
		"scale": 1.0,
		"rotates": false,
		"bullet": "laser",
	},
	"ray": {
		"stats": {
			"damage": 0.5,
			"attack_speed": 0.5,
			"attack_range": 300.0,
			"ray_duration": 1.0,
			"ray_length": 300.0,
		},
		"upgrades": {
			"damage": {"amount": 1.0, "multiplies": false},
			"attack_speed": {"amount": 1.5, "multiplies": true},
			"ray_length": {"amount": 1.5, "multiplies": true},
			"ray_duration": {"amount": 1.5, "multiplies": true},
		},
		"name": "Raygun",
		"cost": 30,
		"upgrade_cost": 50,
		"max_level": 3,
		"scene": "res://Scenes/turrets/rayTurret/rayTurret.tscn",
		"sprite": "res://Assets/turrets/reallaser.png",
		"scale": 1.0,
		"rotates": true,
	},
	"melee": {
		"stats": {
			"damage": 5.0,
			"attack_speed": 2.0,
			"attack_range": 100.0,
		},
		"upgrades": {
			"damage": {"amount": 2.5, "multiplies": false},
			"attack_speed": {"amount": 1.5, "multiplies": true},
		},
		"name": "Explosive",
		"cost": 70,
		"upgrade_cost": 100,
		"max_level": 5,
		"scene": "res://Scenes/turrets/meleeTurret/meleeTurret.tscn",
		"sprite": "res://Assets/turrets/dynamite.png",
		"scale": 1.0,
		"rotates": false,
	},
}

const stats := {
	"damage": {"name": "Damage"},
	"attack_speed": {"name": "Speed"},
	"attack_range": {"name": "Range"},
	"bulletSpeed": {"name": "Bullet Speed"},
	"bulletPierce": {"name": "Bullet Pierce"},
	"ray_length": {"name": "Ray Length"},
	"ray_duration": {"name": "Ray Duration"},
}

const bullets := {
	"fire": {
		"frames": "res://Assets/bullets/bullet1.tres",
	},
	"laser": {
		"frames": "res://Assets/bullets/bullet2.tres",
	}
}

const enemies := {
	"redDino": {
		"stats": {
			"hp": 10.0,
			"speed": 0.5,
			"baseDamage": 5.0,
			"goldYield": 10.0,
		},
		"difficulty": 1.0,
		"sprite": "res://Assets/enemies/dino1.png",
		"scale": 1.5  # Tamanho padrão maior
	},
	"blueDino": {
		"stats": {
			"hp": 5.0,
			"speed": 1.0,
			"baseDamage": 5.0,
			"goldYield": 10.0,
		},
		"difficulty": 2.0,
		"sprite": "res://Assets/enemies/dino2.png",
		"scale": 1.5
	},
	"yellowDino": {
		"stats": {
			"hp": 10.0,
			"speed": 2.5,
			"baseDamage": 1.0,
			"goldYield": 10.0,
		},
		"difficulty": 3.0,
		"sprite": "res://Assets/enemies/dino3.png",
		"scale": 1.5
	},
	"greenDino": {
		"stats": {
			"hp": 10.0,
			"speed": 5.0,
			"baseDamage": 1.0,
			"goldYield": 10.0,
		},
		"difficulty": 4.0,
		"sprite": "res://Assets/enemies/dino4.png",
		"scale": 1.5
	},
	# Miniboss (Wave 5)
	"miniboss": {
		"stats": {
			"hp": 500.0,
			"speed": 0.3,
			"baseDamage": 20.0,
			"goldYield": 50.0,
		},
		"difficulty": 5.0,
		"sprite": "res://Assets/enemies/dino3.png",
		"scale": 5  # Maior que o padrão
	},
	# Boss (Wave 10)
	"boss": {
		"stats": {
			"hp": 3000.0,
			"speed": 0.2,
			"baseDamage": 50.0,
			"goldYield": 100.0,
		},
		"difficulty": 10.0,
		"sprite": "res://Assets/enemies/dino4.png",
		"scale": 10  # Ainda maior que o miniboss
	}
}



const maps := {
	"map1": {
		"name": "Grass Map",
		"bg": "res://Assets/maps/map1.webp",
		"scene": "res://Scenes/maps/map1.tscn",
		"baseHp": 10,
		"startingGold": 100,
		"spawner_settings":
			{
			"difficulty": {"initial": 2.0, "increase": 1.5, "multiplies": true},
			"max_waves": 10,
			"wave_spawn_count": 10,
			"special_waves": {},
			},
	},
	"map2": {
		"name": "Desert Map",
		"bg": "res://Assets/maps/map2.png",
		"scene": "res://Scenes/maps/map2.tscn",
		"baseHp": 15,
		"startingGold": 200,
		"spawner_settings":
			{
			"difficulty": {"initial": 1.0, "increase": 1.2, "multiplies": true},
			"max_waves": 10,
			"wave_spawn_count": 10,
			"special_waves": {},
			},
	}
}
