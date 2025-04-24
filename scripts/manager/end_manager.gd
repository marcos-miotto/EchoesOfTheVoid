extends Node


func _on_button_restart_pressed() -> void:
	GameController.restart_game()
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_button_menu_pressed() -> void:
	GameController.restart_game()
	get_tree().change_scene_to_file("res://scenes/main.tscn")
