extends Node2D

@onready var hover_sfx = $HoverSFX
@onready var select_sfx = $SelectSFX
@onready var button_menu = $CanvasLayer/button_menu

func _ready() -> void:
	$board_manager.setup_scene(GameController.level)

func _on_button_menu_mouse_entered() -> void:
	print("hover quit")
	if not hover_sfx.playing:
		hover_sfx.play()

func _on_button_menu_pressed() -> void:
	if not select_sfx.playing:
		select_sfx.play()
		await select_sfx.finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")
