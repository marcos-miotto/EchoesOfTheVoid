extends CanvasLayer

@onready var hover_sfx = $HoverSFX
@onready var select_sfx = $SelectSFX

func _ready():
	MusicPlayer.resume()

func _on_button_menu_mouse_entered() -> void:
	print("hover quit")
	if not hover_sfx.playing:
		hover_sfx.play()

func _on_button_menu_pressed() -> void:
	select_sfx.play()
	await select_sfx.finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")
