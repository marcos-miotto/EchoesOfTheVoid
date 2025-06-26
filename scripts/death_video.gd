extends Node

@onready var video_player: VideoStreamPlayer = $VideoStreamPlayer

func _ready():
	video_player.play()

func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://scenes/end.tscn")
