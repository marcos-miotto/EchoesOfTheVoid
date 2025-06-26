extends Control

@onready var txt_monsters_killed: Label = $txt_monsters_killed
@onready var txt_level: Label = $txt_level
@onready var bar_health: ProgressBar = $HealthBar
@onready var txt_health: Label = $txt_health
@onready var player: CharacterBody2D = GameController.player

func _ready() -> void:
	GameController.killed_count_updated.connect(_update_kill_count)
	_update_kill_count(EnemyTile.monsters_killed)
	_update_level_count(GameController.level)
	bar_health.value = 50
	bar_health.add_theme_color_override("fg", Color.RED)
	update_health(GameController.health)
	player.update_health.connect(_on_update_health)

func _on_update_health(health: int) -> void:
	GameController.health = clamp(health, 0, 100)
	update_health(GameController.health)
	
func _update_kill_count(value: int) -> void:
	txt_monsters_killed.text = "Inimigos derrotados: %s" % value
	
func _update_level_count(value: int) -> void:
	txt_level.text = "Andar: %s" % value

func update_health(health: int) -> void:
	bar_health.value = health
	txt_health.text = "Oxigênio: "

	var t := float(100 - health) / 100.0
	var color := Color(0, 1, 0).lerp(Color(1, 0, 0), t)
