extends Node


func _on_button_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
