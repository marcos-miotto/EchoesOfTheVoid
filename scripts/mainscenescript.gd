extends Node

func _ready():
	GameController.music_player = $AudioStreamPlayer
	$AudioStreamPlayer.play()

func _on_video_finished():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
