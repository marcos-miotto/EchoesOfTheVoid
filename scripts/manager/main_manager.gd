extends Node

@onready var hover_sfx = $HoverSFX
@onready var click_sfx = $ClickSFX
@onready var select_sfx = $SelectSFX
@onready var button_play = $control/button_play
@onready var button_comandos = $control/button_comandos
@onready var button_quit = $control/button_quit

func _ready():
	MusicPlayer.resume()

func _on_button_play_mouse_entered() -> void:
	if not hover_sfx.playing:
		hover_sfx.play()

func _on_button_comandos_mouse_entered() -> void:
	if not hover_sfx.playing:
		hover_sfx.play()

func _on_button_quit_mouse_entered() -> void:
	if not hover_sfx.playing:
		hover_sfx.play()

func _on_button_play_pressed() -> void:
	if not click_sfx.playing:
		click_sfx.play()
		await click_sfx.finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_button_comandos_pressed() -> void:
	if not select_sfx.playing:
		select_sfx.play()
		await select_sfx.finished
	get_tree().change_scene_to_file("res://scenes/comandos.tscn")

func _on_button_quit_pressed() -> void:
	if not select_sfx.playing:
		select_sfx.play()
		await select_sfx.finished
	get_tree().quit()
