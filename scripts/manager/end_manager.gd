extends Node

@onready var game_over_sfx = $GameOverMusicPlayer
@onready var select_sfx = $SelectSFX
@onready var hover_sfx = $HoverSFX

func _ready():
	var message = "Você sobreviveu %s andares." % GameController.level
	$Control/LabelTitle2.text = message
	game_over_sfx.play()

func _on_button_restart_pressed() -> void:
	if not select_sfx.playing:
		select_sfx.play()
		await select_sfx.finished
	GameController.restart_game()
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_button_menu_pressed() -> void:
	if not select_sfx.playing:
		select_sfx.play()
		await select_sfx.finished
	GameController.restart_game()
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_button_restart_mouse_entered() -> void:
	if not hover_sfx.playing:
		hover_sfx.play()

func _on_button_menu_mouse_entered() -> void:
	if not hover_sfx.playing:
		hover_sfx.play()
