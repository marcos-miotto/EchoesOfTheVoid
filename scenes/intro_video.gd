extends Node

func _ready():
	print("Script da cena de vídeo carregado!")
	MusicPlayer.pause()

func _on_video_finished() -> void:
	print("Vídeo finalizado. Indo para a main.tscn...")
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_video_stream_player_finished() -> void:
	print("Stream Vídeo finalizado. Indo para a main.tscn...")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
